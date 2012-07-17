@focus
Feature: Interacting with buttons

  Scenario: Should be able to click a button by text
    Given I'm on the buttons screen
    Then I should be able to click the button by "text"

  Scenario: Should be able to click a button by index
    Given I'm on the buttons screen
    Then I should be able to click the button by "index"
