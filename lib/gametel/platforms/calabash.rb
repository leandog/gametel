require 'calabash-android/operations'

include Calabash::Android::Operations

module Gametel
  module Platforms
    class Calabash
      def has_text?(text)
        begin
          performAction 'assert_text', text, true
        rescue
          return false
        end
        true
      end
      
      def wait_for_text(text_to_find)
        performAction 'wait_for_text', text_to_find
      end
    end
  end
end
