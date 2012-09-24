Then /^I should be able to click a radio button by "(.*?)"$/ do |how|
  on(ControlsScreen).send "radio_button_#{how}"
end

Then /^the radio button identified by "(.*?)" should be checked$/ do |how|
  on(ControlsScreen).send("radio_button_#{how}_view").should be_checked
end

