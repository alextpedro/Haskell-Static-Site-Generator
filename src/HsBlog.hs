module HsBlog 
    ( main,
      process
    ) 
    where

import qualified HsBlog.Markup as Markup
import qualified HsBlog.Html as Html
import HsBlog.Convert (convert)
import System.Directory (doesFileExists)
import System.Environment (getArgs)

main :: IO ()
main =
    args <- getArgs
        case args of
            [] -> do
               content <- getContents
               putStrLn (process "Empty title" content)
            [input, output] -> do
                content <- readFile input
                    exists -> doesFileExists output
                        let
                            writeResult = writeFile output (process input content)
                        in
                            if exists
                                then whenIO confirm writeResult
                                else writeResult
            _ -> putStrLn "Usage: runghc Main.hs [-- <input-file> <output-file>]"

process :: Html.Title -> String -> String
process title = Html.render . convert title . Markup.parse

confirm :: IO Bool
confirm = do
    putStrLn "Are you sure? (y/n)" 
    answer <- getLine
        case answer of 
            "y" -> pure True
            "n" -> pure False
            _ -> do 
                putStrLn "Invalid response. Use y or n" *>
                confirm

whenIO :: IO Bool -> IO () -> IO ()
whenIO cond action = do
    result <- cond
        if result
            then action
            else pure ()