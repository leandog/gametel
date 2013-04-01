require 'spec_helper'

include Gametel::Waiter

describe Gametel::Waiter do
  before(:each) do
    ::Time.stub(:now).and_return(100)
    self.stub(:sleep)
  end

  it "should wait for your condition" do
    screen = double("fake screen")
    screen.should_receive(:predicate?).and_return(false, false, true)
    self.should_receive(:sleep).exactly(2)
    wait_until(2) { screen.predicate? }
  end

  it "is not as forgiving if you make it wait" do
    lambda { wait_until(0) }.should raise_error
  end

  it "can be told what it is waiting on" do
    lambda { wait_until(0, "something to happen") }.should raise_error "Timed out waiting for something to happen"
  end
end
