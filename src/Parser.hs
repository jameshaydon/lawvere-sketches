module Parser where

import Protolude hiding (try)
import Text.Megaparsec
import qualified Text.Megaparsec.Char as Char
import qualified Text.Megaparsec.Char.Lexer as Lexer

type Parser = Parsec Void Text

spaceConsumer :: Parser ()
spaceConsumer = Lexer.space Char.space1 lineComment blockComment
  where
    lineComment = Lexer.skipLineComment "--"
    blockComment = Lexer.skipBlockComment "{-" "-}"

symbol :: Text -> Parser Text
symbol = Lexer.symbol spaceConsumer

lexeme :: Parser a -> Parser a
lexeme = Lexer.lexeme spaceConsumer

inside :: Text -> Text -> Parser a -> Parser a
inside b e = between (symbol b >> spaceConsumer) (spaceConsumer >> symbol e)

parensP :: Parser a -> Parser a
parensP = inside "(" ")"

bracesP :: Parser a -> Parser a
bracesP = inside "{" "}"

sqBracketsP :: Parser a -> Parser a
sqBracketsP = inside "[" "]"
