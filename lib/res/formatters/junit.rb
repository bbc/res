require 'nokogiri'
require 'json'

module Res
  module Formatters
    class Junit
      attr_accessor :junit, :results, :output
      def initialize(junit_file)
        @junit = Nokogiri::XML(File.open(junit_file))
        @output = Hash.new
        @output["type"] = "Junit"
        @output["started"] = ""
        @output["finished"] = ""
        @output["results"] = Array.new
        @results = Array.new
        @test_suites = false

      end

      def start(suite)
        if suite.name == "testsuites"
          attach_suite_to_suites(suite)
        elsif suite.name == "testsuite"
          attach_suite_to_suite(suite)
        end 
        @output["results"] = @results   
      end

      def attach_suite_to_suites(suite)
      @test_suites = true
      j = 0
      results = Array.new
        if suite.name == "testsuites"
          count  = 0
          results = Hash.new
          results["children"] = Array.new
          results["name"] = suite.attributes["name"].value  
          while count < suite.children.count          
              if suite.children[count].name == "testsuite"
                results["children"][j] = Hash.new
                results["children"][j]["name"] = suite.children[count].attributes["name"].value
                results["children"][j]["type"] = "TestSuite"
                results["children"][j]["started"] = suite.children[count].attributes["timestamp"].value
                results["children"][j]["children"] = attach_tests_to_suite(suite.children[count]) 
                j = j + 1 if results["children"][j] != []
              end
              count = count +1
            end
          @results = results
        end
      end

      def attach_suite_to_suite(suite)
        j = 0
        if suite.name == "testsuite"
          count  = 0
          results = Array.new
            while count < suite.children.count
              if suite.children[count].name == "testsuite"
                results[j] = Hash.new 
                results[j]["type"] = "TestSuite"
                results[j]["started"] = suite.children[count].attributes["timestamp"].value
                results[j]["children"] = attach_tests_to_suite(suite.children[count])
                j = j + 1 if results[j]["children"] != []
              elsif suite.children[count].name == "testcase"
                results[j] = Hash.new 
                results[j]["type"] = "TestSuite"
                results[j]["children"] = attach_tests_to_suite(suite)
                count = suite.children.count
                if results[j]["children"] != []
                  results[j]["name"] = suite.attributes["name"].value
                  results[j]["started"] = suite.attributes["timestamp"].value
                  j = j + 1 
                end
              end
              count = count + 1
            end
        results
        @results = results if @test_suites != true
        end
      end

      def attach_tests_to_suite(suite)
        index = 0 
        count = 0
        test_suite = 0
        testcase = Array.new
        while suite.children[count] != nil
          if suite.children[count].name != "text" or suite.children[count].name != "properties"
            if suite.children[count].name == "testcase" 
              testcase[index] = Hash.new
              testcase[index]["type"] = "TestCase"
              testcase[index]["name"] = suite.children[count].attributes["name"].value
              if suite.children[count].children[0] != nil
                if suite.children[count].children[1].name == "failure" or suite.children[count].children[0].name == "failure"
                  testcase[index]["status"] = "failed" 
                elsif suite.children[count].children[1].name == "skipped"
                  testcase[index]["status"] = "skipped" 
                else
                  testcase[index]["status"] = "passed" 
                end
              else
                testcase[index]["status"] = "passed" 
              end
              testcase[index]["duration"] = suite.children[count].attributes["time"].value if suite.children[count].attributes["time"] != nil
              index = index + 1
            elsif suite.children[count].name == "testsuite"
              testcase[index] = Hash.new
              testcase[index]["type"] = "TestSuite"
              testcase[index]["children"] = attach_tests_to_suite(suite.children[count])
              testcase[index]["name"] = suite.children[count].attributes["name"].value
              testcase[index]["started"] = suite.children[count].attributes["timestamp"].value
              index = index + 1
            end
          count = count + 1
          end 
        end
      testcase 
      end
    end    
  end
end