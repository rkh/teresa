require 'teresa/error'
require 'teresa/parser'
require 'teresa/test'
require 'teresa/version'

module Teresa
  extend self

  def parse(string, options = {}, &block)
    Parser.parse(string, options, &block)
  end

  def parse_file(string, options = {}, &block)
    Parser.parse_file(string, options, &block)
  end
end
