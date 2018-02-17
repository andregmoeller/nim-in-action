# Package

version       = "0.1.0"
author        = "Andre Moeller"
description   = "A simple Twitter clone developed in Nim in Action."
license       = "MIT"

bin = @["tweeter"]
skipExt = @["nim"]

# Dependencies

requires "nim >= 0.17.2", "jester >= 0.0.1"

