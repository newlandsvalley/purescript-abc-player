{-
Welcome to your new Dhall package-set!

Below are instructions for how to edit this file for most use
cases, so that you don't need to know Dhall to use it.

## Warning: Don't Move This Top-Level Comment!

Due to how `dhall format` currently works, this comment's
instructions cannot appear near corresponding sections below
because `dhall format` will delete the comment. However,
it will not delete a top-level comment like this one.

## Use Cases

Most will want to do one or both of these options:
1. Override/Patch a package's dependency
2. Add a package not already in the default package set

This file will continue to work whether you use one or both options.
Instructions for each option are explained below.

### Overriding/Patching a package

Purpose:
- Change a package's dependency to a newer/older release than the
    default package set's release
- Use your own modified version of some dependency that may
    include new API, changed API, removed API by
    using your custom git repo of the library rather than
    the package set's repo

Syntax:
where `entityName` is one of the following:
- dependencies
- repo
- version
-------------------------------
let upstream = --
in  upstream
  with packageName.entityName = "new value"
-------------------------------

Example:
-------------------------------
let upstream = --
in  upstream
  with halogen.version = "master"
  with halogen.repo = "https://example.com/path/to/git/repo.git"

  with halogen-vdom.version = "v4.0.0"
-------------------------------

### Additions

Purpose:
- Add packages that aren't already included in the default package set

Syntax:
where `<version>` is:
- a tag (i.e. "v4.0.0")
- a branch (i.e. "master")
- commit hash (i.e. "701f3e44aafb1a6459281714858fadf2c4c2a977")
-------------------------------
let upstream = --
in  upstream
  with new-package-name =
    { dependencies =
       [ "dependency1"
       , "dependency2"
       ]
    , repo =
       "https://example.com/path/to/git/repo.git"
    , version =
        "<version>"
    }
-------------------------------

Example:
-------------------------------
let upstream = --
in  upstream
  with benchotron =
      { dependencies =
          [ "arrays"
          , "exists"
          , "profunctor"
          , "strings"
          , "quickcheck"
          , "lcg"
          , "transformers"
          , "foldable-traversable"
          , "exceptions"
          , "node-fs"
          , "node-buffer"
          , "node-readline"
          , "datetime"
          , "now"
          ]
      , repo =
          "https://github.com/hdgarrood/purescript-benchotron.git"
      , version =
          "v7.0.0"
      }
-------------------------------
-}

let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.13.8-20201204/packages.dhall sha256:89f184cea1ca40630ea34fb68972589b8eedf4809275686aef85f86abaa2145f

in  upstream
  with abc-melody =
     { dependencies =
         [ "abc-parser"
         , "effect"
         , "prelude"
         , "soundfonts"
         ]
     , repo =
         "https://github.com/newlandsvalley/purescript-abc-melody.git"
     , version =
         "master"
     }
  with abc-parser =
     { dependencies =
        [ "bifunctors"
        , "effect"
        , "either"
        , "foldable-traversable"
        , "generics-rep"
        , "maybe"
        , "midi"
        , "ordered-collections"
        , "rationals"
        , "strings"
        , "stringutils"
        , "string-parsers"
        , "transformers"
        , "tuples"
        ]
    , repo =
        "https://github.com/newlandsvalley/purescript-abc-parser.git"
    , version =
        "v1.8.0"
    }
  with abc-scores =
     { dependencies =
         [ "abc-parser"
         , "console"
         , "effect"
         , "prelude"
         ]
     , repo =
         "https://github.com/newlandsvalley/purescript-abc-scores.git"
     , version =
         "v0.4.1"
     }
   with halogen-components =
     { dependencies =
         [ "console"
         , "css"
         , "effect"
         , "js-fileio"
         , "halogen"
         , "halogen-css"
         , "soundfonts"
         ]
     , repo =
         "https://github.com/newlandsvalley/purescript-halogen-components.git"
     , version =
         "master"
     }
   with js-fileio =
     { dependencies =
         [ "aff"
         , "effect"
         , "prelude"
         ]
     , repo =
         "https://github.com/newlandsvalley/purescript-js-fileio.git"
     , version =
         "2.0.3"
     }