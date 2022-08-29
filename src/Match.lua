local Symbols = require(script.Parent.Symbols)
local update = require(script.Parent.Util.update)
local types = require(script.Parent.types)
local use = require(script.Parent.Util.use)

local CLASS = {}
local META = {__index = CLASS}
local WEAK_TABLE = {__mode = "vk"}

function CLASS:_update(_, newValue)

    local conditionTable = self._conditionTable
    local oldValue = self._value
    local chosenCondition = conditionTable[newValue] or conditionTable["default"]

    self._value = Symbols.Pending 
    self._value = chosenCondition(use(self))

    update(self, oldValue, self._value)
end

function CLASS:get() 
    return self._value
end

return function(objectToMath, conditionTable)
    local self = setmetatable({
        type = "match",

        _value = Symbols.None,
        _conditionTable = conditionTable,
        _dependency = objectToMath,
        _dependencySet = setmetatable({}, WEAK_TABLE),
        _dependentSet = setmetatable({}, WEAK_TABLE)
    }, META)

    objectToMath._dependentSet[self] = true

    self:_update(0,objectToMath:get())
    return self
end