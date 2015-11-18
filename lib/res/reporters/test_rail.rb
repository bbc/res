require 'test_rail'
require 'res/ir'
require 'res/mappings'
require 'res/config'

module Res
  module Reporters
    class TestRail
      
      attr_accessor :ir, :case_status, :config, :project, :suite
      def initialize(args)
        @url = args[:url]
        @config = Res::Config.new([:user, :password, :namespace, :project, :suite], :optional => [:run_id, :run_name], :pre_env => 'test_rail')
        config.process(args)

        @case_status = {}
        @io = File.new("./.test_rail_reporter.log","w+") 
      
        test_rail_project = config.project
        @suite_name = config.suite 
  
       begin
          @project = tr.find_project(:name => test_rail_project)
        rescue
          @io.puts "Project: #{test_rail_project} could not be found" 
          @io.puts "  Please create a project first to contain test suite #{@suite_name}"
          @io.close
          return "Project #{test_rail_project} could not be found" 
        end
      end # initialize

      # Creates a new suite within testrail
      def sync_tests(ir)
        @ir = ir
        @mappings = Res::Mappings.new(@ir.type)

        suite = @project.find_or_create_suite(:name => @suite_name, :id => @project.id)
        @io.puts "Syncing Suite"

        i = 0
          while i < @ir.results.count         
            section = suite.find_or_create_section(:project_id => @project.id, :suite_id => suite.id, :name => @ir.results[i][:name])   
            create_suite(@ir.results[i], @project.id, suite, section)
            i += 1
          end # while
        @synced = true
        @io.puts "> Sync Successful"
      end

      # Submits run against suite
      # Either creates a new run using run_name or use existing run_id 
      def submit_results(ir, args = {})
        sync_tests(ir) if !@synced
        suite = @project.find_suite(:name => @suite_name)

        run_name = @config.run_name || args[:run_name] || nil
        run_id = @config.run_id || args[:run_id] || nil

        if !run_name.nil? 
          run_name = @config.run_name 
          @io.puts "> Created new run with name #{run_name}"
          run_id = @tr.add_run( :project_id => @project.id, :name => run_name, :description => args[:run_description], :suite_id => suite.id ).id
          @io.puts "> Created new run: #{run_id}"
        
        elsif !run_id.nil? 
          run_id = @config.run_id 
            begin
              run = @tr.get_run(:run_id => @config.run_id) 
              @io.puts "> Found run with id #{run_id}"
            rescue
              @io.puts "> Couldn't find run with id #{run_id}"
              @io.close
              return "Couldn't find run with id #{run_id}"           
            end

        else
          @io.puts "> run_name and run_id are either nil or not specified"
          @io.close
          return "run_name and run_id are either nil or not specified"          

        end

        i = 0
        if @case_status.empty?
          while i < @ir.results.count
            begin
              section = suite.find_section(:name => @ir.results[i][:name])
            rescue 
              @io.puts "> Couldn't find section with name #{@ir.results[i][:name]}" 
              puts "Couldn't find section with name #{@ir.results[i][:name]}"
            end
            case_details(@ir.results[i], section)
            i += 1
          end # while
        end # ifa
        add_case_status(run_id)
        @io.puts "> Added the test case status"
        @io.puts "> Submit Successful"
        @io.close
        return "Submitted to Test Rail"
      end

      def tr
        @tr = ::TestRail::API.new( :user   => @config.user,
                                :password  => @config.password,
                                :namespace => @config.namespace) 
      end

      # Add status to each testcase
      def add_case_status(run_id)
        @case_status.each { |case_id, status|
          @tr.add_result_for_case(:run_id => run_id, :case_id => case_id, :status => status)
        }
      end

      # Add section or cases within parent section
      def create_suite(ir, project_id, suite, parent)
        ir[:children].each do |child|
          if @mappings.context.include?(child[:type])
            section = parent.find_or_create_section(:project_id => project_id, :suite_id => suite.id, :name => child[:name])   
            create_suite(child, project_id, suite, section) if child[:children].count > 0

          elsif @mappings.case.include?(child[:type])
            parent = suite if parent.nil?   
            tcase = parent.find_or_create_test_case(:title => child[:name])
            @case_status[:"#{tcase.id}"] = child[:status]

          else
            # To be added. Ex: steps 
          end # if
        end # each
      end # create_suite

      def case_details(ir, section)
        ir[:children].each do |child|
          if @mappings.context.include?(child[:type])
              section = section.find_section(:name => child[:name])   
              case_details(child, section)

          elsif @mappings.case.include?(child[:type])  
              tcase = section.find_test_case(:title => child[:name])  if !section.nil?
              @case_status[:"#{tcase.id}"] = child[:status] if !tcase.nil?

          end
        end
      end

    end # TestRail
 end # Reporters
end # Res
