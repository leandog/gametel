module Gametel
  module Accessors
    def text(name, locator)
      define_method("#{name}=") do |value|
        platform.enter_text(value, locator)
      end
    end

    def button(name, locator)
      define_method(name) do
        platform.press_button(locator)
      end
    end

    def list_item(name, locator)
      define_method(name) do
        platform.press_list_item(locator)
      end
    end

    def checkbox(name, locator)
      define_method(name) do
        platform.click_checkbox(locator)
      end
    end

    def radio_button(name, locator)
      define_method(name) do
        platform.click_radio_button(locator)
      end
    end
  end
end
  
