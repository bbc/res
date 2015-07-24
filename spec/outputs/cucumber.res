{
  "started": "2015-07-24 18:55:38 +0100",
  "finished": "2015-07-24 18:55:38 +0100",
  "results": [
    {
      "started": "2015-07-24 18:55:38 +0100",
      "file": "features/background_steps.feature",
      "line": 2,
      "urn": "features/background_steps.feature:2",
      "comments": [
        "# A feature comment",
        "# A background comment"
      ],
      "type": "Cucumber::Feature",
      "name": "Background steps",
      "description": "As a user\nI want to be able to use background steps",
      "children": [
        {
          "started": "2015-07-24 18:55:38 +0100",
          "file": "features/background_steps.feature",
          "line": 12,
          "urn": "features/background_steps.feature:12",
          "type": "Cucumber::Scenario",
          "name": "Basic scenario with background",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given first background step",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "And second background step",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "And third background step",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "Given this fourth thing happens",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "When the fifth thing happens",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then this sixth thing happens",
              "status": "passed"
            }
          ],
          "status": "passed",
          "finished": "2015-07-24 18:55:38 +0100"
        },
        {
          "started": "2015-07-24 18:55:38 +0100",
          "file": "features/background_steps.feature",
          "line": 17,
          "urn": "features/background_steps.feature:17",
          "type": "Cucumber::Scenario",
          "name": "Second scenario with background",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given first background step",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "And second background step",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "And third background step",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "Given this fourth thing happens",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then the fifth thing happens",
              "status": "passed"
            }
          ],
          "status": "passed",
          "finished": "2015-07-24 18:55:38 +0100"
        }
      ],
      "finished": "2015-07-24 18:55:38 +0100"
    },
    {
      "started": "2015-07-24 18:55:38 +0100",
      "file": "features/outlines.feature",
      "line": 2,
      "urn": "features/outlines.feature:2",
      "tags": [
        "outlines"
      ],
      "type": "Cucumber::Feature",
      "name": "Scenario Outlines",
      "description": "As a user\nI want to be able to use Scenario Outlines\nAnd get reports on testing progress",
      "children": [
        {
          "started": "2015-07-24 18:55:38 +0100",
          "file": "features/outlines.feature",
          "line": 9,
          "urn": "features/outlines.feature:9",
          "comments": [
            "#This is a comment"
          ],
          "tags": [
            "broken"
          ],
          "type": "Cucumber::ScenarioOutline",
          "name": "Simple outline",
          "children": [
            {
              "type": "Cucumber::ScenarioOutline::Example",
              "children": [
                {
                  "type": "Cucumber::ScenarioOutline::Parameter",
                  "name": "one",
                  "status": "passed"
                },
                {
                  "type": "Cucumber::ScenarioOutline::Parameter",
                  "name": "nothing",
                  "status": "passed"
                }
              ],
              "name": "| one | nothing |",
              "status": "passed",
              "line": 16,
              "urn": "features/outlines.feature:16"
            },
            {
              "type": "Cucumber::ScenarioOutline::Example",
              "children": [
                {
                  "type": "Cucumber::ScenarioOutline::Parameter",
                  "name": "two",
                  "status": "passed"
                },
                {
                  "type": "Cucumber::ScenarioOutline::Parameter",
                  "name": "an exception",
                  "status": "failed"
                }
              ],
              "name": "| two | an exception |",
              "message": "Exception!",
              "status": "failed",
              "line": 17,
              "urn": "features/outlines.feature:17"
            }
          ],
          "description": "Given an <option> of some description\nWhen <something> happens\nThen the status should be reported\n| option | something |",
          "finished": "2015-07-24 18:55:38 +0100"
        },
        {
          "started": "2015-07-24 18:55:38 +0100",
          "file": "features/outlines.feature",
          "line": 19,
          "urn": "features/outlines.feature:19",
          "type": "Cucumber::ScenarioOutline",
          "name": "Broken outline",
          "children": [
            {
              "type": "Cucumber::ScenarioOutline::Example",
              "children": [
                {
                  "type": "Cucumber::ScenarioOutline::Parameter",
                  "name": "nothing",
                  "status": "passed"
                }
              ],
              "name": "| nothing |",
              "message": "Exception from a non-parameterised step",
              "status": "failed",
              "line": 27,
              "urn": "features/outlines.feature:27"
            },
            {
              "type": "Cucumber::ScenarioOutline::Example",
              "children": [
                {
                  "type": "Cucumber::ScenarioOutline::Parameter",
                  "name": "nought",
                  "status": "passed"
                }
              ],
              "name": "| nought |",
              "message": "Exception from a non-parameterised step",
              "status": "failed",
              "line": 28,
              "urn": "features/outlines.feature:28"
            }
          ],
          "description": "Given something occurs\nWhen <something> happens\nAnd a non-parametised step throws an exception\nThen the result is a fail\n| something |",
          "finished": "2015-07-24 18:55:38 +0100"
        }
      ],
      "finished": "2015-07-24 18:55:38 +0100"
    },
    {
      "started": "2015-07-24 18:55:38 +0100",
      "file": "features/result_statuses.feature",
      "line": 1,
      "urn": "features/result_statuses.feature:1",
      "type": "Cucumber::Feature",
      "name": "Result statuses feature",
      "description": "As a user\nI want to be able to detect various results",
      "children": [
        {
          "started": "2015-07-24 18:55:38 +0100",
          "file": "features/result_statuses.feature",
          "line": 5,
          "urn": "features/result_statuses.feature:5",
          "type": "Cucumber::Scenario",
          "name": "Passing scenario",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given everything passes",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then I report a pass",
              "status": "passed"
            }
          ],
          "status": "passed",
          "finished": "2015-07-24 18:55:38 +0100"
        },
        {
          "started": "2015-07-24 18:55:38 +0100",
          "file": "features/result_statuses.feature",
          "line": 9,
          "urn": "features/result_statuses.feature:9",
          "type": "Cucumber::Scenario",
          "name": "Everything Fails Scenario",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given everything fails",
              "status": "failed",
              "message": "I broken!"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then I report a fail",
              "status": "skipped"
            }
          ],
          "status": "failed",
          "finished": "2015-07-24 18:55:38 +0100"
        },
        {
          "started": "2015-07-24 18:55:38 +0100",
          "file": "features/result_statuses.feature",
          "line": 13,
          "urn": "features/result_statuses.feature:13",
          "type": "Cucumber::Scenario",
          "name": "Single Step fails in this Scenario",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given most of the steps pass",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "And one step fails",
              "status": "failed",
              "message": "I fail"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then I report a fail",
              "status": "skipped"
            }
          ],
          "status": "failed",
          "finished": "2015-07-24 18:55:38 +0100"
        }
      ],
      "finished": "2015-07-24 18:55:38 +0100"
    },
    {
      "started": "2015-07-24 18:55:38 +0100",
      "file": "features/simple.feature",
      "line": 2,
      "urn": "features/simple.feature:2",
      "tags": [
        "simple"
      ],
      "type": "Cucumber::Feature",
      "name": "Simple feature",
      "description": "As a user\nI want to be able to write simple features\nAnd get reports on testing progress",
      "children": [
        {
          "started": "2015-07-24 18:55:38 +0100",
          "file": "features/simple.feature",
          "line": 8,
          "urn": "features/simple.feature:8",
          "tags": [
            "very_simple_one"
          ],
          "type": "Cucumber::Scenario",
          "name": "Very basic scenario",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given a simple step",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "When something happens",
              "status": "failed",
              "message": "Aaaaargh!"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then the status should be reported",
              "status": "skipped"
            }
          ],
          "status": "failed",
          "finished": "2015-07-24 18:55:38 +0100"
        }
      ],
      "finished": "2015-07-24 18:55:38 +0100"
    },
    {
      "started": "2015-07-24 18:55:38 +0100",
      "file": "features/subdirs/simple.feature",
      "line": 2,
      "urn": "features/subdirs/simple.feature:2",
      "tags": [
        "simple_in_subdir"
      ],
      "type": "Cucumber::Feature",
      "name": "Simple feature",
      "description": "As a user\nI want to be able to write simple features\nThat lives in a subdir",
      "children": [
        {
          "started": "2015-07-24 18:55:38 +0100",
          "file": "features/subdirs/simple.feature",
          "line": 8,
          "urn": "features/subdirs/simple.feature:8",
          "tags": [
            "very_simple_one"
          ],
          "type": "Cucumber::Scenario",
          "name": "Very basic scenario",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given a simple step",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "When something happens",
              "status": "failed",
              "message": "Aaaaargh!"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then the status should be reported",
              "status": "skipped"
            }
          ],
          "status": "failed",
          "finished": "2015-07-24 18:55:38 +0100"
        }
      ],
      "finished": "2015-07-24 18:55:38 +0100"
    },
    {
      "started": "2015-07-24 18:55:38 +0100",
      "file": "features/subdirs/subdirs/simple.feature",
      "line": 2,
      "urn": "features/subdirs/subdirs/simple.feature:2",
      "tags": [
        "simple_in_a_sub_subdir"
      ],
      "type": "Cucumber::Feature",
      "name": "Simple feature",
      "description": "As a user\nI want to be able to write simple features\nThat lives in an identically named subdir",
      "children": [
        {
          "started": "2015-07-24 18:55:38 +0100",
          "file": "features/subdirs/subdirs/simple.feature",
          "line": 8,
          "urn": "features/subdirs/subdirs/simple.feature:8",
          "tags": [
            "very_simple_one"
          ],
          "type": "Cucumber::Scenario",
          "name": "Very basic scenario",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given a simple step",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "When something happens",
              "status": "failed",
              "message": "Aaaaargh!"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then the status should be reported",
              "status": "skipped"
            }
          ],
          "status": "failed",
          "finished": "2015-07-24 18:55:38 +0100"
        }
      ],
      "finished": "2015-07-24 18:55:38 +0100"
    },
    {
      "started": "2015-07-24 18:55:38 +0100",
      "file": "features/tables.feature",
      "line": 2,
      "urn": "features/tables.feature:2",
      "tags": [
        "tables"
      ],
      "type": "Cucumber::Feature",
      "name": "Tables",
      "description": "As a user\nI want to be able to write features using tables\nAnd ensure they are reported to the repository",
      "children": [
        {
          "started": "2015-07-24 18:55:38 +0100",
          "file": "features/tables.feature",
          "line": 7,
          "urn": "features/tables.feature:7",
          "type": "Cucumber::Scenario",
          "name": "Values table",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given a simple step",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "When a table with values is encountered:",
              "status": "passed",
              "args": "\n  |     A |     B |\n  |     1 |     2 |\n  |     2 |     3 |\n"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then the table should be parsed",
              "status": "passed"
            }
          ],
          "status": "passed",
          "finished": "2015-07-24 18:55:38 +0100"
        }
      ],
      "finished": "2015-07-24 18:55:38 +0100"
    },
    {
      "started": "2015-07-24 18:55:38 +0100",
      "file": "features/tags.feature",
      "line": 2,
      "urn": "features/tags.feature:2",
      "tags": [
        "high"
      ],
      "type": "Cucumber::Feature",
      "name": "Two scenarios in this feature",
      "description": "As a user\nI want to be able to write multiple scenarios",
      "children": [
        {
          "started": "2015-07-24 18:55:38 +0100",
          "file": "features/tags.feature",
          "line": 7,
          "urn": "features/tags.feature:7",
          "tags": [
            "automated"
          ],
          "type": "Cucumber::Scenario",
          "name": "Scenario tagged as automated",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given a simple step",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "When something happens",
              "status": "failed",
              "message": "Aaaaargh!"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then the status should be reported",
              "status": "skipped"
            }
          ],
          "status": "failed",
          "finished": "2015-07-24 18:55:38 +0100"
        },
        {
          "started": "2015-07-24 18:55:38 +0100",
          "file": "features/tags.feature",
          "line": 13,
          "urn": "features/tags.feature:13",
          "tags": [
            "custommanualtag"
          ],
          "type": "Cucumber::Scenario",
          "name": "Scenario with a custom tag",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given a simple step",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "When something else happens",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then the status should be reported",
              "status": "passed"
            }
          ],
          "status": "passed",
          "finished": "2015-07-24 18:55:38 +0100"
        }
      ],
      "finished": "2015-07-24 18:55:38 +0100"
    },
    {
      "started": "2015-07-24 18:55:38 +0100",
      "file": "features/two_scenarios.feature",
      "line": 3,
      "urn": "features/two_scenarios.feature:3",
      "comments": [
        "# A feature comment",
        "# A background comment"
      ],
      "tags": [
        "two"
      ],
      "type": "Cucumber::Feature",
      "name": "Two scenarios in this feature",
      "description": "As a user\nI want to be able to write multiple scenarios",
      "children": [
        {
          "started": "2015-07-24 18:55:38 +0100",
          "file": "features/two_scenarios.feature",
          "line": 13,
          "urn": "features/two_scenarios.feature:13",
          "tags": [
            "first"
          ],
          "type": "Cucumber::Scenario",
          "name": "Very basic scenario",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given some background tasks",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "And some other things",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "Given a simple step",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "When something happens",
              "status": "failed",
              "message": "Aaaaargh!"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then the status should be reported",
              "status": "skipped"
            }
          ],
          "status": "failed",
          "finished": "2015-07-24 18:55:38 +0100"
        },
        {
          "started": "2015-07-24 18:55:38 +0100",
          "file": "features/two_scenarios.feature",
          "line": 20,
          "urn": "features/two_scenarios.feature:20",
          "comments": [
            "#A scenario comment"
          ],
          "tags": [
            "last"
          ],
          "type": "Cucumber::Scenario",
          "name": "The other scenario",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given some background tasks",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "And some other things",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "Given a simple step",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "When something else happens",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then the status should be reported",
              "status": "passed"
            }
          ],
          "status": "passed",
          "finished": "2015-07-24 18:55:38 +0100"
        }
      ],
      "finished": "2015-07-24 18:55:38 +0100"
    }
  ],
  "type": "Cucumber"
}
