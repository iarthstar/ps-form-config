module Inputs.Types where

import Prelude

import Control.Alt ((<|>))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe)
import Data.Newtype (class Newtype)
import Foreign.Class (class Decode, class Encode, decode, encode)
import Foreign.Generic (defaultOptions, genericDecode, genericEncode)


-- | Input Field Types
-- | 
-- | FYI : Maybe means Optional

data InputField
  = Text TextField
  | Select SelectField
  -- | Switch SwitchField
  -- | Checkbox CheckboxField
  -- | Radio RadioField
derive instance genericInputField :: Generic InputField _
instance showInputField :: Show InputField where show = genericShow 
instance decodeInputField :: Decode InputField where 
  decode str = (Select <$> (decode str)) <|> (Text <$> (decode str))
instance encodeInputField :: Encode InputField where 
  encode = case _ of
    Text a -> encode a
    Select a -> encode a

newtype TextField = TextField
  { name        :: String
  , required    :: Boolean

  -- Optional values for TextField
  , label       :: Maybe String
  , error       :: Maybe Boolean
  , type        :: Maybe String
  , helpText    :: Maybe String
  , errorText   :: Maybe String
  , placeHolder :: Maybe String
  -- , pattern     :: Maybe RegExp
  , disabled    :: Maybe Boolean
  }
derive instance newtypeTextField :: Newtype TextField _
derive instance genericTextField :: Generic TextField _
instance showTextField :: Show TextField where show = genericShow
instance decodeTextField :: Decode TextField where decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })
instance encodeTextField :: Encode TextField where encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

newtype SelectField = SelectField
  { name        :: String
  , options     :: Array Option
  , required    :: Boolean

  -- Optional values for SelectField
  , label       :: Maybe String
  , error       :: Maybe Boolean
  , multiple    :: Maybe Boolean
  , helpText    :: Maybe String
  , errorText   :: Maybe String
  , placeHolder :: Maybe String
  , disabled    :: Maybe Boolean
  }
derive instance newtypeSelectField :: Newtype SelectField _
derive instance genericSelectField :: Generic SelectField _
instance showSelectField :: Show SelectField where show = genericShow
instance decodeSelectField :: Decode SelectField where decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })
instance encodeSelectField :: Encode SelectField where encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

-- | Helper Types
newtype Option = Option
  { label :: String
  , value :: String
  }
derive instance newtypeOption :: Newtype Option _
derive instance genericOption :: Generic Option _
instance showOption :: Show Option where show = genericShow
instance decodeOption :: Decode Option where decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })
instance encodeOption :: Encode Option where encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })