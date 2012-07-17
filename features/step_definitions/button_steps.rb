Given /^I\'m on the buttons screen$/ do
  on(MainMenuScreen) do |screen|
    screen.views
    screen.wait_for_text 'Buttons'
  end
  on(ViewsMenuScreen) do |screen|
    screen.buttons
    screen.wait_for_text 'Normal'
  end
end

Then /^I should be able to click the button by "(.*?)"$/ do |how|
  on(ButtonScreen).send "normal_#{how}"
end
