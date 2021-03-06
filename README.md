# Teresa

Teresa is a Test Result Analyzer. Well, it's more of a Test Output Parser, but that doesn't make a great name.
It takes the output from a test run and parses it into Ruby objects.

Supported formats:

* [Test Anywhere Protocol](http://en.wikipedia.org/wiki/Test_Anything_Protocol) (version 12 and 13)
* [Knock](https://github.com/chneukirchen/knock#readme)
* [xUnit XML](http://en.wikipedia.org/wiki/XUnit), as produced by [JUnit](http://junit.org/) and other frameworks

## Usage

``` ruby
require 'teresa'

# parse a string of test output
Teresa.parse(some_input) do |test|
  puts "#{test.name}: #{test.state}"
end

# parse a file
tests = Teresa.parse_file("result.xml")
puts "#{tests.size} tests found"
```
