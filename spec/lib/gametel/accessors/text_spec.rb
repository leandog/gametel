require 'spec_helper'

describe Gametel::Views::Text do
  let(:platform) { double('Gametel platform') }
  let(:locator) { {:id => 'abc'} }
  subject { Gametel::Views::Text.new(platform, locator) }

  it 'should know what its type is' do
    subject.view_class.should eq('android.widget.EditText')
  end
end