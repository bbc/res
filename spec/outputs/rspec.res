{
  "started": "",
  "finished": "2015-10-26 12:41:57 +0000",
  "results": [
    {
      "type": "Rspec::Describe",
      "name": "I am describe",
      "urn": "./spec/rspec_formatter_spec.rb:3",
      "children": [
        {
          "type": "Rspec::Describe",
          "name": "Describe#1",
          "urn": "./spec/rspec_formatter_spec.rb:6",
          "children": [
            {
              "type": "Rspec::Test",
              "name": "I am passing test#1",
              "urn": "./spec/rspec_formatter_spec.rb:8",
              "status": "passed"
            },
            {
              "type": "Rspec::Test",
              "name": "I am failing test#1",
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
              "name": "I am passing test#2",
              "urn": "./spec/rspec_formatter_spec.rb:18",
              "status": "passed"
            },
            {
              "type": "Rspec::Test",
              "name": "I am passing test#3",
              "urn": "./spec/rspec_formatter_spec.rb:22",
              "status": "passed"
            },
            {
              "type": "Rspec::Test",
              "name": "I am passing test#4",
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
                          "name": "I am failing test#2",
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
              "name": "I am passing test#5",
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
              "name": "I am passing test#6",
              "urn": "./spec/rspec_formatter_spec.rb:50",
              "status": "passed"
            }
          ]
        },
        {
          "type": "Rspec::Test",
          "name": "I am passing test#7",
          "urn": "./spec/rspec_formatter_spec.rb:55",
          "status": "passed"
        },
        {
          "type": "Rspec::Test",
          "name": "I am failing test#3",
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
          "name": "I am passing test#8",
          "urn": "./spec/rspec_formatter_spec.rb:66",
          "status": "passed"
        }
      ]
    }
  ],
  "type": "Rspec"
}
