module HeaderBar exposing (headerBar)

import List
import Html exposing (Html, div, span, button, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import AppMessages

import AppCss
import Html.CssHelpers
{ id, class, classList } = Html.CssHelpers.withNamespace "sl"

headerBar isAddMode =
  div [ class [ AppCss.HeaderBar ] ]
    [ div [ class [ AppCss.HeaderBarItem ] ] 
      [ if isAddMode then cancelButton else clearButton ]
    , div [ class [ AppCss.HeaderBarItem, AppCss.HeaderBarCenter ] ] [ span [] [ text "Shopping List" ] ]
    , if isAddMode then 
        div [ class [ AppCss.HeaderBarItem, AppCss.HeaderBarRight ] ] [ doneButton ]
      else
        div [ class [ AppCss.HeaderBarItem, AppCss.HeaderBarRight ] ] [ addButton ]
    ]

addButton =
  button [ class [ AppCss.HeaderBarAdd ], onClick AppMessages.ToggleAddPanel ] [ text "+" ]

doneButton =
  button 
    [ class [ AppCss.HeaderBarButton ]
    , onClick AppMessages.AddItems 
    ] [ text "Done" ]

cancelButton =
  button 
    [ class [ AppCss.HeaderBarButton ]
    , onClick AppMessages.CancelAdd 
    ] [ text "Cancel" ]

clearButton =
  button 
    [ class [ AppCss.HeaderBarButton ]
    , onClick AppMessages.Clear 
    ] [ text "Clear" ]
