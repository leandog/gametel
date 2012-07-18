Feature: Interacting with view elements

  Scenario: Clicking on items by their id
    When I am perusing options for Alert Dialogs
    And I choose the List Dialogs button by id
    Then I should see the "Command one" list item
