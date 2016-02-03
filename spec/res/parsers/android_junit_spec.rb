require 'res/parsers/android_junit'
require 'json'

describe Res::Parsers::AndroidJunit do
  let(:general_file) { 'spec/outputs/android_junit_general.out' }
  let(:single_test_1) { 'spec/outputs/android_junit_single_test_1.out' }
  let(:single_test_2) { 'spec/outputs/android_junit_single_test_2.out' }

  let(:single_good_test) {
    {
      "results" => [
        {
          "type" => "AndroidJUnit::Class",
          "name" => "com.example.test.ExampleClass",
          "children" => [
            {
            "type" => "AndroidJUnit::Test",
            "name" => "ExampleTest",
            "status" => "passed"
            }
          ]
        }
      ]
    }
  }

  before(:each) do
    File.delete('instruments.res') if File.exist?('instruments.res')
  end

  describe '.new' do
    it 'accepts an empty file' do
      expect(Res::Parsers::AndroidJunit.new(general_file)).to be_an Res::Parsers::AndroidJunit
    end

    it 'accepts a test with fields ordered class/test' do
      expect(Res::Parsers::AndroidJunit.new(single_test_1)).to be_an Res::Parsers::AndroidJunit
    end

    it 'correctly interprets a test with fields ordered class/test' do
      Res::Parsers::AndroidJunit.new(single_test_1)
      expect(JSON.parse(File.read('instruments.res'))).to include(single_good_test)
    end

    it 'accepts a test with fields ordered test/class' do
      expect(Res::Parsers::AndroidJunit.new(single_test_2)).to be_an Res::Parsers::AndroidJunit
    end

    it 'correctly interprets a test with fields ordered test/class' do
      Res::Parsers::AndroidJunit.new(single_test_2)
      expect(JSON.parse(File.read('instruments.res'))).to include(single_good_test)
    end

  end
end
