local Magma = {}

-- Objects
Magma.Gem = require(script.Gem)
Magma.ReGem = require(script.ReGem)
Magma.Listener = require(script.listener)
Magma.Match = require(script.Match)

-- Utils
Magma.cleanUp = require(script.Util.cleanup)
Magma.doNothing = require(script.Util.doNothing)
return Magma