When /^I click the first list item by "(.+)"$/ do |type|
  on(MainMenuScreen).send "first_list_item_#{type}"
end

When /^I click the list item "(.*?)" from the main menu$/ do |list_item|
  on(MainMenuScreen).send "#{list_item.downcase}"
end
