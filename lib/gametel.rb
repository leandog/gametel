require 'brazenhead'
require 'gametel/accessors'
require 'gametel/driver'
require 'gametel/navigation'
require 'gametel/waiter'
require 'gametel/version'
require 'gametel/platforms/brazenhead_platform'
require 'gametel/views'
require 'gametel/webview'
require 'gametel/webviewable'

module Gametel
  include Gametel::Waiter
  include Gametel::Webviewable

  def self.included(cls)
    cls.extend Gametel::Accessors
  end

  def self.apk_path=(path)
    @apk_path = path
  end

  def self.keystore=(keystore)
    @keystore = keystore
  end

  def self.default_driver
    @default_driver ||= Gametel::Driver.new
  end

  def self.default_server
    options = [@apk_path]
    options << @keystore if @keystore
    @default_server ||= Brazenhead::Server.new *options
  end

  def self.start(activity)
    default_server.start(activity)
    default_driver
  end

  def self.stop
    default_server.stop
  end

  #
  # Returns true if the view is enabled
  #
  def enabled?(locator)
    platform.enabled?(locator)
  end

  #
  # Returns true if a view exists
  #
  def has_view?(locator)
    platform.has_view?(locator)
  end

  #
  # Press the back button
  #
  def back
    platform.back
  end

  #
  # Go back to a specific activity
  #
  def back_to(activity)
    platform.go_back_to_activity activity
  end

  def current_activity
    platform.chain_calls do |device|
      device.get_current_activity
      device.get_class
      device.get_simple_name
    end

    platform.last_response.body.gsub('"','')
  end

  #
  # Press the enter key
  #
  def enter
    platform.enter
  end


end

