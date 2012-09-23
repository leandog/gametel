require 'brazenhead'

module Gametel
  module Platforms
    module Progress

      PROGRESS_BAR_CLASS = 'android.widget.ProgressBar'

      def get_progress(locator)
        return get_progress_by_id locator[:id] if locator[:id]
        return get_progress_by_index locator[:index] if locator[:index]
      end

      def set_progress(locator, value)
        set_progress_by_id locator[:id], value if locator[:id]
        set_progress_by_index locator[:index], value if locator[:index]
      end

      def get_secondary_progress(locator)
        return get_secondary_progress_by_id locator[:id] if locator[:id]
        return get_secondary_progress_by_index locator[:index] if locator[:index]
      end

      def set_secondary_progress(locator, value)
        set_secondary_progress_by_id locator[:id], value if locator[:id]
        set_secondary_progress_by_index locator[:index], value if locator[:index]
      end

      private
      def get_progress_by_id(id)
        get_view_by_id(id) do |device|
          device.get_progress
        end
        last_response.body.to_i
      end

      def get_progress_by_index(index)
        get_view_by_index(PROGRESS_BAR_CLASS, index) do |device|
          device.get_progress
        end
        last_response.body.to_i
      end

      def set_progress_by_id(id, progress)
        get_view_by_id(id) do |device|
          device.set_progress_bar '@@the_view@@', progress, :target => 'Robotium'
        end
      end

      def set_progress_by_index(index, progress)
        get_view_by_index(PROGRESS_BAR_CLASS, index) do |device|
          device.set_progress_bar '@@the_view@@', progress, :target => 'Robotium'
        end
      end

      def get_secondary_progress_by_id(id)
        get_view_by_id(id) do |device|
          device.get_secondary_progress
        end
        last_response.body.to_i
      end

      def get_secondary_progress_by_index(index)
        get_view_by_index(PROGRESS_BAR_CLASS, index) do |device|
          device.get_secondary_progress
        end
        last_response.body.to_i
      end

      def set_secondary_progress_by_id(id, progress)
        get_view_by_id(id) do |device|
          device.set_secondary_progress progress
        end
      end

      def set_secondary_progress_by_index(index, progress)
        get_view_by_index(PROGRESS_BAR_CLASS, index) do |device|
          device.set_secondary_progress progress
        end
      end
    end
  end
end
