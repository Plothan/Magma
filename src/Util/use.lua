return function(self)
    return function(object)
        object._dependentSet[self] = true -- Puts self into the object's dependent set so it gets notifed when object changes
        self._dependencySet[object] = true -- puts object into it's dependency set so it can further communicate with the object on certain events

        return object._value
    end
end