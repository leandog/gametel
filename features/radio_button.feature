Feature:  Interacting with Radio Buttons

  Scenario: Clicking on a radio button by text
    Given I'm on the controls screen
    Then I should be able to click a radio button by "text"
    And the radio button identified by "text" should be checked

  Scenario: Clicking on a radio button by id
    Given I'm on the controls screen
    Then I should be able to click a radio button by "id"
    And the radio button identified by "id" should be checked

  Scenario: Clicking on a radio button by index
    Given I'm on the controls screen
    Then I should be able to click a radio button by "index"
    And the radio button identified by "index" should be checked
