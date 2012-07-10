Then /^I should see the "(.*?)" list item$/ do |list_item|
  on(MainMenuScreen).should have_text list_item
end

When /^I press the "(.*?)" list item$/ do |list_item|
  on(MainMenuScreen).send "#{list_item}_list_item"
end

When /^I press the Back button$/ do
  on(MainMenuScreen).back
end

