# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gametel/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jeffrey S. Morgan", "Levi Wilson"]
  gem.email         = ["jeff.morgan@leandog.com", "levi@leandog.com"]
  gem.description   = %q{High level wrapper around android drivers}
  gem.summary       = %q{High level wrapper around android drivers}
  gem.homepage      = "http://github.com/leandog/gametel"

  gem.files         = `git ls-files`.split($\).grep(%r{^(lib|spec|features)})
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec|features)/})
  gem.name          = "gametel"
  gem.require_paths = ["lib"]
  gem.version       = Gametel::VERSION

  gem.add_dependency 'brazenhead', '>= 0.4.0'
  gem.add_dependency 'ADB', '>= 0.5.4'

  gem.add_development_dependency 'rspec', '>= 2.6.0'
  gem.add_development_dependency 'cucumber'

end
