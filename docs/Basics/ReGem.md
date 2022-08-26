# **ReGems**
ReGems are state objects that we use to derive new data from other ones efficiently - Let's learn how to use them!

**Required Code**
```Lua linenums="1" hl_lines="2 4"

local ReplicatedStorage = game:GetStorage("ReplicatedStorage")
local Magma = require(ReplicatedStorage.Magma)

local Gem = Magma.Gem
```
____

# **Usage**

To use ReGems, you should get the constructor first:

```Lua linenums="1" hl_lines="2 3"

local ReGem = Magma.ReGem
```

To create a regem, you should call the constructor with the prcoesser function that returns a value that accepts a `use` utility, you will use this function to let ReGem know what objects you are using. 

Secondly, you can provide a destructor function in the second argument for objects that require manual destruction and/or have a `Destroy()` method. Additionally, you can use `Magma.cleanUp` utility as the destructor function. 

Here is a list of the objects that get handled by `cleanUp`.
1. Roblox Instances
2. RBXScriptConnection
3. Any table that has a `Destroy()` method.

```Lua linenums="1"

local health = Gem(23)

local midHealth = ReGem(function(use) 
    return use(health) / 2
end) -- No destructor is provided as numbers don't require destruction
```

To read from them, you can use:

```Lua linenums="1"

print(midHealth:get())
```

If you were to update `health`, midHealth will update too:
```Lua linenums="1"

health:set(50)

print(midHealth:get()) -- 25
```
______

# **Why ReGems?**

You may ask why can't I just use `listener:onBind`? While listeners do work, it is a nightmare when you use more than 1 dependency in a dependent.
