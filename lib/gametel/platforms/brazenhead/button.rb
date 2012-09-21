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

      def get_button_property_by_index(index, property)
        get_button_by_index(index) do |device|
          device.send "is_#{property}"
        end
        last_response.body
      end
    end
  end
end
