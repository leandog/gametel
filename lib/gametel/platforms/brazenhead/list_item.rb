require 'brazenhead'

module Gametel
  module Platforms
    module ListItem

      def press_list_item(locator)
        puts locator
        list = locator[:list] ? locator[:list] : 0
        result = click_long_in_list(locator[:index] + 1, list) if locator[:index]
        result = click_on_text(locator[:text]) if locator[:text]
      end
    end
  end
end
