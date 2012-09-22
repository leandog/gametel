require 'brazenhead'

module Gametel
  module Platforms
    module Progress
      def get_progress_by_id(id)
        get_view_by_id(id) do |device|
          device.get_progress
        end
        last_response.body.to_i
      end

      def set_progress_by_id(id, progress)
        get_view_by_id(id) do |device|
          device.set_progress_bar '@@the_view@@', progress, :target => 'Robotium'
        end
      end

      def get_secondary_progress_by_id(id)
        get_view_by_id(id) do |device|
          device.get_secondary_progress
        end
        last_response.body.to_i
      end

      def set_secondary_progress_by_id(id, progress)
        get_view_by_id(id) do |device|
          device.set_secondary_progress progress
        end
      end
    end
  end
end
