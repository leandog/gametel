class AppScreen
  include Gametel

  list_item(:alert_dialogs, :text => 'Alert Dialogs')
  list_item(:action_bar, :text => 'Action Bar')
  view(:list_dialog, :id => 'select_button')
end
