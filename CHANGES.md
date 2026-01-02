# Changes

## 2026-01-02 v0.6.0

- Added caching mechanism for `/bin/ps` command output using the `psoutput`
  method with `@psoutput ||= ...` memoization pattern
- Maintained backward compatibility while improving performance by avoiding
  repeated system calls
- Introduced automated changelog generation configuration in the Rakefile with
  `changelog` block setting `filename` to `'CHANGES.md'`
- Updated gem dependencies including `rubygems_version` from **3.6.9** to
  **4.0.2** and `gem_hadar` development dependency from **~> 2.1** to **>=
  2.16.3**
- Enabled proper changelog handling during gem packaging and release workflows

## 2025-08-19 v0.5.0

- **Documentation**: Comprehensive YARD documentation added to all classes and
  methods, with improved README containing installation instructions and usage
  examples
- **Licensing**: Full GPL-2.0 license file included in gem package
- **Packaging**: Refined gemspec and Rakefile configurations to exclude
  unnecessary files

## 2024-09-24 v0.4.0

+ Supports display of forrest now if more than one `PID` was given as arguments.
+ Removed obsolete variable `code`.
+ Update dependencies and version information:
    - Remove `simplecov` development dependency
    - Update `gem_hadar` development dependency to `~> **1.17.1**`
    - Removed ruby **3.2.3** from `.tool-versions` file

## 2024-03-15 v0.3.1

* **Changes for version **1.0**:
  + Use `github` as homepage.
  + Create `codeql-analysis.yml`.
  + Update `gemspec`.
  + Configure `asdf`.

## 2019-04-15 v0.3.0

* Convert `rdoc README` to markdown
* Only recurse into this one subtree correctly
* Merge changes from `github.com:flori/pstree`
  + Support UTF-8 output and use it by default (default encoding changed to **UTF-8**)
  + Update code to use new default encoding (**UTF-8**)

## 2017-11-07 v0.2.0

* **Support UTF-8 output and use it by default**
  + Added support for UTF-8 output
  + Changed default output encoding to UTF-8
* **Cleanup code**
  + Improved code organization and structure
* **stop ruby 1.9 from whining**
  + Updated code to be compatible with Ruby 1.9

## 2014-02-06 v0.1.0

* **Bumped gem_hadar dependency**:
  + Updated `gem_hadar` dependency to use the latest version
* **Dependency on new version of gem_hadar**:
  + Updated `gem_hadar` dependency to use a new version (**1.0.0**)
* **Cleanup code**:
  + Improved code organization and readability
* **Fix stupid ruby warning**:
  + Resolved a Ruby warning issue

## 2013-05-15 v0.0.0

  * Start
