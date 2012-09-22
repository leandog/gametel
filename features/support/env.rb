$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'rspec/expectations'
require 'brazenhead'
require 'brazenhead/server'
require 'gametel'
require 'gametel/navigation'

World(Gametel::Navigation)

keystore = {
  :path => 'features/support/debug.keystore',
  :alias => 'androiddebugkey',
  :password => 'android',
  :keystore_password => 'android'
}

server = Brazenhead::Server.new('features/support/ApiDemos.apk', keystore)

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
