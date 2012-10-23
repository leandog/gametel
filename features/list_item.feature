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

  Scenario: Determining text inside a list item
    Given I am on the custom list screen
    When I ask for the first item in the list
    Then I should know that it has the text "Tom"
    And I should know that it has the text "This is Tom, he likes long walks in the park."

  Scenario: Determining if a list item has an image
    Given I am on the efficient adapter screen
    When I ask for the list item for "Abertam"
    Then I should know that it has an image

  Scenario: Knowing that a list item has no image
    Given I am on the custom list screen
    When I ask for the first item in the list
    Then I should know that it does not have an image
