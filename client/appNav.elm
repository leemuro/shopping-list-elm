module AppNav exposing (appNav)

import List
import Html exposing (Html, div, span, button, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import AppMessages
import NavBar exposing (navBar)

import AppCss
import Html.CssHelpers
{ id, class, classList } = Html.CssHelpers.withNamespace "sl"

appNav isAddMode =
  if isAddMode then 
    navBar "Add Items" cancelButton doneButton
  else
    navBar "Shopping List" clearButton addButton

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
