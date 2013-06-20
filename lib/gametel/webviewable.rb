module Gametel
  module Webviewable

    attr_reader :platform

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

    
  end
end
