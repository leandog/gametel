require 'calabash-android/cucumber'
require 'gametel/accessors'
require 'gametel/navigation'
require 'gametel/version'

module Gametel
  include Calabash::Android::Operations

  def self.included(cls)
    cls.extend Gametel::Accessors
  end

  def wait_for_text(text_to_find)
    performAction 'wait_for_text', text_to_find
  end
end

