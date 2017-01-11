require 'res/config'

module Res
  module Reporters
    class Testmine

      attr_accessor :url, :config

      def initialize(args)
        @url = args[:url]
        @config = Res::Config.new([:project, :component, :suite, :url],
                                  :optional => [:hive_job_id, :version, :target, :cert, :cacert, :ssl_verify_mode],
                                  :pre_env  => 'TESTMINE_')
        config.process(args)
      end

      def submit_results(ir, args = nil)
        # Set missing project information
        ir.project     = config.project
        ir.suite       = config.suite
        ir.target      = config.target
        ir.hive_job_id = config.hive_job_id 
        
        # Load world information into json hash
       
        world_version = (defined? config.version) ? config.version : @config.version

        ir.world = {
          :project   => @config.project,
          :component => @config.component,
          :version   => world_version
        }

        # Submit to testmine

        uri = URI.parse(config.url)
        @http = Net::HTTP.new(uri.host, uri.port)
        if config.cert
          pem = File.read(config.cert)
          @http.use_ssl = true if uri.scheme == 'https'
          @http.cert = OpenSSL::X509::Certificate.new(pem)
          @http.key = OpenSSL::PKey::RSA.new(pem)
          @http.ca_file = config.cacert if config.cacert
          @http.verify_mode = config.ssl_verify_mode if config.ssl_verify_mode
        end
        
        request = Net::HTTP::Post.new(config.url + "/api/v1/submit")
        request.content_type = 'application/json'
        request.set_form_data({"data" => ir.to_json})
        @http.request(request)

      end

    end
  end
end
