module Gametel
  module Accessors

    #
    # Generates a method named active? which will wait for the
    # activity to become active
    #
    # returns true when successful
    #
    def activity(activity_name)
      define_method("active?") do
        platform.wait_for_activity activity_name
        platform.last_json
      end 
    end

    #
    # Generates methods to enter text into a text field, clear the text
    # field, get the hint as well as the description
    #
    # @example
    #   text(:first_name, :index => 0)
    #   # will generate 'first_name', 'first_name=', 'clear_first_name', 'first_name_hint' and 'first_name_description' methods
    #
    # @param  [Symbol]  the name used for the generated methods
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
      define_method("#{name}_view") do
        Gametel::Views::Text.new(platform, locator)
      end
    end

    #
    # Generates a method to click a button and determine if it is enabled.
    #
    # @example
    #   button(:save, :text => 'Save')
    #   # will generate 'save' and 'save_enabled?' methods
    #
    # @param  [Symbol]  the name used for the generated methods
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
      define_method("#{name}_view") do
        Gametel::Views::Button.new(platform, locator)
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
    # @param  [Symbol]  the name used for the generated methods
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
      define_method("#{name}_view") do
        Gametel::Views::ListItem.new(platform, locator)
      end
    end

    #
    # Generates one method to click a checkbox.
    #
    # @example
    #   checkbox(:enable, :text => 'Enable')
    #   # will generate 'enable' method
    #
    # @param  [Symbol]  the name used for the generated methods
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
      define_method("#{name}_view") do
        Gametel::Views::CheckBox.new(platform, locator)
      end
    end

    #
    # Generates one method to click a radio button.
    #
    # @example
    #   radio_button(:circle, :text => 'Circle')
    #   # will generate 'circle' method
    #
    # @param  [Symbol]  the name used for the generated methods
    # @param  [Hash]  locator for how the checkbox is found  The valid
    # keys are:
    #  * :text
    #  * :index
    #  * :id
    #
    def radio_button(name, locator)
      define_method(name) do
        platform.click_radio_button(locator)
      end
      define_method("#{name}_view") do
        Gametel::Views::RadioButton.new(platform, locator)
      end
    end

    #
    # Generates one method to click a view.
    # @example
    #   view(:clickable_text, :id => 'id_name_of_your_control')
    #   # will generate 'clickable_text' method
    #
    # @param  [Symbol]  the name used for the generated methods
    # @param  [Hash]  locator indicating an id for how the view is found.
    # The only valid keys are:
    #   * :id
    #   * :text
    #
    def view(name, locator)
      define_method(name) do
        platform.click_view(locator)
      end
      define_method("#{name}_view") do
        Gametel::Views::View.new(platform, locator)
      end
    end

    #
    # Generates methods to get an set the progress as well as
    # the secondary progress
    # @example
    #   spinner(:progress_item, :id => 'id_name_of_your_control')
    #   # will generate progress_item, progress_item=, progress_item_secondary, progress_item_secondary=
    #
    # @param  [Symbol]  the name used for the generated methods
    # @param  [Hash]  locator indicating an id for how the progress bar is found.
    # The only valid keys are:
    #   * :id
    #   * :index
    #
    def progress(name, locator)
      define_method("#{name}") do
        platform.get_progress(locator)
      end
      define_method("#{name}_max") do
        platform.get_progress_max(locator)
      end
      define_method("#{name}_secondary") do
        platform.get_secondary_progress(locator)
      end
      define_method("#{name}=") do |value|
        platform.set_progress(locator, value)
      end
      define_method("#{name}_secondary=") do |value|
        platform.set_secondary_progress(locator, value)
      end
      define_method("#{name}_view") do
        Gametel::Views::Progress.new(platform, locator)
      end
    end

    #
    # Generates three method to interact with a spinner
    # @example
    #   spinner(:spinner_item, :id => 'id_name_of_your_control')
    #   # will generate 'spinner_item' method to return the spinner
    #   # value, 'select_spinner_item(value) to set the spinner value
    #   # and 'spinner_view' to return the view
    
    #
    # @param  [Symbol]  the name used for the generated methods
    # @param  [Hash]  locator indicating an id for how the spinner is found.
    # The only valid keys are:
    #   * :id
    #   * :index
    #
    def spinner(name, locator)
      define_method(name) do
        platform.get_spinner_value(locator)
      end
      define_method("select_#{name}") do |value|
        platform.select_spinner_value(locator, value)
      end
      define_method("#{name}_view") do
        Gametel::Views::Spinner.new(platform, locator)
      end
    end

    #
    # Generaes method to interact with an image.
    #
    # @example
    #   image(:headshot, :id => 'headshot')
    #   # will generate 'click_headshot' method to click the image,
    #   # 'wait_for_headshot' which will wait until the image has
    #   # loaded a drawable and 'headshot_view' to return the view
    #
    # @param  [Symbol]  the name used for the generated methods
    # @param  [Hash]  locator indicating an id for how the image is found.
    # The only valid keys are:
    #   * :index
    #
    def image(name, locator)
      define_method("click_#{name}") do
        platform.click_image(locator)
      end
      define_method("wait_for_#{name}") do
        wait_until do
          platform.has_drawable?(locator)
        end
      end
      define_method("#{name}_view") do
        Gametel::Views::Image.new(platform, locator)
      end
    end

    def webview(name, locator)
      define_method("#{name}_view") do
        Gametel::Views::WebView.new(platform, locator)
      end
    end

    def action_item(name, locator)
      define_method(name) do
        platform.click_menu(locator)
      end
    end

    alias_method :menu_item, :action_item
  end
end

