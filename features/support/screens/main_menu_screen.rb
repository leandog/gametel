class MainMenuScreen
  include Gametel

  list_item(:first_list_item_text, :text => 'Accessibility')
  list_item(:first_list_item_index, :index => 0)
  list_item(:first_list_item_index_list, :index => 0, :list => 0)
  list_item(:animation, :index => 1)
  list_item(:app, :index => 2)
  list_item(:content, :index => 3)
  list_item(:graphics, :index => 4)
  list_item(:media, :index => 5)
  list_item(:nfc, :index => 6)
  list_item(:os, :index => 7)
  list_item(:preference, :index => 8)
  list_item(:text, :index => 9)
  list_item(:views, :index => 10)
end
