When /^I am perusing options for Alert Dialogs$/ do
  on(MainMenuScreen).app
  on(AppScreen).alert_dialogs
end

When /^I choose the List Dialogs button by id$/ do
  on(AlertDialogsScreen).list_dialog
end

When /^I am observing custom views$/ do
  on(MainMenuScreen) do |screen|
    screen.scroll_down
    screen.views
  end
  on(ViewsMenuScreen).custom
end

Then /^I should see the "(.*?)" custom view$/ do |view_text|
  on(CustomViewScreen).send view_text
end
