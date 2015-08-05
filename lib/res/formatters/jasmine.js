module Res
  module Formatters
  	class Jasmine

  		# def initialize(formatter, jasmine_server_url, result_batch_size)
  		# 	@formatter = formatter
  		# 	@jasmine_server_url = jasmine_server_url
  		# 	@result_batch_size = result_batch_size
  		# end
  		
  		def format(results)
  			results.each do |result|

  				require 'pry'
  				binding.pry
  				puts "A"
    		end
  		end

  		def done
  			puts "Done"
  		end
  	end
  end
end


module Res
	module Formatters
		class Runner
			attr_accessor :formatter, :jasmine_server_url, :result_batch_size
			def initialize(formatter, jasmine_server_url, result_batch_size)
				@formatter =formatter
				@jasmine_server_url = jasmine_server_url
				@result_batch_size = result_batch_size
			end

			def run()

				command = "#{Phantomjs.path} /Users/khana46/opt/res/res/run-jasmine.js #{@jasmine_server_url} #{@result_batch_size}"
			require 'pry'
			binding.pry
				IO.popen(command) do |output|
					output.each do |line|
						raw_results = JSON.parse(line.to_json, :max_nesting => false)
						results = raw_results.map { |r| Result.new(r) }
						@formatter.format(results)
					end
				end
				@formatter.done
			end
		end
	end
end 
