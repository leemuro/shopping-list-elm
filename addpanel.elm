module AddPanel exposing (addPanel)

import List
import Html exposing (Html, div, textarea, button, text)
import Html.Attributes exposing (style, value, placeholder)
import Html.Events exposing (onClick, onInput)
import AppStyles
import AppMessages

addPanel newItems visible =
  div 
    [ style panelStyle , (displayStyle visible) ] 
    [ addBox newItems, addButton ]

addBox newItems =
  textarea 
    [ style addBoxStyle
    , onInput AppMessages.NewItems
    , value newItems
    , placeholder "Type to add new items" 
    ] 
    []

addButton =
  button 
    [ style addButtonStyle
    , onClick AppMessages.AddItems 
    ] 
    [ text "Add" ] 

displayStyle visible =
  if visible then
    style [ ("display", "inherit") ]
  else
    style [ ("display", "none") ]

panelStyle =
  [ ("background-color", "#eee"),
    ("padding", "0.5em")
  ]

addBoxStyle =
  List.concat
    [ AppStyles.baseBox
    , [ ("width", "100%")
      , ("height", "10em")
      , ("padding", "0.5em")
      ]
    ]

addButtonStyle =
  AppStyles.baseBox
