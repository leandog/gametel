Then /^I should be able to click a checkbox by "(.*?)"$/ do |how|
  on(ControlsScreen).send "checkbox_#{how}"
end
