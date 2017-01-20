module NavBar exposing (navBar)

import Html exposing (Html, div, span, button, text)
import Html.Attributes exposing (class)

import AppCss
import Html.CssHelpers
{ id, class, classList } = Html.CssHelpers.withNamespace "sl"

navBar titleText leftButton rightButton =
  div [ class [ AppCss.HeaderBar ] ]
    [ div [ class [ AppCss.HeaderBarItem ] ] [ leftButton ]
    , div [ class [ AppCss.HeaderBarItem, AppCss.HeaderBarCenter ] ] [ span [] [ text titleText ] ]
    , div [ class [ AppCss.HeaderBarItem, AppCss.HeaderBarRight ] ] [ rightButton ]
    ]
