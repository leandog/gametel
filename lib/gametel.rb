require 'brazenhead'
require 'gametel/accessors'
require 'gametel/driver'
require 'gametel/navigation'
require 'gametel/waiter'
require 'gametel/version'
require 'gametel/platforms/brazenhead_platform'
require 'gametel/views'

module Gametel
  include Gametel::Waiter

  attr_reader :platform

  ROBOTIUM_LEFT = 21
  ROBOTIUM_RIGHT = 22

  def self.included(cls)
    cls.extend Gametel::Accessors
  end

  def self.apk_path=(path)
    @apk_path = path
  end

  def self.default_driver
    @default_driver ||= Gametel::Driver.new
  end

  def self.default_server
    @default_server ||= Brazenhead::Server.new @apk_path
  end

  def self.start(activity, keystore=nil)
    default_server.start(activity, keystore) if keystore
    default_server.start(activity) unless keystore
    default_driver
  end

  def self.stop
    default_server.stop
  end

  def initialize(pform = :brazenhead)
    @platform = Gametel::Platforms::BrazenheadPlatform.new if pform == :brazenhead
  end

  #
  # Returns true if the provided text is found on the screen
  #
  def has_text?(text)
    platform.has_text?(text)
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

  #
  # scroll down
  #
  def scroll_down
    platform.scroll_down
  end

  #
  # scroll up
  #
  def scroll_up
    platform.scroll_up
  end
  
  #
  # scroll left
  #
  def scroll_left
    platform.scroll_to_side ROBOTIUM_LEFT
  end

  #
  # scroll right
  #
  def scroll_right
    platform.scroll_to_side ROBOTIUM_RIGHT
  end

  #
  # Wait for the provided text to appear
  #
  def wait_for_text(text_to_find)
    platform.wait_for_text(text_to_find)
    raise "Timed out waiting for the text '#{text_to_find}'" unless platform.last_json
  end

end

