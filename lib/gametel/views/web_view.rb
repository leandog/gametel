module Gametel
  module Views
    class WebView < View

      def click(how, what, index=0, scroll=true)
        platform.click_on_webview(how, what, index, scroll)
      end

      def enter_text(how, what, text)
        platform.enter_text_in_webview(how, what, text)
      end

      def type_text(how, what, text, index=0)
        find_element_by(how, what) do |device, by| 
          device.type_text_in_web_element(by, text, index, :target => :Robotium)
        end
      end

      def clear_text(how, what)
        platform.clear_text_in_webview(how, what)
      end

      def wait_for_element(how, what, timeout=20, scroll=true)
        find_element_by(how, what) do |device, by|
          device.wait_for_web_element(by, timeout, scroll, :target => :Robotium)
        end
      end

      def has_element?(how, what)
        platform.get_web_views_by(how, what, :target => :Brazenhead)
        not platform.last_json.empty?
      end
      
      protected

      def find_element_by(how, what)
        platform.chain_calls do |device|
          device.web_view_by(how, what, :variable => '@@by@@', :target => :Brazenhead)
          yield device, '@@by@@'
        end
      end
    end
  end
end
