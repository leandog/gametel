module Gametel
  module Views
    class WebView < View
      WEB_VIEW_CLASS = 'android.webkit.WebView'

      def click(how, what, index=0, scroll=true)
        find_element_by(how, what) do |device, by| 
          device.click_on_web_element(by, index, scroll, :target => :Robotium)
        end
      end

      def enter_text(how, what, text)
        find_element_by(how, what) do |device, by| 
          device.enter_text_in_web_element(by, text, :target => :Robotium)
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
      
      def build_property_methods
        metaclass = class << self; self; end
        properties.each do |property|
          metaclass.send(:define_method, "#{property}?".to_sym) do
            
            platform.get_view_by_id(locator[:id]) do |device|
              device.send "is_#{property}"
            end if locator[:id]
            
            platform.get_view_by_index(WEB_VIEW_CLASS, locator[:index]) do |device|
              device.send "is_#{property}"
            end if locator[:index]

            platform.last_response.body == "true"
          end
        end
      end
    end
  end
end
