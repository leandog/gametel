class ActionBarUsage
  include Gametel

  action_item(:menu_by_id, :id => :action_edit)
  menu_item(:menu_by_text, :text => 'Add')
end