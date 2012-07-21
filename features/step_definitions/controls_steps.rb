Given /^I\'m on the controls screen$/ do
  on(MainMenuScreen) do |screen|
    screen.views
    screen.wait_for_text 'Controls'
  end
  on(ViewsMenuScreen) do |screen|
    screen.controls
    screen.wait_for_text 'Light Theme'
  end
  on(ControlsMenuScreen).light_theme
  on(ControlsScreen).wait_for_text 'Views/Controls'
end

When /^I enter "(.*?)" into the text field identified by "(.*?)"$/ do |text_value, how|
  on(ControlsScreen).send "text_field_#{how}=", text_value
end

Then /^I should have the value "(.*?)" on the control screen$/ do |text_value|
  on(ControlsScreen).should have_text text_value
end

When /^I clear the text from the text field identified by "(.*?)"$/ do |how|
  on(ControlsScreen).send "clear_text_field_#{how}"
end

Then /^I should not have the value "(.*?)" on the control screen$/ do |text_value|
  on(ControlsScreen).should_not have_text text_value
end
