module AppCss exposing (..)

import Css exposing (..)
import Css.Elements exposing (body, div, span, h1, button, ul, li)
import Css.Namespace exposing (namespace)

type CssClasses = 
  HeaderBar
  | HeaderBarAdd
  | HeaderBarItem
  | HeaderBarCenter
  | HeaderBarRight
  | AddPanel
  | AddBox
  | TextButtonContainer
  | TextButton
  | Show
  | Hide 
  | ListCategoryHeader
  | ShoppingItem 
  | ShoppingItemCompleted
  | ListActions
  | NoItems

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
      , backgroundColor accentColor
      , color (hex "fff")
      ]

  , (.) HeaderBarItem
      [ flex (int 1)
      , displayFlex
      ]

  , (.) HeaderBarCenter
      [ children [ span [ margin auto ] ] ]

  , (.) HeaderBarRight
      [ children [ button [ marginLeft auto ] ] ]

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
      [ backgroundColor (hex "eee")
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

  , (.) TextButtonContainer
      [ textAlign right
      , paddingTop (em 0.5)
      ]

  , (.) TextButton
      [ baseFontFamilies
      , fontSize (em 1)
      , fontWeight bold
      , backgroundColor transparent
      , color accentColor
      , border zero
      , cursor pointer
      , paddingRight zero
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

  , (.) ListActions
      [ padding (em 0.5) ]

  , (.) NoItems
      [ textAlign center ]
  ]
