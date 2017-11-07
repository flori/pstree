# -*- encoding: utf-8 -*-
# stub: pstree 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "pstree".freeze
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Florian Frank".freeze]
  s.date = "2017-11-07"
  s.description = "This library uses the output of the ps command to creaste process tree data structure for the current host.".freeze
  s.email = "flori@ping.de".freeze
  s.executables = ["ruby-pstree".freeze]
  s.extra_rdoc_files = ["README.rdoc".freeze, "lib/pstree.rb".freeze, "lib/pstree/version.rb".freeze]
  s.files = [".gitignore".freeze, "Gemfile".freeze, "README.rdoc".freeze, "Rakefile".freeze, "VERSION".freeze, "bin/ruby-pstree".freeze, "lib/pstree.rb".freeze, "lib/pstree/version.rb".freeze, "pstree.gemspec".freeze]
  s.homepage = "http://flori.github.com/pstree".freeze
  s.licenses = ["GPL-2".freeze]
  s.rdoc_options = ["--title".freeze, "Pstree - Ruby library that builds a process tree of this host".freeze, "--main".freeze, "README.rdoc".freeze]
  s.rubygems_version = "2.6.13".freeze
  s.summary = "Ruby library that builds a process tree of this host".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<gem_hadar>.freeze, ["~> 1.9.1"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
    else
      s.add_dependency(%q<gem_hadar>.freeze, ["~> 1.9.1"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<gem_hadar>.freeze, ["~> 1.9.1"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end
