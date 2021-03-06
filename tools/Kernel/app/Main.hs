module Main where

--import Math.Combinatorics.Exact.Binomial
import Control.Monad
import Numeric (showHex)
import qualified Data.Text as T
import Text.Wrap
import Data.List (intercalate)

main :: IO ()
main = do
    putStr $ unlines
        [ "#include <fixed.h>"
        , ""
        , "// Epanechnikov kernels normalized to 1 in Q31 fixed point format."
        , ""
        , "using namespace fixed;"
        ]
    forM_ [1..31] $ \n -> do
        --let xs = map (fromIntegral . choose n) [0..n]
        let xs = map (epanechnikov n) [0..n]
            s = sum xs
        putStrLn $ decl n $ map (q31 . (/s)) xs
    putStrLn $ unlines $
        [ ""
        , "const q31_t *epanechnikov(unsigned n)"
        , "{"
        , "    switch (n)"
        , "    {"
        ] ++
        map f [1..31] ++
        [ "    default: return 0;"
        , "    }"
        , "}"
        ]
    where f n = "    case "
             <> show n
             <> ": return epanechnikov"
             <> show n
             <> ";"

epanechnikov :: Int -> Int -> Double
epanechnikov n i = 1 - x * x
    where x = 2 * (fromIntegral (i + 1) / fromIntegral (n + 2)) - 1

decl n xs = "\nconstexpr q31_t epanechnikov" <> show n <> "[" <> show (n + 1) <> "] = \n"
         <> "    { " <> ss <> "\n    };"
    where ss = intercalate "\n    , "
             $ map (intercalate ", " . words)
             $ lines
             $ T.unpack
             $ wrapText defaultWrapSettings 60
             $ T.pack 
             $ unwords $ map (\x -> "q31_t(" <> format x <> ")") xs
          format x = "0x" <> showHex x "" <> "l"

q31 :: Double -> Int
q31 = round . (*0x7fffffff)

