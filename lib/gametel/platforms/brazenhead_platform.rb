require 'brazenhead'


module Gametel
  module Platforms
    class BrazenheadPlatform
      include Brazenhead

      ENTER_KEY = 66

      #
      # get text
      #
      def get_text(locator)
        result = chain_calls do |device|
          device.id_from_name(locator[:id], :target => 'Brazenhead', :variable => '@@view_id@@')
          device.get_view('@@view_id@@', :target => 'Robotium')
          device.get_text
          device.to_string
        end
        strip_quotes_from result.body
      end

      #
      # enter text in a text box
      #
      def enter_text(text, locator)
        result = chain_calls do |device|
          device.enter_text(locator[:index], text)
        end if locator[:index]
        result = chain_calls do |device|
          device.id_from_name(locator[:id], :target => 'Brazenhead', :variable => '@@view_id@@')
          device.get_view('@@view_id@@', :target => 'Robotium', :variable => '@@the_view@@')
          device.enter_text('@@the_view@@', text, :target => 'Robotium')
        end if locator[:id]
      end

      #
      # clear the text in a text box
      #
      def clear_text(locator)
        result = clear_edit_text(locator[:index]) if locator[:index]
        chain_calls do |device|
          device.id_from_name(locator[:id], :target => 'Brazenhead', :variable => '@@view_id@@')
          device.get_view('@@view_id@@', :target => 'Robotium', :variable => '@@the_view@@')
          device.clear_edit_text('@@the_view@@', :target => 'Robotium')
        end if locator[:id]
      end

      #
      # press a button
      #
      def press_button(locator)
        result = click_on_button(locator[:text]) if locator[:text]
        result = click_on_button(locator[:index] + 1) if locator[:index]
        result = click_on_view_by_id(locator[:id]) if locator[:id]
      end

      #
      # press a list item
      #
      def press_list_item(locator)
        list = locator[:list] ? locator[:list] : 0
        result = click_in_list(locator[:index] + 1), list if locator[:index]
        result = click_on_text(locator[:text]) if locator[:text]
      end
      
      #
      # click a checkbox
      #
      def click_checkbox(locator)
        result = click_on_checkbox(locator[:index] + 1) if locator[:index]
        result = click_on_text(locator[:text]) if locator[:text]
        result = click_on_view_by_id(locator[:id]) if locator[:id]
      end

      #
      # click a radio button
      #
      def click_radio_button(locator)
        result = click_on_text(locator[:text]) if locator[:text]
        result = click_on_view_by_id(locator[:id]) if locator[:id]
      end

      #
      # get the selected spinner value
      #
      def get_spinner_value(locator)
        result = chain_calls do |device|
          device.id_from_name(locator[:id], :target => 'Brazenhead', :variable => '@@view_id@@')
          device.get_view('@@view_id@@', :target => 'Robotium')
          device.get_selected_item
        end
        strip_quotes_from result.body
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
        result = chain_calls do |device|
          device.id_from_name(locator, :target => 'Brazenhead', :variable => '@@view_id@@')
          device.get_view('@@view_id@@', :target => 'Robotium')
          device.is_enabled
        end
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

      private

      def click_on_view_by_id(id)
        chain_calls do |device|
          device.id_from_name(id, :target => 'Brazenhead', :variable => '@@view_id@@')
          device.get_view('@@view_id@@', :target => 'Robotium', :variable => '@@the_view@@')
          device.click_on_view('@@the_view@@', :target => 'Robotium')
        end
      end

      def get_view_by_id(id)
        chain_calls do |device|
          device.id_from_name(id, :target => 'Brazenhead', :variable => '@@view_id@@')
          device.get_view('@@view_id@@', :target => 'Robotium')
        end
      end

      def strip_quotes_from(value)
        value.gsub('"', '')
      end
    end
  end
end
