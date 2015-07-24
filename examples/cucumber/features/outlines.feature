@outlines
Feature: Scenario Outlines
As a user
I want to be able to use Scenario Outlines
And get reports on testing progress

  #This is a comment
  @broken
  Scenario Outline: Simple outline
    Given an <option> of some description
    When <something> happens
    Then the status should be reported
      
    Examples:
      | option | something    |
      | one    | nothing      |
      | two    | an exception |

  Scenario Outline: Broken outline
    Given something occurs
    When <something> happens
    And a non-parametised step throws an exception
    Then the result is a fail

    Examples:
      | something    |
      | nothing      |
      | nought       |

