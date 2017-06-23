{
  "started": "2017-06-23 11:36:46 +0100",
  "finished": "2017-06-23 11:36:46 +0100",
  "results": [
    {
      "started": "2017-06-23 11:36:46 +0100",
      "file": "features/test.feature",
      "line": 1,
      "urn": "features/test.feature:1",
      "type": "Cucumber::Feature",
      "name": "test",
      "description": "",
      "children": [
        {
          "started": "2017-06-23 11:36:46 +0100",
          "file": "features/test.feature",
          "line": 2,
          "urn": "features/test.feature:2",
          "type": "Cucumber::ScenarioOutline",
          "name": "test2",
          "children": [
            {
              "type": "Cucumber::ScenarioOutline::Example",
              "children": [
                {
                  "type": "Cucumber::ScenarioOutline::Parameter",
                  "name": "true",
                  "status": "failed"
                },
                {
                  "type": "Cucumber::ScenarioOutline::Parameter",
                  "name": "false",
                  "status": "failed"
                }
              ],
              "name": "| true | false |",
              "message": "\nexpected: false\n     got: true\n\n(compared using ==)\n",
              "status": "failed",
              "line": 8,
              "urn": "features/test.feature:8"
            },
            {
              "type": "Cucumber::ScenarioOutline::Example",
              "children": [
                {
                  "type": "Cucumber::ScenarioOutline::Parameter",
                  "name": "true",
                  "status": "passed"
                },
                {
                  "type": "Cucumber::ScenarioOutline::Parameter",
                  "name": "true",
                  "status": "passed"
                }
              ],
              "name": "| true | true |",
              "status": "passed",
              "line": 9,
              "urn": "features/test.feature:9"
            }
          ],
          "description": "When I do <this>\nThen I get <that>\n| this | that |",
          "status": "passed",
          "finished": "2017-06-23 11:36:46 +0100"
        }
      ],
      "finished": "2017-06-23 11:36:46 +0100"
    },
    {
      "started": "2017-06-23 11:36:46 +0100",
      "file": "features/test2.feature",
      "line": 1,
      "urn": "features/test2.feature:1",
      "type": "Cucumber::Feature",
      "name": "Ruby Cucumber 2 Formatter testing for first fail scenario and other pass",
      "description": "",
      "children": [
        {
          "started": "2017-06-23 11:36:46 +0100",
          "file": "features/test2.feature",
          "line": 2,
          "urn": "features/test2.feature:2",
          "type": "Cucumber::Scenario",
          "name": "Failed Scenario",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given I am testing first scenario",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then My test fail",
              "status": "failed",
              "message": "\nexpected: false\n     got: true\n\n(compared using ==)\n"
            }
          ],
          "status": "failed",
          "finished": "2017-06-23 11:36:46 +0100"
        },
        {
          "started": "2017-06-23 11:36:46 +0100",
          "file": "features/test2.feature",
          "line": 6,
          "urn": "features/test2.feature:6",
          "type": "Cucumber::Scenario",
          "name": "Passing Scenario 1",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given I am testing second scenario",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then My test pass",
              "status": "passed"
            }
          ],
          "status": "passed",
          "finished": "2017-06-23 11:36:46 +0100"
        },
        {
          "started": "2017-06-23 11:36:46 +0100",
          "file": "features/test2.feature",
          "line": 10,
          "urn": "features/test2.feature:10",
          "type": "Cucumber::Scenario",
          "name": "Passing Scenario 2",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given I am testing third scenario",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then My test pass",
              "status": "passed"
            }
          ],
          "status": "passed",
          "finished": "2017-06-23 11:36:46 +0100"
        }
      ],
      "finished": "2017-06-23 11:36:46 +0100"
    },
    {
      "started": "2017-06-23 11:36:46 +0100",
      "file": "features/test3.feature",
      "line": 1,
      "urn": "features/test3.feature:1",
      "type": "Cucumber::Feature",
      "name": "Ruby Cucumber 2 Formatter testing for failing background",
      "description": "",
      "message": "\nexpected: false\n     got: true\n\n(compared using ==)\n",
      "children": [
        {
          "started": "2017-06-23 11:36:46 +0100",
          "file": "features/test3.feature",
          "line": 6,
          "urn": "features/test3.feature:6",
          "type": "Cucumber::Scenario",
          "name": "Failed Scenario",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given I am testing first scenario",
              "status": "skipped"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then My test fail",
              "status": "skipped"
            }
          ],
          "status": "failed",
          "finished": "2017-06-23 11:36:46 +0100"
        },
        {
          "started": "2017-06-23 11:36:46 +0100",
          "file": "features/test3.feature",
          "line": 10,
          "urn": "features/test3.feature:10",
          "type": "Cucumber::Scenario",
          "name": "Passing Scenario 1",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given I am testing second scenario",
              "status": "skipped"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then My test pass",
              "status": "skipped"
            }
          ],
          "status": "failed",
          "finished": "2017-06-23 11:36:46 +0100"
        },
        {
          "started": "2017-06-23 11:36:46 +0100",
          "file": "features/test3.feature",
          "line": 14,
          "urn": "features/test3.feature:14",
          "type": "Cucumber::Scenario",
          "name": "Passing Scenario 2",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given I am testing third scenario",
              "status": "skipped"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then My test pass",
              "status": "skipped"
            }
          ],
          "status": "failed",
          "finished": "2017-06-23 11:36:46 +0100"
        }
      ],
      "finished": "2017-06-23 11:36:46 +0100"
    },
    {
      "started": "2017-06-23 11:36:46 +0100",
      "file": "features/test4.feature",
      "line": 1,
      "urn": "features/test4.feature:1",
      "type": "Cucumber::Feature",
      "name": "Ruby Cucumber 2 Formatter testing for passing background",
      "description": "",
      "children": [
        {
          "started": "2017-06-23 11:36:46 +0100",
          "file": "features/test4.feature",
          "line": 6,
          "urn": "features/test4.feature:6",
          "type": "Cucumber::Scenario",
          "name": "Failed Scenario",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given I am testing first scenario",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then My test fail",
              "status": "failed",
              "message": "\nexpected: false\n     got: true\n\n(compared using ==)\n"
            }
          ],
          "status": "failed",
          "finished": "2017-06-23 11:36:46 +0100"
        },
        {
          "started": "2017-06-23 11:36:46 +0100",
          "file": "features/test4.feature",
          "line": 10,
          "urn": "features/test4.feature:10",
          "type": "Cucumber::Scenario",
          "name": "Passing Scenario 1",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given I am testing second scenario",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then My test pass",
              "status": "passed"
            }
          ],
          "status": "passed",
          "finished": "2017-06-23 11:36:46 +0100"
        },
        {
          "started": "2017-06-23 11:36:46 +0100",
          "file": "features/test4.feature",
          "line": 14,
          "urn": "features/test4.feature:14",
          "type": "Cucumber::Scenario",
          "name": "Passing Scenario 2",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given I am testing third scenario",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then My test pass",
              "status": "passed"
            }
          ],
          "status": "passed",
          "finished": "2017-06-23 11:36:46 +0100"
        }
      ],
      "finished": "2017-06-23 11:36:46 +0100"
    }
  ],
  "type": "Cucumber"
}
