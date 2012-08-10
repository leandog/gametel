@wip
Feature: Determining whether or not a view is enabled

  Scenario: Identifying a disabled view
    When I'm on the buttons screen
    Then I can tell when buttons are disabled

  Scenario: Identifying an enabled view
    When I'm on the buttons screen
    Then I can tell when buttons are enabled
