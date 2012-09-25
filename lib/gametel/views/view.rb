module Gametel
  module Views
    class View
      attr_reader :locator, :platform

      def initialize(platform, locator)
        @platform = platform
        @locator = locator
        build_property_methods
      end

      protected
      
      def properties
        [:clickable, :enabled, :focusable, :focused, :selected, :shown]
      end

      def build_property_methods
        metaclass = class << self; self; end
        properties.each do |property|
          metaclass.send(:define_method, "#{property}?".to_sym) do
            platform.get_view_by_id(locator[:id]) do |device|
              device.send "is_#{property}"
            end
            platform.last_response.body == "true"
          end
        end
      end
      
    end
  end
end

