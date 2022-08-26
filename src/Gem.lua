local Symbols = require(script.Parent.Symbols)
local update = require(script.Parent.Util.update)

local ERROR = "%s's type (%s) is not the same as %s's (%s)"

local CLASS = {}
local META = {__index = CLASS}
local WEAK_TABLE = {__mode = "kv"}

function CLASS:_update(oldValue : any, newValue : any)
    self._value = newValue
    update(self, oldValue, newValue)
end

function CLASS:set(value : any)
    local oldValue = self._value

    local oldValueType = type(oldValue)
    local currentValueType = type(value)
    
    local contain_symbol = false
    
    if oldValueType == "table" and oldValue.type == "Symbol" then
        contain_symbol = true
    end

    if self._protectType and not contain_symbol and oldValueType ~= currentValueType then
        error(string.format(ERROR, tostring(oldValue), oldValueType, tostring(value), currentValueType))
    elseif oldValue == value then
        return string.format("%s is the same as %s", tostring(oldValue), tostring(value))
    else
        self:_update(oldValue, value)
    end
end

function CLASS:get() : any
    return self._value
end

return function(initalValue : any, protectType : boolean?)
    local self = setmetatable({
        type = "gem",
        
        _protectType = protectType or true,
        _value = initalValue or Symbols.None,
        _dependentSet = setmetatable({}, WEAK_TABLE)
    }, META)

    return self
end
