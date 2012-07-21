require 'spec_helper'

class AccessorsSampleScreen
  include Gametel

  list_item(:first_list_item_text, :text => 'first item')
  list_item(:first_list_item_index, :index => 0)
  list_item(:first_list_item_index_list, :index => 0, :list => 1)
  text(:first_name_index, :index => 2)
  text(:first_name_name, :content_description => 'Some name')
  text(:first_name_id, :id => 'fnid')
  button(:save_text, :text => 'Save')
  button(:save_index, :index => 1)
  button(:save_id, :id => 'some_button_id')
  checkbox(:checkbox_index, :index => 0)
  checkbox(:checkbox_text, :text => 'Checkbox 2')
  checkbox(:checkbox_id, :id => 'some_check_id')
  radio_button(:radio_text, :text => 'Radio Button 1')
  radio_button(:radio_id, :id => 'some_radio_id')
  view(:view_id, :id => 'some_view_id')
  view(:view_text, :text => 'Any view text')
end

describe Gametel::Accessors do
  context "when using Calabash" do
    let(:screen) { AccessorsSampleScreen.new }
    let(:platform) { calabash_platform(screen) }

    context "list items" do
      it "should know how to be chosen by text" do
        platform.should_receive(:performAction).with('click_on_text', 'first item')
        screen.first_list_item_text
      end

      it "should know how to be chosen by index" do
        platform.should_receive(:performAction).with('press_list_item', 1, 0)
        screen.first_list_item_index
      end

      it "should know how to select the list when using index" do
        platform.should_receive(:performAction).with('press_list_item', 1, 1)
        screen.first_list_item_index_list
      end
    end

    context "text controls" do
      it "should know how to enter text using an index" do
        platform.should_receive(:performAction).with('enter_text_into_numbered_field', 'blah', 3)
        screen.first_name_index = 'blah'
      end

      it "should know how to enter text using the name" do
        platform.should_receive(:performAction).with('enter_text_into_named_field', 'blah', 'Some name')
        screen.first_name_name = 'blah'
      end

      it "should know how to enter text using the id" do
        platform.should_receive(:performAction).with('enter_text_into_id_field', 'blah', 'fnid')
        screen.first_name_id = 'blah'
      end

      it "should know how to be cleared using an index" do
        platform.should_receive(:performAction).with('clear_numbered_field', 3)
        screen.clear_first_name_index
      end

      it "should know how to be cleared by name" do
        platform.should_receive(:performAction).with('clear_named_field', 'Some name')
        screen.clear_first_name_name
      end

      it "should know now to be cleared by id" do
        platform.should_receive(:performAction).with('clear_id_field', 'fnid')
        screen.clear_first_name_id
      end
    end

    context "buttons" do
      it "should know how to be chosen by text" do
        platform.should_receive(:performAction).with('press_button_with_text', 'Save')
        screen.save_text
      end

      it "should know how to be chosen by index" do
        platform.should_receive(:performAction).with('press_button_number', 2)
        screen.save_index
      end

      it "should know how to be chosen by id" do
        platform.should_receive(:performAction).with('click_on_view_by_id', 'some_button_id')
        screen.save_id
      end
    end


    context "checkboxes" do
      it "should know how to be checked by index" do
        platform.should_receive(:performAction).with('toggle_numbered_checkbox', 1)
        screen.checkbox_index
      end

      it "should know how to be checked by text" do
        platform.should_receive(:performAction).with('click_on_text', 'Checkbox 2')
        screen.checkbox_text
      end

      it "should know how to be checked by id" do
        platform.should_receive(:performAction).with('click_on_view_by_id', 'some_check_id')
        screen.checkbox_id
      end
    end

    context "radio buttons" do
      it "should know how to be clicked by text" do
        platform.should_receive(:performAction).with('click_on_text', 'Radio Button 1')
        screen.radio_text
      end

      it "should know how to be clicked by id" do
        platform.should_receive(:performAction).with('click_on_view_by_id', 'some_radio_id')
        screen.radio_id
      end
    end

    context "views" do
      it "should know how to be clicked by id" do
        platform.should_receive(:performAction).with('click_on_view_by_id', 'some_view_id')
        screen.view_id
      end

      it "should know how to be clicked by test" do
        platform.should_receive(:performAction).with('click_on_text', 'Any view text')
        screen.view_text
      end
    end
  end
end
