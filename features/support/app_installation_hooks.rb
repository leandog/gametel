require 'calabash-android/management/app_installation'

AfterConfiguration do |config|
  FeatureNameMemory.feature_name = nil
  uninstall_apps
  install_app(ENV["TEST_APP_PATH"])
  install_app(ENV["APP_PATH"])
end

Before do |scenario|
  feature_name = scenario.feature.name
  if FeatureNameMemory.feature_name != feature_name
    log "Is first scenario - reinstalling apps"

    FeatureNameMemory.feature_name = feature_name
  end
end

FeatureNameMemory = Class.new
class << FeatureNameMemory
  @feature_name = nil
  attr_accessor :feature_name
end
