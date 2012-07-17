Feature: Interacting with the standard text field

  Scenario: Entering text into a text field
    Given I'm on the controls screen
    When I enter "example text" into the text field
    Then I should have the value "example text" on the control screen

  Scenario: Clearing the text from a text field
    Given I'm on the controls screen
    When I enter "example text" into the text field
    Then I should have the value "example text" on the control screen
    When I clear the text from the text field
    Then I should not have the value "example text" on the control screen
