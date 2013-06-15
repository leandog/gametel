@webview
Feature: Adding support for webviews

  Background:
    Given I have navigated to the webview screen

  Scenario: Clicking on text and checking if text exists
    When I click the text "Some Other Page" in a webview
    Then I should see the text "Welcome to Some Other Page" in a webview

@focus
  Scenario: Checking for the existance of elements
    When I look for elements in the webview
    Then I should know the following elements exist:
    | locator     | value       |
    | className   | panel       |
    | cssSelector | div.panel   |
    | tagName     | p           |
    | textContent | Six columns |

