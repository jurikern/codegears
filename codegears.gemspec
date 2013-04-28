# coding: utf-8
$:.unshift File.expand_path("../lib/", __FILE__)

require "cg/version"

Gem::Specification.new do |gem|
  gem.name               = "codegears"
  gem.version            = CG::VERSION
  gem.authors            = ["Juri Semjonov"]
  gem.email              = ["js@codegears.co"]
  gem.description        = %q{Client library and CLI to manage apps on CodeGears}
  gem.summary            = %q{Client library and command-line tool to manage apps on CodeGears}
  gem.homepage           = "https://github.com/Semjonow/codegears"
  gem.license            = "MIT"
  gem.executables        << "cg"
  gem.default_executable = "cg"

  gem.files = %x{ git ls-files }.split("\n").select { |d| d =~ %r{^(LICENSE|README|bin/|lib/|)} }

  gem.add_dependency "rails"
  gem.add_dependency "jquery-rails"
  gem.add_dependency "httparty"
end
