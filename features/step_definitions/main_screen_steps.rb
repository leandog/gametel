Then /^I should see the "(.*?)" list item$/ do |list_item|
  on(MainMenuScreen).should have_text list_item
end

When /^I press the "(.*?)" list item$/ do |list_item|
  on(MainMenuScreen).send "#{list_item}_list_item"
end

When /^I press the Back button$/ do
  on(MainMenuScreen) do |screen|
    screen.wait_for_text 'Accessibility Service'
    screen.back
  end
end

When /^I scroll down to the bottom of the screen$/ do
  on(MainMenuScreen).scroll_down
end

When /^I scroll up to the top of the screen$/ do
  on(MainMenuScreen).scroll_up
end
