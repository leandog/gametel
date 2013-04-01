require 'page_navigation'
require 'gametel/waiter'

module Gametel
  #
  # Module to facilitate create new gametel screen objects in
  # definitions.
  #
  module Navigation
    include PageNavigation, Gametel::Waiter

    #
    # create a new screen given a class name
    #
    def on(cls, &block)
      @current_screen = @current_page = cls.new
      waiting_for  = "#{cls} to be active"
      wait_until(10, waiting_for) { @current_screen.active? } if @current_screen.respond_to?(:active?)
      block.call @current_screen if block
      @current_screen
    end

  end
end
