require 'calabash-android/management/adb'

Before do |scenario|
  return if scenario.failed? #No need to start the server is anything before this has failed.
  start_test_server_in_background
end

After do
  require 'net/http'
  Net::HTTP.get(URI.parse("http://localhost:34777/kill"))
end
