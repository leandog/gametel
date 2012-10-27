module Gametel
  module Views
    class ListItem < View

      def text
        platform.text_from_list_item(locator)
      end

      def has_text?(text)
        the_text = ''
        self.text.each do |txt|
          the_text += txt + ' '
        end
        return the_text.include? text
      end

      def has_image?
        platform.list_item_has_image(locator)
      end
      
      protected
      
      def build_property_methods
        # do nothing
      end
    end
  end
end
