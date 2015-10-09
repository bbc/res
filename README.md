# Res

Res is a collection of formatting tools for making test 
result reporting easier and more consistent. The concept is that 
rather than writing formatters over and over again for different testing
tools and result repositories, we standardise on one format for test
results (an Intermediate Representation) and write a single formatter
and submitter for each runner and repository.

Example: Reporting a testing tool output to testrail

    Formatter      --------->    Intermediate     -------->   Reporter
    or Parser                   Representation               (TestRail)

## Frontends

There are three different types of front end:

1. Formatters -- libraries that can be loaded into a test runner to generate IR output
2. Parsers -- scripts that parse result files into IR after a test runner has completed
3. Native -- custom test runners that use IR as their native format

IR is a json formatted file that captures a hierarchical definition of 
a test suite alongside results and metadata.

## Formatters and Parsers
You can dump a Res IR results file using a cucumber formatter or parse xunit output into res format. 

## Cucumber

    cucumber -f pretty -f Res::Formatters::RubyCucumber -o './cucumber.res'
Note: This cucumber formatter works for cucumber version < 2.0 

## Junit

    ./bin/res.rb --junit '/path/to/xunit_result.xml'
Note: The Res output of the xunit parser is saved in the current directory

## Reporters

There are a number of backend reporters, for taking IR and producing a report from
it, or submitting the IR results to a test repository or test management
tool.

If you have a Res IR file, you can submit using a reporter: 

    ./bin/res.rb --res '/path/to/file.res' --submit REPORTER [... options]

### Hive

Hive CI uses a Res reporter for result submission, the api arguments look like this:

    Res.submit_results( 
      :reporter => :hive, 
      :ir       => 'path/to/file.res', 
      :url      => 'http://hive.local', 
      :job_id   => 10723 
    )

### TestRail

    ./bin/res.rb --res '/path/to/file.res' --submit testrail --config-file '/path/to/.test_rail.yaml'

Our TestRail reporter currently be used to sync a suite with TestRail, and
to submit test results against a test run. You will need to create a
config file in your project in order for our reporter to know where to sync
the tests and put the results.
    
Your config file should be called .test_rail.yaml, and should look like this:

    namespace: 'NameSpace'
    user:      'user@example.com'
    password:  'passw0rd'
    project:   'MyProjectName'
    suite:     'MySuite'
    run_name:  'RunName' or run_id:    '1234'

### Testmine 

The Testmine reporter is very similar to the TestRail reporter, but doesn't 
require you to sync your test definitions before you submit a run.

You need to create a project file in the root of your test code, the file 
should be called .testmine.yaml, and should look like this:

    testmine_url: 'mytestmineinstance.bbc.co.uk'
    authentication: 'authenticationkey'
    project:   'MyProjectName'
    component: 'Android acceptance'
    suite:     'MySuiteName'
