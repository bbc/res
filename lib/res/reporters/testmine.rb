module Res
  module Reporters
    class Testmine

      attr_accessor :url, :config

      def initialize(args)
        @url = args[:url]
        @config = Res::Config.new([:project, :component, :suite, :version, :url, :target, :testmine_url])
        config.populate(args)
      end

      def submit_results(ir, args)
        
        # Set missing project information
        ir.project = config.project
        ir.suite   = config.suite
        
        # Load world information into json hash
        ir.world = {
          :project   => @config.project,
          :component => @config.component,
          :version   => @config.version
        }

        # Submit to testmine
        uri = URI.parse(url)
        net = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Post.new("/api/v1/submit")
        request.set_form_data({"data" => ir.to_json})
        net.read_timeout = 60
        net.open_timeout = 10

        response = net.start do |http|
          http.request(request)
        end
        #log response.read_body

      end

    end
  end
end
