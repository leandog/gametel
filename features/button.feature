@focus
Feature: Interacting with buttons

  Scenario: Should be able to click a button by text
    Given I'm on the buttons screen
    Then I should be able to click the button by "text"

  Scenario: Should be able to click a button by index
    Given I'm on the buttons screen
    Then I should be able to click the button by "index"

  Scenario: Should be able to click a toggle button
    Given I'm on the buttons screen
    When I click the on/off button
    Then I should see the text "ON" on the screen
    When I click the on/off button
    Then I should see the text "OFF" on the screen
