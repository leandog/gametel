module Gametel
  module Views
    class ListItem < View

      def text
        platform.text_from_list_item(locator)
      end
      
      protected
      
      def build_property_methods
        # do nothing
      end
    end
  end
end
