require 'brazenhead'

module Gametel
  module Platforms
    module Basic

      def is_enabled_by_id(id)
        chain_calls do |device|
          device.id_from_name(id, :target => 'Brazenhead', :variable => '@@view_id@@')
          device.get_view('@@view_id@@', :target => 'Robotium')
          device.is_enabled
        end
      end
      
    end
  end
end
