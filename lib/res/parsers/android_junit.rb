require 'res/ir'

module Res
  module Parsers
    class AndroidJunit
      attr_accessor :io
     
      def initialize(instrument_output)
        result = parse(instrument_output)
        ir = ::Res::IR.new( :type        => 'AndroidJUnitRunner', 
                            :started     => '',
                            :finished    => Time.now,
                            :results     => result
                            )
        @io = File.open('./instruments.res', 'w')
        @io.puts ir.json
        @io.close
      end

      def parse(output)
        test_complete = false
        total_tests = 0
        passed = 0
        failed = 0
        class_name = []
        result = []
        test = {
          type: 'AndroidJUnit::Test',
          name: 'UNKNOWN',
          status: 'unknown'
        }

        File.open(output) do |f|
          f.each_line do |line|
            if !line.match('INSTRUMENTATION_RESULT') && !test_complete

              if line.match('INSTRUMENTATION_STATUS: numtests=(.*)$')
                 total_tests =  Regexp.last_match[1].to_i
              end

              if line.match('INSTRUMENTATION_STATUS_CODE: (.*)$')
                  case Regexp.last_match[1].strip
                    when '1'
                      # Skip if this is just the 'pre-run' test
                      next
                    when '0'
                      test[:status] = 'passed'
                      passed += 1
                    when '-2'
                      test[:status] = 'failed'
                    when '-3'
                      # Ignored (skipped) test
                      test[:status] = 'ignored'
                    else
                      test[:status] = 'unknown'
                  end
                result.last[:children] << test if test[:status] != 'ignored'
                test = {
                  type: 'AndroidJUnit::Test',
                  name: 'UNKNOWN',
                  status: 'unknown'
                }
              end

              if line.include?('class=')
                line = line.gsub('INSTRUMENTATION_STATUS: class=', '').strip
                unless class_name.include? line
                  class_name.push(line)
                  result << {
                    type: 'AndroidJUnit::Class',
                    name: class_name.last,
                    children: Array.new
                  }
                end
              elsif line.include?('test=')
                test[:name] = line.gsub('INSTRUMENTATION_STATUS: test=', '').strip
              elsif line.include?('Error in ')
                test[:status] = 'failed'
              end

            else

              if line.match('Tests run: (.*),  Failures: (.*)$')
                failed = Regexp.last_match[2].to_i
                if total_tests != (passed + failed)
                  result << {
                    type: 'AndroidJUnit::Exception',
                    name: 'Exception(s): Check in logs for more info',
                    status: 'failed'
                  }
                end
              end
              test_complete = true

            end
          end
        end
        result
      end
    end
  end
end
