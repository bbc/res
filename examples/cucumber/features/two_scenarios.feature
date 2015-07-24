# A feature comment
@two
Feature: Two scenarios in this feature
As a user
I want to be able to write multiple scenarios

  # A background comment
  Background: Set stuff up
    Given some background tasks
    And some other things

  @first
  Scenario: Very basic scenario
    Given a simple step
    When something happens
    Then the status should be reported

  #A scenario comment
  @second @last
  Scenario: The other scenario
    Given a simple step
    #A step comment
    When something else happens
    Then the status should be reported
