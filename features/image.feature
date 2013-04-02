Feature: Interacting with Images

  Scenario: Should be able to click an image
    Given I'm on the image screen
    Then I should be able to click on the first image

  Scenario: Should be able to get the images view
    Given I'm on the image screen
    Then the first image should have the following properties:
      | property  | value |
      | clickable | false |
      | enabled   | true  |
      | focusable | false |
      | focused   | false |
      | selected  | false |
      | shown     | true  |

  Scenario: Waiting for the drawable to load
    Given I'm on the image screen
    Then I should be able to wait until the images drawable has loaded
