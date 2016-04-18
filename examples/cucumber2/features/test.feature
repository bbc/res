Feature: test
  Scenario Outline: test2
    When I do <this>
    Then I get <that>

    Examples:
      |this|that|
      |true|false|
      |true|true|
