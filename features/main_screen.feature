Feature: Interacting with the elements on the main screen

  Scenario: Identifying the list items on the main screen
    Then I should see the "Accessibility" list item
    And I should see the "App" list item
    And I should see the "Content" list item

  Scenario: Navigating using the items in the list and the back button
    When I press the "first" list item
    And I press the Back button
    Then I should see the "App" list item
    And I should see the "Content" list item
