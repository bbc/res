require 'res'
require 'res/reporters/test_rail'
require 'json'

describe Res::Reporters::TestRail do
  
  describe "Submitting Junit results in testrail" do
    describe "Create a new test run and submit results" do
      
      junit_command = "RUBYLIB=lib bundle exec ./bin/res.rb --junit './examples/junit/junittests.xml' --submit testrail --config-file ./examples/cucumber/.test_rail.yaml"
      
      before(:all) do
        @output = `#{junit_command}`
      end

      it "Submit the test results" do
        expect( @output ).to match /Submitted to Test Rail/
      end

    end
  end

end