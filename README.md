# PSTree - Process Status Tree for UNIX in Ruby

## Description

This library provides a Ruby implementation of the `pstree` utility, enabling
developers to visualize process hierarchies as tree structures. It parses
system process information and presents it in an easily readable format with
proper indentation and Unicode/ASCII tree characters.

The library can be used both programmatically as a data structure and through
its command-line interface for quick process tree visualization.

## Installation

### RubyGems

Install the latest version from RubyGems.org:

```bash
gem install pstree
```

### Bundler

Add to your Gemfile:
```ruby
gem 'pstree'
```

Then run:
```bash
bundle install
```

## Requirements
- Ruby 2.0 or higher
- UNIX-like operating system (Linux, macOS, BSD)
- `/bin/ps` utility available in PATH

## Usage

You can display a simple process tree by executing the ruby-pstree script.

```
$ ruby-pstree $$
34223 -bash (flori)
└─ 37124 ruby /Users/flori/.rvm/gems/ruby-2.6.2/bin/ruby-pstree 34223 (flori)
   └─ 37129 /bin/ps axww -o ppid,pid,user,command (root)
```

### Programmatic Usage

Access process information programmatically:

```ruby
require 'pstree'

# Create a process tree for PID 1 (init)
tree = PSTree.new(1)

# Iterate over processes in the tree
tree.each do |process|
  puts "#{process.pid}: #{process.cmd}"
end

# Or get the tree as a string
puts tree.to_s

# Navigate the tree to find the pids of your favourite processes
pid_of_shell_parent_of_irb = tree.find { it.cmd =~ /irb/ }&.ppid
```

## Download

The homepage of this library is located at

* https://github.com/flori/pstree

## Author

[Florian Frank](mailto:flori@ping.de)

## License

[GPLv2 License](./LICENSE)
