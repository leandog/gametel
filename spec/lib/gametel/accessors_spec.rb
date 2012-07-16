require 'spec_helper'

class AccessorsSampleScreen
  include Gametel

  list_item(:first_list_item, 1)
  text(:first_name, 3)
end

describe Gametel::Accessors do
  context "when using Calabash" do
    let(:screen) { AccessorsSampleScreen.new }
    let(:platform) { calabash_platform(screen) }
    
    it "should know how to press a list item" do
      platform.should_receive(:performAction).with('press_list_item', 1, 0)
      screen.first_list_item
    end

    it "should know how to long press a list item" do
      platform.should_receive(:performAction).with('long_press_list_item', 1, 0)
      screen.long_first_list_item
    end

    it "should know how to enter text into a text field" do
      platform.should_receive(:performAction).with('enter_text_into_numbered_field', 'blah', 3)
      screen.first_name = 'blah'
    end
  end
end
