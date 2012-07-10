$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'rspec/expectations'
require 'calabash-android/cucumber'
require 'gametel'
require 'gametel/navigation'

World(Gametel::Navigation)
