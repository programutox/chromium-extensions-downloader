from os import commandLineParams
from strformat import fmt

proc main =
  let params = commandLineParams()
  if params.len == 0 or params[0] == "help":
    echo "CED (Chromium Extensions Downloader) by programutox"
    echo "Command expected : ced chromium_version extension_id"
    echo "Returns : a link you can paste to download an extension without going to the web store"
    return

  if params.len != 2:
    echo "Incorrect number of arguments (must be 2)"
    return

  echo fmt"https://clients2.google.com/service/update2/crx?response=redirect&acceptformat=crx2,crx3&prodversion={params[0]}&x=id%3D{params[1]}%26installsource%3Dondemand%26uc"

when isMainModule:
  main()

