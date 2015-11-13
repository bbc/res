Feature: Performance
As a user
I want to be able to capture performance measures
And have them show up in my res file
  
  Scenario: Capture some performance data
    Given I run my test
    When I capture some performance data
    Then It should associate with the correct test in res
    