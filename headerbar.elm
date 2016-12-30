module HeaderBar exposing (headerBar)

import List
import Html exposing (Html, div, button, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import AppStyles
import AppMessages

headerBar =
  div [ style barStyle ]
    [ div [ style leftStyle ] []
    , div [ style centerStyle ] [ text "Shopping List" ]
    , div [ style rightStyle ] [ addButton ]
    ]

addButton =
  button [ onClick AppMessages.ToggleAddPanel ] [ text "+" ]

barStyle = 
  List.concat
    [ AppStyles.baseBox
    , [ ("display", "flex")
      , ("padding", "0.5em")
      , ("background-color", "#49E6AA")
      , ("color", "white")
      , ("text-transform", "uppercase")
      , ("text-align", "right")
      ]
    ]

leftStyle =
  [ ("flex-grow", "1") ]

centerStyle =
  [ ("flex-grow", "1") 
  , ("text-align", "center")
  ]

rightStyle =
  [ ("flex-grow", "1") ]
