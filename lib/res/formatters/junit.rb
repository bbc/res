require 'ox'
require 'json'
require 'res/ir'

module Res
  module Formatters
    class Junit
      attr_accessor :io
     
      def initialize(junit_xml)
        file = File.open(junit_xml, "rb") 
        begin
          junit = Ox.parse(file.read)
        rescue Ox::ParseError => e
         raise "Invalid xunit XML format. Error: #{e}"
        end
        file.close
        result = Array.new
        result = attach_suite(junit)
        ir = ::Res::IR.new( :type        => 'Junit', 
                            :started     => "",
                            :finished    => Time.now(),
                            :results     => result
                            )
        @io = File.open("./junit.res", "w")
        @io.puts ir.json
        @io.close
      end

      def attach_cases(node)
        testcase = Hash.new
        testcase["type"] = "JUnit::" + node.value
        testcase["name"] = node.attributes[:name]
        testcase["classname"] = node.attributes[:classname] if testcase["classname"] != nil
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
            suite[index]["type"] = "JUnit::" + node.value
            suite[index]["name"] = node.attributes[:name]
            suite[index]["classname"] = node.attributes[:classname] if suite[index]["classname"] != nil
            suite[index]["children"] = attach_suite(node)
          end # if 
        index += 1
        end # each
        suite
      end # def attach_suite
    end # class JUnit 
  end # class Formatters
end # class Res

