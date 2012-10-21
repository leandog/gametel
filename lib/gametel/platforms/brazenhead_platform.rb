require 'brazenhead'
require File.join(File.dirname(__FILE__), 'brazenhead', 'basic')
require File.join(File.dirname(__FILE__), 'brazenhead', 'button')
require File.join(File.dirname(__FILE__), 'brazenhead', 'progress')
require File.join(File.dirname(__FILE__), 'brazenhead', 'spinner')
require File.join(File.dirname(__FILE__), 'brazenhead', 'text')
require File.join(File.dirname(__FILE__), 'brazenhead', 'view')
require File.join(File.dirname(__FILE__), 'brazenhead', 'list_item')


module Gametel
  module Platforms
    class BrazenheadPlatform
      include Brazenhead
      include Gametel::Platforms::Basic
      include Gametel::Platforms::Button
      include Gametel::Platforms::Progress
      include Gametel::Platforms::Spinner
      include Gametel::Platforms::Text
      include Gametel::Platforms::View
      include Gametel::Platforms::ListItem

      ENTER_KEY = 66

      #
      # get text
      #
      def get_text(locator)
        result = get_text_by_id(locator[:id])
        last_json
      end

      #
      # get the hint text
      #
      def get_text_hint(locator)
        result = get_text_hint_by_id(locator[:id])
        last_json
      end

      #
      # get the content description
      #
      def get_text_description(locator)
        result = get_text_description_by_id(locator[:id])
        last_json
      end

      #
      # enter text in a text box
      #
      def enter_text(text, locator)
        enter_text_by_index(locator[:index], text) if locator[:index]
        enter_text_by_id(locator[:id], text) if locator[:id]
      end

      #
      # clear the text in a text box
      #
      def clear_text(locator)
        clear_edit_text(locator[:index]) if locator[:index]
        clear_text_by_id(locator[:id]) if locator[:id]
      end

      #
      # press a button
      #
      def press_button(locator)
        result = click_on_button(locator[:text]) if locator[:text]
        result = click_on_button(locator[:index]) if locator[:index]
        result = click_on_view_by_id(locator[:id]) if locator[:id]
      end

      #
      # click a checkbox
      #
      def click_checkbox(locator)
        result = click_on_check_box(locator[:index]) if locator[:index]
        result = click_on_text(locator[:text]) if locator[:text]
        result = click_on_view_by_id(locator[:id]) if locator[:id]
      end

      #
      # click a radio button
      #
      def click_radio_button(locator)
        result = click_on_text(locator[:text]) if locator[:text]
        result = click_on_view_by_id(locator[:id]) if locator[:id]
        result = click_on_radio_button(locator[:index]) if locator[:index]
      end

      #
      # get the selected spinner value
      #
      def get_spinner_value(locator)
        result = get_spinner_value_by_id(locator[:id]) if locator[:id]
        result = get_spinner_value_by_index(locator[:index]) if locator[:index]
        last_json
      end

      #
      # select the spinner value using the item's index
      #
      def select_spinner_value(locator, index)
        result = select_spinner_value_by_id(locator[:id], index) if locator[:id]
        result = press_spinner_item(locator[:index], index) if locator[:index]
      end

      #
      # click a view
      #
      def click_view(locator)
        result = click_on_text(locator[:text]) if locator[:text]
        result = click_on_view_by_id(locator[:id]) if locator[:id]
      end

      #
      # determine if text exists on the screen and visible
      #
      def has_text?(text)
        result = search_text(text, true)
        result.body == 'true'
      end
      
      #
      # determine if a view exists
      #
      def has_view?(locator)
        result = get_view_by_id(locator)
        result.body.include? 'windowLocation'
      end

      #
      # determine if a view is enabled
      #
      def enabled?(locator)
        result = is_enabled_by_id(locator)
        result.body == 'true'
      end

      #
      # press the back button
      #
      def back
        result = go_back
      end

      #
      # press the enter key
      #
      def enter
        result = send_key ENTER_KEY
      end

    end
  end
end
