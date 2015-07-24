@tables
Feature: Tables
As a user
I want to be able to write features using tables
And ensure they are reported to the repository

  Scenario: Values table
    Given a simple step
    When a table with values is encountered:
    | A | B |
    | 1 | 2 |
    | 2 | 3 |
    Then the table should be parsed

