Feature: Interacting with view elements

  Scenario: Clicking on views by their id
    When I am perusing options for Alert Dialogs
    And I choose the List Dialogs button by id
    Then I should see the "Command one" list item

  Scenario: Clicking on view by their text
    When I'm on the controls screen
    Then I should be able to click a view by "text"

  Scenario: Determining properties of a view
    When I'm on the controls screen
    Then the "view" field identified by "id" can determine the following properties:
      | property  | value |
      | clickable | true  |
      | enabled   | true  |
      | focusable | true  |
      | focused   | true  |
      | selected  | false |
      | shown     | true  |
