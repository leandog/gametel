require 'spec_helper'

class GametelSampleScreen
  include Gametel
end

describe Gametel do

  it "should initialize the platform to Calabash when no other platform is specified" do
    screen = GametelSampleScreen.new
    platform = screen.instance_variable_get(:@platform)
    platform.should be_instance_of ::Gametel::Platforms::Calabash
  end

  it "should add the accessors to the class when included" do
    GametelSampleScreen.should respond_to :text
    GametelSampleScreen.should respond_to :button
  end
  
  context "when using Calabash" do
    let(:screen) { GametelSampleScreen.new }
    let(:platform) { calabash_platform(screen) }
          
    it "should know when a sceen has text" do
      platform.should_receive(:performAction).with('assert_text', 'blah', true).and_return(true)
      screen.has_text? "blah"
    end

    it "should know how to press the back button" do
      platform.should_receive(:performAction).with('go_back')
      screen.back
    end
  end
end
