require 'spec_helper'

class SampleScreen
  include Gametel
end

describe Gametel do

  it "should initialize the platform to Calabash when no other platform is specified" do
    screen = SampleScreen.new
    platform = screen.instance_variable_get(:@platform)
    platform.should be_instance_of ::Gametel::Platforms::Calabash
  end

  it "should add the accessors to the class when included" do
    SampleScreen.should respond_to :text
    SampleScreen.should respond_to :button
  end
  
  context "when using Calabash" do
    let(:screen) { SampleScreen.new }
    let(:platform) { calabash_platform(screen) }
          
    it "should know when a sceen has text" do
      platform.should_receive(:performAction).with('assert_text', 'blah', true).and_return(true)
      screen.has_text? "blah"
    end
  end
end
