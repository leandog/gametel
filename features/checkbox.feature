Feature:  Interacting with checkboxes

  Scenario: Clicking a checkbox by index
    Given I'm on the controls screen
    Then I should be able to click a checkbox by "index"
    And the checkbox identified by "index" should be checked

  Scenario: Clicking on a checkbox by text
    Given I'm on the controls screen
    Then I should be able to click a checkbox by "text"

  Scenario: Clicking a checkbox by id
    Given I'm on the controls screen
    Then I should be able to click a checkbox by "id"
