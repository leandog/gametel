module Gametel
  module Views
    class CheckBox < View
      def checked?
        result = platform.is_check_box_checked locator[:index]
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


