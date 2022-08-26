local Symbols = require(script.Parent.Symbols)
local update = require(script.Parent.Util.update)
local use = require(script.Parent.Util.use)
local types = require(script.Parent.types)

local CLASS = {}
local META = {__index = CLASS}
local WEAK_TABLE = {__mode = "vk"}

function CLASS:_update(oldValue : any, newValue : any)
    for _, connection in self._connections do
        task.spawn(connection, oldValue, newValue)
    end
end

function CLASS:onChange(fun : (any, any) -> (() -> ()))
    local position = #self._connections + 1
    table.insert(self._connections, fun)
    
    return function()
        table.remove(self._connections, position)
    end

end

function CLASS:onBind(fun : (any, any) -> (() -> ()))
    fun(nil, self._dependency:get())
    return self:onChange(fun)
end


return function(object : types.Gem | types.ReGem) : types.Listener
    local self = setmetatable({
        type = "listener",

        _connections = {},
        _dependency = object
    }, META) :: types.Listener

    return self
end
