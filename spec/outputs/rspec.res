{
  "started": "",
  "finished": "2015-10-26 12:13:40 +0000",
  "results": [
    {
      "type": "Rspec::Describe",
      "name": "I am describe",
      "urn": "./spec/rspec_formatter_spec.rb:3",
      "children": [
        {
          "type": "Rspec::Describe",
          "name": "#tests",
          "urn": "./spec/rspec_formatter_spec.rb:6",
          "children": [
            {
              "type": "Rspec::Test",
              "name": "returns an array of just the test portions of the json",
              "urn": "./spec/rspec_formatter_spec.rb:8",
              "status": "passed"
            },
            {
              "type": "Rspec::Test",
              "name": "only includes Testcase as tests",
              "urn": "./spec/rspec_formatter_spec.rb:12",
              "status": "failed"
            }
          ]
        },
        {
          "type": "Rspec::Describe",
          "name": "#count",
          "urn": "./spec/rspec_formatter_spec.rb:17",
          "children": [
            {
              "type": "Rspec::Test",
              "name": "Can pick out the passing tests from the run",
              "urn": "./spec/rspec_formatter_spec.rb:18",
              "status": "passed"
            },
            {
              "type": "Rspec::Test",
              "name": "Can pick out the failing tests from the run",
              "urn": "./spec/rspec_formatter_spec.rb:22",
              "status": "passed"
            },
            {
              "type": "Rspec::Test",
              "name": "Can identify there were no tests of an unknown type",
              "urn": "./spec/rspec_formatter_spec.rb:26",
              "status": "passed"
            }
          ]
        },
        {
          "type": "Rspec::Describe",
          "name": "I am First Context",
          "urn": "./spec/rspec_formatter_spec.rb:31",
          "children": [
            {
              "type": "Rspec::Describe",
              "name": "I am context 2",
              "urn": "./spec/rspec_formatter_spec.rb:32",
              "children": [
                {
                  "type": "Rspec::Describe",
                  "name": "I am context 3",
                  "urn": "./spec/rspec_formatter_spec.rb:33",
                  "children": [
                    {
                      "type": "Rspec::Describe",
                      "name": "I am context 4",
                      "urn": "./spec/rspec_formatter_spec.rb:34",
                      "children": [
                        {
                          "type": "Rspec::Test",
                          "name": "I am first test",
                          "urn": "./spec/rspec_formatter_spec.rb:35",
                          "status": "failed"
                        }
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "type": "Rspec::Describe",
          "name": "I am context 3",
          "urn": "./spec/rspec_formatter_spec.rb:43",
          "children": [
            {
              "type": "Rspec::Test",
              "name": "I am test 2",
              "urn": "./spec/rspec_formatter_spec.rb:44",
              "status": "passed"
            }
          ]
        },
        {
          "type": "Rspec::Describe",
          "name": "Context 4",
          "urn": "./spec/rspec_formatter_spec.rb:49",
          "children": [
            {
              "type": "Rspec::Test",
              "name": "This is it",
              "urn": "./spec/rspec_formatter_spec.rb:50",
              "status": "passed"
            }
          ]
        },
        {
          "type": "Rspec::Test",
          "name": "I am second test",
          "urn": "./spec/rspec_formatter_spec.rb:55",
          "status": "passed"
        },
        {
          "type": "Rspec::Test",
          "name": "I am third test",
          "urn": "./spec/rspec_formatter_spec.rb:59",
          "status": "failed"
        }
      ]
    },
    {
      "type": "Rspec::Describe",
      "name": "I am describe 2",
      "urn": "./spec/rspec_formatter_spec.rb:65",
      "children": [
        {
          "type": "Rspec::Test",
          "name": "I am test 2",
          "urn": "./spec/rspec_formatter_spec.rb:66",
          "status": "passed"
        }
      ]
    }
  ],
  "type": "Rspec"
}
