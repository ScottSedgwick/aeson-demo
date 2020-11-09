{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import           AesonDemo 
import           Data.Aeson 
import qualified Data.ByteString.Lazy as BS

main :: IO ()
main = do
  bs <- BS.readFile "data/demo.json"
  case eitherDecode bs of
    (Left err) -> putStrLn ("Failure reading/parsing JSON file: " ++ err)
    (Right xs) -> do
      let ys = doSomething xs
      BS.writeFile "data/result.json" (encode ys)
  
doSomething :: [Person] -> [Person]
doSomething = id