import Html exposing (Html, div)
import Html.Attributes exposing (style, name, content)
import Html.App as App
import String
import List
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
  }

type alias ShoppingList =
  { newItems: String
  , addedItems: List ShoppingItem
  , categories: List Categories
  , currentItemId: Int
  , addPanelVisible: Bool
  }

type alias Model = ShoppingList

model: Model
model = {
  newItems = ""
  , addedItems = []
  , categories = [
      { name = "Produce", matchers = ["banana", "apple", "grape", "potato"] }
    , { name = "Meat", matchers = ["chicken", "beef", "pork", "turkey", "meat"] }
    , { name = "Snacks", matchers = ["chips", "chocolate", "crackers"] }
    , { name = "Other", matchers = [] }
    ]
  , currentItemId = 0
  , addPanelVisible = False
  }

main = 
  App.beginnerProgram { model = model, view = view, update = update }


update msg model =
  case msg of 
    AppMessages.ToggleAddPanel ->
      { model | addPanelVisible = not model.addPanelVisible }

    AppMessages.NewItems newItems ->
      { model | newItems = newItems }

    AppMessages.AddItems ->
      { model | 
        addedItems = appendTextAsNewItems model.addedItems model.newItems model.currentItemId
        , currentItemId = model.currentItemId + List.length (String.split "\n" model.newItems)
        , newItems = ""
        , addPanelVisible = False
      }

    AppMessages.ToggleItem itemId ->
      { model | addedItems = List.map (\i -> toggleItemIfId i itemId) model.addedItems }

    AppMessages.Clear ->
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

view : Model -> Html AppMessages.Msg

view model = 
  div []
    [ headerBar
    , addPanel model.newItems model.addPanelVisible
    , categorizedList model.categories model.addedItems
    ]
