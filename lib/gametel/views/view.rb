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

      def raw_view(&block)
        get_view_by_id(locator[:id], &block) if locator[:id]
        get_view_by_index(view_class, locator[:index], &block) if locator[:index]
        get_view_by_index(locator[:class], locator[:index] || 0, &block) if locator[:class]
      end

      protected
      
      def properties
        [:clickable, :enabled, :focusable, :focused, :selected, :shown]
      end

      def get_view_by_id(id, &block)
        platform.get_view_by_id(id, &block)
      end

      def get_view_by_index(clazz, index, &block)
        platform.get_view_by_index(clazz, index, &block)
      end

      def build_property_methods
        metaclass = class << self; self; end
        properties.each do |property|
          metaclass.send(:define_method, "#{property}?".to_sym) do
            raw_view {|device| device.send "is_#{property}" }
            platform.last_response.body == "true"
          end
        end
      end
      
    end
  end
end

