require 'spec_helper'

class SampleScreen
  include Gametel
end

describe Gametel do
  context "when using Calabash" do
    let(:screen) { SampleScreen.new }
    let(:platform) { calabash_platform(screen) }
          
    it "should know when a sceen has text" do
      platform.should_receive(:performAction).with('assert_text', 'blah', true).and_return(true)
      screen.has_text? "blah"
    end
  end
end
