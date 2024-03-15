from std/os import commandLineParams
from std/strformat import fmt
import std/strutils

const
  attributeLength = 6
  extensionIdLength = 32

proc main =
  let params = commandLineParams()
  if params.len == 0 or params[0] == "help":
    echo "CED (Chromium Extensions Downloader) by programutox"
    echo "Command expected : ced chromium_version extension_link"
    echo "Returns : a link you can paste to download an extension without going to the web store"
    return

  if params.len != 2:
    echo "Incorrect number of arguments (must be 2)"
    return

  let
    chromiumVersion = params[0]
    extensionLink = params[1]
    extensionId =
      # If the link ends with attribute "?hl=en" for example
      if "?hl=" in extensionLink:
        extensionLink[extensionLink.len-extensionIdLength-attributeLength..extensionLink.len-attributeLength-1]
      else:
        extensionLink[extensionLink.len-extensionIdLength..extensionLink.len-1]

  echo "Here is the link !"
  echo fmt"https://clients2.google.com/service/update2/crx?response=redirect&acceptformat=crx2,crx3&prodversion={chromiumVersion}&x=id%3D{extensionId}%26installsource%3Dondemand%26uc"

when isMainModule:
  main()

