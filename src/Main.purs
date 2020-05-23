module Main where

import Prelude

import Data.Either (Either(..))
import Foreign (Foreign)
import Foreign.Generic (encode)
import Form.Utils (readFormConfig, writeFormConfig)

validateConfig :: Foreign -> Foreign
validateConfig = readFormConfig >>> case _ of
    Left err -> encode "{}"
    Right fc -> writeFormConfig fc
