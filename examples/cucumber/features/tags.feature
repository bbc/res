@high
Feature: Two scenarios in this feature
As a user
I want to be able to write multiple scenarios

  @automated
  Scenario: Scenario tagged as automated
    Given a simple step
    When something happens
    Then the status should be reported

  @custommanualtag
  Scenario: Scenario with a custom tag
    Given a simple step
    When something else happens
    Then the status should be reported
