require 'spec_helper'

include Gametel::Navigation

class NavigationScreen
end

describe Gametel::Navigation do
  it "cares about :active? if you do" do
    screen = double('gametel screen')
    NavigationScreen.should_receive(:new).and_return(screen)
    screen.should_receive(:active?).and_return(true)
    on(NavigationScreen)
  end
end
