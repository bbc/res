require 'res/config'

module Res
  module Reporters
    class Testmine

      attr_accessor :url, :config

      def initialize(args)
        @url = args[:url]
        @config = Res::Config.new([:project, :component, :suite, :version, :url, :target])
        config.process(args)
      end

      def submit_results(ir)
        # Set missing project information
        ir.project = config.project
        ir.suite   = config.suite
        ir.target  = config.target
        
        # Load world information into json hash
        ir.world = {
          :project   => @config.project,
          :component => @config.component,
          :version   => @config.version,
        }

        # Submit to testmine
        uri = URI.parse(config.url)
        net = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Post.new("/api/v1/submit")
        request.set_form_data({"data" => ir.to_json})
        net.read_timeout = 60
        net.open_timeout = 10
        
        response = net.start do |http|
          http.request(request)
        end
        
        response.read_body
      end

    end
  end
end
