Then /^I can see the spinner value referenced by "(.*?)" is "(.*?)"$/ do |how, the_selected_value|
  on(ControlsScreen) do |screen|
    screen.send("spinner_#{how}").should eq(the_selected_value)
  end
end
