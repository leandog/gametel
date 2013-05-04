@webview
Feature: Adding support for webviews

  Background:
    Given I have navigated to the webview screen

@focus
  Scenario: Clicking a link in a WebView
    When I click the images link in a webview
    Then I should not see the Coffee link


    
    
