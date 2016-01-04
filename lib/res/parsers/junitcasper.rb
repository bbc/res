require 'ox'
require 'json'
require 'res/ir'

module Res
  module Parsers
    class Junitcasper
      attr_accessor :io

      def initialize(junit_xml)
        file = File.open(junit_xml, "rb")
        begin
          junit = Ox.parse(file.read)
        rescue Ox::ParseError => e
          raise "Invalid xunit XML format. Error: #{e}"
        end
        file.close
        @test_suites = create_test_suites(packagenames(junit))
        junit.nodes.collect do |test_suites|
          create_multiple_test_suite(test_suites)
        end
        ir = ::Res::IR.new(:type => 'Casper',
                           :started => "",
                           :finished => Time.now(),
                           :results => @test_suites
        )

        @io = File.open("./junitcasper.res", "w")
        @io.puts ir.json
        @io.close
      end

      def test_case(suite)
        testcases = Hash.new
        testcases = suite.nodes.collect do |node|
          if node.value == "testcase"
            testcase = Hash.new
            testcase[:type] = "Casper::" + node.value
            testcase[:name] = truncateName(node.attributes[:name])
            testcase["duration"] = node.attributes[:time]
            testcase["status"] = "passed"
            if node.nodes[0] != nil
              testcase["status"] = "failed" if node.nodes[0].value == "failure" or node.nodes[0].value == "error"
              testcase["status"] = "notrun" if node.nodes[0].value == "skipped"
            end
            testcase
          end
        end
        testcases.compact
      end

      def create_multiple_test_suite(suites)
        i = 0
        suites.nodes.each_with_index do |suite, index|
          test_suite = Hash.new
          test_suite[:type] = "Casper::testsuite"
          test_suite[:name] = suite.attributes[:name]
          test_suite[:children] = Array.new
          test_suite[:children] = test_case(suite)
          i = @test_suites.index { |test_suites|
            test_suites[:name] == suite.attributes[:package]
          }
          @test_suites[i][:children].push(test_suite)
        end
      end

      def create_test_suites (pkgnames)
        test_suites= Array.new
        pkgnames.each_with_index do |pkgname, index|
          test_suites[index] = Hash.new
          test_suites[index][:type]= "Casper::testsuites"
          test_suites[index][:name]= pkgname
          test_suites[index][:children] = Array.new
        end
        test_suites
      end


      def packagenames (junit)
        packagename=junit.nodes[0].nodes.collect do |node|
          node.attributes[:package]
        end
        packagename.uniq
      end

      def truncateName(inputText)
        if inputText.to_s.empty? ==false
          return inputText[0..253]#.gsub(/\s+$/, '')
        else
          return inputText
        end
      end


    end # class JUnit
  end # class Parsers
end # class Res

