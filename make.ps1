$OrigBgColor = $host.ui.rawui.BackgroundColor
$OrigFgColor = $host.ui.rawui.ForegroundColor

function Reset-Colors {
  $host.ui.rawui.BackgroundColor = $OrigBgColor
  $host.ui.rawui.ForegroundColor = $OrigFgColor
}

elm-css stylesheets.elm
elm-make app.elm --output app.js

(Get-Content _index.html).replace('{cacheToken}', (get-date -Format "MMddyyyyHHmmss")) | Set-Content index.html

Reset-Colors
