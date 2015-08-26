require 'test_rail'

module Res
  module Reporters
    class TestRail

      attr_accessor :ir, :suite, :case, :case_status
      def initialize(json)
        i = 0
        @case_status = {}
        @ir = JSON.parse(json, :symbolize_names => true)
        
        # @io = io
        # @config = load_config

        project_name = 'bbc-test/post_result'
        suite_name = "Jasmine"
        project_id = get_project(project_name)

        suite_id = get_suite(project_id, suite_name)
        
        set_type(@ir[:type]) 
        
        while i < @ir[:results].count
          # Create a parent section
          section = @tr.add_section(:project_id => project_id, :suite_id => suite_id, :name => @ir[:results][i][:name], :parent_id => nil) 
          # Add section or cases within parent section
          sync_results(@ir[:results][i], project_id, suite_id, section.id)
          i += 1
        end # while

        # Add New run
        run_id = add_test_run(project_id, suite_id)

        # Add status to each testcase
        add_case_status(run_id)
      end # initialize

      def tr
        @tr = TestRail::API.new( :user  => "testrail@example.com",
                                 :password  => "g0ne8ang",
                                 :namespace => "bbcsandbox" )
      end

      def add_case_status(run_id)
        @case_status.each { |case_id, status|
          @tr.add_result_for_case(:run_id => run_id, :case_id => case_id, :status => status)
        }
      end

      def add_test_run(project_id, suite_id)
        run = @tr.add_run(:project_id => project_id, :suite_id => suite_id, :description => "#{@ir[:type]}_#{Time.now}")
        run.id
      end

      def get_project(project_name)
        project = tr.find_project(:name => project_name)
        project.id
      end

      # Returns the newly created or existing suite id
      def get_suite(project_id, suite_name)
        suites = @tr.get_suites(:project_id => project_id)
        suites.each do |suite|
          if suite.name == suite_name
            return suite.id
          end
        end
        suite = @tr.add_suite(:project_id => project_id, :name => "#{@ir[:type]}_Suite")
        suite.id
      end

      # Set types to be included in context and case
      def set_type(type)
        case type
        when "Junit"
          @context = ["JUnit::testsuite", "JUnit::testsuites"]
          @case = ["JUnit::testcase"]      
        when "Cucumber"
          @context = ["Cucumber::Feature", "Cucumber::ScenarioOutline"]
          @case = ["Cucumber::Scenario"]
        end
      end

      # Add sections or cases 
      def sync_results(ir, project_id, suite_id, parent_id)
        ir[:children].each do |child|
          if @context.include?(child[:type])
            section = @tr.add_section(:project_id => project_id, :suite_id => suite_id, :name => child[:name], :parent_id => parent_id) 
            sync_results(child, project_id, suite_id, section.id) if child[:children].count > 0
          elsif @case.include?(child[:type])
            parent_id = suite_id if parent_id == nil  
            tcase = @tr.add_case(:section_id => parent_id, :title => child[:name])
            @case_status[:"#{tcase.id}"] = child[:status]
          else
            # To be added Ex: steps 
          end # if
        end # each
      end # sync_results

    end # TestRail
  end # Reporters
end # Res
