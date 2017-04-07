module Data.Text.Human
    ( HumanText (..)
    ) where

import Data.Either (Either (..))
import Data.Text (Text)

-- | An entirely unprincipled class for things which can be converted to text
-- that might be suitable to show to a human user. The output should probably
-- not include Haskell or JSON or any other nerd shit.
class HumanText a where

    humanText :: a -> Text

instance (HumanText a, HumanText b) => HumanText (Either a b) where
    humanText (Left  a) = humanText a
    humanText (Right b) = humanText b
