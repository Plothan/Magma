local Symbols = require(script.Parent.Symbols)
local types = require(script.Parent.types)

local update = require(script.Parent.Util.update)
local use = require(script.Parent.Util.use)
local CLASS = {}
local META = {__index = CLASS}
local WEAK_TABLE = {__mode = "kv"}


function CLASS:_update()
    local oldValue = self._value

    for dependency in self._dependencySet do
        dependency._dependentSet[self] = nil
    end

    table.clear(self._dependencySet)
    
    self._destructor(self._value)
    self._value = Symbols.Pending
    self._value = self._callback(use(self))

    update(self, oldValue, self._value)
end

function  CLASS:get()
    return self._value
end


return function(fn, destructor)
    local self = setmetatable({
        type = "regem",

        _destructor = destructor or function() end,
        _callback = fn,
        _value = Symbols.None,
        _dependencySet = setmetatable({}, WEAK_TABLE),
        _dependentSet = setmetatable({}, WEAK_TABLE)
    }, META) :: types.ReGem

    
    task.spawn(self._update, self ,use(self))

    return self
end