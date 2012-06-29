require 'gametel/version'
require 'calabash-android/cucumber'
require 'gametel/navigation'

module Gametel
  include Calabash::Android::Operations

  def self.included(cls)
    cls.extend Gametel::ClassMethods
  end

  def wait_for_text(text_to_find)
    performAction 'wait_for_text', text_to_find
  end

  module ClassMethods
    def text(name, locator)
      define_method("#{name}=") do |value|
        action = locator.kind_of?(String) ?  'enter_text_into_named_field' :  'enter_text_into_numbered_field'
        performAction(action, value, locator)
      end
      define_method(name) do
        # get the value from the text thingy
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

