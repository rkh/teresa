require 'teresa/parser/generic'
require 'nokogiri'

module Teresa
  module Parser
    # Implements xUnit (like JUnit) output format.
    class XUnit < Generic
      matches /<\?xml.*<testsuite/m

      def initialize(string)
        @document = Nokogiri::XML(string)
      end

      def parse
        @document.xpath("testsuite").each do |suite|
          suite.xpath("testcase").each do |node|
            test      = Test.new(name: node["name"], id: [suite["name"], node["classname"], node["name"]].compact.join(" "))
            test.time = node["time"].to_f if node["time"]
            test.name = node["classname"] + " " + node["name"] unless test.name.include?(" ") or node["name"].to_s.empty?

            node.xpath("failure|error|skipped").each do |failure|
              test.state   = failure.node_name == "skipped" ? :skipped : :failed
              test.message = failure["message"]
              test.output  = failure.text
            end

            yield test
          end
        end
      end
    end
  end
end
