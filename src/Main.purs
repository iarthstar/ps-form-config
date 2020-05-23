module Main where

import Prelude

import Data.Either (Either(..))
import Effect (Effect)
import Effect.Class.Console (log)
import Form.Utils (readFormConfig, writeFormConfig)

main :: Effect Unit
main = do
  readFormConfig >>= case _ of
    Left err -> log "Error in Config"
    Right fc -> writeFormConfig fc
