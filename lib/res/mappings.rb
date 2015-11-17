module Res
  class Mappings

    attr_accessor :context, :case, :type

    def initialize(type)
      @type = type
      set_type
    end
 
    def set_type
      case @type
      when "Junit"
        @context = ["JUnit::testsuite", "JUnit::testsuites"]
        @case = ["JUnit::testcase"]      
      when "Cucumber"
        @context = ["Cucumber::Feature", "Cucumber::ScenarioOutline"]
        @case = ["Cucumber::Scenario"]
      when "Rspec"
        @context = ["Rspec::Describe"]
        @case = ["Rspec::Test"]
      end
    end

  end
end
