require 'res/config'

module Res
  module Reporters
    class Lion

      attr_accessor :url, :config

      def initialize(args)
        @url = args[:url]
        @config = Res::Config.new([:url, :tag, :description, :app_name, :queue],
                                  :optional => [:hive_job_id],
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
          :queue_name => config.queue || ENV["HIVE_QUEUE_NAME"],
          :type => ir.type,
          :started => ir.results.first[:started],
          :finished => ir.results.last[:finished],
          :status => status,
          :perf_values => values.compact!
        }
        uri = URI.parse(config.url)
        net = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Post.new("/import")
        request.set_form_data(lion_data)

        net.read_timeout = 60
        net.open_timeout = 10

        response = net.start do |http|
          http.request(request)
        end
      end

    end
  end
end

