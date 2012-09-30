module Gametel
  #
  # Module to facilitate create new gametel screen objects in
  # definitions.
  #
  module Navigation

    class << self
      attr_reader :navigation_routes

      def routes=(routes)
        @navigation_routes = routes
      end
    end

    #
    # create a new screen given a class name
    #
    def on(cls, &block)
      @current_screen = cls.new
      block.call @current_screen if block
      @current_screen
    end

    #
    # Navigate to a specific screen following a predefined path.
    #
    def navigate_to(screen_cls, how = {:using => :default}, &block)
      path = path_for how
      from = @current_screen ? @current_screen.class : path[0][0]
      from_index = find_index_for(path, from)
      to_index = find_index_for(path, screen_cls) - 1
      navigate_through_pages(path[from_index..to_index])
      on(screen_cls, &block)
    end

    private

    def path_for(how)
      path = Gametel::Navigation.navigation_routes[how[:using]]
      fail("Gametel::Navigation route :#{how[:using].to_s} not found") unless path
      path
    end

    def find_index_for(path, item)
      path.each_with_index { |each, index| return index if each[0] == item}
    end

    def navigate_through_pages(pages)
      pages.each do |cls, method|
        page = on(cls)
        fail("Navigation method not specified on #{cls}.  Please call the ") unless page.respond_to? method
        page.send method
      end
    end

  end
end
