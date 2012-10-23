class ListsMenuScreen
  include Gametel
  
  list_item(:array, :text => 'Array')
  list_item(:cursor_people, :text => 'Cursor (People)')
  list_item(:cursor_phones, :text => 'Cursor (Phones)')
  list_item(:list_adapter, :text => 'ListAdapter')
  list_item(:separators, :text => 'Separators')
  list_item(:list_adapter_collapsed, :text => 'ListAdapter Collapsed')
  list_item(:cursor_phones2, :text => 'Cursor (Phones)')
  list_item(:photos, :text => 'Photos')
  list_item(:array_overlay, :text => 'Array (Overlay)')
  list_item(:single_choice_list, :text => 'Single choice list')
  list_item(:multiple_choice_list, :text => 'Multiple choice list')
  list_item(:transcript, :text => 'Transcript')
  list_item(:slow_adapter, :text => 'Slow Adapter')
  list_item(:efficient_adapter, :text => 'Efficient Adapter')
  list_item(:selection_mode, :text => 'Selection Model')
  list_item(:border_selection_mode, :text => 'Border selection mode')
  list_item(:activate_items, :text => 'Activate items')
  list_item(:custom_items, :text => 'Custom items')
end
