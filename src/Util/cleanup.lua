local shouldNeedDestruct = require(script.Parent.shouldNeedDestruct)
local cleanupTypes = {
    ["Instances"] = "Destroy",
    ["RBXScriptConnection"] = "Disconnect"
}


return function (object)
    local objectType = typeof(object)

    if shouldNeedDestruct(object) then
        object[cleanupTypes[objectType] or "Destroy"](object)
    end
end
