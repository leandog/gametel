Feature: Adding support for webviews

  Background:
    Given I have navigated to the webview screen

  Scenario: Clicking on text and checking if text exists
    When I click the text "Some Other Page" in a webview
    Then I should see the text "Welcome to Some Other Page" in a webview

  Scenario: Checking for the existance of elements
    When I look for elements in the webview
    Then I should know the following elements exist:
    | locator     | value       |
    | className   | panel       |
    | cssSelector | div.panel   |
    | tagName     | p           |
    | textContent | Six columns |

  Scenario: Clicking on a web element
    When I look for elements in the webview
    And I click on the anchor with the text "Some Other Page"
    Then I should see the text "Welcome to Some Other Page" in a webview

  Scenario: Entering text in a web element
    When I look for elements in the webview
    Then I should be able to enter "Some Text" into the text field

  Scenario: Typing text in a web element
    When I look for elements in the webview
    Then I should be able to type "Some Text" into the text field

  Scenario: Clearing the text in a web welement
    When I look for elements in the webview
    Then I should be able to enter "Some Text" into the text field
    And I should be able to clear the text of the text field

  Scenario: Waiting for a web element
    When I look for elements in the webview
    Then I should be able to wait for the text field

  Scenario: Clicking on text and checking if text exists on webview screen
    When I click the text "Some Other Page" in a webview screen
    Then I should see the text "Welcome to Some Other Page" in a webview screen

@focus
  Scenario: Checking for the existance of elements on webview screen
    When I look for elements in the webview screen
    Then I should know the following webview elements exist:
    | locator     | value       |
    | className   | panel       |
    | cssSelector | div.panel   |
    | tagName     | p           |
    | textContent | Six columns |

