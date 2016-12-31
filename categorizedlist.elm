module CategorizedList exposing (categorizedList)

import List
import String
import Html exposing (Html, h1, ul, li, p, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import AppMessages

import AppCss
import Html.CssHelpers
{ id, class, classList } = Html.CssHelpers.withNamespace "sl"

categorizedList categories addedItems = 
  if List.length addedItems == 0 then
    noItems
  else
    ul [ ] (listCategories categories addedItems)

listCategories categories items =
  let x = 
    categoryLists categories items
  in
    List.map (\c -> listCategory c) x

listCategory categoryList = 
  li []
    [ h1 [ class [ AppCss.ListCategoryHeader ] ] [ text categoryList.name ]
    , ul []  (List.map listItem categoryList.items)
    ]

listItem item =
  li [ itemClass item, onClick (AppMessages.ToggleItem item.id)] [ text item.desc ]

categoryLists categories items = 
  let x =
    List.map (\c -> { name = c.name, items = (itemsInCategory items c categories) }) categories
  in 
    List.filter (\i -> List.length i.items > 0) x

itemsInCategory items category categories =
  if List.length category.matchers > 0 then
    List.filter (\item -> itemMatches item category.matchers category.exclusions) items
  else
    itemsInNoCategory items categories

itemMatches item matchers exclusions =
  List.any (\matcher -> String.contains (String.toLower matcher) (String.toLower item.desc)) matchers
  && not (List.any (\exclusion -> String.contains (String.toLower exclusion) (String.toLower item.desc)) exclusions)

itemsInNoCategory items categories =
  List.filter (\item -> 
    (not (List.any (\category -> 
      itemMatches item category.matchers category.exclusions) categories ))) items

itemClass item =
  if item.completed then
    class [ AppCss.ShoppingItem, AppCss.ShoppingItemCompleted ]
  else
    class [ AppCss.ShoppingItem ]

noItems =
  p [ class [ AppCss.NoItems ] ] [ text "Click + to add some items to the list." ]
