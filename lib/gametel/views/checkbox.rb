module Gametel
  module Views
    class CheckBox < View
      def checked?
        result = platform.is_check_box_checked locator[:index] if locator[:index]
        result = platform.is_check_box_checked locator[:text] if locator[:text]
        result = is_check_box_checked_by_id locator[:id] if locator[:id]
        result.body == "true"
      end

      private
      def is_check_box_checked_by_id(id)
        platform.get_view_by_id(id) do |device|
          device.is_checked
        end
      end
    end
  end
end


