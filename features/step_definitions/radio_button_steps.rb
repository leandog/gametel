Then /^I should be able to click a radio button by "(.*?)"$/ do |how|
  on(ControlsScreen).send "radio_button_#{how}"
end
