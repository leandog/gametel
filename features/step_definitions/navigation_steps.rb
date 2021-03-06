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
  navigate_to(ViewsMenuScreen)
end

When(/^I wait for the "(.*?)" screen$/) do |which|
  begin
    on(which.to_class)
  rescue Exception => e
    @last_error = e
  end
end

Then(/^the last error should tell me "(.*?)"$/) do |what|
  @last_error.message.should eq(what)
end

