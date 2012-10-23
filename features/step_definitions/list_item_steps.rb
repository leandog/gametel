When /^I click the first list item by "(.+)"$/ do |type|
  on(MainMenuScreen).send "first_list_item_#{type}"
end

When /^I click the list item "(.*?)" from the main menu$/ do |list_item|
  on(MainMenuScreen).send "#{list_item.downcase}"
end

When /^I click the first list item by index on the first list$/ do
  on(MainMenuScreen).first_list_item_index_list
end

Given /^I am on the custom list screen$/ do
  on(MainMenuScreen) do |screen|
    screen.views
    screen.wait_for_text 'Buttons'
  end
  on(ViewsMenuScreen) do |screen|
    screen.scroll_down
    screen.lists
    screen.wait_for_text "ListAdapter"
  end
  on(ListsMenuScreen) do |screen|
    screen.custom_items
    screen.wait_for_text 'Tom'
  end
end

When /^I ask for the first item in the list$/ do
  @list_item = on(CustomItemsScreen).tom_view
end

Then /^I should know that it has the text "(.*?)"$/ do |expected_text|
  @list_item.text.should include expected_text
  @list_item.should have_text expected_text
end

Given /^I am on the efficient adapter screen$/ do
  on(MainMenuScreen) do |screen|
    screen.views
    screen.wait_for_text 'Buttons'
  end
  on(ViewsMenuScreen) do |screen|
    screen.scroll_down
    screen.lists
    screen.wait_for_text "ListAdapter"
  end
  on(ListsMenuScreen) do |screen|
    screen.efficient_adapter
    screen.wait_for_text 'Abertam'
  end
end

When /^I ask for the list item for "(.*?)"$/ do |arg1|
  @list_item = on(EfficientAdapterScreen).abertam_view
end

Then /^I should know that it has an image$/ do
  @list_item.should have_image
end

Then /^I should know that it does not have an image$/ do
  @list_item.should_not have_image
end
