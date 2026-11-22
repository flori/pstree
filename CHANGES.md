# Changes

## 2026-11-19 v0.7.0

### Improvements
- Widen process ID padding in `PSTree` output from 5 to 7
  characters in the `to_s` method.

### Build & CI
- Bump `gem_hadar` development dependency floor to `>= 2.24.1`.

## 2026-01-02 v0.6.0

### Features
- Added `psoutput` method with memoization to cache `/bin/ps`
  command output.
- Improved performance by avoiding repeated system calls to
  `/bin/ps` during initialization.

### Build & CI
- Configured automated changelog generation in the Rakefile.
- Updated `gem_hadar` development dependency from **~> 2.1** to
  **>= 2.16.3**.

## 2025-08-19 v0.5.0

### Features

- Added full **GPL-2.0** license text to the repository and gem
  package.

### Improvements

- Expanded `README.md` with installation instructions for RubyGems and
  Bundler, system requirements, and programmatic usage examples.
- Added comprehensive YARD documentation for `PSTree` and
  `ProcStruct` classes, including method descriptions and
  parameters.

### Build & CI

- Excluded documentation artifacts and metadata files from gem
  packaging by updating `Rakefile` and `gemspec`.
- Updated `gem_hadar` development dependency from **1.17.1** to
  **2.1**.

## 2024-09-24 v0.4.0

### Features
- Support displaying the process tree for multiple PIDs by passing
  several PIDs as arguments to the `ruby-pstree` executable.
- Default to PID `0` if no PIDs are provided as arguments.

### Improvements
- Removed obsolete `pid` variable from `PSTree#initialize`.

### Build & CI
- Remove `simplecov` development dependency from `Rakefile` and
  gemspec.
- Update `gem_hadar` development dependency to `~> **1.17.1**`.
- Remove `.tool-versions` file specifying Ruby **3.2.3**.

### Documentation
- Add new `CHANGES.md` file with version history.

## 2024-03-15 v0.3.1

### Build & CI
- Updated the `homepage` to `https://github.com/flori/pstree` in the
  `Rakefile` and `pstree.gemspec`.
- Upgraded the `gem_hadar` development dependency to **~> 1.14.0** and
  simplified the dependency declaration logic in `pstree.gemspec`.
- Updated the Ruby version in `.tool-versions` from 3.0.4 to 3.2.3.
- Added a GitHub Actions workflow for CodeQL analysis in
  `.github/workflows/codeql-analysis.yml`.
- Updated `pstree.gemspec` to use `README.md` instead of `README.rdoc`
  and updated the file list.

### Documentation
- Updated the documentation source in `pstree.gemspec` from `README.rdoc`
  to `README.md`.

## 2019-04-15 v0.3.0

### Features
- Add support for UTF-8 tree characters, enabled by
  default, with ASCII as a fallback option.

### Fixes
- Correctly recurse into only the specified process subtree
  instead of scanning the entire process list.

### Improvements
- Update `README` from RDoc to Markdown format, adding a
  Usage section with example output.

### Build & CI
- Update `gem_hadar` development dependency to version
  **1.9.1**.
- Update `Rakefile` configuration to reference
  `README.md`.

## 2017-11-07 v0.2.0

### Features
- Added support for UTF-8 output and set it as the default.

### Improvements
- Refactored output rendering to use charset-specific helper methods.

### Fixes
- Fixed a syntax error when instantiating `ProcStruct` in Ruby 1.9.

## 2014-02-06 v0.1.0

### Improvements
- Switched logical operator `&&` to `and` in `lib/pstree.rb` for improved
  readability.

### Build & CI
- Updated `gem_hadar` dependency from `~> 0.3.1` to `~> 1.0.0`.

## 2013-05-15 v0.0.0

  * Start
