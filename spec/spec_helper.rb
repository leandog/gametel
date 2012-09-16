# encoding: utf-8
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

if ENV['coverage']
  raise "simplecov only works on Ruby 1.9" unless RUBY_VERSION =~ /^1\.9/

  require 'simplecov'
  SimpleCov.start { add_filter "spec/" }
end

require 'rspec'
require 'gametel'

def brazenhead_platform(gametel)
  platform = Gametel::Platforms::BrazenheadPlatform.new
  gametel.instance_variable_set(:@platform, platform)
  platform.stub(:accumulator).and_return(accumulator)
  platform
end

