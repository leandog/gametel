$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'rspec/expectations'
require 'require_all'
require 'gametel'

World(Gametel::Navigation)

require_rel '/screens'

Gametel::Navigation.routes = {
  :default => [[MainMenuScreen, :views],
               [ViewsMenuScreen, :controls],
               [ControlsMenuScreen, :light_theme],
               [ControlsScreen, :button_field_id]],
  :button_route => [[MainMenuScreen, :views],
                    [ViewsMenuScreen, :buttons],
                    [ButtonScreen, :normal_id]],
  :action_bar => [[MainMenuScreen, :app],
                  [AppScreen, :action_bar],
                  [ActionBar]]
}

Gametel.keystore = {
  :path => 'features/support/debug.keystore',
  :alias => 'androiddebugkey',
  :password => 'android',
  :keystore_password => 'android'
}


Before do
  Gametel.apk_path = 'features/support/ApiDemos.apk'
  @driver = Gametel.start('ApiDemos')
end

After do
  Gametel.stop
end
