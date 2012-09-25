Then /^I should be able to click a checkbox by "(.*?)"$/ do |how|
  on(ControlsScreen) do |screen|
    screen.send "checkbox_#{how}"
    screen.send("checkbox_#{how}_view").should be_checked
  end
end
