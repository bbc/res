module Res
  module Reporters
    class Testmine

      attr_accessor :url

      def initialize(args)
        url = args[:url]
      end

      def submit_results(ir, args)

       # TODO, load in the tesmime config and merge it into the json hash

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
