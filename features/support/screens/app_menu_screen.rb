class AppScreen
  include Gametel

  list_item(:alert_dialogs, :text => 'Alert Dialogs')
  view(:list_dialog, :id => 'select_button')
end
