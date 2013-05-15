# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "pstree"
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Florian Frank"]
  s.date = "2013-05-15"
  s.description = "This library uses the output of the ps command to creaste process tree data structure for the current host."
  s.email = "flori@ping.de"
  s.executables = ["ruby-pstree"]
  s.extra_rdoc_files = ["README.rdoc", "lib/pstree.rb", "lib/pstree/version.rb"]
  s.files = [".gitignore", "Gemfile", "README.rdoc", "Rakefile", "VERSION", "bin/ruby-pstree", "lib/pstree.rb", "lib/pstree/version.rb", "pstree.gemspec"]
  s.homepage = "http://flori.github.com/pstree"
  s.licenses = ["GPL-2"]
  s.rdoc_options = ["--title", "Pstree - Ruby library that builds a process tree of this host", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Ruby library that builds a process tree of this host"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<gem_hadar>, ["~> 0.3.1"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<gem_hadar>, ["~> 0.3.1"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<gem_hadar>, ["~> 0.3.1"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end
