require 'brazenhead'

module Gametel
  module Platforms
    module Webview

      def click_on_webview(how, what, index=0, scroll=true)
        find_web_element_by(how, what) do |device, by|
          device.click_on_web_element(by, index, scroll, :target => :Robotium)
        end
      end

      def enter_text_in_webview(how, what, text)
        find_web_element_by(how, what) do |device, by|
          device.enter_text_in_web_element(by, text, :target => :Robotium)
        end
      end

      def find_web_element_by(how, what)
        chain_calls do |device|
          device.web_view_by(how, what, :variable => '@@by@@', :target => :Brazenhead)
          yield device, '@@by@@'
        end
      end

    end
  end
end
