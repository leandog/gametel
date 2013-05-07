@webview
Feature: Adding support for webviews

  Background:
    Given I have navigated to the webview screen

@focus
  Scenario: Clicking a link in a WebView
    When I click the text "Coffee"  in a webview
    Then I should see the text "Starbucks" in a webview


    
    
