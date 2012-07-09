require 'calabash-android/cucumber'

module Gametel
  module Platforms
    module Calabash
      
      
      def wait_for_text(text_to_find)
        performAction 'wait_for_text', text_to_find
      end
    end
  end
end
