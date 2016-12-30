module AppCss exposing (..)

import Css exposing (..)
import Css.Elements exposing (body, div, h1, button, ul, li)
import Css.Namespace exposing (namespace)

type CssClasses = 
  HeaderBar
  | HeaderBarAdd
  | HeaderBarCenter
  | HeaderBarRight
  | AddPanel
  | AddBox
  | AddPanelActions
  | AddPanelButton
  | Show
  | Hide 
  | ListCategoryHeader
  | ShoppingItem 
  | ShoppingItemCompleted

reset = 
  mixin
    [ margin zero
    , padding zero 
    , boxSizing borderBox
    ]

baseFontFamilies = 
  fontFamilies ["Droid Sans", "Arial", "sans-serif"] 

accentColor = hex "F95759"

css =
  (stylesheet << namespace "sl")

  [ body [ reset, baseFontFamilies ] 
  , div [ reset ]
  , ul [ reset ]
  , li [ reset, listStyleType none ]
  , h1 [ reset, fontSize (em 1) ]

  , (.) HeaderBar
      [ displayFlex
      , alignItems center
      , backgroundColor accentColor
      , color (hex "fff")
      , children [ div [ flexGrow (int 1) ] ]
      ]

  , (.) HeaderBarCenter [ textAlign center ]

  , (.) HeaderBarRight [ textAlign right ]

  , (.) HeaderBarAdd
      [ backgroundColor transparent
      , color (hex "fff")
      , fontSize (em 2)
      , border zero
      , paddingTop (em 0.25)
      , paddingBottom (em 0.25)
      , paddingLeft (em 0.5)
      , paddingRight (em 0.5)
      , cursor pointer
      ]

  , (.) AddPanel
      [ backgroundColor (hex "ddd")
      , padding (em 0.75)
      ]

  , (.) AddBox
      [ reset
      , baseFontFamilies
      , fontSize (em 1)
      , padding (em 0.5)
      , width (pct 100)
      , height (em 10)
      , border zero
      ]

  , (.) AddPanelActions
      [ textAlign right
      , paddingTop (em 0.5)
      ]

  , (.) AddPanelButton
      [ baseFontFamilies
      , fontSize (em 1)
      , fontWeight bold
      , backgroundColor transparent
      , color accentColor
      , border zero
      , cursor pointer
      ]

  , (.) Show
      [ display inherit ]

  , (.) Hide
      [ display none ]

  , (.) ListCategoryHeader
      [ padding (em 1)
      , borderBottom3 (px 1) solid (hex "eee")
      ]

  , (.) ShoppingItem
      [ padding (em 1) 
      , paddingLeft (em 2)
      , borderBottom3 (px 1) solid (hex "eee")
      ]

  , (.) ShoppingItemCompleted
      [ textDecoration lineThrough
      , color (hex "ccc")
      ]
  ]
