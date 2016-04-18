{
  "started": "2016-04-18 17:20:52 +0100",
  "finished": "2016-04-18 17:20:52 +0100",
  "results": [
    {
      "started": "2016-04-18 17:20:52 +0100",
      "file": "features/test.feature",
      "line": 1,
      "urn": "features/test.feature:1",
      "type": "Cucumber::Feature",
      "name": "test",
      "description": "",
      "children": [
        {
          "started": "2016-04-18 17:20:52 +0100",
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
          "status": "failed",
          "finished": "2016-04-18 17:20:52 +0100"
        }
      ],
      "finished": "2016-04-18 17:20:52 +0100"
    }
  ],
  "type": "Cucumber"
}
