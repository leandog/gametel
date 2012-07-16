require 'calabash-android/operations'

include Calabash::Android::Operations

module Gametel
  module Platforms
    class Calabash

      #
      # enter text in a text box
      #
      def enter_text(text, locator)
        action = locator.kind_of?(String) ?  'enter_text_into_named_field' :  'enter_text_into_numbered_field'
        performAction(action, text, locator)
      end

      #
      # press a button
      #
      def press_button(locator)
        action = locator.kind_of?(String) ? 'press_button_with_text' : 'press_button_number'
        performAction(action, locator)
      end

      #
      # press a list item
      #
      def press_list_item(locator)
        performAction 'press_list_item', locator, 0
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
