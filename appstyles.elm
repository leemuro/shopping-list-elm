module AppStyles exposing (..)

fontStyle =
  [ ("font-family", "Calibri, Tahoma, sans-serif") ]

baseFontSize = 
  [ ("font-size", "1.1em") ]

borderBox =
  [ ("box-sizing", "border-box") ]

baseBox = 
  List.concat 
    [ fontStyle 
    , baseFontSize
    , borderBox
    ]
