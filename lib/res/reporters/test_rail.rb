require 'test_rail'
require 'res/ir'
require 'res/mappings'
require 'pry'
module Res
  module Reporters
    class TestRail

      attr_accessor :ir, :case_status
      def initialize(res_file)
        @case_status = {}
        
        @ir = Res::IR.load(res_file)
        @mappings = Res::Mappings.new(@ir.type)
        project_name = 'bbc-test/post_result'
        @suite_name = "Jasmine"

        @project = tr.find_project(:name => project_name)
        raise "Couldn't find project with name #{project_name}" if @project.nil?
      end # initialize


      def sync_tests(args = {})
        suite = @project.find_or_create_suite(:name => @suite_name, :id => @project.id)
        i = 0
          while i < @ir.results.count         
            section = suite.find_or_create_section(:project_id => @project.id, :suite_id => suite.id, :name => @ir.results[i][:name])   
            sync_results(@ir.results[i], @project.id, suite, section)
            i += 1
          end # while
      end

      def submit_results(args)
        suite = @project.find_suite(:name => @suite_name)
        raise "Couldn't find suite with name #{@suite_name}" if suite.nil?
        # run_id = args[:run_id] 
        run_id = add_test_run(@project.id, suite.id) if run_id != nil
        i = 0
        if !@case_status.empty?
          while i < @ir.results.count
            section = suite.find_section(:name => @ir.results[i][:name])
            raise "Couldn't find section with name #{@ir.results[i][:name]}" if section.nil?
            case_details(@ir.results[i], section)
            i += 1
          end # while
        end # if
        add_case_status(run_id)
      end

      def tr
        @tr = ::TestRail::API.new( :user  => "user",
                                 :password  => "passw0rd",
                                 :namespace => "namespace")
      end

      # Add status to each testcase
      def add_case_status(run_id)
        @case_status.each { |case_id, status|
          @tr.add_result_for_case(:run_id => run_id, :case_id => case_id, :status => status)
        }
      end

      # Add New Test run
      def add_test_run(project_id, suite_id)
        run = @tr.add_run(:project_id => project_id, :suite_id => suite_id, :name => "run_name", :description => "#{@ir.type}_#{Time.now}")
        run.id
      end

      # Add section or cases within parent section
      def sync_results(ir, project_id, suite, parent)
        ir[:children].each do |child|
          if @mappings.context.include?(child[:type])
            section = parent.find_or_create_section(:project_id => project_id, :suite_id => suite.id, :name => child[:name])   
            sync_results(child, project_id, suite, section) if child[:children].count > 0
          elsif @mappings.case.include?(child[:type])
            parent = suite if parent == nil  
            tcase = parent.find_or_create_test_case(:title => child[:name])
            @case_status[:"#{tcase.id}"] = child[:status]
          else
            # To be added. Ex: steps 
          end # if
        end # each
      end # sync_results


      def case_details(ir, section)
        ir[:children].each do |child|
          if @mappings.context.include?(child[:type])
              section = section.find_section(:name => child[:name])   
              case_details(child, section)
          elsif @mappings.case.include?(child[:type])  
              tcase = section.find_test_case(:title => child[:name]) if !section.nil? 
              @case_status[:"#{tcase.id}"] = child[:status] if !tcase.nil?
          end
        end
      end

    end # TestRail
  end # Reporters
end # Res
