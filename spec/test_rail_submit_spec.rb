require 'res'
require 'res/reporters/test_rail'
require 'json'

describe Res::Reporters::TestRail do
 
  describe "Submitting Junit results in testrail" do
    describe "Create a new test run and submit results" do
      
      junit_command = "RUBYLIB=lib bundle exec ruby ./bin/res.rb --junit './examples/junit/junittests.xml' --submit testrail --config-file ./examples/cucumber/.test_rail.yaml"
      
      it "Skipping tests", :if => !File.exists?("./examples/cucumber/.test_rail.yaml") do
        puts "Create file ./examples/cucumber/.test_rail.yaml with below template
              namespace: 'namespace'
              url:       'url'
              user:      'username'
              password:  'password'
              suite:     'SuiteName'
              project:   'ProjectName'
              run_name:  'RunName'
              run_id:    'run_id'"
        puts "Skipping Rspec tests for test rail as .test_rail.yaml not found"
      end

      it "Submit the test results", :if => File.exists?("./examples/cucumber/.test_rail.yaml") do
        @output = `#{junit_command}`
        expect( @output ).to match /Submitted to Test Rail/
      end

    end
  end

  describe "Submitting Cucumber results in testrail" do
    describe "Create a new test run and submit results" do
      
      cucumber_command = "unset BUNDLE_GEMFILE; unset RUBYOPT; cd examples/cucumber; bundle install --without production test > /dev/null && VERSION=12 TARGET=nothing bundle exec cucumber"

      it "Submit the test results", :if => File.exists?("./examples/cucumber/.test_rail.yaml") do
        `#{cucumber_command} features/tags.feature -f Res::Formatters::RubyCucumber -o ./cucumber.res`
        @output = `unset BUNDLE_GEMFILE; unset RUBYOPT; RUBYLIB=lib bundle exec ruby ./bin/res.rb --res examples/cucumber/cucumber.res --submit testrail --config-file ./examples/cucumber/.test_rail.yaml`
        expect( @output ).to include ("Submitted to Test Rail")
      end

    end
  end

end
