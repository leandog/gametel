require 'spec_helper'

class GametelSampleScreen
  include Gametel
end

describe Gametel do

  it "should initialize the platform to Brazenhead when no other platform is specified" do
    screen = GametelSampleScreen.new
    platform = screen.instance_variable_get(:@platform)
    platform.should be_instance_of ::Gametel::Platforms::BrazenheadPlatform
  end

  it "should add the accessors to the class when included" do
    GametelSampleScreen.should respond_to :text
    GametelSampleScreen.should respond_to :button
  end
  
  context "when using Brazenhead" do
    let(:screen) { GametelSampleScreen.new }
    let(:platform) { brazenhead_platform(screen) }
    let(:accumulator) { double('accumulator') }
    let(:result) { double('result') }
    let(:device) { double('device') }

          
    before(:each) do
      platform.stub(:accumulator).and_return(accumulator)
      platform.stub(:device).and_return(device)
      accumulator.stub(:clear)
      accumulator.stub(:message)
      device.stub(:send).and_return(result)
    end

    it "should know when a sceen has text" do
      platform.should_receive(:search_text).with('blah', true).and_return(result)
      result.should_receive(:body).and_return('true')
      screen.has_text? "blah"
    end

    it "should know if a view is enabled" do
      result.should_receive(:body).and_return('true')
      accumulator.should_receive(:id_from_name)
      accumulator.should_receive(:get_view)
      accumulator.should_receive(:is_enabled)
      screen.should be_enabled('some_id')
    end

    it "should know if a view exists" do
      result.should_receive(:body).and_return('windowLocation')
      platform.should_receive(:get_view_by_id).and_return(result)
      screen.should have_view('some_id')
    end

    it "should know if a view does not exist" do
      result.should_receive(:body).and_return('')
      platform.should_receive(:get_view_by_id).and_return(result)
      screen.should_not have_view('some_id')
    end


    it "should know how to press the back button" do
      platform.should_receive(:go_back)
      screen.back
    end

    it "should know how to go back to an activity" do
      platform.should_receive(:go_back_to_activity).with('SomeActivity')
      screen.back_to 'SomeActivity'
    end

    it "should know how to get the current activity" do
      result.should_receive(:body).and_return('"SomeActivity"')
      accumulator.should_receive(:get_current_activity)
      accumulator.should_receive(:get_class)
      accumulator.should_receive(:get_simple_name).and_return(result)
      screen.current_activity.should eq('SomeActivity')
    end

    it "should know how to press the enter key" do
      platform.should_receive(:send_key).with(66)
      screen.enter
    end

    it "should know how to scroll down" do
      platform.should_receive(:scroll_down)
      screen.scroll_down
    end

    it "should know how to scroll up" do
      platform.should_receive(:scroll_up)
      screen.scroll_up
    end

    it "should know how to scroll left" do
      platform.should_receive(:scroll_to_side).with(21)
      screen.scroll_left
    end

    it "should know how to scroll right" do
      platform.should_receive(:scroll_to_side).with(22)
      screen.scroll_right
    end
  end
end
