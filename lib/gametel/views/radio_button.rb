module Gametel
  module Views
    class RadioButton < View
      def checked?
        result = platform.is_radio_button_checked locator[:text] if locator[:text]
        result = platform.is_radio_button_checked locator[:index] if locator[:index]
        result = is_radio_checked_by_id locator[:id] if locator[:id]
        result.body == "true"
      end

      private
      def is_radio_checked_by_id(id)
        platform.get_view_by_id(id) do |device|
          device.is_checked
        end
      end
    end
  end
end

