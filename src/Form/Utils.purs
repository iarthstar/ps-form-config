module Form.Utils where

import Prelude

import Control.Monad.Except (runExcept)
import Data.Either (Either)
import Data.List.Types (NonEmptyList)
import Effect (Effect)
import Foreign (Foreign, ForeignError)
import Foreign.Class (class Decode, decode, encode)
import Inputs.Types (InputField)

foreign import _readFormConfig :: Effect Foreign

foreign import _writeFormConfig :: Foreign -> Effect Unit

runExceptDecode :: forall a. Decode a => Effect Foreign -> Effect (Either (NonEmptyList ForeignError) a)
runExceptDecode = map (runExcept <<< decode)

readFormConfig :: Effect (Either (NonEmptyList ForeignError) (Array InputField))
readFormConfig = runExceptDecode _readFormConfig

writeFormConfig :: Array InputField -> Effect Unit
writeFormConfig = _writeFormConfig <<< encode