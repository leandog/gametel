class ControlsScreen
  include Gametel
  
  text(:text_field, :index => 0)
  button(:enabled_save, :index => 0)
  button(:disabled_save, :index => 1)
  checkbox(:checkbox_index, :index => 0)
  checkbox(:checkbox_text, :text => 'Checkbox 2')
  checkbox(:checkbox_id, :id => 'check1')
  radio_button(:radio_button_text, :text => 'RadioButton 1')
  
end
