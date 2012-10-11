Feature:  Interacting with progress bars

  Scenario: Getting and setting the progress by id
    Given I am looking at the progress of a seek bar
    When I set the progress indicated by "id" to "37"
    Then I should see the text "37 from touch" on the screen 
    And the retrieved progress indicated by "id" should be "37" 

  Scenario: Getting and setting the progress by index
    Given I am looking at the progress of a seek bar
    When I set the progress indicated by "index" to "11"
    Then the retrieved progress indicated by "index" should be "11" 

  Scenario: Getting and setting the secondary progress by id
    Given I am looking at the progress of a seek bar
    When I set the secondary progress indicated by "id" to "74"
    And the retrieved secondary progress indicated by "id" should be "74" 

  Scenario: Getting the progress max by id
    When I am looking at the progress of a seek bar
    Then the retrieved progress max indicated by "id" should be "100"

  Scenario: Getting the progress max by index
    When I am looking at the progress of a seek bar
    Then the retrieved progress max indicated by "index" should be "100"

@focus
  Scenario: Getting the progress bar's view by id
    When I am looking at the progress of a seek bar
    Then the progress bar indicated by "id" can determine the following properties:
      | property  | value |
      | clickable | false |
      | enabled   | true  |
      | focusable | true  |
      | focused   | false |
      | selected  | false |
      | shown     | true  |

@focus
  Scenario: Getting the progress bar's view by index
    When I am looking at the progress of a seek bar
    Then the progress bar indicated by "index" can determine the following properties:
      | property  | value |
      | clickable | false |
      | enabled   | true  |
      | focusable | true  |
      | focused   | false |
      | selected  | false |
      | shown     | true  |
