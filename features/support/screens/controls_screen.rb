class ControlsScreen
  include Gametel
  
  text(:text_field, :index => 0)
  button(:enabled_save, 1)
  button(:disabled_save, 2)
  
end
