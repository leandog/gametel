module Gametel
  module Webviewable

    attr_reader :platform

    ROBOTIUM_LEFT = 21
    ROBOTIUM_RIGHT = 22


    def initialize(pform = :brazenhead)
      @platform = Gametel::Platforms::BrazenheadPlatform.new if pform == :brazenhead
    end

    #
    # click on the provided text
    #
    def click_on_text(text)
      platform.click_on_text text
    end

    
    #
    # Returns true if the provided text is found on the screen
    #
    def has_text?(text)
      platform.has_text?(text)
    end

    
    #
    # Wait for the provided text to appear
    #
    def wait_for_text(text_to_find)
      platform.wait_for_text(text_to_find)
      raise "Timed out waiting for the text '#{text_to_find}'" unless platform.last_json
    end

    #
    # scroll down
    #
    def scroll_down
      platform.scroll_down
    end

    #
    # scroll up
    #
    def scroll_up
      platform.scroll_up
    end
    
    #
    # scroll left
    #
    def scroll_left
      platform.scroll_to_side ROBOTIUM_LEFT
    end

    #
    # scroll right
    #
    def scroll_right
      platform.scroll_to_side ROBOTIUM_RIGHT
    end

  end
end
