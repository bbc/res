{
  "started": "",
  "finished": "2015-08-25 11:46:32 +0100",
  "results": [
    {
      "type": "JUnit::testsuites",
      "name": "AllTestUnits",
      "classname": null,
      "children": [
        {
          "type": "JUnit::testsuite",
          "name": "Test Suite 1",
          "classname": null,
          "children": [
            {
              "type": "JUnit::testcase",
              "name": "Test Case 1",
              "duration": "0.000571",
              "status": "passed"
            },
            {
              "type": "JUnit::testcase",
              "name": "002-failed-test",
              "duration": "20",
              "status": "failed"
            },
            {
              "type": "JUnit::testsuite",
              "name": "Test Suite Inner",
              "classname": null,
              "children": [
                {
                  "type": "JUnit::testcase",
                  "name": "Test Case 111",
                  "duration": "0.000571",
                  "status": "passed"
                },
                {
                  "type": "JUnit::testcase",
                  "name": "Test Case 222",
                  "duration": "0.000571",
                  "status": "passed"
                }
              ]
            },
            {
              "type": "JUnit::testcase",
              "name": "Test Case 2",
              "duration": "0.000571",
              "status": "passed"
            }
          ]
        },
        {
          "type": "JUnit::testsuite",
          "name": "Test Suite 2",
          "classname": null,
          "children": [
            {
              "type": "JUnit::testcase",
              "name": "Test Case 11",
              "duration": "0.000571",
              "status": "passed"
            },
            {
              "type": "JUnit::testcase",
              "name": "Test Case 22",
              "duration": "0.000571",
              "status": "passed"
            }
          ]
        }
      ]
    }
  ],
  "type": "Junit"
}
