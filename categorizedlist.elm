module CategorizedList exposing (categorizedList)

import List
import String
import Html exposing (Html, h1, ul, li, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import AppMessages

categorizedList categories addedItems = 
  ul [ style listStyle ] (listCategories categories addedItems)

listCategories categories items =
  List.map (\c -> listCategory c.name (itemsInCategory items c categories)) categories

listCategory categoryName items =
  li []
    [ h1 [ style headerStyle ] [ text categoryName ]
    , ul [ style listStyle ] (List.map listItem items)
    ]

listItem item =
  li [ style listItemStyle, style (completedStyle item), onClick (AppMessages.ToggleItem item.id)] [ text item.desc ]

itemsInCategory items category categories =
  if List.length category.matchers > 0 then
    List.filter (\item -> itemMatches item category.matchers) items
  else
    itemsInNoCategory items categories

itemMatches item matchers =
  List.any (\matcher -> String.contains matcher item.desc) matchers

itemsInNoCategory items categories =
  let
    allMatchers = List.concatMap (\c -> c.matchers) categories
  in
    List.filter (\item -> not (itemMatches item allMatchers)) items

headerStyle = 
  [ ("font-size", "1.3em")
  , ("margin", "0.5em") 
  ]

listStyle =
  [ ("margin", "0")
  , ("padding", "0")
  , ("list-style-type", "none")
  , ("border-bottom", "1px solid #ccc")
  ]

listItemStyle =
  [ ("padding", "1em")
  , ("border-top", "1px solid #ccc")
  ]

completedStyle item =
  if item.completed then
    [ ("text-decoration", "line-through") ]
  else
    [ ("text-decoration", "none") ]
