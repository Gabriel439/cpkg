# cpkg

[![Build Status](https://travis-ci.org/vmchale/cpkg.svg?branch=master)](https://travis-ci.org/vmchale/cpkg)
[![Windows build status](https://ci.appveyor.com/api/projects/status/github/vmchale/cpkg?svg=true)](https://ci.appveyor.com/project/vmchale/cpkg)

cpkg is a package manager for C.
It is configured using
[Dhall](http://github.com/dhall-lang/dhall-haskell).

By considering a package to be a *function* taking a `cpkg`-supplied
installation directory to a series of instructions, we can effectively package
C projects with diverse build systems and handle dependencies between them.

The goal is to eventually provide something like `cabal new-install` for C, but
with better support for cross-compilation.

- [Installation](#installation)
  - [Shell Completions](#shell-completions)
- [Example](#example)
  - [Configuration](#configuration)
  - [Dhall Prelude](#dhall-prelude)
- [Security](#security)
- [Contents](#contents)

## Installation

```
cabal new-install cpkg
```

### Shell Completions

Add the following to your `~/.bashrc` for shell completions:

```
eval "$(cpkg --bash-completion-script cpkg)"
```

## Example

To install `tar`:

```
cpkg install tar
```

### Configuration

Here is the configuration for Valgrind:

```dhall
let prelude = https://raw.githubusercontent.com/vmchale/cpkg/master/dhall/cpkg-prelude.dhall
in

let types = https://raw.githubusercontent.com/vmchale/cpkg/master/dhall/cpkg-types.dhall
in

let valgrind =
  let valgrindConfigure =
    λ(cfg : types.ConfigureVars) →
      prelude.defaultConfigure cfg # [ prelude.mkExe "auxprogs/make_or_upd_vgversion_h" ]
  in

  λ(v : List Natural) →
    prelude.simplePackage { name = "valgrind", version = v } ⫽
      { pkgUrl = "http://www.valgrind.org/downloads/valgrind-${prelude.showVersion v}.tar.bz2"
      , configureCommand = valgrindConfigure
      , installCommand = prelude.installWithBinaries [ "bin/valgrind" ]
      }
in

valgrind [3,14,0]
```

### Dhall Prelude

There is
a [prelude](https://github.com/vmchale/cpkg/blob/master/dhall/cpkg-prelude.dhall)
available containing functions which simplify the process of writing package
descriptions. As an example, we can install `sed`

```dhall
let prelude = https://raw.githubusercontent.com/vmchale/cpkg/master/dhall/cpkg-prelude.dhall
in

let sed =
  λ(v : List Natural) →
    prelude.makeGnuExe { name = "sed", version = v }
in

sed [4,5]
```

## Security

This tool is insecure.

## Contents

Lovingly provided by [polyglot](https://github.com/vmchale/polyglot):

```
-------------------------------------------------------------------------------
 Language             Files       Lines         Code     Comments       Blanks
-------------------------------------------------------------------------------
 Bash                     1           4            4            0            0
 Cabal                    1         119          109            0           10
 Cabal Project            1           2            2            0            0
 Dhall                    3        1115          975            0          140
 Haskell                 22        1121          894           24          203
 Markdown                 4         220          188            0           32
 YAML                     4         156          141            0           15
-------------------------------------------------------------------------------
 Total                   36        2737         2313           24          400
-------------------------------------------------------------------------------
```
