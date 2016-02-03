require 'res/ir'

# Res API
module Res

  @data = []

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

  def self.parse_results(args)
    parser_class = Res.parser_class(args[:parser])
    parser_class.new(args[:file])
  end

  def self.parser_class(type)
    case type
      when :junit
        require 'res/parsers/junit'
        Res::Parsers::Junit
      when :junitcasper
        require 'res/parsers/junitcasper'
        Res::Parsers::Junitcasper
      else
        raise "#{type} parser not Implemented"
    end
  end

  def self.perf_data
    @data
  end

end
