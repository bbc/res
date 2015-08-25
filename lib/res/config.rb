require 'yaml'
require 'ostruct'


module Res
  class Config
    attr_accessor :struct, :prepend
    
    def initialize(items, prepend = '')
      @struct = Struct.new(items).new
      @prepend = prepend
    end

    
    # Load in config -- this can come from three places:
    # 1. Arguments passed to the initializer
    # 2. From environment variables
    # 3. From a config file
    def process( args = {} )
      
      raise 'Need to configure Config class'
      
      config_file = {}
      if args[:config_file]
        load_from_config(args[:config_file])
        args.delete![:config_file]
      end
      
      struct.members.each do |item|
        struct[item] = args[item] || ENV[(prepend + item).upcase] || config_file[:item]
      end
    end

    def load_from_config(config_file)
      config = {}
      if File.exists?(config_file)
        config = YAML::load(File.open(config_file))
      end
      config
    end

  end
end
