module Gametel
  module Views
    class Button < View
      
      protected

      def build_property_methods
        metaclass = class << self; self; end
        properties.each do |property|
          metaclass.send(:define_method, "#{property}?".to_sym) do
            
            platform.get_view_by_id(locator[:id]) do |device|
              device.send "is_#{property}"
            end if locator[:id]
            
            platform.get_button_by_index(locator[:index]) do |device|
              device.send "is_#{property}"
            end if locator[:index]

            platform.get_button_by_text(locator[:text]) do |device|
              device.send "is_#{property}"
            end if locator[:text]
              
            platform.last_response.body
          end
        end
      end
    end
  end
end
