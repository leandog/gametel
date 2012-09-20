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
  spinner(:spinner_id, :id => 'spinner_id')
end

describe Gametel::Accessors do
  context "when using Brazenhead" do
    let(:screen) { AccessorsSampleScreen.new }
    let(:platform) { brazenhead_platform(screen) }
    let(:accumulator) { double('accumulator') }
    let(:device) { double('device') }
    let(:result) { double('result') }


    before(:each) do
      platform.stub(:accumulator).and_return(accumulator)
      platform.stub(:device).and_return(device)
      accumulator.stub(:clear)
      accumulator.stub(:message)
      device.stub(:send).and_return(result)
    end

    context "list items" do
      it "should know how to be chosen by text" do
        platform.should_receive(:click_on_text)
        screen.first_list_item_text
      end

      it "should know how to be chosen by index" do
        list = 0
        platform.should_receive(:click_in_list).with(1, list)
        screen.first_list_item_index
      end

      it "should know how to select the list when using index" do
        list = 1
        platform.should_receive(:click_in_list).with(1, list)
        screen.first_list_item_index_list
      end
    end

    context "text controls" do
      it "should know how to enter text using an index" do
        accumulator.should_receive(:enter_text)
        screen.first_name_index = 'blah'
      end

      it "should know how to enter text using the id" do
        accumulator.should_receive(:id_from_name)
        accumulator.should_receive(:get_view)
        accumulator.should_receive(:enter_text)
        screen.first_name_id = 'blah'
      end

      it "should know how to be cleared using an index" do
        platform.should_receive(:clear_edit_text)
        screen.clear_first_name_index
      end

      it "should know how to be cleared by id" do
        accumulator.should_receive(:id_from_name)
        accumulator.should_receive(:get_view)
        accumulator.should_receive(:clear_edit_text)
        screen.clear_first_name_id
      end

      it "should know how to get text by id" do
        accumulator.should_receive(:id_from_name)
        accumulator.should_receive(:get_view)
        accumulator.should_receive(:get_text)
        accumulator.should_receive(:to_string)
        result.should_receive(:body).and_return("the value")
        screen.first_name_id.should eq('the value')
      end

      it "should know how to get the hint text" do
        accumulator.should_receive(:id_from_name)
        accumulator.should_receive(:get_view)
        accumulator.should_receive(:get_hint)
        result.should_receive(:body).and_return("the hint")
        screen.first_name_id_hint.should eq('the hint')
      end

      it "should know how to get the content description" do
        accumulator.should_receive(:id_from_name)
        accumulator.should_receive(:get_view)
        accumulator.should_receive(:get_content_description)
        result.should_receive(:body).and_return("the content description")
        screen.first_name_id_description.should eq('the content description')
      end
        
    end

    context "buttons" do
      it "should know how to be chosen by text" do
        platform.should_receive(:click_on_button).with('Save')
        screen.save_text
      end

      it "should know how to be chosen by index" do
        platform.should_receive(:click_on_button).with(2)
        screen.save_index
      end

      it "should know how to be chosen by id" do
        platform.should_receive(:click_on_view_by_id).with('some_button_id')
        screen.save_id
      end
    end


    context "checkboxes" do
      it "should know how to be checked by index" do
        platform.should_receive(:click_on_checkbox).with(1)
        screen.checkbox_index
      end

      it "should know how to be checked by text" do
        platform.should_receive(:click_on_text).with('Checkbox 2')
        screen.checkbox_text
      end

      it "should know how to be checked by id" do
        platform.should_receive(:click_on_view_by_id).with('some_check_id')
        screen.checkbox_id
      end
    end

    context "radio buttons" do
      it "should know how to be clicked by text" do
        platform.should_receive(:click_on_text).with('Radio Button 1')
        screen.radio_text
      end

      it "should know how to be clicked by id" do
        platform.should_receive(:click_on_view_by_id).with('some_radio_id')
        screen.radio_id
      end
    end

    context "views" do
      it "should know how to be clicked by id" do
        platform.should_receive(:click_on_view_by_id).with('some_view_id')
        screen.view_id
      end

      it "should know how to be clicked by test" do
        platform.should_receive(:click_on_text).with('Any view text')
        screen.view_text
      end
    end

    context "spinners" do
      it "should be able to determine their selected item" do
        accumulator.should_receive(:id_from_name)
        accumulator.should_receive(:get_view)
        accumulator.should_receive(:get_selected_item)
        accumulator.should_receive(:to_string)
        result.should_receive(:body).and_return('the text value')
        screen.spinner_id.should eq('the text value')
      end
    end
  end
end
