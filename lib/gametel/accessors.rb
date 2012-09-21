module Gametel
  module Accessors
    #
    # Generates methods to enter text into a text field, clear the text
    # field, get the hint as well as the description
    #
    # @example
    #   text(:first_name, :index => 0)
    #   # will generate 'first_name', 'first_name=', 'clear_first_name', 'first_name_hint' and 'first_name_description' methods
    #
    # @param  [String]  the name used for the generated methods
    # @param  [Hash]  locator for how the text is found  The valid
    # keys are:
    #  * :id
    #  * :index
    #
    def text(name, locator)
      define_method("#{name}") do
        platform.get_text(locator)
      end
      define_method("#{name}=") do |value|
        platform.enter_text(value, locator)
      end
      define_method("clear_#{name}") do
        platform.clear_text(locator)
      end
      define_method("#{name}_hint") do
        platform.get_text_hint(locator)
      end
      define_method("#{name}_description") do
        platform.get_text_description(locator)
      end
      view_properties_for(name, locator) if locator[:id]
    end

    #
    # Generates a method to click a button and determine if it is enabled.
    #
    # @example
    #   button(:save, :text => 'Save')
    #   # will generate 'save' and 'save_enabled?' methods
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
      button_properties_for(name, locator)
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
      view_properties_for(name, locator) if locator[:id]
    end

    def progress(name, locator)
      define_method("#{name}=") do |value|
        platform.get_view_by_id(locator[:id]) do |device|
          device.set_progress_bar '@@the_view@@', value, :target => 'Robotium'
        end
      end
    end

    #
    # Generates one method to get the selected item text.
    # @example
    #   spinner(:spinner_item, :id => 'id_name_of_your_control')
    #   # will generate 'spinner_item' method
    #
    # @param  [String]  the name used for the generated methods
    # @param  [Hash]  locator indicating an id for how the spinner is found.
    # The only valid keys are:
    #   * :id
    #
    def spinner(name, locator)
      define_method(name) do
        platform.get_spinner_value(locator) if locator[:id]
      end
    end

    private
    def view_properties
      [:clickable, :enabled, :focusable, :focused, :selected, :shown]
    end

    def button_properties_for(name, locator)
      view_properties.each do |property|
        define_method("#{name}_#{property}?") do
          result = platform.get_button_property_by_id(locator[:id], property) if locator[:id]
          result = platform.get_button_property_by_index(locator[:index], property) if locator[:index]
          result = platform.get_button_property_by_text(locator[:text], property) if locator[:text]
          result
        end
      end
    end

    def view_properties_for(name, locator)
      view_properties.each do |property|
        define_method("#{name}_#{property}?") do
          platform.get_view_by_id(locator[:id]) do |device|
            device.send "is_#{property}"
          end
          platform.last_response.body
        end
      end
    end
  end
end

