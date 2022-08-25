local Symbols = require(script.Parent.Symbols)
local update = require(script.Parent.Util.update)
local use = require(script.Parent.Util.use)

local CLASS = {}
local META = {__index = CLASS}
local WEAK_TABLE = {__mode = "vk"}

function CLASS:_update(oldValue, newValue)
    for _, connection in self._connections do
        task.spawn(connection, oldValue, newValue)
    end
end

function CLASS:onChange(fun)
    local position = #self._connections + 1
    table.insert(self._connections, fun)
    
    return function()
        table.remove(self._connections, position)
    end

end

function CLASS:onBind(fun)
    fun()
    return self:onChange(fun)
end


return function(object)
    local self = setmetatable({
        type = "listener",

        _connections = {},
        _dependency = object
    }, META)

    return self
end
