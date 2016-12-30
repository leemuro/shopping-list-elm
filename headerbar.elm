module HeaderBar exposing (headerBar)

import List
import Html exposing (Html, div, button, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import AppMessages

import AppCss
import Html.CssHelpers
{ id, class, classList } = Html.CssHelpers.withNamespace "sl"

headerBar =
  div [ class [ AppCss.HeaderBar ] ]
    [ div [ ] []
    , div [ class [ AppCss.HeaderBarCenter ] ] [ text "Shopping List" ]
    , div [ class [ AppCss.HeaderBarRight ] ] [ addButton ]
    ]

addButton =
  button [ class [ AppCss.HeaderBarAdd ], onClick AppMessages.ToggleAddPanel ] [ text "+" ]
