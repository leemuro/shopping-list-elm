module CategorizedList exposing (categorizedList)

import List
import String
import Html exposing (Html, h1, ul, li, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import AppMessages

import AppCss
import Html.CssHelpers
{ id, class, classList } = Html.CssHelpers.withNamespace "sl"

categorizedList categories addedItems = 
  ul [ ] (listCategories categories addedItems)

listCategories categories items =
  List.map (\c -> listCategory c.name (itemsInCategory items c categories)) categories

listCategory categoryName items =
  li []
    [ h1 [ class [ AppCss.ListCategoryHeader ] ] [ text categoryName ]
    , ul []  (List.map listItem items)
    ]

listItem item =
  li [ itemClass item, onClick (AppMessages.ToggleItem item.id)] [ text item.desc ]

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

itemClass item =
  if item.completed then
    class [ AppCss.ShoppingItem, AppCss.ShoppingItemCompleted ]
  else
    class [ AppCss.ShoppingItem ]
