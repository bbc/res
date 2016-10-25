require 'res/parsers/android_junit'
require 'json'

describe Res::Parsers::AndroidJunit do
  let(:pass_test) { 'spec/outputs/android_junit_single_pass.out' }
  let(:failing_test) { 'spec/outputs/android_junit_single_fail.out' }
  let(:erroring_test) { 'spec/outputs/android_junit_single_error_with_retry.out'}

  before(:each) do
    File.delete('instruments.res') if File.exist?('instruments.res')
  end

  describe '.new' do

    it 'returns the correct results when parsing a passing test' do
      Res::Parsers::AndroidJunit.new(pass_test)
      ir = Res::IR.load('instruments.res')
      expect(ir.count(:passed)).to eq 1
      expect(ir.count(:failed)).to eq 0
      expect(ir.count(:unknown)).to eq 0
    end

    it 'returns the correct results when parsing a failing test' do
      Res::Parsers::AndroidJunit.new(failing_test)
      ir = Res::IR.load('instruments.res')
      expect(ir.count(:failed)).to eq 1
      expect(ir.count(:passed)).to eq 0
      expect(ir.count(:unknown)).to eq 0
    end

    it 'returns the correct results when parsing an erroring test' do
      Res::Parsers::AndroidJunit.new(erroring_test)
      ir = Res::IR.load('instruments.res')
      expect(ir.count(:passed)).to eq 0
      expect(ir.count(:failed)).to eq 2
      expect(ir.count(:unknown)).to eq 0
    end

  end
end
