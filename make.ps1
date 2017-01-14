elm-css stylesheets.elm
elm-make shoppinglist.elm --output app.js

(Get-Content _index.html).replace('{cacheToken}', (get-date -Format "MMddyyyyHHmmss")) | Set-Content index.html
