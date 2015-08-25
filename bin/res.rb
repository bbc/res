#! /usr/bin/env ruby

require 'optparse'
require 'ostruct'
require 'res/ir'

class CLIParser

  #
  # Return a structure describing the options.
  #
  def self.parse(args)
    
    # Default values
    options = OpenStruct.new

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: res [options]"
 
      opts.on("-r", "--res RES_FILE",
              "res file to load") do |res|
        options.res = res
      end
      
      opts.on("-s", "--submit REPORTER",
              "Reporter to use to submit results") do |reporter|
        options.reporter = reporter
      end

      opts.on("--cert CERT",
              "Reporter to use to submit results") do |cert|
        options.cacert = cert
      end

      opts.on("--cacert CACERT",
              "Reporter to use to submit results") do |cacert|
        options.reporter = cacert
      end

      opts.on("--ssl_verify_mode SSL_VERIFY_MODE",
              "Reporter to use to submit results") do |cacert|
        options.reporter = cacert
      end

      opts.on("--url URL",
              "URL to submit results to") do |reporter|
        options.reporter = reporter
      end

      opts.on("--job-id JOB_ID",
              "JOB_ID to submit results against") do |job_id|
        options.job_id = job_id
      end

      opts.on("--config-file CONFIG_FILE",
              "Config file for the submitter") do |config_file|
        options.config_file = config_file
      end

      opts.on("--version VERSION",
              "VERSION of the world under test") do |config_file|
        options.config_file = config_file
      end
      
      opts.on("--target TARGET",
              "Target of execution (e.g. Chrome)") do |config_file|
        options.config_file = config_file
      end


    end

    opt_parser.parse!(args)
    options
  end 
end 

options = CLIParser.parse(ARGV)

if options.res
  ir = Res::IR.load(options.res)
  puts 'IR File loaded'
end

raise "No results loaded" if !ir

if options.reporter
  
  case options.reporter
  when 'hive'
    
    raise "Need to provide a hive job_id" if !options.job_id
    
    reporter = Res::Reporter::Hive.new(
      :url => options.url,
      :cert => options.cert,
      :cacert => options.cacert,
      :ssl_verify_mode => options.ssl_verify_mode
    )
    
    reporter.submit( ir, :job_id => options.job_id )
  when 'testmine'
    
    reporter = Res::Reporter::Testmine.new(
      :config_file => options.config_file,
      :version     => options.version,
      :target      => options.target
    )
    
    testmine.submit_results(ir)
    
  else
    raise "#{options.reporter} not implemented"
  end
  
end

