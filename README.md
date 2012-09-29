# Gametel

[![Build Status](http://travis-ci.org/leandog/gametel.png)](http://travis-ci.org/leandog/gametel)

A gem to assist in building page-object like structures for testing android applications.

## Installation

Add this line to your application's Gemfile:

    gem 'gametel'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gametel

## Usage

### Defining your screen object
````ruby
class LoginPage
  include Gametel
end
````

When you include this module methods are added to your class allowing you to declare the items on the screen.

````ruby
class LoginPage
  include Gametel
  
  text(:username, :index => 0)
  text(:password, :index => 1)
  button(:login, :text => 'Login')
end
````

In your step definitions you can then access generated methods to interact with the views on your screen.

````ruby
on(LoginPage) do |screen|
  screen.username = 'levi'
  screen.password = 'secret'
  screen.login
end
````

## Supported Drivers

### Brazenhead

**_Getting Started_**

Before being able to instrument your application, you will need to add the `INTERNET` permission to your `AndroidManifest.xml`.

```xml
<uses-permission android:name="android.permission.INTERNET" />
```

**_Cucumber Setup_**

Sample `features/support/env.rb` file.

````ruby
require 'brazenhead'
require 'brazenhead/server'
require 'gametel'
require 'gametel/navigation'

World(Gametel::Navigation)

server = Brazenhead::Server.new "ApiDemos.apk"

class Driver
  include Brazenhead
end

Before do
  @driver = Driver.new
  server.start "ApiDemos"
end

After do
  server.stop
end
````

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
