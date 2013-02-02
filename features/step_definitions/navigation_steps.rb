When /^I navigate to the Controls screen$/ do
  navigate_to(ControlsScreen)
end

When /^I continue navigating to the Controls screen$/ do
  continue_navigation_to(ControlsScreen)
end

When /^I navigate to the Buttons screen using the "(.*?)" route$/ do |route|
  navigate_to(ButtonScreen, :using => route.to_sym)
end

Given /^I am on the the ViewsMenuScreen$/ do
  navigate_to(MainMenuScreen).views
end
