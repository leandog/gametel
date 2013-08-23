# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gametel/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jeffrey S. Morgan", "Levi Wilson"]
  gem.email         = ["jeff.morgan@leandog.com", "levi@leandog.com"]
  gem.description   = %q{High level wrapper around android drivers}
  gem.summary       = %q{High level wrapper around android drivers}
  gem.homepage      = "http://github.com/leandog/gametel"
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($\).grep(%r{^(lib|spec|features)})
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec|features)/})
  gem.name          = "gametel"
  gem.require_paths = ["lib"]
  gem.version       = Gametel::VERSION

  gem.add_dependency 'brazenhead', '>= 0.4.8'
  gem.add_dependency 'ADB', '>= 0.5.6'
  gem.add_dependency 'page_navigation', '>= 0.9'

  gem.add_development_dependency 'rspec', '>= 2.14.0'
  gem.add_development_dependency 'cucumber', '>=1.3.6'
  gem.add_development_dependency 'require_all'


end
