require 'brazenhead'

module Gametel
  module Platforms
    module ListItem

      def press_list_item(locator)
        list = locator[:list] ? locator[:list] : 0
        result = click_in_list(locator[:index] + 1, list) if locator[:index]
        result = click_on_text(locator[:text]) if locator[:text]
      end

      def text_from_list_item(locator)
        chain_calls do |device|
          device.list_item_by_text(locator[:text], :target => 'Brazenhead', :variable => '@@the_view@@')
          device.get_current_text_views('@@the_view@@', :target => 'Robotium')
        end
        last_json.map { |text_view| text_view['text'] }
      end
    end
  end
end
