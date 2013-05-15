require 'brazenhead'

module Gametel
  module Platforms
    module Menu
      def click_menu_by_id(id)
        chain_calls do |device|
          device.id_from_name id, :target => 'Brazenhead', :variable => '@@id@@'
          device.click_on_action_bar_item '@@id@@', :target => 'Robotium'
        end
      end

      def click_menu_by_text(text)
        click_on_menu_item text
      end
    end
  end
end
