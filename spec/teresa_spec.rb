require 'support'

describe Teresa do
  describe :parse_file do
    Payloads.each do |name, file|
      it "parses #{name}" do
        tests = Teresa.parse_file(file)
        tests.should be_an(Array)
        tests.each { |t| t.should be_an(Teresa::Test) }
      end
    end
  end
end
