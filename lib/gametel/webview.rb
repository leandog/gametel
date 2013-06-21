require 'gametel/webviewable'
require 'gametel/webview/accessors'

module Gametel
  module Webview
    include Gametel::Webviewable

    def self.included(cls)
      cls.extend Gametel::Webview::Accessors
    end


    def has_element?(how, what)
      platform.get_web_views_by(how, what, :target => :Brazenhead)
      not platform.last_json.empty?
    end

  end
end
