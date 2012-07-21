require 'calabash-android/operations'

include Calabash::Android::Operations

module Gametel
  module Platforms
    class Calabash

      #
      # enter text in a text box
      #
      def enter_text(text, locator)
        performAction 'enter_text_into_named_field', text, locator[:content_description] if locator[:content_description]
        performAction 'enter_text_into_numbered_field', text, locator[:index] + 1 if locator[:index]
        performAction 'enter_text_into_id_field', text, locator[:id] if locator[:id]
      end

      def clear_text(locator)
        performAction 'clear_numbered_field', locator[:index] + 1 if locator[:index]
        performAction 'clear_named_field', locator[:content_description] if locator[:content_description]
        performAction 'clear_id_field', locator[:id] if locator[:id]
      end

      #
      # press a button
      #
      def press_button(locator)
        performAction 'press_button_with_text', locator[:text] if locator[:text]
        performAction 'press_button_number', locator[:index] + 1 if locator[:index]
        performAction 'click_on_view_by_id', locator[:id] if locator[:id]
      end

      #
      # press a list item
      #
      def press_list_item(locator)
        list = locator[:list] ? locator[:list] : 0
        performAction 'press_list_item', locator[:index] + 1, list if locator[:index]
        performAction 'click_on_text', locator[:text] if locator[:text]
      end
      
      #
      # click a checkbox
      #
      def click_checkbox(locator)
        performAction 'toggle_numbered_checkbox', locator[:index] + 1 if locator[:index]
        performAction 'click_on_text', locator[:text] if locator[:text]
        performAction 'click_on_view_by_id', locator[:id] if locator[:id]
      end

      #
      # click a radio button
      #
      def click_radio_button(locator)
        performAction 'click_on_text', locator[:text] if locator[:text]
        performAction 'click_on_view_by_id', locator[:id] if locator[:id]
      end

      #
      # click a view
      #
      def click_view(locator)
        performAction 'click_on_view_by_id', locator[:id] if locator[:id]
        performAction 'click_on_text', locator[:text] if locator[:text]
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
      # press the enter key
      #
      def enter
        performAction 'send_key_enter'
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
