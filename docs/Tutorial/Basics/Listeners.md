# **Observing States**
In our systems, we usually need to listen to changes coming from state objects - Let's learn how Magma's object `listener` provides us a great, efficient way of listening to these changes.

??? "Required Code"
    ```Lua

    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local Magma = require(ReplicatedStorage.Magma)

    local Gem = Magma.Gem
    ```
______

## **Listening to Changes**

To listen to changes coming from other state objects, we use Magma's `listener` object.

To start using listeners, we need to import the listener constructor.

```Lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Magma = require(ReplicatedStorage.Magma)

local Gem = Magma.Gem

local Listener = Magma.Listener
```
Now, we can create a new Listner, but first, let's create a new Gem object.

```Lua

local health = Gem(100)
```
Now, we can create a listener for it, which we will name "healthListener", and then call the constructor with the `health` object as an argument. 

```Lua

local health = Gem(100)
local healthListener = Listener(health)
```

Now, to listen to changes on health, we can use the `healthListener:onChange(handler)` method.

```Lua

healthListener:onChange(function(oldValue, newValue)
    print(oldValue, newValue)
end)
```

Additionally, Magma offers a syntatic sugar for `onChange(0)` method. It first calls your handler with `(nil, currentValue)`, and then calls `...:onChange` internally. 

Moreover, sometimes we need to disconnect these handlers.  We can disconnect the handlers by using the `Disconnect` function returned by both `OnChange` and `OnBind`.
