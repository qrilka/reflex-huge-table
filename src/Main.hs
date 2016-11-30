{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
module Main where

import Control.Monad
import Data.String.Class
import Data.Text (Text)
import Reflex
import Reflex.Dom

main :: IO ()
main =
  mainWidget $ do
    clicked <- button "Go"
    void . widgetHold blank $ ffor clicked $ \_ -> do
      let colNames = ["a","b","c","d"]
      elClass "table" "table" $ do
        el "thead" . el "tr" $ forM_ colNames $ \n ->
            el "th" (text n)
        el "tbody" . forM_ table $ \Entry{..} -> do
          let cells = [a, b, toText $ show c, toText $ show d]
          el "tr" . forM_ cells $ \cell -> do
                el "td" (text cell)

data Entry = Entry
  { a :: Text
  , b :: Text
  , c :: Double
  , d :: Int
  }

table :: [Entry]
table = replicate 1000 Entry {a = "Some", b = "Text here", c = 1.23, d = 424242}
