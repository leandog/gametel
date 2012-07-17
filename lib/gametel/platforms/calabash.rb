require 'calabash-android/operations'

include Calabash::Android::Operations

module Gametel
  module Platforms
    class Calabash

      #
      # enter text in a text box
      #
      def enter_text(text, locator)
        performAction('enter_text_into_name_field', text, locator[:name]) if locator[:name]
        performAction('enter_text_into_numbered_field', text, locator[:index] + 1) if locator[:index]
      end

      #
      # press a button
      #
      def press_button(locator)
        performAction 'press_button_with_text', locator[:text] if locator[:text]
        performAction 'press_button_number', locator[:index] + 1 if locator[:index]
      end

      #
      # press a list item
      #
      def press_list_item(locator)
        performAction 'press_list_item', locator[:index] + 1, 0 if locator[:index]
        performAction 'click_on_text', locator[:text] if locator[:text]
      end
      
      #
      # long press a list item
      #
      def long_press_list_item(locator)
        performAction 'long_press_list_item', locator, 0
      end

      #
      # determine if text exists on the screen
      #
      def has_text?(text)
        begin
          performAction 'assert_text', text, true
        rescue
          return false
        end
        true
      end

      #
      # press the back button
      #
      def back
        performAction 'go_back'
      end

      #
      # scroll down
      #
      def scroll_down
        performAction 'scroll_down'
      end

      #
      # scroll up
      #
      def scroll_up
        performAction 'scroll_up'
      end

      #
      # wait for text to appear on the screen
      #
      def wait_for_text(text_to_find)
        performAction 'wait_for_text', text_to_find
      end
    end
  end
end
