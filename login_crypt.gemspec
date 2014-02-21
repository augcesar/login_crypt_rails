# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'login_crypt/version'

Gem::Specification.new do |spec|
  spec.name          = "login_crypt"
  spec.version       = LoginCrypt::VERSION
  spec.authors       = ["Augusto César"]
  spec.email         = ["augcesar.sa@gmail.com"]
  spec.description   = %q{HTTP::LoginCrypt}
  spec.summary       = %q{Conexões HTTP estão sujeitas as interceptações e código da login crypt se encarrega de embaralhar os valores passados no login}
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.rubyforge_project = "login_crypt"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
