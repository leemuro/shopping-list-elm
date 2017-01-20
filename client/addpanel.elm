module AddPanel exposing (addPanel)

import List
import Html exposing (Html, div, textarea, button, text)
import Html.Attributes exposing (value, placeholder)
import Html.Events exposing (onClick, onInput)
import AppMessages

import AppCss
import Html.CssHelpers
{ id, class, classList } = Html.CssHelpers.withNamespace "sl"

addPanel newItems =
  textarea 
    [ id "addBox"
    , class [ AppCss.AddBox ]
    , onInput AppMessages.NewItems
    , value newItems
    , placeholder "Type to add multiple items using one item per line." 
    ] 
    []
