Feature: Interacting with the standard text field

  Scenario: Entering text into a text field identified by index
    Given I'm on the controls screen
    When I enter "example text" into the text field identified by "index"
    Then I should have the value "example text" on the control screen

  Scenario: Entering text into a text field identified by id
    Given I'm on the controls screen
    When I enter "example text" into the text field identified by "id"
    Then I should have the value "example text" on the control screen

  Scenario: Clearing the text from a text field identified by index
    Given I'm on the controls screen
    When I enter "example text" into the text field identified by "index"
    Then I should have the value "example text" on the control screen
    When I clear the text from the text field identified by "index"
    Then I should not have the value "example text" on the control screen

  Scenario: Clearing the text from a text field identified by id
    Given I'm on the controls screen
    When I enter "example text" into the text field identified by "id"
    Then I should have the value "example text" on the control screen
    When I clear the text from the text field identified by "id"
    Then I should not have the value "example text" on the control screen

  Scenario: Retrieving the hint text identified by id
    When I'm on the search view filter screen
    Then I am am given the hint "Some Hint Text" for the "text_field_id" control

  Scenario: Retrieving text identified by index
    Given I'm on the controls screen
    When I enter "example text" into the text field identified by "id"
    Then I should have the value "example text" in the text field identified by "id"
