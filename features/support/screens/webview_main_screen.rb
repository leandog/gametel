class WebviewMainScreen
  include Gametel

  activity 'MainActivity'

  button(:goto_webview, :text => 'Go to http://www.google.com')
  
end
