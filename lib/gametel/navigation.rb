require 'page_navigation'

module Gametel
  #
  # Module to facilitate create new gametel screen objects in
  # definitions.
  #
  module Navigation
    include PageNavigation

    #
    # create a new screen given a class name
    #
    def on(cls, &block)
      @current_screen = @current_page = cls.new
      block.call @current_screen if block
      @current_screen
    end

  end
end
