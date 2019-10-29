{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name =
    "foreign-lens"
, dependencies =
    [ "console", "effect", "foreign", "profunctor-lenses", "psci-support" ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs", "test/**/*.purs" ]
}
