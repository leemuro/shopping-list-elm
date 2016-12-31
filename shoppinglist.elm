port module Main exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (style, name, content)
import Html.App as App
import String
import List
import Categories exposing (defaultCategories)
import AppMessages
import HeaderBar exposing (headerBar)
import AddPanel exposing (addPanel)
import CategorizedList exposing (categorizedList)

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

type alias ShoppingList =
  { newItems: String
  , addedItems: List ShoppingItem
  , categories: List Categories
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
      ( model, Cmd.none )
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
      let newModel =
        { model | 
          addedItems = appendTextAsNewItems model.addedItems model.newItems model.currentItemId
          , currentItemId = model.currentItemId + List.length (String.split "\n" model.newItems)
          , newItems = ""
          , addPanelVisible = False
        }
      in
        ( newModel, setStorage newModel )

    AppMessages.ToggleItem itemId ->
      let newModel =
        { model | addedItems = List.map (\i -> toggleItemIfId i itemId) model.addedItems }
      in
        ( newModel, setStorage newModel )

    AppMessages.Clear ->
      let newModel =
        { model | addedItems = [] }
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

toggleItemIfId item id =
  if item.id == id then
    { item | completed = not item.completed }
  else
    item

view : Model -> Html AppMessages.Msg

view model = 
  div []
    [ headerBar
    , addPanel model.newItems model.addPanelVisible
    , categorizedList model.categories model.addedItems
    ]
