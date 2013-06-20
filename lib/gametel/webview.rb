require 'gametel/webviewable'


module Gametel
  module Webview
    include Gametel::Webviewable

    def has_element?(how, what)
      platform.get_web_views_by(how, what, :target => :Brazenhead)
      not platform.last_json.empty?
    end

  end
end
