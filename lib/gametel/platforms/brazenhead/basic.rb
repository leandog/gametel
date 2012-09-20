require 'brazenhead'

module Gametel
  module Platforms
    module Basic

      def is_enabled_by_id(id)
        get_view_by_id(id) do |device|
          device.is_enabled
        end
      end
      
    end
  end
end
