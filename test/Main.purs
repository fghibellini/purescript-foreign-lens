module Test.Main where

import Prelude
import Effect (Effect)
import Effect.Class.Console (log)
import Foreign (Foreign, unsafeToForeign)
import Data.Foreign.Lens (string, prop, array)
import Data.Lens (Fold', sequenceOf_, traversed, to)

doc :: Foreign
doc = unsafeToForeign { paras: [ { word: "Hello" }, { word: "World" } ] }

-- | This `Fold'` extracts all words appearing in a structure like the one above.
words :: forall r. Monoid r => Fold' r Foreign String
words = prop "paras"
    <<< array
    <<< traversed
    <<< prop "word"
    <<< string

main :: Effect Unit
main = sequenceOf_ (words <<< to log) doc
