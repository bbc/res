# A feature comment
Feature: Background steps
As a user
I want to be able to use background steps

  # A background comment
  Background: Do a number of background things
    Given first background step
    And second background step
    And third background step

  Scenario: Basic scenario with background
    Given this fourth thing happens
    When the fifth thing happens
    Then this sixth thing happens

  Scenario: Second scenario with background
    Given this fourth thing happens
    Then the fifth thing happens
