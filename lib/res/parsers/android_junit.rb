require 'res/ir'

module Res
  module Parsers
    class AndroidJUnit
      attr_accessor :io
     
      def initialize(instrument_output)
        result = Array.new
        result = parse(instrument_output)
        ir = ::Res::IR.new( :type        => 'AndroidJUnitRunner', 
                            :started     => "",
                            :finished    => Time.now(),
                            :results     => result
                            )
        @io = File.open("./instruments.res", "w")
        @io.puts ir.json
        @io.close
      end

      def parse(output)
        class_name = Array.new
        test = Array.new
        count = 0
        result = Array.new
        File.open(output) do |f|
          f.each_line do |line|
            if line.include?("class")
              line = line.gsub("INSTRUMENTATION_STATUS: class=", "").strip
              if !class_name.include? line
                class_name.push(line) 
                result[count] = add_suite(class_name)
                count += 1
              end
            elsif line.include?("test=")
                line = line.gsub("INSTRUMENTATION_STATUS: test=", "").strip
                test.push(line)
                if !line.empty? and !class_name.include? line
                  c = result[count - 1][:children].count
                  result[count - 1][:children][c] = add_case(test)
                end
            elsif line.include?("Error in ")
                c = result[count - 1][:children].count
                result[count - 1][:children][c - 1][:status] = "failed"
            end


          end
        end
        result
      end

      def add_case(test)
        t_case = Hash.new
        t_case[:type] = "AndroidJUnit::Test"
        t_case[:name] = test.last
        t_case[:status] = "passed"
        t_case
      end

      def add_suite(class_name)
        suite = Hash.new
        suite[:type] = "AndroidJUnit::Class"
        suite[:name] = class_name.last
        suite[:children] = Array.new
        suite
      end

    end
  end
end