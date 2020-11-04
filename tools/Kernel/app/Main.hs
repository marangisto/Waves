module Main where

import Math.Combinatorics.Exact.Binomial
import Control.Monad
import Numeric (showHex)
import qualified Data.Text as T
import Text.Wrap
import Data.List (intercalate)

main :: IO ()
main = forM_ [1..31] $ \n -> do
    let xs = map (choose n) [0..n]
        s = sum xs
    putStrLn $ decl n $ map (q31 . (/ fromIntegral s) . fromIntegral) xs

decl n xs = "\nconstexpr q31t gauss_kernel_" <> show n <> "[" <> show (n + 1) <> "] = \n"
         <> "    { " <> ss <> "\n    };"
    where ss = intercalate "\n    , "
             $ map (intercalate ", " . words)
             $ lines
             $ T.unpack
             $ wrapText defaultWrapSettings 60
             $ T.pack 
             $ unwords $ map (\x -> "q31_t(" <> format x <> ")") xs
          format x = "0x" <> showHex x ""

q31 :: Double -> Int
q31 = round . (*0x7fffffff)

