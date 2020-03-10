{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.List (partition)
import Data.Text (Text)
import qualified Data.Text as T

main :: IO ()
main = do
  print "input the level: "
  level <- getLine
  contents <- readFile "./temp"

  let (i, o) = chunk (T.pack contents)
  -- Write the files to the current directory as <level>.in and <level>.out
  writeFile (level ++ ".in") (T.unpack i)
  writeFile (level ++ ".out") (T.unpack o)
  putStrLn "\n done"

chunk :: Text -> (Text, Text)
chunk text = uncurry (clean allPrefixes)
           $ partition (hasPrefix inputPrefixes) textLines

  where textLines = T.lines text
        inputPrefixes = ["jshell> ", "   ...> "]
        allPrefixes = inputPrefixes ++ ["$.. ==>"]

hasPrefix :: [Text] -> Text -> Bool
hasPrefix prefixes text = foldl (\t prefix -> t && T.isPrefixOf prefix text) True prefixes

clean :: [Text] -- separators
      -> [Text] -> [Text] -- separated text
      -> (Text, Text) -- cleaned text
clean separators i o = both (T.intercalate "\n" . fmap (stripAll separators) ) (i, o)
  where both f (x, y) = (f x, f y)

stripAll :: [Text] -- separators
         -> Text
         -> Text
stripAll prefixes txt = foldl f txt $ (flip T.stripPrefix txt) <$> prefixes
  where f _ (Just txt) = txt
        f txt _ = txt
