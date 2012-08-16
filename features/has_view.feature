Feature:  Determining whether or not a view exists

  Scenario:  Checking the existence of a view
    When I'm on the buttons screen
    Then we should know that the view with id "button_normal" exists

  Scenario:  Checking the absence of a view
    When I'm on the buttons screen
    Then we should know that the view with id "checkbox_button" does not exist
