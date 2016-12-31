module AddPanel exposing (addPanel)

import List
import Html exposing (Html, div, textarea, button, text)
import Html.Attributes exposing (value, placeholder)
import Html.Events exposing (onClick, onInput)
import AppMessages

import AppCss
import Html.CssHelpers
{ id, class, classList } = Html.CssHelpers.withNamespace "sl"

addPanel newItems visible =
  div 
    [ (addPanelClass visible) ] 
    [ addBox newItems, panelActions ]

addBox newItems =
  textarea 
    [ class [ AppCss.AddBox ]
    , onInput AppMessages.NewItems
    , value newItems
    , placeholder "Type to add new items" 
    ] 
    []

panelActions =
  div [ class [ AppCss.TextButtonContainer ] ]
    [ button 
      [ class [ AppCss.TextButton ]
      , onClick AppMessages.AddItems 
      ] 
      [ text "Add" ] 
    ]

addPanelClass visible =
  if visible then
    class [ AppCss.AddPanel, AppCss.Show ]
  else
    class [ AppCss.AddPanel, AppCss.Hide ]
