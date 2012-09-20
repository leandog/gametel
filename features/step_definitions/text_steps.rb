When /^I'm on the search view filter screen$/ do
  on(MainMenuScreen).views
  on(ViewsMenuScreen).controls
  on(ControlsMenuScreen).light_theme
end

Then /^I am am given the hint "(.*?)" for the "(.*?)" control$/ do |hint, value|
  on(ControlsScreen) do |screen|
    screen.send("#{value}_hint").should eq(hint)
  end
end
