# **Listeners**
Listeners are state objects that gives us the ability to listen to changes from other state objects - Let's learn how to use it!

**Required Code**
```Lua linenums="1" hl_lines="2 4"

local ReplicatedStorage = game:GetStorage("ReplicatedStorage")
local Magma = require(ReplicatedStorage.Magma)

local Gem = Magma.Gem
```
____

# **Usage**

To start using listener objects, you should get the listener constructor first:
```Lua linenums="1"

local Listener = Magma.Listener
```

To create a listener object, you should call the constructor with the state object you want:

```Lua linenums="1"

local health = Gem(100)
local healthListener = Listener(health)
```

To listen to changes from that object, you should use the `onChange` method from the newly-constructed listener object. It accepts a handler that expects a paramter of the old value, and another one of the new value, which then returns a disconnect function that disconnects the handler.
```Lua linenums="1"

local disconnect = healthListener:onChange(function(oldValue, newValue)
    print("yes")
end)

health:set(40)
disconnect()
health:set(2)
```

Additionally, listener objects also provide a syntantic sugar method named `onBind`. This method does the same as `onChange` with the exception that it immediately fires the handler with `(nil, currentValue)` as paramaters.

```Lua linenums="1"

local disconnect = healthListener:onBind(function(oldValue, newValue)
    print("yes")
end)

```

__________

# **When Listeners run?**

Due to the nature of state objects that hold a value, listeners will only run their handlers when they get notifed after a valid change in their root dependency.