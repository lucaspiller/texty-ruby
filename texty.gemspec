# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "texty/version"

Gem::Specification.new do |s|
  s.name        = "texty"
  s.version     = Texty::Ruby::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Luca Spiller"]
  s.email       = ["luca@stackednotion.com"]
  s.homepage    = ""
  s.summary     = %q{A Ruby interface to the Texty app}
  s.description = %q{A Ruby interface to the Texty app}

  s.rubyforge_project = "texty"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency("rspec", "~> 2.5")
end
