import Html exposing (Html, textarea, button, div, h1, ul, li, text, input)
import Html.Attributes exposing (value, checked, type', style)
import Html.App as App
import Html.Events exposing (onClick, onInput)
import String
import List

type alias ShoppingItem =
  { id: Int
  , desc: String
  , completed: Bool
  }

type alias Categories = 
  { name: String
  , matchers: List String
  }

type alias ShoppingList =
  { newItems: String
  , addedItems: List ShoppingItem
  , categories: List Categories
  , currentItemId: Int
  }

type alias Model = ShoppingList

model: Model
model = {
  newItems = ""
  , addedItems = [
    { id = 0, desc = "potato chips", completed = False }
    , { id = 1, desc = "grapes", completed = False }
    ] 
  , categories = [
      { name = "Produce", matchers = ["banana", "apple", "grape", "potato"] }
    , { name = "Meat", matchers = ["chicken", "beef", "pork", "turkey", "meat"] }
    , { name = "Snacks", matchers = ["chips", "chocolate", "crackers"] }
    , { name = "Other", matchers = [] }
    ]
  , currentItemId = 2
  }

main = 
  App.beginnerProgram { model = model, view = view, update = update }

type Msg = NewItems String | AddItems | Clear | ToggleItem Int

update msg model =
  case msg of 
    NewItems newItems ->
      { model | newItems = newItems }

    AddItems ->
      { model | 
        addedItems = appendTextAsNewItems model.addedItems model.newItems model.currentItemId
        , currentItemId = model.currentItemId + List.length (String.split "\n" model.newItems)
        , newItems = ""
      }

    ToggleItem itemId ->
      { model | addedItems = List.map (\i -> toggleItemIfId i itemId) model.addedItems }

    Clear ->
      { model | addedItems = [] }

appendTextAsNewItems items text currentItemId =
  List.append items (textToNewItems text currentItemId)

textToNewItems text currentItemId =
  let 
    lines = List.indexedMap (,) (String.split "\n" text)
  in
    List.map (\line -> newItem (currentItemId + (fst line)) (snd line)) lines

newItem id desc =
  { id = id, desc = desc, completed = False }

toggleItemIfId item id =
  if item.id == id then
    { item | completed = not item.completed }
  else
    item

view : Model -> Html Msg

view model = 
  div []
    [ textarea [onInput NewItems, value model.newItems ] []
    , button [ onClick AddItems ] [ text "Add" ]
    , button [ onClick Clear ] [ text "Clear" ]
    , ul [listStyle] (listCategories model.categories model.addedItems)
    ]

listCategories categories items =
  List.map (\c -> listCategory c.name (itemsInCategory items c categories)) categories

listCategory categoryName items =
  li []
    [ h1 [headerStyle] [ text categoryName ]
    , ul [listStyle] (List.map listItem items)
    ]

listItem item =
  li [textStyle, (completedStyle item)] 
    [ 
      input [ type' "checkbox", checked item.completed, onClick (ToggleItem item.id), checkboxStyle ] []
    , text item.desc
    ]

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

checkboxStyle =
  style
    [ ("border", "solid 1px #ccc")
    , ("padding", "1em")
    ]

listStyle =
  style
    [ ("margin", "0")
    , ("padding", "0")
    , ("list-style-type", "none")
    ]

headerStyle =
  style 
    [ ("font-family", "Calibri, Tahoma, sans-serif")
    , ("font-size", "1.3em")
    ]

textStyle = 
  style 
    [ ("font-family", "Calibri, Tahoma, sans-serif")
    , ("font-size", "1.1em")
    ]

completedStyle item =
  if item.completed then
    style [ ("text-decoration", "line-through") ]
  else
    style [ ("text-decoration", "none") ]
