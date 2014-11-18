# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-dash/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Aren Patel"]
  gem.email         = ["aren55555@users.noreply.github.com"]
  gem.description   = %q{OmniAuth strategy for Dash.}
  gem.summary       = %q{OmniAuth strategy for Dash.}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-dash"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Dash::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.0'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end