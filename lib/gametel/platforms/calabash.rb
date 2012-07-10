require 'calabash-android/operations'

include Calabash::Android::Operations

module Gametel
  module Platforms
    class Calabash
      def has_text?(text)
        performAction 'assert_text', text, true
      end
      
      def wait_for_text(text_to_find)
        performAction 'wait_for_text', text_to_find
      end
    end
  end
end
