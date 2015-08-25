{
  "started": "",
  "finished": "2015-08-25 10:52:07 +0100",
  "results": [
    {
      "type": "testsuites",
      "name": "AllTestUnits",
      "classname": null,
      "children": [
        {
          "type": "testsuite",
          "name": "Test Suite 1",
          "classname": null,
          "children": [
            {
              "type": "testcase",
              "name": "Test Case 1",
              "duration": "0.000571",
              "status": "passed"
            },
            {
              "type": "testcase",
              "name": "002-failed-test",
              "duration": "20",
              "status": "failed"
            },
            {
              "type": "testsuite",
              "name": "Test Suite Inner",
              "classname": null,
              "children": [
                {
                  "type": "testcase",
                  "name": "Test Case 111",
                  "duration": "0.000571",
                  "status": "passed"
                },
                {
                  "type": "testcase",
                  "name": "Test Case 222",
                  "duration": "0.000571",
                  "status": "passed"
                }
              ]
            },
            {
              "type": "testcase",
              "name": "Test Case 2",
              "duration": "0.000571",
              "status": "passed"
            }
          ]
        },
        {
          "type": "testsuite",
          "name": "Test Suite 2",
          "classname": null,
          "children": [
            {
              "type": "testcase",
              "name": "Test Case 11",
              "duration": "0.000571",
              "status": "passed"
            },
            {
              "type": "testcase",
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
