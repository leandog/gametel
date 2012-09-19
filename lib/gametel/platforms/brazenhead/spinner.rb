require 'brazenhead'

module Gametel
  module Platforms
    module Spinner
      
      def get_spinner_value_by_id(id)
        chain_calls do |device|
          device.id_from_name(id, :target => 'Brazenhead', :variable => '@@view_id@@')
          device.get_view('@@view_id@@', :target => 'Robotium')
          device.get_selected_item
          device.to_string
        end
      end
      
    end
  end
end
