Feature: Navigation through the screens of the application

  Scenario: Navigating to a screen using the default route
    When I navigate to the Controls screen 
    Then I should see the text "Checkbox 1" on the screen

  Scenario: Navigating to a screen using a named route
    When I navigate to the Buttons screen using the "button_route" route
    Then I should see the text "Views/Buttons" on the screen

  Scenario: Navigating to a screen starting with a current screen
    Given I am on the the ViewsMenuScreen
    When I navigate to the Controls screen 
    Then I should see the text "Checkbox 1" on the screen
