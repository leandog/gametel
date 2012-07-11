Given /^I\'m on the controls screen$/ do
  on(MainMenuScreen).views
  on(ViewsMenuScreen).controls
  on(ControlsMenuScreen).light_theme
end

When /^I enter "(.*?)" into the text field$/ do |text_value|
  on(ControlsScreen).text_field = text_value
end

Then /^I should have the value "(.*?)" on the screen$/ do |text_value|
  on(ControlsScreen).should have_text text_value
end
