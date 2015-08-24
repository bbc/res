require 'ox'
require 'json'

module Res
  module Formatters
    class Junit
      
      def initialize(junit_xml)
        file = File.open(junit_xml, "rb") 
        begin
          junit = Ox.parse(file.read)
        rescue Ox::ParseError => e
         raise "Invalid xunit XML format. Error: #{e}"
        end
        file.close
        @output = Hash.new
        @output["type"] = "Junit"
        @output["started"] = ""
        @output["finished"] = ""
        @output["results"] = Array.new
        @result = Array.new
        @result = attach_suite(junit)
        @output["results"] = @result
      end

      def attach_cases(node)
        testcase = Hash.new
        testcase["type"] = node.value
        testcase["name"] = node.attributes[:name]
        testcase["duration"] = node.attributes[:time]
        testcase["status"] = "passed"
        if node.nodes[0] != nil
          testcase["status"] = "failed" if node.nodes[0].value == "failure" or node.nodes[0].value == "error"
          testcase["status"] = "notrun" if node.nodes[0].value == "skipped"
        end
        testcase
      end

      def attach_suite(component)
        suite = Array.new
        index = 0
        component.nodes.each do |node|
          if node.value == "testcase"
            suite[index] = Hash.new
            suite[index] = attach_cases(node)
          else 
            suite[index] = Hash.new
            suite[index]["type"] = node.value
            suite[index]["name"] = node.attributes[:name]
            suite[index]["classname"] = node.attributes[:classname]
            suite[index]["children"] = attach_suite(node)
          end # if 
        index += 1
        end # each
        suite
      end # def attach_suite

      def get_res
        return @output.to_json
      end

    end #class JUnit 
  end
end
