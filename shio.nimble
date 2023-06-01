# Package

version       = "0.1.0"
author        = "Luke"
description   = "A quick media server in nim"
license       = "GPL-3.0-only"
srcDir        = "src"
binDir        = "bin"
bin           = @["shio"]


# Dependencies

requires "nim >= 1.4.8", "jester", "jsony"
