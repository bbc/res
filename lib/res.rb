require 'res/ir'

# Res API
module Res

  # Report Res IR to a test repository or similar
  def self.submit_results(args)
    reporter_class = Res.reporter_class(args[:reporter])
    reporter = reporter_class.new( args )
    
    ir = Res::IR.load(args[:ir])
    
    reporter.submit_results( ir, args )
  end

  def self.reporter_class(type)
    case type
    when :test_rail
      require 'res/reporters/test_rail'
      Res::Reporters::TestRail
    when :hive
      require 'res/reporters/hive'
      Res::Reporters::Hive
    when :testmine
      require 'res/reporters/testmine'
      Res::Reporters::Testmine
    end
  end

end
