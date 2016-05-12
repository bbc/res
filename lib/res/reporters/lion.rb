require 'res/config'

module Res
  module Reporters
    class Lion

      attr_accessor :url, :config

      def initialize(args)
        @url = args[:url]
        @config = Res::Config.new([:url, :tag, :description, :app_name],
                                  :optional => [:hive_job_id, :queue, :cert, :cacert, :ssl_verify_mode],
                                  :pre_env  => 'LION_')
        config.process(args)
      end

      def submit_results(ir, args = nil)
        status = "failed"
        status = "passed" if ir.tests.count == ir.count(:passed)

        count = 0
        values = Array.new
        while count < ir.tests.count
          values[count] = ir.tests[count][:values]
          count += 1
        end
 
        # Set Lion Data
        lion_data = {
          :app_name => config.app_name,
          :tag => config.tag,
          :description => config.description,
          :queue_name => ENV["HIVE_QUEUE_NAME"] || config.queue,
          :type => ir.type,
          :started => ir.results.first[:started],
          :finished => ir.results.last[:finished],
          :status => status,
          :perf_values => values.compact!
        }
        
        
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
        
        request = Net::HTTP::Post.new(config.url + "/import")
        request.content_type = 'application/json'
        request.body = lion_data.to_json

        @http.request(request)
      end

    end
  end
end

