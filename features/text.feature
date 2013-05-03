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

  Scenario: Retrieving the content description text identified by id
    When I'm on the search view filter screen
    Then I am am given the description "Edit Description" for the "text_field_id" control

  Scenario: Retrieving text identified by id
    Given I'm on the controls screen
    When I enter "example text" into the text field identified by "id"
    Then I should have the value "example text" in the text field identified by "id"

  Scenario: Retrieving text identified by index
    Given I'm on the controls screen
    When I enter "example text" into the text field identified by "index"
    Then I should have the value "example text" in the text field identified by "index"

  Scenario: Determining if a text view is enabled
    When I'm on the controls screen
    Then the "text" field's "enabled" property is "true"

  Scenario: Determining if a button view is enabled
    When I'm on the controls screen
    Then the "button" field's "enabled" property is "true"

  Scenario: Determining if a button view is disabled
    When I'm on the controls screen
    Then the "button_disabled" field's "enabled" property is "false"

  Scenario: Determining properties of a text view
    When I'm on the controls screen
    Then the "text" field identified by "id" can determine the following properties:
      | property  | value |
      | clickable | true  |
      | enabled   | true  |
      | focusable | true  |
      | focused   | true  |
      | selected  | false |
      | shown     | true  |

  Scenario: Determining properties of a text view by index
    When I'm on the controls screen
    Then the "text" field identified by "index" can determine the following properties:
      | property  | value |
      | clickable | true  |
      | enabled   | true  |
      | focusable | true  |
      | focused   | true  |
      | selected  | false |
      | shown     | true  |
