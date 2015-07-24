require 'json'

module Res
  class IR
    attr_accessor :hash, :results, :type, :start_time, :end_time
 
    def self.load(file)
      f = File.open file
      hash = JSON.load(f, nil, :symbolize_names => true )
      
      Res::IR.new( hash )
    end  
   
    # Expects hash of:
    # :results => {  }
    # :type => test_runner
    # :start_time => Time the tests started
    # :end_time => Time they completed
    def initialize( options = {} )
      @results     = options[:results]     or raise "No results data"
      @type        = options[:type]        or raise "No type provided (e.g. 'Cucumber')"
      @started     = options[:started]     or raise "Need to provide a start time"
      @finished    = options[:finished]    or raise "Need to provide an end time"
    end

    # Dump as json
    def json
      JSON.pretty_generate(
      { :started     => @started,
        :finished    => @finished,
        :results     => @results,
        :type        => @type }
      )
    end

    # Count number of tests in specific state
    # count(:passed)
    def count(status)
      
    end
    
    # Pluck out the actual test nodes from the contexts
    def tests
      IR.find_tests(results).flatten
    end

    # Returns a simple array of test information
    # [ { :name => 'test1', :uri => 'file/tests.t:32', :status => 'passed', :time => 12.04 },
    #   { :name => 'test2', :uri => 'file/tests.t:36', :status => 'failed', :time =>  } ]
    def flat_format

    end
    
    private
    
    # Recursive function for retrieving test nodes
    def self.find_tests(nodes)
      tests = []
      nodes.each do |n|
        if IR.is_a_test?(n)
          tests << n
        elsif n[:children]
          tests << IR.find_tests(n[:children])
        end
      end
      tests
    end
    
    def self.is_a_test?(node)
      !node[:status].nil?
    end
    
  end
end
