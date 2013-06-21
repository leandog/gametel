require 'gametel/views/web_view'

module Gametel
  module Webview
    module Accessors
      
      def link(name, locator)
        index = value_or_default(locator, :index, 0)
        locator = cleanup(locator)
        define_method(name) do
          platform.click_on_webview(locator.first[0], locator.first[1], index)
        end
      end

      private

      def cleanup(locator)
        loc = locator.first
        key = nil
        case loc[0]
        when :text
          locator.delete(:text)
          key = :textContent
        when :css
          locator.delete(:css)
          key = :cssSelector
        when :class
          locator.delete(:class)
          key = :className
        when :tag
          locator.delete(:tag)
          key = :tagName
        end
        locator[key] = loc[1] if key
        locator
      end

      def value_or_default(locator, value, default)
        locator[value] ? locator.delete(value) : default
      end
      
    end
  end
end

