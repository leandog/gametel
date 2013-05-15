When(/^I am on the action bar usage screen$/) do
  navigate_to(ActionBar, :using => :action_bar).action_bar_usage
end

Then(/^I can select the menu item by id$/) do
  on(ActionBarUsage) do |screen|
    screen.menu_by_id
    screen.should have_text('Selected Item: Edit')
  end
end

Then(/^I can select the menu item by text$/) do
  on(ActionBarUsage) do |screen|
    screen.menu_by_text
    screen.should have_text('Selected Item: Add')
  end
end
