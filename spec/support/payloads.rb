module Payloads
  extend Enumerable
  @files   = Dir.glob File.expand_path("../../payloads/*", __FILE__)
  @map     = Hash[@files.map { |f| [File.basename(f), f] }]
  @content = {}

  def self.[](key)
    @files.include?(key) ? key : @map.fetch(key)
  end

  def self.content(key)
    @content[self[key]] ||= File.read(self[key], encoding: Encoding::UTF_8)
  end

  def self.each(&block)
    @map.each(&block)
  end
end