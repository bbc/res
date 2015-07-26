# Res

Res is a collection of formatting tools for making test 
result reporting easier and more consistent. The concept is that 
rather than writing formatters over and over again for different testing
tools and result repositories, we standardise on one format for test
results (an Intermediate Representation) and write a single formatter
and submitter for each runner and repository.

For example, reporting cucumber results into testrail:

    Cucumber      --------->    Intermediate     -------->   TestRail
    Formatter                  Representation                Reporter

## Frontends

There are three different types of frontend:
1. Formatters -- libs that can be loaded into a test runner to generate IR output
2. Parsers -- scripts that parse result files into IR after a test runner has completed
3. Native -- custom test runners that use IR as their native format

IR is a json formatted file that captures a hierarchical definition of 
a test suite alongside results and metadata.

## Formatters

### Cucumber

You can dump a Res IR results file using a cucumber formater. Simply add
the cucumber formatter to your command line:

    cucumber -f pretty -f Res::Formatters::RubyCucumber -o './cucumber.res'

## Reporters

There are a number of backend reporters, for taking IR and producing a report from
it, or submitting the IR results to a test repository or test management
tool.

If you have a res IR file, you can submit using a reporter: 

    res report --ir <IR_FILE> --repo <REPO_TYPE> [... options]

You can also report results using the api:
    
    Res.report( :ir => '/path/to/file.res', :reporter => :hive, ... ) 

### Hive

Hive CI uses a Res reporter for result submission, the api args look like this:

    Res.submit_results( 
      :reporter => :hive, 
      :ir       => 'spec/outputs/cucumber.res', 
      :url      => 'http://hive.local', 
      :job_id => 10723 
    )

### Test Rail

    res report --ir ./cucumber.res --repo test_rail 
      --username username --password password --namespace mynamespace

Using the api:

    Res.report( :ir => '/path/to/ir', :reporter => :test_rail )

### TestRail Reporter

Our testrail reporter currently be used to sync a suite with testrail, and
to submit test results against a test run. You will need to create a
config file in your project in order for our formatter to know where to sync
the tests and put the results.

Your file should be called .test_rail.yaml, and looks like this:

    namespace: 'iplayer'
    user:      'testrail@example.com'
    password:  'passw0rd'
    project:   'iPlayer Android'
    suite:     'Features'

Note: PostResult no longer picks a project and suite name for you if you don't 
define one.

When submitting results, you will need to provide your testrail run id
that you want your results to be reported against or a name and description
if you want post_result to create a run for you.

You will also need to provide a version string, this is a text string for
identifting the thing you're testing (e.g. a tag or revision number).

#### Tags

PostResult lets you synchronise your cucumber tags with testrail. The default
behaviour matches tags to case types and priorities. For example, if you tag a
scenario: @automated, and you have an 'Automated' test case type in testrail,
the 'Automated' case type will be selected for that scenario.

If you have a scenario tagged @high, and a priority named 'High', the priority
will be set to 'High' for that scenario.

Any unmatched case types and priorities will be set to the default selection.

You can add in additional custom mappings for case types in the .test_rail.yaml
file:

    tag_type_mappings:
      automatable: 'Manual'
      wip: 'Unimplemented'

#### Examples

Syncing a cucumber test suite with TestRail:

First you need to create a .test_rail.yaml file at the base of your cucumber
folder. This contains some important config for your testrail setup. Then, in
order to sync your tests with testrail, run:

    bundle exec cucumber -f TestRail::Sync --dry-run

You will then need to create a test plan or test run in testrail. You submit
results for an individual run by doing:

    TEST_RAIL_RUN_ID=22 VERSION='v1.2.3' bundle exec cucumber -f TestRail::Submit
    
You can get post_result to create a run for you by providing a run name and
optional run description:

    TEST_RAIL_RUN_NAME='ci run #1' TEST_RAIL_RUN_DESCRIPTION='RC Test run overnights \
    VERSION= 'v1.2.3' bundle exec cucumber -f TestRail::Submit

### Testmite Reporter

The tesmite reporter is very similar to the testrail reporter, but doesn't 
require you to sync your test definitions before you submit a run.

You need to create a project file in the root of your test code, the file 
should be called .testmite.yaml, and looks like this:

    testmite_url: 'mytestmiteinstance.bbc.co.uk'
    authentication: 'authenticationkey'
    project:   'iPlayer Radio'
    component: 'Android acceptance'
    suite:     'Cucumber'

When submitting your results you will need to provide a version string
and target string to store your test results against.

#### Examples

You can submit your cucumber results to testmite by running a command like
the following:

    VERSION='1.2.3' TARGET='nexus5' bundle exec cucumber -f Testmite::Submit


