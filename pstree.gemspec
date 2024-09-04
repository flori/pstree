# -*- encoding: utf-8 -*-
# stub: pstree 0.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "pstree".freeze
  s.version = "0.3.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Florian Frank".freeze]
  s.date = "2024-09-04"
  s.description = "This library uses the output of the ps command to creaste process tree data structure for the current host.".freeze
  s.email = "flori@ping.de".freeze
  s.executables = ["ruby-pstree".freeze]
  s.extra_rdoc_files = ["README.md".freeze, "lib/pstree.rb".freeze, "lib/pstree/version.rb".freeze]
  s.files = [".github/workflows/codeql-analysis.yml".freeze, ".gitignore".freeze, "Gemfile".freeze, "README.md".freeze, "Rakefile".freeze, "VERSION".freeze, "bin/ruby-pstree".freeze, "lib/pstree.rb".freeze, "lib/pstree/version.rb".freeze, "pstree.gemspec".freeze]
  s.homepage = "https://github.com/flori/pstree".freeze
  s.licenses = ["GPL-2".freeze]
  s.rdoc_options = ["--title".freeze, "Pstree - Ruby library that builds a process tree of this host".freeze, "--main".freeze, "README.md".freeze]
  s.rubygems_version = "3.5.16".freeze
  s.summary = "Ruby library that builds a process tree of this host".freeze

  s.specification_version = 4

  s.add_development_dependency(%q<gem_hadar>.freeze, ["~> 1.17.0".freeze])
end
