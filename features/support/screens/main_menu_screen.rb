class MainMenuScreen
  include Gametel

  list_item(:first_list_item_text, :text => 'Accessibility')
  list_item(:first_list_item_index, :index => 0)
  list_item(:app, :text => 'App')
  list_item(:content, :text => 'Content')
  list_item(:graphics, :text => 'Graphics')
  list_item(:media, :text => 'Media')
  list_item(:nfc, :text => 'NFC')
  list_item(:os, :text => 'OS')
  list_item(:preference, :text => 'Preference')
  list_item(:text, :text => 'Text')
  list_item(:views, :text => 'Views')
end
