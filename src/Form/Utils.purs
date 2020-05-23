module Form.Utils where

import Prelude

import Control.Monad.Except (runExcept)
import Data.Either (Either)
import Data.List.Types (NonEmptyList)
import Foreign (Foreign, ForeignError)
import Foreign.Class (class Decode, decode, encode)
import Inputs.Types (InputField)

foreign import _readFormConfig :: Foreign -> Foreign

foreign import _writeFormConfig :: Foreign -> Foreign

runExceptDecode :: forall a. Decode a => Foreign -> Either (NonEmptyList ForeignError) a
runExceptDecode = runExcept <<< decode

readFormConfig :: Foreign -> (Either (NonEmptyList ForeignError) (Array InputField))
readFormConfig = runExceptDecode <<< _readFormConfig

writeFormConfig :: Array InputField -> Foreign
writeFormConfig = _writeFormConfig <<< encode