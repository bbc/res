require 'yaml'


module Res
  class Config
    attr_accessor :struct, :prepend
        
    def initialize(items, prepend = '')
      @struct = Struct.new(*items).new
      @prepend = prepend
    end
    
    # Load in config -- this can come from three places:
    # 1. Arguments passed to the initializer
    # 2. From environment variables
    # 3. From a config file
    def process( args = {} )
      
      config_from_file = {}
      if args[:config_file]
        config_from_file = load_from_config(args[:config_file])
        args.delete(:config_file)
      end
      
      missing = []
      struct.members.each do |item|
        struct[item] = args[item] || ENV[(prepend + item.to_s).upcase] || config_from_file[item]
        missing << item if !struct[item]
      end
      raise "Missing configuration: " + missing.join( ", ") if missing.any?
    end

    def load_from_config(config_file)
      config = {}
      if File.exists?(config_file)
        config = Res::Config.symbolize_keys(YAML::load(File.open(config_file)))
      else
        raise "Couldn't find config file '#{config_file}'"
      end
      config
    end
    
    def self.symbolize_keys(hash)
      symbolized_hash = {}
      hash.each do |key, value|
        symbolized_hash[key.to_sym] = value
      end
      symbolized_hash
    end
    
    def method_missing(m, *args, &block)
      struct.send(m,*args, &block)
    end

  end
end
