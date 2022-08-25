local Symbols = require(script.Parent.Symbols)
local update = require(script.Parent.Util.update)

local ERROR = "%s's type (%s) is not the same as %s's (%s)"

local CLASS = {}
local META = {__index = CLASS}
local WEAK_TABLE = {__mode = "kv"}

function CLASS:_update(args)
    
end