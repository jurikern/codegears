# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)

require "codegears/version"

Gem::Specification.new do |s|
  s.name          = "codegears"
  s.version       = Codegears::VERSION
  s.authors       = ["Juri Semjonov"]
  s.email         = ["js@codegears.co"]
  s.description   = %q{Codegears platform for Rails}
  s.summary       = %q{Codegears platform for Rails}
  s.homepage      = "https://github.com/Semjonow/codegears"
  s.license       = "MIT"

  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails"
  s.add_dependency "jquery-rails"
  s.add_dependency "httparty"
end
