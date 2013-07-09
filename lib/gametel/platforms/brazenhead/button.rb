require 'brazenhead'

module Gametel
  module Platforms
    module Button
      def get_button_by_index(index, &block)
        chain_calls do |device|
          device.get_button index, :variable => '@@the_button@@'
          block.call device if block
        end
      end

      def get_button_by_text(text, &block)
        chain_calls do |device|
          device.get_button text, :variable => '@@the_button@@'
          block.call device if block
        end
      end
    end
  end
end
