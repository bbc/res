require 'optparse'
require 'ostruct'
require 'res/ir'
require 'res/reporters/testmine'
require 'res/reporters/test_rail'
require 'res/reporters/hive'
require 'res/formatters/junit'
require 'openssl'

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

      opts.on("--junit junit_xml",
              "Format junit xml to res type") do |junit|
        options.junit = junit
      end

      opts.on("--cert CERT",
              "Client certificate file") do |cert|
        options.cert = cert
      end

      opts.on("--cacert CACERT",
              "CA Certificate") do |cacert|
        options.cacert = cacert
      end

      opts.on("--no-ssl-verification",
              "Turn off ssl verification (don't do this)") do |no_ssl_verification|
        options.ssl_verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      opts.on("--url URL",
              "URL to submit results to") do |url|
        options.url = url
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
              "VERSION of the world under test") do |version|
        options.version = version
      end
      
      opts.on("--target TARGET",
              "Target of execution (e.g. Chrome)") do |target|
        options.target = target
      end
      
      opts.on_tail("-h", "--help", "Display help") do
        puts opts
        exit
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

if options.junit
    junit_output = Res::Formatters::Junit.new(options.junit)
    ir = Res::IR.load(junit_output.io)
end 

raise "No results loaded" if !ir

if options.reporter
  case options.reporter
  when 'hive'
    
    raise "Need to provide a hive job_id" if !options.job_id
    
    reporter = Res::Reporters::Hive.new(
      :url => options.url,
      :cert => options.cert,
      :cacert => options.cacert,
      :ssl_verify_mode => options.ssl_verify_mode
    )
    
    reporter.submit( ir, :job_id => options.job_id )
  when 'testmine'
    
    reporter = Res::Reporters::Testmine.new(
      :config_file => options.config_file,
      :version     => options.version,
      :target      => options.target,
      :url         => options.url
    )
    
    id = reporter.submit_results(ir)
    puts "Reported to testmine: #{id}"
  when 'testrail'
    reporter = Res::Reporters::TestRail.new(
      :config_file => options.config_file,
      :target      => options.target,
      :url         => options.url,
      :ir          => ir
    )
 
    output = reporter.submit_results(:ir => ir)
    puts output
  else

    raise "#{options.reporter} not implemented"
  end
end