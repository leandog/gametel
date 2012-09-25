class ButtonScreen
  include Gametel

  button(:normal_text, :text => 'Normal')
  button(:normal_index, :index => 0)
  button(:small, :text => 'Small')
  button(:on_off_index, :index => 2)
  button(:on_off_id, :id => 'button_toggle')
  
end
