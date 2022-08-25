local cleanupTypes = {
    ["Instance"] = "Destroy",
    ["RBXScriptConnection"] = "Disconnect"
}

return function (object)
    local objectType = typeof(object)

    local destructor = cleanupTypes[objectType]

    if destructor or objectType == "table" and object.Destroy  then
        return true
    else
        return false
    end
end