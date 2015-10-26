require 'rspec/core/formatters'
require 'res/ir'

module Res
  module Formatters
    class RspecFormatter
     
      attr_accessor :output, :result
      RSpec::Core::Formatters.register self, :start, 
                                             :example_group_started, :example_passed, :example_failed, :example_pending, 
                                             :stop, :start_dump
                                             

      def initialize output
        @result = Array.new
      end

      # Called when rspec starts execution 
      def start notification
        @count = 0
        @child = 0
      end

      # Called Once per example group
      def example_group_started group_notification
       if @child == 0
          result[@count] = format_structure(group_notification.group)
          @child += 1
          i = 0
          if result[@count].has_key?(:children)
            index = result[@count][:children].count 
          else
            index =0
          end
          while i < group_notification.group.examples.count
            result[@count][:children] = Array.new if !result[@count].has_key?(:children)
            result[@count][:children][index] = Hash.new
            result[@count][:children][index] = add_result(group_notification.group.examples[i].metadata)
            index += 1
            i += 1
          end 
          @count += 1
        end
        @child -= 1  
      end
   
      # Called One of these per example, depending on outcome
      def example_passed(passed_example_notification)
        status = passed_example_notification.example.metadata[:execution_result].status.to_s
        test = passed_example_notification.example
        set_status(result, test.metadata[:location], status)
      end

      def example_failed(failed_example_notification)
        status = failed_example_notification.example.metadata[:execution_result].status.to_s
        test = failed_example_notification.example
        set_status(result, test.metadata[:location], status)
      end

      def example_pending(pending_example_notification)
        status = "skipped"
        test = pending_example_notification.example
        set_status(result, test.metadata[:location], status)
      end

        def add_result(test)
       return { 
          "type": "Rspec::Test",
          "name": test[:description],
          "urn": test[:location],
        }
      end

      def format_structure(group)
    
        result = Hash.new
        result[:type] = "Rspec::Describe"
        result[:name] = group.description
        result[:urn] = group.location
        if !group.children.empty?
          result[:children] = Array.new
          i = 0
          while i < group.children.count
            
            result[:children][i] = format_structure(group.children[i])
            @child += 1            
            
            k = 0
            j = i
            while k < group.children[i].examples.count
            if k == 0
              result[:children][j][:children] = Array.new  
              result[:children][j][:children][k] = Hash.new
            end
              result[:children][j][:children][k] = add_result(group.children[j].examples[k].metadata)
              k += 1
            end
            i += 1
          end
        end

        result
      end

      def set_status(result, urn, status)
        result.each do |r|
          if r[:type] == "Rspec::Describe"
            set_status(r[:children], urn, status)
          elsif r[:type] == "Rspec::Test"
            if r[:urn] == urn
              r[:status] = status
              break;
            end
          end
        end
      end
	

      # Called At the end of the suite
      def stop(stop_notification)
        @ir = ::Res::IR.new( :type        => 'Rspec',
                            :started     => '',
                            :results     => result,
                            :finished    => Time.now(),
                            )
      end

      def start_dump(start_dump_notification)
        @io = File.open("./rspec.res", "w")
        @io.puts @ir.json
        @io.close
      end

    end
  end
end


