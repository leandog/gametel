require 'brazenhead'

module Gametel
  module Platforms
    module Text

      def get_text_by_id(id)
        chain_calls do |device|
          device.id_from_name(id, :target => 'Brazenhead', :variable => '@@view_id@@')
          device.get_view('@@view_id@@', :target => 'Robotium')
          device.get_text
          device.to_string
        end
      end

      def enter_text_by_id(id, text)
        chain_calls do |device|
          device.id_from_name(id, :target => 'Brazenhead', :variable => '@@view_id@@')
          device.get_view('@@view_id@@', :target => 'Robotium', :variable => '@@the_view@@')
          device.enter_text('@@the_view@@', text, :target => 'Robotium')
        end
      end

      def enter_text_by_index(index, text)
        chain_calls do |device|
          device.enter_text(index, text)
        end
      end

      def clear_text_by_id(id)
        chain_calls do |device|
          device.id_from_name(id, :target => 'Brazenhead', :variable => '@@view_id@@')
          device.get_view('@@view_id@@', :target => 'Robotium', :variable => '@@the_view@@')
          device.clear_edit_text('@@the_view@@', :target => 'Robotium')
        end
      end

      def get_text_hint_by_id(id)
        chain_calls do |device|
          device.id_from_name(id, :target => 'Brazenhead', :variable => '@@view_id@@')
          device.get_view('@@view_id@@', :target => 'Robotium')
          device.get_hint
        end
      end

      def get_text_description_by_id(id)
        chain_calls do |device|
          device.id_from_name(id, :target => 'Brazenhead', :variable => '@@view_id@@')
          device.get_view('@@view_id@@', :target => 'Robotium')
          device.get_content_description
        end
      end
    end
  end
end
