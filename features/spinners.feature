Feature:  Working with Spinners

  Scenario: Retrieving the selected Spinner text by id
    When I'm on the controls screen
    Then I can see the spinner value referenced by "id" is "Mercury"

  Scenario: Retrieving the selected Spinner text by index
    When I'm on the controls screen
    Then I can see the spinner value referenced by "index" is "Mercury"
