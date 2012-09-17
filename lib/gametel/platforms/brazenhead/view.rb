require 'brazenhead'

module Gametel
  module Platforms
    module View

      def click_on_view_by_id(id)
        chain_calls do |device|
          device.id_from_name(id, :target => 'Brazenhead', :variable => '@@view_id@@')
          device.get_view('@@view_id@@', :target => 'Robotium', :variable => '@@the_view@@')
          device.click_on_view('@@the_view@@', :target => 'Robotium')
        end
      end

      def get_view_by_id(id)
        chain_calls do |device|
          device.id_from_name(id, :target => 'Brazenhead', :variable => '@@view_id@@')
          device.get_view('@@view_id@@', :target => 'Robotium')
        end
      end

    end
  end
end
