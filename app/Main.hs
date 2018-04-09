module Main where

import Lib
import System.IO
import System.Environment
import Data.Char
main :: IO ()
main = do
                args <- getArgs
                case args of
                    [m,k] -> case m of
                         "-d" -> con
                         "-e" -> con
                         _ -> print "Wrong mode"
                         where 
                         con =  do  
                              print "Enter message"
                              input <- getLine
                              case m of
                                  "-e" -> print $ f (cycle (map toUpper k))  $ words   $ map toUpper input
                                  where     
                                               f k []=[]
                                               f k  (x:xs)=zipWith  g x (take (length x) k) : f (drop (length x) k) xs 
                                                    where 
                                                        g x y= chr $ (+ 65) $ flip mod (ord 'A') (ord x + ord y)
                    _ -> print  "Wrong pattern"
                    