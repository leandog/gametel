module Gametel
  module Views
    class View
      attr_reader :locator, :platform

      def initialize(platform, locator)
        @platform = platform
        @locator = locator
        build_property_methods
      end

      def view_class
        'android.view.View'
      end

      protected
      
      def properties
        [:clickable, :enabled, :focusable, :focused, :selected, :shown]
      end

      def build_property_methods
        metaclass = class << self; self; end
        properties.each do |property|
          metaclass.send(:define_method, "#{property}?".to_sym) do
            query_property = lambda {|device| device.send "is_#{property}" }
            platform.get_view_by_id(locator[:id], &query_property) if locator[:id]
            platform.get_view_by_index(view_class, locator[:index], &query_property) if locator[:index]
            platform.get_view_by_index(locator[:class], locator[:index] || 0, &query_property) if locator[:class]
            platform.last_response.body == "true"
          end
        end
      end
      
    end
  end
end

