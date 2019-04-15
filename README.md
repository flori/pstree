# PSTree - Process Status Tree for UNIX in Ruby

## Description

This library can be used to create and display a process status tree as a Ruby
datastructure.

## Installation

Install the gem by typing

# gem install pstree

## Usage

You can display a simple process tree by executing the ruby-pstree script.

```
$ ruby-pstree $$
34223 -bash (flori)
└─ 37124 ruby /Users/flori/.rvm/gems/ruby-2.6.2/bin/ruby-pstree 34223 (flori)
   └─ 37129 /bin/ps axww -o ppid,pid,user,command (root)
```

## Download

The homepage of this library is located at

* http://flori.github.com/pstree

## Author

Florian Frank <flori@ping.de>

## License

This is free software; you can redistribute it and/or modify it under the
terms of the GNU General Public License Version 2 as published by the Free
Software Foundation: www.gnu.org/copyleft/gpl.html
