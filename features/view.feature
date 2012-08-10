Feature: Interacting with view elements

  Scenario: Clicking on views by their id
    When I am perusing options for Alert Dialogs
    And I choose the List Dialogs button by id
    Then I should see the "Command one" list item

  @ignore
  Scenario: Clicking on view by their text
    When I am observing custom views
    Then I should see the "blue" custom view
