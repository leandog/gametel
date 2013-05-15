require 'spec_helper'

class MenuScreen
  include Gametel

  action_item(:action_by_id, :id => 'action_item_id')
  menu_item(:menu_by_text, :text => 'Ze Text')
end

describe Gametel::Platforms::Menu do
  let(:screen) { MenuScreen.new }
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

  it 'can select menus by their id' do
    accumulator.should_receive(:id_from_name).with('action_item_id', :target => 'Brazenhead', :variable => '@@id@@')
    accumulator.should_receive(:click_on_action_bar_item).with('@@id@@', :target => 'Robotium')
    screen.action_by_id
  end

  it 'can select menus by text' do
    platform.should_receive(:click_on_menu_item).with('Ze Text')
    screen.menu_by_text
  end
end
