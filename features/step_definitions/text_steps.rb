When /^I\'m on the search view filter screen$/ do
  on(MainMenuScreen).views
  on(ViewsMenuScreen).controls
  on(ControlsMenuScreen).light_theme
end

Then /^I am am given the hint "(.*?)" for the "(.*?)" control$/ do |hint, value|
  on(ControlsScreen) do |screen|
    view = screen.send("#{value}_view")
    view.hint.should == hint
  end
end

Then /^I am am given the description "(.*?)" for the "(.*?)" control$/ do |description, value|
  on(ControlsScreen) do |screen|
    view = screen.send("#{value}_view")
    view.description.should == description
  end
end
