module Gametel
  module Views
    class Text < View

      def view_class
        'android.widget.EditText'
      end
      
      def hint  
        platform.get_text_hint(locator)
      end

      def description 
        platform.get_text_description(locator)
      end
      
    end
  end
end
