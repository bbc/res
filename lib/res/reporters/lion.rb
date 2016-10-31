require 'res/config'

module Res
  module Reporters
    class Lion

      attr_accessor :url, :config

      def initialize(args)
        @url = args[:url]
        # :device_type is optional for backward compatibility
        # At the next major version update this should be moved into the
        # required list.
        @config = Res::Config.new([:url, :tag, :description, :app_name, :target],
                                  :optional => [:hive_job_id, :queue, :cert, :cacert, :ssl_verify_mode, :device_type, :version],
                                  :pre_env  => 'LION_')
        config.process(args)
      end

      def submit_results(ir, args = nil)
        status = "failed"
        status = "passed" if ir.tests.count == ir.count(:passed)
        results = Hash[ir.tests.map { |t| [t[:name], t[:status]] }]

        if ir.values.has_key?('#type') && ir.values['#type'] == 'multiple'
          measures = {}
          ir.values.select { |k, v| k !~ /^[#_]/ }.each do |k, v|
            measures[k] = { :count => v, :total => ir.values['_total'] }
          end
        else
          measures = ir.values
        end

        # Set Lion Data
        lion_data = {
          :app_name => config.app_name,
          :version => config.version,
          :hive_job_id => config.hive_job_id,
          :tag => config.tag,
          :device_type => config.device_type || 'Unknown',
          :description => config.description,
          :queue_name => config.target,
          :type => ir.type,
          :started => ir.results.first[:started],
          :finished => ir.results.last[:finished],
          :status => status,
          :results => results,
          :measures => measures
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

