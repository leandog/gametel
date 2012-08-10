Then /^I can tell when buttons are disabled$/ do
  on(ButtonScreen).should_not be_enabled('button_disabled')
end

Then /^I can tell when buttons are enabled$/ do
  on(ButtonScreen).should be_enabled('button_normal')
end
