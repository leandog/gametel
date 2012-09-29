Then /^I can see the spinner value referenced by "(.*?)" is "(.*?)"$/ do |how, the_selected_value|
  on(ControlsScreen) do |screen|
    screen.send("spinner_#{how}").should eq(the_selected_value)
  end
end

When /^I select item number "(.*?)" from the spinner using "(.*?)"$/ do |num, how|
  on(ControlsScreen).send "select_spinner_#{how}", num.to_i
end

