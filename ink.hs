module Main where

import System.IO
import System.Environment
import Control.Monad

-- needed for toUpper need to get ride of this asap
import Data.Char

cap1 :: String -> String
cap1 = map toUpper


main :: IO ()

version = "0.1"
splash = "\
\.___ _______   ____  __.\n\
\|   |\\      \\ |    |/ _|\n\
\|   |/   |   \\|      <\n\  
\|   /    |    \\    |  \\\n\ 
\|___\\____|__  /____|__ \\\n\
\            \\/        \\/\n"

                    



prompt :: (String -> String) -> Bool -> IO ()
prompt f isSecret = do
    when (isSecret) $ hSetEcho stdin False
    putStrLn splash
    putStrLn ("Welcome to ink " ++ version)
    putStr "prompt> " -- doesn't work as excepted. It is only printed once
    hFlush stdout
    interact f

secretArg = "--secret" --option should be also set at runtime
hasSecretArg :: [String] -> Bool
hasSecretArg = elem secretArg 


interpreter = cap1

main = do
    args <- getArgs
    let secret =  hasSecretArg args
    prompt interpreter secret
