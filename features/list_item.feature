Feature: Interacting with the list item control

  Scenario: Should be able to click a list item by text
    When I click the first list item by "text"
    Then I should see the "Accessibility Service" list item

  Scenario: Should be able to click a list item by index
    When I click the first list item by "index"
    Then I should see the "Accessibility Service" list item

  Scenario: Should be able to click a list item when it is not visible on the screen
    When I click the list item "Views" from the main menu
    Then I should see the "Controls" list item

  Scenario: Should be able to click a list item from a specific list
    When I click the first list item by index on the first list
    Then I should see the "Accessibility Service" list item
