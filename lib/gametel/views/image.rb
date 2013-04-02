module Gametel
  module Views
    class Image < View
      IMAGE_VIEW_CLASS = 'android.widget.ImageView'

      protected

      def build_property_methods
        metaclass = class << self; self; end
        properties.each do |property|
          metaclass.send(:define_method, "#{property}?".to_sym) do
            
            platform.get_view_by_id(locator[:id]) do |device|
              device.send "is_#{property}"
            end if locator[:id]
            
            platform.get_view_by_index(IMAGE_VIEW_CLASS, locator[:index]) do |device|
              device.send "is_#{property}"
            end if locator[:index]

            platform.last_response.body == "true"
          end
        end
      end
    end
  end
end
