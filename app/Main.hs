module Main where

import qualified HsBlog

main :: IO ()
main = HsBlog.main

pInputDir :: Parser FilePath
pInputDir =
  strOption
    ( long "input"
      <> short 'i'
      <> metavar "DIRECTORY"
      <> help "Input directory"
    )

pOutputDir :: Parser FilePath
pOutputDir =
  strOption
    ( long "output"
      <> short 'o'
      <> metavar "DIRECTORY"
      <> help "Output directory"
    )

pConvertDir :: Parser Options
pConvertDir =
  ConvertDir <$> pInputDir <*> pOutputDir
