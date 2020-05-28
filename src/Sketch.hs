module Sketch where

import Protolude

type Name = Text

type Object = [Name]

data Morphism
  = Morphism
      { name :: Name,
        nsource :: [Name],
        target :: [Name]
      }

data Sketch
  = Sketch
      { objects :: [Name],
        morphisms :: [Morphism]
      }

data OMapping = OMapping Name Object

data MMapping = MMapping Name Name

data CartFunc
  = CartFunc
      { objectMapping :: [OMapping],
        mprhimsMapping :: [MMapping]
      }
