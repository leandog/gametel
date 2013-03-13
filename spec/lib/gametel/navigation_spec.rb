require 'spec_helper'

include Gametel::Navigation

class NavigationScreen
end

describe Gametel::Navigation do
  let(:screen) { double 'gametel screen' }

  before(:each) do
    ::Time.stub(:now).and_return(0)
    NavigationScreen.should_receive(:new).and_return(screen)
  end

  it "is cool, if you don't care about :active?" do
    on(NavigationScreen)
  end

  it "cares about :active? if you do" do
    screen.should_receive(:active?).and_return(true)
    on(NavigationScreen)
  end

  it "will still wait on you, though" do
    screen.stub(:active?).and_return(true)
    self.should_receive(:wait_until)
    on(NavigationScreen)
  end
end
