require 'gametel/accessors'
require 'gametel/navigation'
require 'gametel/version'
require 'gametel/platforms/brazenhead_platform'

module Gametel

  attr_reader :platform

  def self.included(cls)
    cls.extend Gametel::Accessors
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
  # Wait for the provided text to appear
  #
  def wait_for_text(text_to_find)
    platform.wait_for_text(text_to_find)
  end

end

