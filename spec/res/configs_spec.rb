require 'spec_helper'
require 'res/config'

EXAMPLE_CONFIG_FILE = 'blah'


describe Res::Config do

  describe ".new" do
    it 'can be initialized with required parameters' do
      expect( Res::Config.new([:a, :b]) ).to be_a Res::Config
    end
  end

  describe "#process" do

    context "Initialized with required values" do

      let!(:config) { Res::Config.new([:a, :b], :pre_env => 'PRE_ENV_') }

      it "should throw an exception if all the values aren't set" do
        expect { config.process(:a => 1) }.to raise_exception
      end

      it "gets set up cleanly when all values are set" do
        config.process(:a => 1, :b => 2)
        expect( config.a ).to eq 1
        expect( config.b ).to eq 2
      end

      it "reads config from the environment" do
        ENV['PRE_ENV_A'] = 'X'
        config.process( :b => 2 )
        expect( config.a ).to eq 'X'
      end

    end

    context "Initialized with required and optional values" do
      let!(:config) { Res::Config.new([:a, :b], :optional => [:c, :d], :pre_env => 'PRE_ENV_') }
      
      it "should throw an exception if all the required values aren't set" do
        expect { config.process(:a => 1) }.to raise_exception
      end

      it "should initialize cleanly if optional values aren't set" do
        config.process(:a => 1, :b => 2)
        expect(config.a).to eq 1
        expect(config.c).to be_nil
      end

      it "should initialize with optional values" do
        config.process(:a => 1, :b => 2, :c => 3, :d => 4)
        expect(config.a).to eq 1
        expect(config.b).to eq 2
        expect(config.c).to eq 3
        expect(config.d).to eq 4
      end

    end
  end

end
