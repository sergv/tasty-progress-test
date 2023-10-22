-- |
-- Module:     TestMain
-- Copyright:  (c) Sergey Vinokurov 2023
-- License:    Apache-2.0 (see LICENSE)
-- Maintainer: serg.foo@gmail.com

module TestMain (main) where

import Data.List qualified as L
import System.Exit
import System.IO

import Test.Tasty
import Test.Tasty.QuickCheck qualified as QC

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = localOption (QC.QuickCheckTests 100000) $ testGroup "QuickCheck"
  [ QC.testProperty "sort == sort . reverse" $
      \list -> L.sort (list :: [Int]) == L.sort (reverse list)
  , QC.testProperty "Fermat's little theorem" $
      \x -> ((x :: Integer)^7 - x) `mod` 7 == 0
  ]
