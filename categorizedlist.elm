module CategorizedList exposing (categorizedList)

import List
import Html exposing (Html, div, h1, ul, li, p, button, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import AppMessages

import AppCss
import Html.CssHelpers
{ id, class, classList } = Html.CssHelpers.withNamespace "sl"

categorizedList categorizedItems =
  if List.length categorizedItems == 0 then
    noItems
  else
    div [] 
      [ ul [] (List.map (\c -> listCategory c) categorizedItems)
      , div [ class [ AppCss.ListActions, AppCss.TextButtonContainer ] ]
          [ button [ class [ AppCss.TextButton ], onClick AppMessages.Clear ] [ text "Clear List" ] ]
      ]

listCategory categoryList = 
  li []
    [ h1 [ class [ AppCss.ListCategoryHeader ] ] [ text categoryList.name ]
    , ul []  (List.map listItem categoryList.items)
    ]

listItem item =
  li [ itemClass item, onClick (AppMessages.ToggleItem item.id)] [ text item.desc ]

itemClass item =
  if item.completed then
    class [ AppCss.ShoppingItem, AppCss.ShoppingItemCompleted ]
  else
    class [ AppCss.ShoppingItem ]

noItems =
  p [ class [ AppCss.NoItems ] ] [ text "Click + to add some items to the list." ]

