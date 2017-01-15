module AppCss exposing (..)

import Css exposing (..)
import Css.Elements exposing (body, div, span, h1, button, ul, li)
import Css.Namespace exposing (namespace)

type CssClasses = 
  FixedHeader
  | HeaderBar
  | HeaderBarAdd
  | HeaderBarItem
  | HeaderBarCenter
  | HeaderBarRight
  | AddModeContainer
  | AddPanel
  | AddBox
  | TextButton
  | TextButtonRight
  | Show
  | Hide 
  | ListContainer
  | ListCategoryHeader
  | ShoppingItem 
  | ShoppingItemCompleted
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
lightGrayColor = hex "eee"

css =
  (stylesheet << namespace "sl")

  [ Css.Elements.html [ height (pct 100) ]
  , body [ reset, baseFontFamilies, height (pct 100) ] 
  , div [ reset ]
  , ul [ reset ]
  , li [ reset, listStyleType none ]
  , h1 [ reset, fontSize (em 1) ]

  , (.) FixedHeader
      [ position fixed
      , top zero
      , left zero
      , width (pct 100)
      ]

  , (.) HeaderBar
      [ displayFlex
      , backgroundColor accentColor
      , color (hex "fff")
      , height (em 3)
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
      , paddingRight (em 0.5)
      , cursor pointer
      ]

  , (.) AddModeContainer
      [ displayFlex
      , flexDirection column
      , height (pct 100)
      ]

  , (.) AddPanel
      [ displayFlex
      , flexDirection column
      , flexGrow (int 1)
      , flexShrink (int 1)
      , flexBasis auto
      ]

  , (.) AddBox
      [ reset
      , baseFontFamilies
      , fontSize (em 1)
      , padding (em 0.5)
      , width (pct 100)
      , border zero
      , flexGrow (int 1)
      ]

  , (.) TextButton
      [ baseFontFamilies
      , fontSize (em 1)
      , fontWeight bold
      , backgroundColor transparent
      , color accentColor
      , border zero
      , cursor pointer
      , padding (em 0.75)
      ]

  , (.) TextButtonRight
      [ float right ]

  , (.) Show
      [ display inherit ]

  , (.) Hide
      [ display none ]

  , (.) ListContainer
      [ paddingTop (em 3) ]

  , (.) ListCategoryHeader
      [ padding (em 1)
      , borderBottom3 (px 1) solid lightGrayColor
      ]

  , (.) ShoppingItem
      [ padding (em 1) 
      , paddingLeft (em 2)
      , borderBottom3 (px 1) solid lightGrayColor
      ]

  , (.) ShoppingItemCompleted
      [ textDecoration lineThrough
      , color (hex "ccc")
      ]

  , (.) NoItems
      [ textAlign center ]
  ]
