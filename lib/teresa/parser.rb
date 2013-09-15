require 'teresa/parser/tap'
require 'teresa/parser/xunit'

module Teresa
  module Parser
    extend self

    def detect(string)
      constant = constants.sort.reverse.map { |c| const_get(c) }.detect { |c| c.matches? string }
      constant or raise Teresa::Error, "cannot detect test format"
    end

    def get(type)
      return type if type.respond_to? :new
      raise Teresa::Error, "unknown test format #{type}" unless name = constants.detect { |c| c.to_s.downcase == type.to_s }
      const_get(name)
    end

    def parse(string, options = {}, &block)
      parser = get(options[:type] || detect(string)).new(string)
      block  ? parser.parse(&block) : parser.enum_for(:parse).to_a
    end

    def parse_file(file, options = {}, &block)
      encoding = options.fetch(:encoding) { Encoding::UTF_8 }
      parse(File.read(file, encoding: encoding), options)
    end
  end
end
