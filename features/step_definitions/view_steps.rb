When /^I am perusing options for Alert Dialogs$/ do
  on(MainMenuScreen).app
  on(AppScreen).alert_dialogs
end

When /^I choose the List Dialogs button by id$/ do
  on(AlertDialogsScreen).list_dialog
end
