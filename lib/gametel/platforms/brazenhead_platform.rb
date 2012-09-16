require 'brazenhead'


module Gametel
  module Platforms
    class BrazenheadPlatform
      include Brazenhead

      ENTER_KEY = 66

      #
      # press a list item
      #
      def press_list_item(locator)
        list = locator[:list] ? locator[:list] : 0
        result = click_in_list(locator[:index] + 1), list if locator[:index]
        result = click_on_text(locator[:text]) if locator[:text]
      end
      


      #
      # determine if text exists on the screen and visible
      #
      def has_text?(text)
        result = search_text(text, true)
        result.body
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
        send_key ENTER_KEY
      end
    end
  end
end
