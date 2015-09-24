require 'res'
require 'res/reporters/test_rail'
require 'json'

describe Res::Reporters::TestRail do
  
  describe "Submitting Junit results in testrail" do
    describe "Create a new test run and submit results" do
      
      junit_command = "RUBYLIB=lib bundle exec ./bin/res.rb --junit './examples/junit/junittests.xml' --submit testrail --config-file ./examples/cucumber/.test_rail.yaml"
      
      before(:each) do
        @output = `#{junit_command}`
      end

      it "Submit the test results" do
        expect( @output ).to match /Submitted to Test Rail/
      end

    end
  end

  describe "Submitting Cucumber results in testrail" do
    describe "Create a new test run and submit results" do
      
      cucumber_command = "unset BUNDLE_GEMFILE; unset RUBYOPT; cd examples/cucumber; bundle install --without production test > /dev/null && VERSION=12 TARGET=nothing bundle exec cucumber"
      
      before(:each) do
        `#{cucumber_command} features/tags.feature -f Res::Formatters::RubyCucumber -o ./cucumber.res`
        @output = `RUBYLIB=lib ./bin/res.rb --res examples/cucumber/cucumber.res --submit testrail --config-file ./examples/cucumber/.test_rail.yaml`
      end

      it "Submit the test results" do
         expect( @output ).to include ("Submitted to Test Rail")
      end

    end
  end

end