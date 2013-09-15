require 'teresa/parser/generic'
require 'strscan'

module Teresa
  module Parser
    # Implements Test Anything Protocol and Knock test output format.
    class TAP < Generic
      matches /^(?:not )?ok\b|\A\s*1\.\.0/

      def initialize(string)
        @string  = string
      end

      def parse
        scanner  = StringScanner.new(@string)
        version  = scanner.scan(/TAP version (\d+)\n/) ? scanner[1].to_i : 12
        maximum  = scanner.scan(/1\.\.(\d+)\n/) && scanner[1]
        expected = 0

        raise "TAP #{version} is not supported" unless version.between? 12, 13

        while scanner.scan_until(/^(not )?ok\b/)
          expected    += 1
          test         = Test.new
          test.state   = :failed if scanner[1]
          test.id      = scanner.scan(/ +(\d+)/) ? scanner[1].to_i : expected
          test.message = scanner.scan(/ +.+/).to_s.gsub(/^\s*-|-\s*$/, '').strip
          test.name    = test.message.gsub(/(\: FAILED)?(#.*)?$/, '')
          test.state   = :skipped if test.message =~ /# *(SKIP|TODO)/i
          expected     = test.id
          test.name    = "Test ##{test.id}" if test.name.empty?
          test.message = nil if test.message.empty?

          if version >= 13 and scanner.scan(/^([ \t]+)---\n$/)
            test.output = "meta data:\n\n\t---\n"
            prefix      = scanner[1]

            while scanner.scan(/^#{prefix}(.*)\n/)
              test.output << scanner[1]
              test.message = scanner[1][/message: *"?(.*)"?/, 1] if scanner[1].start_with? "message:"
            end

            test.output << "\n"
          end

          while scanner.scan(/^# ?(.*\n)/)
            test.output ||= ""
            test.output << scanner[1]
          end

          yield test
        end

        unless scanner.scan_until(/^Bail out!\b/)
          maximum ||= scanner.scan_until(/1\.\.(\d+)\n/) && scanner[1]
          expected.upto(maximum.to_i) { |i| yield Test.new(state: :failed, id: i, name: "Test ##{i}") }
        end
      end
    end
  end
end
