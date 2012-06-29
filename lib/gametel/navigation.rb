module Gametel
  module Navigation
    def on(cls, &block)
      @current_screen = cls.new
      block.call @current_screen if block
      @current_screen
    end
  end
end
