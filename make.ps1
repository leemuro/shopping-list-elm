elm-css stylesheets.elm
elm-make shoppinglist.elm --output app.js

(Get-Content index.html).replace('{cacheToken}', (get-date -Format "MMddyyyyHHmmss")) | Set-Content index.html
