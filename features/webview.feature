@webview
Feature: Adding support for webviews

  Background:
    Given I have navigated to the webview screen

@focus
  Scenario: Clicking a link in a WebView
    When I click the text "Some Other Page" in a webview
    Then I should see the text "Welcome to Some Other Page" in a webview


    
    
