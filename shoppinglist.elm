port module Main exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (style, name, content)
import Html.App as App
import String
import Regex
import List
import Categories exposing (defaultCategories)
import AppMessages
import HeaderBar exposing (headerBar)
import AddPanel exposing (addPanel)
import CategorizedList exposing (categorizedList)

import AppCss
import Html.CssHelpers
{ id, class, classList } = Html.CssHelpers.withNamespace "sl"

type alias ShoppingItem =
  { id: Int
  , desc: String
  , completed: Bool
  }

type alias Categories = 
  { name: String
  , matchers: List String
  , exclusions: List String
  }

type alias CategoryOfItems =
  { name: String
  , items: List ShoppingItem
}

type alias ShoppingList =
  { newItems: String
  , addedItems: List ShoppingItem
  , categories: List Categories
  , categorizedItems: List CategoryOfItems
  , currentItemId: Int
  , addPanelVisible: Bool
  }

type alias Model = ShoppingList

port setStorage : Model -> Cmd msg

defaultModel : Model
defaultModel = {
  newItems = ""
  , addedItems = []
  , categories = defaultCategories
  , categorizedItems = []
  , currentItemId = 0
  , addPanelVisible = False
  }

main : Program (Maybe Model)
main =
  App.programWithFlags
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }

subscriptions : Model -> Sub AppMessages.Msg
subscriptions model =
  Sub.batch []

init : Maybe Model -> ( Model, Cmd msg )
init model =
  case model of
    Just model ->
      ( { model | categories = defaultCategories }, Cmd.none )
    Nothing ->
      ( defaultModel, Cmd.none )

update : AppMessages.Msg -> Model -> ( Model, Cmd AppMessages.Msg )
update msg model =
  case msg of 
    AppMessages.ToggleAddPanel ->
      let newModel =
        { model | addPanelVisible = not model.addPanelVisible }
      in
        ( newModel, setStorage newModel )

    AppMessages.NewItems newItems ->
      let newModel =
        { model | newItems = newItems }
      in
        ( newModel, setStorage newModel )

    AppMessages.AddItems ->
      let 
        newAddedItems = appendTextAsNewItems model.addedItems model.newItems model.currentItemId
        newModel =
          { model | 
              addedItems = newAddedItems
            , categorizedItems = categorizedItems model.categories newAddedItems
            , currentItemId = model.currentItemId + List.length (String.split "\n" model.newItems)
            , newItems = ""
            , addPanelVisible = False
          }
      in
        ( newModel, setStorage newModel )

    AppMessages.ToggleItem itemId ->
      if model.addPanelVisible then
        let newModel =
          { model | addPanelVisible = not model.addPanelVisible }
        in
          ( newModel, setStorage newModel )
      else
        let newModel =
          { model | 
            addedItems = List.map (\i -> toggleItemIfId i itemId) model.addedItems 
          , categorizedItems = List.map (\c -> {c | items = List.map (\i -> toggleItemIfId i itemId) c.items}) model.categorizedItems 
          }
        in
          ( newModel, setStorage newModel )

    AppMessages.Clear ->
      let newModel =
        { model | addedItems = [], categorizedItems = [] }
      in
        ( newModel, setStorage newModel )

appendTextAsNewItems items text currentItemId =
  List.append items (textToNewItems text currentItemId)

textToNewItems text currentItemId =
  let 
    lines = List.indexedMap (,) (String.split "\n" text)
  in
    List.filter (\item -> not (item.desc == ""))
      (List.map (\line -> newItem (currentItemId + (fst line)) (String.trim (snd line))) lines)

newItem id desc =
  { id = id, desc = desc, completed = False }

categorizedItems categories items = 
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
  List.any (\matcher -> Regex.contains (Regex.regex ("(\\W|^)" ++ (String.toLower matcher) ++ "(\\W|$)")) (String.toLower item.desc)) matchers
  && not (List.any (\exclusion -> Regex.contains (Regex.regex ("(\\W|^)" ++ (String.toLower exclusion) ++ "(\\W|$)")) (String.toLower item.desc)) exclusions)

itemsInNoCategory items categories =
  List.filter (\item -> 
    (not (List.any (\category -> 
      itemMatches item category.matchers category.exclusions) categories ))) items

toggleItemIfId item id =
  if item.id == id then
    { item | completed = not item.completed }
  else
    item

view : Model -> Html AppMessages.Msg

view model = 
  if model.addPanelVisible then
    div [ class [ AppCss.AddModeContainer ] ]
      [ div [] [ headerBar ]
      , addPanel model.newItems model.addPanelVisible 
      ]
  else
    div []
      [ div [ class [ AppCss.FixedHeader ] ] [ headerBar ]
      , categorizedList model.categorizedItems
      ]

