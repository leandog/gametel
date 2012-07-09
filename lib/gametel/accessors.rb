module Gametel
  module Accessors
    def text(name, locator)
      define_method("#{name}=") do |value|
        action = locator.kind_of?(String) ?  'enter_text_into_named_field' :  'enter_text_into_numbered_field'
        performAction(action, value, locator)
      end
    end

    def button(name, locator)
      define_method(name) do
        action = locator.kind_of?(String) ? 'press_button_with_text' : 'press_button_number'
        performAction(action, locator)
      end
    end
  end
end
  
