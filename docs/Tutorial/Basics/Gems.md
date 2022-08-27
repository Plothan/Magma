# **Gems**

Gems are objects that store singular values in them to be used by other state objects - Let's learn how to use them.

**Required Code**
```Lua linenums="1" hl_lines="2 3"

local ReplicatedStorage = game:GetStorage("ReplicatedStorage")
local Magma = require(ReplicatedStorage.Magma)
```

_____

# **Usage**

To start using Gems, you should get the constructur by doing:

```Lua linenums="1"

local Gem = Magma.Gem
```

To create a new gem, you should pass two arguments to the constructor, the first is the inital value you want, and the second is whether you want your gem to be type protected *(the default is true)*

```Lua linenums="1"

local value = Gem(100)
```

To read from a gem, you should use the `gem:get()` method:

```Lua linenums="1"

print(value:get()) -- 100
```

To set the gem to something new, you should use the `gem:set(input)`. Keep in mind that Magma will throw an error if the new value type doesn't match the old value's if the object is type protected. Secondly, setting the same value that the gem holds will do nothing, this is for performance reasons.
```Lua linenums="1"

value:set(40)

print(value:get()) -- 40
```

___

# **But Why?**

Using state objects *(in this case also gems)*, we can actually be aware of who is using our data, and whose data we are using, we acheive this by storing in each state object:

1. A list of *dependencies*: Those are the objects that the state object use data's.

2. A list of *dependents*: Those are the objects that use our data, and so, we can notify them when there is an update in data.

Using this model, we can create derived variables and event objects very easily.