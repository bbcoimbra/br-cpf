# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "br/cpf/version"

Gem::Specification.new do |s|
  s.name        = "br-cpf"
  s.version     = BR::CPF::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Bruno Coimbra"]
  s.email       = ["bbcoimbra@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Lib implemented in C that calculates and validates CPF using FFI.}
  s.description = %q{}

  s.add_dependency(%q<ffi>, ["~> 1.12.2"])

  s.add_development_dependency(%q<rspec>, ["~> 3.9"])

  s.extensions    = `git ls-files -- ext/*`.split("\n").select{|f| f =~ /extconf/}
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
