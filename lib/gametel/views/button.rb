module Gametel
  module Views
    class Button < View
      
      protected

      def get_view_by_index(clazz, index, &block)
        platform.get_button_by_index(index, &block)
      end

      def get_view_by_text(text, &block)
        platform.get_button_by_text(text, &block)
      end
    end
  end
end
