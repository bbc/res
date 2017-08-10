require 'json'

module Res
  class IR
    attr_accessor :hash, :results, :type, :start_time, :end_time, :world, :values
    attr_accessor :project, :suite, :target, :hive_job_id
 
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
      @values      = initialize_values( options[:values], options[:results] )
    end
    
    def initialize_values( initial_values, results_hash )
      h = {}
      if initial_values && !initial_values.empty?
        initial_values.each do |k,v|
          h[k.to_s] = v
        end
      end
      
      IR.find_values( results_hash ).each do |i|
        if !i.empty?
          i.each do |k,v|
            h[k.to_s] = v
          end           
        end
      end
      
      h
    end
    
    # Dump as json
    def json
      hash = {
        :started     => @started,
        :finished    => @finished,
        :results     => @results,
        :type        => @type }
      
      # Merge in the world information if it's available
      hash[:world] = world if world
      hash[:hive_job_id] = hive_job_id if hive_job_id
      
      JSON.pretty_generate( hash )
    end

    # Pluck out the actual test nodes from the contexts
    def tests
      IR.find_tests(results).flatten
    end

    def count(status)
      tests.count { |t| t[:status].to_sym == status.to_sym  }
    end

    # Returns a simple array of test information
    # [ { :name => 'test1', :urn => 'file/tests.t:32', :status => 'passed', :time => 12.04 },
    #   { :name => 'test2', :urn => 'file/tests.t:36', :status => 'failed', :time =>  } ]
    def flat_format
      self.tests.collect do |t|
        { :name   => t[:name],
          :urn    => t[:urn],
          :status => t[:status] }
      end
    end
    
    private
    
    # Recursive function for retrieving values in nodes
    def self.find_values(nodes)
      value_hashes = []
      nodes.compact.each do |n|
        if n[:values]
          value_hashes << n[:values]
        end
        if n[:children]
          value_hashes += IR.find_values(n[:children])
        end
      end
      value_hashes
    end
    
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
