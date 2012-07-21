module Gametel
  module Accessors
    #
    # Generates two method to enter text into a text field and to
    # clear the text field
    #
    # @example
    #   text(:first_name, :index => 0)
    #   # will generate 'first_name=' and 'clear_first_name' methods
    #
    # @param  [String]  the name used for the generated methods
    # @param  [Hash]  locator for how the text is found  The valid
    # keys are:
    #  * :content_description
    #  * :id
    #  * :index
    #
    def text(name, locator)
      define_method("#{name}=") do |value|
        platform.enter_text(value, locator)
      end
      define_method("clear_#{name}") do
          platform.clear_text(locator)
      end
    end

    #
    # Generates one method to click a button.
    #
    # @example
    #   button(:save, :text => 'Save')
    #   # will generate 'save' method
    #
    # @param  [String]  the name used for the generated methods
    # @param  [Hash]  locator for how the button is found  The valid
    # keys are:
    #  * :text
    #  * :index
    #  * :id
    #
    def button(name, locator)
      define_method(name) do
        platform.press_button(locator)
      end
    end

    #
    # Generates one method to click a list item.
    #
    # @example
    #   list_item(:details, :text => 'Details')
    #   # will generate 'details' method
    #
    # @example
    #   list_item(:details, :index => 1, :list => 1)
    #   # will generate 'details' method to select second item in the
    #   # second list
    #
    # @example
    #   list_item(:details, :index => 2)
    #   # will generate 'details' method to select third item in the
    #   # first list
    #
    # @param  [String]  the name used for the generated methods
    # @param  [Hash]  locator for how the list item is found  The valid
    # keys are:
    #  * :text
    #  * :index
    #  * :list - only us with :index to indicate which list to use on
    # the screen.  Default is 0
    #
    def list_item(name, locator)
      define_method(name) do
        platform.press_list_item(locator)
      end
    end

    #
    # Generates one method to click a checkbox.
    #
    # @example
    #   checkbox(:enable, :text => 'Enable')
    #   # will generate 'enable' method
    #
    # @param  [String]  the name used for the generated methods
    # @param  [Hash]  locator for how the checkbox is found  The valid
    # keys are:
    #  * :text
    #  * :index
    #  * :id
    #
    def checkbox(name, locator)
      define_method(name) do
        platform.click_checkbox(locator)
      end
    end

    #
    # Generates one method to click a radio button.
    #
    # @example
    #   radio_button(:circle, :text => 'Circle')
    #   # will generate 'circle' method
    #
    # @param  [String]  the name used for the generated methods
    # @param  [Hash]  locator for how the checkbox is found  The valid
    # keys are:
    #  * :text
    #  * :id
    #
    def radio_button(name, locator)
      define_method(name) do
        platform.click_radio_button(locator)
      end
    end

    #
    # Generates one method to click a view.
    # @example
    #   view(:clickable_text, :id => 'id_name_of_your_control')
    #   # will generate 'clickable_text' method
    #
    # @param  [String]  the name used for the generated methods
    # @param  [Hash]  locator indicating an id for how the view is found.
    # The only valid keys are:
    #   * :id
    #
    def view(name, locator)
      define_method(name) do
        platform.click_view(locator)
      end
    end
  end
end
  
