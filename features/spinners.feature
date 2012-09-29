Feature:  Working with Spinners

  Scenario: Retrieving the selected Spinner text by id
    When I'm on the controls screen
    Then I can see the spinner value referenced by "id" is "Mercury"

  Scenario: Retrieving the selected Spinner text by index
    When I'm on the controls screen
    Then I can see the spinner value referenced by "index" is "Mercury"

  Scenario: Setting the selected item in a Spinner by id
    When I'm on the controls screen
    And I select item number "3" from the spinner using "id"
    Then I can see the spinner value referenced by "id" is "Mars"

  Scenario: Setting the select item in a Spinner by index
    When I'm on the controls screen
    And I select item number "3" from the spinner using "index"
    Then I can see the spinner value referenced by "index" is "Mars"

