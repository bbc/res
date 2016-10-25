{
  "started": "2016-10-25 11:00:26 +0100",
  "finished": "2016-10-25 11:00:26 +0100",
  "results": [
    {
      "started": "2016-10-25 11:00:26 +0100",
      "file": "features/performance.feature",
      "line": 1,
      "urn": "features/performance.feature:1",
      "type": "Cucumber::Feature",
      "name": "Performance",
      "description": "As a user\nI want to be able to capture performance measures\nAnd have them show up in my res file",
      "children": [
        {
          "started": "2016-10-25 11:00:26 +0100",
          "file": "features/performance.feature",
          "line": 6,
          "urn": "features/performance.feature:6",
          "type": "Cucumber::Scenario",
          "name": "Capture some performance data",
          "children": [
            {
              "type": "Cucumber::Step",
              "name": "Given I run my test",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "When I capture some performance data",
              "status": "passed"
            },
            {
              "type": "Cucumber::Step",
              "name": "Then It should associate with the correct test in res",
              "status": "passed"
            }
          ],
          "status": "passed",
          "finished": "2016-10-25 11:00:26 +0100",
          "values": {
            "perf_parameter_1": 7,
            "perf_parameter_2": 0
          }
        }
      ],
      "finished": "2016-10-25 11:00:26 +0100"
    }
  ],
  "type": "Cucumber"
}
