module Main where

import Data.List (sort, nub, intercalate)
import Data.List.Split (chunksOf)

main :: IO ()
main = do
    let xs = nub $ sort [ x / y | x <- [1..n], y <- [1..n] ]
        n = 20
    mapM_ putStrLn $ output "rational" xs

output :: String -> [Double] -> [String]
output name xs = decl : (map ("    "++) $ (zipWith g [0..] $ map f $ chunksOf 4 xs) ++ [ "};", "" ])
    where f = intercalate "," . map show
          g 0 s = "{ " ++ s
          g _ s = ", " ++ s
          decl = "static const float " ++ name ++ "[] ="

