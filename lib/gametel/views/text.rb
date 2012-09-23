module Gametel
  module Views
    class Text < View
      
      def hint  
        platform.get_text_hint(locator)
      end

      def description 
        platform.get_text_description(locator)
      end
      
    end
  end
end
