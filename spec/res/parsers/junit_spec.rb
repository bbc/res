require 'spec_helper'
require 'res/parsers/junit'
require 'json'

describe Res::Parsers::Junit do
  let(:pass_test) { 'spec/outputs/junit_passed.xml' }
  let(:fail_test) { 'spec/outputs/junit_failed.xml' }

  before(:each) do
    File.delete('junit.res') if File.exist?('junit.res')
  end

  describe '.new' do

    it 'returns the correct results when parsing a passing test' do
      Res::Parsers::Junit.new(pass_test)
      ir = Res::IR.load('junit.res')
      expect(ir.count(:passed)).to eq 10
      expect(ir.count(:failed)).to eq 0
      expect(ir.count(:unknown)).to eq 0
    end

    it 'returns the correct results when parsing a passed and failing test' do
      Res::Parsers::Junit.new(fail_test)
      ir = Res::IR.load('junit.res')
      expect(ir.count(:passed)).to eq 6
      expect(ir.count(:failed)).to eq 4
      expect(ir.count(:unknown)).to eq 0
    end

  end
end
