$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'rspec/expectations'
require 'require_all'
require 'gametel'

World(Gametel::Navigation)

keystore = {
  :path => 'features/support/debug.keystore',
  :alias => 'androiddebugkey',
  :password => 'android',
  :keystore_password => 'android'
}

server = Brazenhead::Server.new('features/support/ApiDemos.apk', keystore)

require_rel '/screens'

Gametel::Navigation.routes = {
  :default => [[MainMenuScreen, :views],
               [ViewsMenuScreen, :controls],
               [ControlsMenuScreen, :light_theme],
               [ControlsScreen, :button_field_id]],
  :button_route => [[MainMenuScreen, :views],
                    [ViewsMenuScreen, :buttons],
                    [ButtonScreen, :normal_id]]
}


class Driver
  include Brazenhead
end

Before do
  @driver = Driver.new
  server.start("ApiDemos")
end

After do
  server.stop
end
