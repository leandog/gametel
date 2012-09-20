require 'brazenhead'

module Gametel
  module Platforms
    module Text

      def get_text_by_id(id)
        get_view_by_id(id) do |device|
          device.get_text
          device.to_string
        end
      end

      def enter_text_by_id(id, text)
        get_view_by_id(id) do |device|
          device.enter_text '@@the_view@@', text, :target => 'Robotium'
        end
      end

      def enter_text_by_index(index, text)
        chain_calls do |device|
          device.enter_text(index, text)
        end
      end

      def clear_text_by_id(id)
        get_view_by_id(id) do |device|
          device.clear_edit_text('@@the_view@@', :target => 'Robotium')
        end
      end

      def get_text_hint_by_id(id)
        get_view_by_id(id) do |device|
          device.get_hint
        end
      end

      def get_text_description_by_id(id)
        get_view_by_id(id) do |device|
          device.get_content_description
        end
      end
    end
  end
end
