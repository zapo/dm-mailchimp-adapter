# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dm-mailchimp-adapter/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["NIEK Antoine"]
  gem.email         = ["antoineniek@gmail.com"]
  gem.description   = %q{Simple datamapper adapter for mailchimp API}
  gem.summary       = %q{Simple datamapper adapter for mailchimp API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dm-mailchimp-adapter"
  gem.require_paths = ["lib"]
  gem.version       = Mailchimp::VERSION
  
  gem.add_runtime_dependency "dm-core", "~> 1.1.0"
  gem.add_runtime_dependency "dm-types","~> 1.1.0"
  gem.add_runtime_dependency "dm-validations","~> 1.1.0"
  gem.add_runtime_dependency "hominid"
end
