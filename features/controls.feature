Feature: Interacting with the standard Android controls

  Scenario: Entering text into a text field
    Given I'm on the controls screen
    When I enter "example text" into the text field
    Then I should have the value "example text" on the screen

