# encoding: utf-8
Gem::Specification.new do |s|
  # general infos
  s.name        = "teresa"
  s.version     = "0.1.0"
  s.description = "Parses test run output in various formats."
  s.homepage    = "https://github.com/rkh/teresa"
  s.summary     = "Test Result Analyzer"
  s.license     = "MIT"

  # generated from git shortlog -sn
  s.authors = [
    "Konstantin Haase"
  ]

  # generated from git shortlog -sne
  s.email = [
    "konstantin.mailinglists@googlemail.com"
  ]

  # generated from git ls-files
  s.files = [
    "LICENSE",
    "README.md",
    "Rakefile",
    "lib/teresa.rb",
    "lib/teresa/error.rb",
    "lib/teresa/parser.rb",
    "lib/teresa/parser/generic.rb",
    "lib/teresa/parser/tap.rb",
    "lib/teresa/parser/xunit.rb",
    "lib/teresa/test.rb",
    "lib/teresa/version.rb",
    "spec/payloads/bacon.knock.txt",
    "spec/payloads/bacon.tap.txt",
    "spec/payloads/blank-junit.xml",
    "spec/payloads/common.tap.txt",
    "spec/payloads/fizzbuzz.xml",
    "spec/payloads/giving_up.tap.txt",
    "spec/payloads/liberties.tap.txt",
    "spec/payloads/mustermann.xml",
    "spec/payloads/sample-junit.xml",
    "spec/payloads/skip_app.tap.txt",
    "spec/payloads/skip_few.tap.txt",
    "spec/payloads/spare_tuits.tap.txt",
    "spec/payloads/tap.txt",
    "spec/payloads/tap13.txt",
    "spec/payloads/unknown_amout.tap.txt",
    "spec/support.rb",
    "spec/support/coverage.rb",
    "spec/support/payloads.rb",
    "spec/teresa_spec.rb",
    "teresa.gemspec"
  ]

  # dependencies
  s.add_dependency "nokogiri",              "~> 1.5"
  s.add_development_dependency "rspec",     "~> 2.14"
  s.add_development_dependency "simplecov", "~> 0.7"
  s.add_development_dependency "rake"
end