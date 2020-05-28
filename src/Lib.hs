module Lib () where

import Protolude

class DomC a where
  lit :: Int -> a
  lam :: (a -> a) -> a
  plus :: a -> a -> a
  err :: a

instance DomC (Int -> Text) where
  lit i = const ("lit_" <> show i)
  err = const "error"
  plus x y level = "(" <> x level <> " + " <> y level <> ")"
  lam f level = "λ" <> f (show . (subtract level)) (level + 1)

example :: (DomC a) => a
example = lam $ \x -> plus x $ lam $ \y -> plus x (lam $ \z -> plus (plus x (plus y y)) z)

foo :: Int -> Text
foo = example
--

-- data Dom a
--   = Lit Int
--   | Lam (a -> a)
--   | Plus a a
--   | Err

-- pret :: Dom -> Int -> Text
-- pret d = case d of
--   Lit i -> const ("lit_" <> show i)
--   Err -> const "error"
--   Lam f -> _ -- f (show . (+ 1))
--   Plus x y -> \level -> x level <> " + " <> y level
