# **Storing State**
Our systems use some data, called "state" - Learn how to store this data with Magma.

??? "Required Code"
    ```Lua
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Magma = require(ReplicatedStorage.Magma)
    ```
______

## **What is State**
State is simply the current condition of your application data at a point. An example of this is a Player object, to know how it behaves and looks, we should have the following:

* Current Health
* Speed
* Children
* etc

So, these values are therefore the state of the player object - so if we want to change how the object behaves, we need to use the value of these variables.

______

## **Storing State**

To store state, Magma provides you various tools to store your state - one of them, are "Gems", these are objects that store singular values that allow for reading and writing.


To use Gens, you should first need to import the `Gem` constructor

```Lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Magma = require(ReplicatedStorage.Magma)

local Gem = Magma.Gem
```

To create a new `Gem` object, we need to call the constructor with an optional inital value.

```Lua

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Magma = require(ReplicatedStorage.Magma)

local Gem = Magma.Gem

local value = Gem(100)
```

By default, this newly created gem will error when you set it to a value whose type is different than the old value's type. To change this, pass another boolean with the value of `false`

```Lua

local value = Gem(100, false)
```

Now, to read from `value`, use the `value:get()` method.

```Lua

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Magma = require(ReplicatedStorage.Magma)

local Gem = Magma.Gem

local value = Gem(100)

print(value:get()) -- 100
```

To set it something else, we can use the `value:set(input)` method.

```Lua

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Magma = require(ReplicatedStorage.Magma)

local Gem = Magma.Gem

local value = Gem(100)

print(value:get()) -- 100

value:set(50)
print(value:get()) -- 50
```

If we were to set it to something else that has a different type than the old value's, it will error.


Keep in mind, that not all `value:set()` calls actually work - if you were to set the `value` to the same value, nothing will occur.
