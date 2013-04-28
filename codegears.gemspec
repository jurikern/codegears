# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)

require "cg/version"

Gem::Specification.new do |s|
  s.name          = "codegears"
  s.version       = CG::VERSION
  s.authors       = ["Juri Semjonov"]
  s.email         = ["js@codegears.co"]
  s.description   = %q{CodeGears platform for Rails}
  s.summary       = %q{CodeGears platform for Rails}
  s.homepage      = "https://github.com/Semjonow/codegears"
  s.license       = "MIT"

  s.files = Dir["{lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails"
  s.add_dependency "jquery-rails"
  s.add_dependency "httparty"
end
