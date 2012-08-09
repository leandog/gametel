@focus
Feature: Determining whether or not a view is enabled

  Scenario: Identifying a disabled view
    When I am looking at the various button types
    Then I can tell that the Disabled button is disabled

  Scenario: Identifying an enabled view
    When I am looking at the various button types
    Then I can tell that the Normal button is enabled
