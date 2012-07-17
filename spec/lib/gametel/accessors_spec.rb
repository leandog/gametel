require 'spec_helper'

class AccessorsSampleScreen
  include Gametel

  list_item(:first_list_item_text, :text => 'first item')
  list_item(:first_list_item_index, :index => 0)
  text(:first_name, :index => 2)
  button(:save_text, :text => 'Save')
  button(:save_index, :index => 1)
  checkbox(:checkbox_index, :index => 0)
  checkbox(:checkbox_text, :text => 'Checkbox 2')
end

describe Gametel::Accessors do
  context "when using Calabash" do
    let(:screen) { AccessorsSampleScreen.new }
    let(:platform) { calabash_platform(screen) }
    
    it "should know how to press a list item by text" do
      platform.should_receive(:performAction).with('click_on_text', 'first item')
      screen.first_list_item_text
    end

    it "should know how to press a list item by index" do
      platform.should_receive(:performAction).with('press_list_item', 1, 0)
      screen.first_list_item_index
    end

    it "should know how to enter text into a text field" do
      platform.should_receive(:performAction).with('enter_text_into_numbered_field', 'blah', 3)
      screen.first_name = 'blah'
    end

    it "should know how to press a button by text" do
      platform.should_receive(:performAction).with('press_button_with_text', 'Save')
      screen.save_text
    end

    it "should know how to press a button by index" do
      platform.should_receive(:performAction).with('press_button_number', 2)
      screen.save_index
    end

    it "should know how to check a checkbox by index" do
      platform.should_receive(:performAction).with('toggle_numbered_checkbox', 1)
      screen.checkbox_index
    end

    it "should know how to check a checkbox by text" do
      platform.should_receive(:performAction).with('click_on_text', 'Checkbox 2')
      screen.checkbox_text
    end
  end
end
