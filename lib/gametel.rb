require 'gametel/accessors'
require 'gametel/navigation'
require 'gametel/version'
require 'gametel/platforms/calabash'

module Gametel
  include Calabash::Android::Operations

  attr_reader :platform

  def self.included(cls)
    cls.extend Gametel::Accessors
  end

  def initialize(pform = :calabash)
    @platform = Gametel::Platforms::Calabash.new if pform == :calabash
  end

  def wait_for_text(text_to_find)
    platform.wait_for_text(text_to_find)
  end

  def has_text?(text)
    platform.has_text?(text)
  end
end

