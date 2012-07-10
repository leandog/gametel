Then /^I should see the "(.*?)" menu option$/ do |menu_item|
  on(MainMenuScreen).should have_text menu_item
end

