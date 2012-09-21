Feature:  Interacting with progress bars

  Scenario: Setting the progress by id
    Given I am looking at the progress of a seek bar
    When I set the progress indicated by "id" to "37"
    Then I should see the text "37 from touch" on the screen 
