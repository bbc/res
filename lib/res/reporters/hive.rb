require 'hive/messages'
require 'json'

module Res
  module Reporters
    class Hive

      def initialize( args = {} )

        if args[:url]
          ::Hive::Messages.configure do |config|
            config.base_path       = args[:url]
            config.pem_file        = args[:cert]
            config.ssl_verify_mode = args[:ssl_verify_mode]
          end
        end

      end

      def submit_results(ir, args)
        
        # Still include count summaries for backward compatability
        params = { :failed_count => ir.count(:failed), 
                   :passed_count => ir.count(:passed), 
                   :errored_count => ir.count(:errored), 
                   :running_count => ir.count(:running),
                   :result_details => ir.flat_format.to_json }
        
        hive_job = ::Hive::Messages::Job.new(:job_id => args[:job_id])
        begin
          update_response = hive_job.update_results(params)
          #log "Hive results update response: #{update_response}"
        rescue
          #log "Hive::Messages couldn't hit the hive, retrying once more"
          update_response = hive_job.update_results(params)
          #log "Hive results update response: #{update_response}"
        end
      end

    end
  end
end
