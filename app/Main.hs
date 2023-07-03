module Main where

import PoHttpExample (name)

main :: IO ()
main = putStrLn ("Hello " <> name)
