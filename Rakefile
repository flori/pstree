# vim: set filetype=ruby et sw=2 ts=2:

require 'gem_hadar'

GemHadar do
  name        'pstree'
  path_module 'PSTree'
  module_type 'class'
  author      'Florian Frank'
  email       'flori@ping.de'
  homepage    "https://github.com/flori/#{name}"
  summary     'Ruby library that builds a process tree of this host'
  description 'This library uses the output of the ps command to creaste process tree data structure for the current host.'
  licenses    << 'GPL-2'
  test_dir    'tests'
  ignore      '.*.sw[pon]', 'pkg', 'Gemfile.lock', '.rvmrc', 'coverage'
  readme      'README.md'
  executables << 'ruby-pstree'

  development_dependency 'simplecov'
end
