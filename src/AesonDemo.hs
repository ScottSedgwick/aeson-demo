{- |
Copyright: (c) 2020 Scott Sedgwick
SPDX-License-Identifier: MIT
Maintainer: Scott Sedgwick <scott.sedgwick@gmail.com>

See README for more info
-}
{-# LANGUAGE OverloadedStrings, DerivingStrategies #-}

module AesonDemo
  ( Person(..)
  ) where

import Control.Monad
import Data.Aeson 
import Data.Text (Text)

data Person = Person 
  { firstName  :: !Text
  , lastName   :: !Text
  , age        :: Int
  , likesPizza :: Bool
  } deriving stock Show

instance FromJSON Person where
 parseJSON (Object v) =
    Person <$> v .: "firstName"
           <*> v .: "lastName"
           <*> v .: "age"
           <*> v .: "likesPizza"
 parseJSON _ = mzero

instance ToJSON Person where
 toJSON (Person fn ln a lp) =
    object [ "firstName"  .= fn
           , "lastName"   .= ln
           , "age"        .= a
           , "likesPizza" .= lp
             ]
