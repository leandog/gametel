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
        list_item(locator) do |device|
          device.get_class
          device.for_name('android.widget.TextView', :variable => '@@the_class@@')
          device.get_current_views('@@the_class@@', '@@the_view@@', :target => 'Robotium')
        end
        last_json.map { |text_view| text_view['text'] }
      end

      def list_item_has_image(locator)
        list_item(locator) do |device|
          device.get_class
          device.for_name('android.widget.ImageView', :variable => '@@the_class@@')
          device.get_current_views('@@the_class@@', '@@the_view@@', :target => 'Robotium')
        end
        last_json[0]['hasDrawable'] if last_json[0]
      end

      def list_item(locator, &block) 
        chain_calls do |device|
          device.list_item_by_text(locator[:text], :target => 'Brazenhead',
                                   :variable => '@@the_view@@')
          block.call device if block
        end
      end
    end
  end
end
