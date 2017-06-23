Feature: Ruby Cucumber 2 Formatter testing for first fail scenario and other pass
  Scenario: Failed Scenario
    Given I am testing first scenario
    Then My test fail

  Scenario: Passing Scenario 1
    Given I am testing second scenario
    Then My test pass

  Scenario: Passing Scenario 2
    Given I am testing third scenario
    Then My test pass 
