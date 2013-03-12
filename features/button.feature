Feature: Interacting with buttons

  Scenario: Should be able to click a button by text
    Given I'm on the buttons screen
    Then I should be able to click the button by "text"

  Scenario: Should be able to click a button by index
    Given I'm on the buttons screen
    Then I should be able to click the button by "index"

  Scenario: Should be able to click a button by id
    Given I'm on the buttons screen
    When I click the on/off button by "id"
    Then I should see the text "ON" on the screen
    
  Scenario: Should be able to click a button by id
    Given I'm on the buttons screen
    When I click the on/off button by "index"
    Then I should see the text "ON" on the screen

  Scenario: Should be able to click a toggle button
    Given I'm on the buttons screen
    When I click the on/off button
    Then I should see the text "ON" on the screen
    When I click the on/off button
    Then I should see the text "OFF" on the screen

  Scenario: Determining properties of a button by id
    When I'm on the controls screen
    Then the "button" field identified by "id" can determine the following properties:
      | property  | value |
      | clickable | true  |
      | enabled   | true  |
      | focusable | true  |
      | focused   | false |
      | selected  | false |
      | shown     | true  |

  Scenario: Determining properties of a button by index
    When I'm on the controls screen
    Then the "button" field identified by "index" can determine the following properties:
      | property  | value |
      | clickable | true  |
      | enabled   | false |
      | focusable | true  |
      | focused   | false |
      | selected  | false |
      | shown     | true  |

  Scenario: Determining properties of a button by text
    When I'm on the controls screen
    Then the "button" field identified by "text" can determine the following properties:
      | property  | value |
      | clickable | true  |
      | enabled   | true  |
      | focusable | true  |
      | focused   | false |
      | selected  | false |
      | shown     | true  |
