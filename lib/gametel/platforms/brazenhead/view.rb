require 'brazenhead'

module Gametel
  module Platforms
    module View

      def click_on_view_by_id(id)
        get_view_by_id(id) do |device|
          device.click_on_view('@@the_view@@', :target => 'Robotium')
        end
      end

      def get_view_by_id(id, &block)
        chain_calls do |device|
          device.id_from_name(id, :target => 'Brazenhead', :variable => '@@view_id@@')
          device.get_view('@@view_id@@', :target => 'Robotium', :variable => '@@the_view@@')
          block.call device if block
        end
      end

    end
  end
end
