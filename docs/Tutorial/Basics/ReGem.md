# **Computing State**
We often need derived values in our systems and UI, let's learn how Magma's object ReGem provides us a simple way ot acheiving this.

??? "Required Code"
    ```Lua

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Magma = require(ReplicatedStorage.Magma)

    local Gem = Magma.Gem
    ```
___

## **The Computation Problem**

Usually in our code, we often need "dervied" values for our systems/UIs. For example, in a simple leaderstats, we often have:

* Kills - increases everytime you kill somebody
* Cash - increases everytime kills increase by 200

If we were to implement this in Magma with Gems and Listeners, we would do:

```Lua

local Kills = Gem(0)
local KillsListener = Listener(Kills)

local Cash = Gem(0)
KillsListener:onBind(function(_, newValue)
    Cash:set(newValue * 200)
end)
```

While this *work*, this has various issues, including:

1. If we were to introduce more dependencies to `Cash`, it would be tedious to manage.
2. The relation between Kills and Cash isn't really clear at a first glance.
3. We are creating two objects, one for saving the latest value, and the other for listening to `Kills`

## **Solution: ReGems**
To solve this, Magma introduces a special kind of state objects - `ReGems`. Instead of storing a fixed value, they run a computation whenever any of their dependencies change.

To use a ReGem, you first need to import it's constructor:
```Lua

local ReGem = Magma.ReGem
```

To create a new ReGem, we call it's constrcutor with the computation as an function that will receive a utility function called `use` as an argument - it is used to tell ReGem what objects you are using.



```Lua

local Players = Gem(100)

local doublePlayers = ReGem(function(use)
    return use(Players) * 2
end)
```

Additionally, you can pass another function as the `destructor` which will be responsible for cleaning up old values that need to be.

```Lua

local doublePlayers = ReGem(function(use)
    return use(Players) * 2
end, function(oldValue)
-- do nothing
end)
```

However, to avoid repeating code, you can use the already built-in `Magma.cleanUp` utility that will clean up the following:

* Instances
* RBXScriptConnections
* Tables with :Destroy()

Or, if you don't want to clean up the oldValue entirely *(whether it doesn't need to be or it isn't supposed to manage it)*, you can just pass nothing or `Magma.doNothing`.


Now, when Players change, doublePlayers will also change:

```Lua

Players:set(20)
print(doublePlayers:get()) -- 40
```
