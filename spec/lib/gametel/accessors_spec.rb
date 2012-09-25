require 'spec_helper'

class AccessorsSampleScreen
  include Gametel

  list_item(:first_list_item_text, :text => 'first item')
  list_item(:first_list_item_index, :index => 0)
  list_item(:first_list_item_index_list, :index => 0, :list => 1)
  text(:first_name_index, :index => 2)
  text(:first_name_name, :content_description => 'Some name')
  text(:first_name_id, :id => 'id_for_first_name')
  button(:save_text, :text => 'Save')
  button(:save_index, :index => 1)
  button(:save_id, :id => 'some_button_id')
  checkbox(:checkbox_index, :index => 0)
  checkbox(:checkbox_text, :text => 'Checkbox 2')
  checkbox(:checkbox_id, :id => 'some_check_id')
  radio_button(:radio_text, :text => 'Radio Button 1')
  radio_button(:radio_id, :id => 'some_radio_id')
  radio_button(:radio_index, :index => 1)
  view(:view_id, :id => 'some_view_id')
  view(:view_text, :text => 'Any view text')
  spinner(:spinner_id, :id => 'spinner_id')
  spinner(:spinner_index, :index => 1)
  progress(:progress_id, :id => 'progress_id')
  progress(:progress_index, :index => 1)
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
        view = screen.first_name_id_view
        view.hint.should eq('the hint')
      end

      it "should know how to get the content description" do
        accumulator.should_receive(:id_from_name)
        accumulator.should_receive(:get_view)
        accumulator.should_receive(:get_content_description)
        result.should_receive(:body).and_return("the content description")
        view = screen.first_name_id_view
        view.description.should eq('the content description')
      end

      context "when looking at properties" do

        it "should know if they are enabled" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:is_enabled)
          result.should_receive(:body).and_return("false")
          view = screen.first_name_id_view
          view.should_not be_enabled
        end

        it "should know if they are clickable" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:is_clickable)
          result.should_receive(:body).and_return("true")
          view = screen.first_name_id_view
          view.should be_clickable
        end

        it "should know if they are focusable" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:is_focusable)
          result.should_receive(:body).and_return("true")
          view = screen.first_name_id_view
          view.should be_focusable
        end

        it "should know if they are focused" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:is_focused)
          result.should_receive(:body).and_return("true")
          view = screen.first_name_id_view
          view.should be_focused
        end

        it "should know if they are selected" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:is_selected)
          result.should_receive(:body).and_return("true")
          view = screen.first_name_id_view
          view.should be_selected
        end

        it "should know if they are shown" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:is_shown)
          result.should_receive(:body).and_return("true")
          view = screen.first_name_id_view
          view.should be_shown
        end
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

      context "when looking at properties by id" do
        it "should know if they are enabled" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:is_enabled)
          result.should_receive(:body).and_return("false")
          view = screen.save_id_view
          view.should_not be_enabled
        end

        it "should know if they are clickable" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:is_clickable)
          result.should_receive(:body).and_return("true")
          view = screen.save_id_view
          view.should be_clickable
        end

        it "should know if they are focusable" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:is_focusable)
          result.should_receive(:body).and_return("true")
          view = screen.save_id_view
          view.should be_focusable
        end

        it "should know if they are focused" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:is_focused)
          result.should_receive(:body).and_return("true")
          view = screen.save_id_view
          view.should be_focused
        end

        it "should know if they are selected" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:is_selected)
          result.should_receive(:body).and_return("true")
          view = screen.save_id_view
          view.should be_selected
        end

        it "should know if they are shown" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:is_shown)
          result.should_receive(:body).and_return("true")
          view = screen.save_id_view
          view.should be_shown
        end
      end

      context "when looking at properties by index" do
        it "should know if they are enabled" do
          accumulator.should_receive(:get_button)
          accumulator.should_receive(:is_enabled)
          result.should_receive(:body).and_return("false")
          view = screen.save_index_view
          view.should_not be_enabled
        end

        it "should know if they are clickable" do
          accumulator.should_receive(:get_button)
          accumulator.should_receive(:is_clickable)
          result.should_receive(:body).and_return("true")
          view = screen.save_index_view
          view.should be_clickable
        end

        it "should know if they are focusable" do
          accumulator.should_receive(:get_button)
          accumulator.should_receive(:is_focusable)
          result.should_receive(:body).and_return("true")
          view = screen.save_index_view
          view.should be_focusable
        end

        it "should know if they are focused" do
          accumulator.should_receive(:get_button)
          accumulator.should_receive(:is_focused)
          result.should_receive(:body).and_return("true")
          view = screen.save_index_view
          view.should be_focused
        end

        it "should know if they are selected" do
          accumulator.should_receive(:get_button)
          accumulator.should_receive(:is_selected)
          result.should_receive(:body).and_return("true")
          view = screen.save_index_view
          view.should be_selected
        end

        it "should know if they are shown" do
          accumulator.should_receive(:get_button)
          accumulator.should_receive(:is_shown)
          result.should_receive(:body).and_return("true")
          view = screen.save_index_view
          view.should be_shown
        end
      end

      context "when looking at properties by text" do
        it "should know if they are enabled" do
          accumulator.should_receive(:get_button).with('Save', anything())
          accumulator.should_receive(:is_enabled)
          result.should_receive(:body).and_return("false")
          view = screen.save_text_view
          view.should_not be_enabled
        end

        it "should know if they are clickable" do
          accumulator.should_receive(:get_button).with('Save', anything())
          accumulator.should_receive(:is_clickable)
          result.should_receive(:body).and_return("true")
          view = screen.save_text_view
          view.should be_clickable
        end

        it "should know if they are focusable" do
          accumulator.should_receive(:get_button).with('Save', anything())
          accumulator.should_receive(:is_focusable)
          result.should_receive(:body).and_return("true")
          view = screen.save_text_view
          view.should be_focusable
        end

        it "should know if they are focused" do
          accumulator.should_receive(:get_button).with('Save', anything())
          accumulator.should_receive(:is_focused)
          result.should_receive(:body).and_return("true")
          view = screen.save_text_view
          view.should be_focused
        end

        it "should know if they are selected" do
          accumulator.should_receive(:get_button).with('Save', anything())
          accumulator.should_receive(:is_selected)
          result.should_receive(:body).and_return("true")
          view = screen.save_text_view
          view.should be_selected
        end

        it "should know if they are shown" do
          accumulator.should_receive(:get_button).with('Save', anything())
          accumulator.should_receive(:is_shown)
          result.should_receive(:body).and_return("true")
          view = screen.save_text_view
          view.should be_shown
        end
      end
    end

    context "checkboxes" do
      it "should know how to be checked by index" do
        platform.should_receive(:click_on_check_box).with(1)
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
      context "identified by text" do
        it "should know how to be clicked" do
          platform.should_receive(:click_on_text).with('Radio Button 1')
          screen.radio_text
        end

        it "should know whether or not it is checked" do
          platform.should_receive(:is_radio_button_checked).with('Radio Button 1').and_return(result)
          result.should_receive(:body).and_return("true")
          screen.radio_text_view.should be_checked
        end
      end

      context "identified by id" do
        it "should know how to be clicked" do
          platform.should_receive(:click_on_view_by_id).with('some_radio_id')
          screen.radio_id
        end

        it "should know whether or not it is checked" do
          accumulator.should_receive(:id_from_name).with('some_radio_id', anything)
          accumulator.should_receive(:get_view).with('@@view_id@@', anything)
          accumulator.should_receive(:is_checked)
          result.should_receive(:body).and_return("false")
          screen.radio_id_view.should_not be_checked
        end
      end

      context "identified by index" do
        it "should know how to be clicked" do
          platform.should_receive(:click_on_radio_button).with(1)
          screen.radio_index
        end

        it "should know whether or not it is checked" do
          platform.should_receive(:is_radio_button_checked).with(1).and_return(result)
          result.should_receive(:body).and_return("false")
          screen.radio_index_view.should_not be_checked
        end
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

      context "when looking at properties" do

        it "should know if they are enabled" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:is_enabled)
          result.should_receive(:body).and_return("false")
          view = screen.view_id_view
          view.should_not be_enabled
        end

        it "should know if they are clickable" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:is_clickable)
          result.should_receive(:body).and_return("true")
          view = screen.view_id_view
          view.should be_clickable
        end

        it "should know if they are focusable" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:is_focusable)
          result.should_receive(:body).and_return("true")
          view = screen.view_id_view
          view.should be_focusable
        end

        it "should know if they are focused" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:is_focused)
          result.should_receive(:body).and_return("true")
          view = screen.view_id_view
          view.should be_focused
        end

        it "should know if they are selected" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:is_selected)
          result.should_receive(:body).and_return("true")
          view = screen.view_id_view
          view.should be_selected
        end

        it "should know if they are shown" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:is_shown)
          result.should_receive(:body).and_return("true")
          view = screen.view_id_view
          view.should be_shown
        end
      end
    end

    context "spinners" do
      context "identified by id" do
        it "should be able to determine their selected item" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:get_selected_item)
          accumulator.should_receive(:to_string)
          result.should_receive(:body).and_return('the text value')
          screen.spinner_id.should eq('the text value')
        end
      end

      context "identified by index" do
        it "should be able to determine their selected item" do
          accumulator.should_receive(:get_class)
          accumulator.should_receive(:for_name).with('android.widget.Spinner', anything)
          accumulator.should_receive(:get_view).with('@@the_type@@', 1, anything)
          accumulator.should_receive(:get_selected_item)
          accumulator.should_receive(:to_string)
          result.should_receive(:body).and_return('the text value')
          screen.spinner_index.should eq('the text value')
        end
      end
    end

    context "progress bars" do

      context "identified by id" do
        it "should be able to set the progress" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:set_progress_bar).with('@@the_view@@', 37, :target => 'Robotium')
          screen.progress_id = 37
        end

        it "should be able to set the secondary progress" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:set_secondary_progress).with(74)
          screen.progress_id_secondary = 74
        end

        it "should be able to get the progress" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:get_progress)
          result.should_receive(:body).and_return("37")
          screen.progress_id.should eq(37)
        end

        it "should be able to get the secondary progress" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:get_secondary_progress)
          result.should_receive(:body).and_return("74")
          screen.progress_id_secondary.should eq(74)
        end

        it "should be able to get the max" do
          accumulator.should_receive(:id_from_name)
          accumulator.should_receive(:get_view)
          accumulator.should_receive(:get_max)
          result.should_receive(:body).and_return("100")
          screen.progress_id_max.should eq(100)
        end
      end

      context "identified by index" do
        it "should be able to set the progress" do
          accumulator.should_receive(:get_class)
          accumulator.should_receive(:for_name).with('android.widget.ProgressBar', :variable => '@@the_type@@')
          accumulator.should_receive(:get_view).with('@@the_type@@', 1, :target => 'Robotium', :variable => '@@the_view@@')
          accumulator.should_receive(:set_progress_bar).with('@@the_view@@', 37, :target => 'Robotium')
          screen.progress_index = 37
        end

        it "should be able to set the secondary progress" do
          accumulator.should_receive(:get_class)
          accumulator.should_receive(:for_name).with('android.widget.ProgressBar', :variable => '@@the_type@@')
          accumulator.should_receive(:get_view).with('@@the_type@@', 1, :target => 'Robotium', :variable => '@@the_view@@')
          accumulator.should_receive(:set_secondary_progress).with(74)
          screen.progress_index_secondary = 74
        end

        it "should be able to get the progress" do
          accumulator.should_receive(:get_class)
          accumulator.should_receive(:for_name).with('android.widget.ProgressBar', :variable => '@@the_type@@')
          accumulator.should_receive(:get_view).with('@@the_type@@', 1, :target => 'Robotium', :variable => '@@the_view@@')
          accumulator.should_receive(:get_progress)
          result.should_receive(:body).and_return("37")
          screen.progress_index.should eq(37)
        end

        it "should be able to get the secondary progress" do
          accumulator.should_receive(:get_class)
          accumulator.should_receive(:for_name).with('android.widget.ProgressBar', :variable => '@@the_type@@')
          accumulator.should_receive(:get_view).with('@@the_type@@', 1, :target => 'Robotium', :variable => '@@the_view@@')
          accumulator.should_receive(:get_secondary_progress)
          result.should_receive(:body).and_return("74")
          screen.progress_index_secondary.should eq(74)
        end

        it "should be able to get the max" do
          accumulator.should_receive(:get_class)
          accumulator.should_receive(:for_name).with('android.widget.ProgressBar', :variable => '@@the_type@@')
          accumulator.should_receive(:get_view).with('@@the_type@@', 1, :target => 'Robotium', :variable => '@@the_view@@')
          accumulator.should_receive(:get_max)
          result.should_receive(:body).and_return("100")
          screen.progress_index_max.should eq(100)
        end
      end
    end
  end
end
