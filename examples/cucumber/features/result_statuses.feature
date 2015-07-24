Feature: Result statuses feature
As a user
I want to be able to detect various results

  Scenario: Passing scenario
    Given everything passes
    Then I report a pass

  Scenario: Everything Fails Scenario
    Given everything fails
    Then I report a fail

  Scenario: Single Step fails in this Scenario
    Given most of the steps pass
    And one step fails
    Then I report a fail
