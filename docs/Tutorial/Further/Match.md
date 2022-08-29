# **State Matching**
We often need some objects that return specific values depending on a new input from another object - Learn how to use Magma's new object "Match" to create switch/match-like state objects efficiently

??? "Required Code"

    ```Lua

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Magma = require(ReplicatedStorage.Magma)
    
    local Gem = Magma.Gem
    ```

______

## **What is State Matching?**

If you ever coded in a language like javascript, you would be aware of the "switch" statement. This statement is like a if-elesif-else statement, but in written in a more readable format.

However, how is this any useful in a state management library? The thing is, that we often need values that result after a new input coming from the root dependency, for example, a top-secret laboratory that will allow you in if you inserted the "right" combination of numbers.

### **Workaround: ReGems?**
It's definitely possible do this with Gems and ReGems, while acheiving the same behavior. Consider the following example:

```Lua

local input = Gem(3)

local output = ReGem(function(use)
    local current_input = use(input)

    if current_input == 2 then
        return true
    else
        return false
    end
end)
```

This *works*, but is extremely unintuitive. There are multiple issus with this kind of thing:

* If our specific case is served by an `elseif` right before `else`, then we would be wasting computational power to reach it.
* What if we were to introduce dependencies into this? No matter how you do it, you would just need to call `use` on all of them, making `output` update when there won't be a difference.
______

## **Solution: Match**

To solve this, Magma introduces another type of state objects - "Match". These are objects that built from the ground to satisfy the following goals:

* Proper Dependency support
* Easy syntax
* Constant lookup for the rightful cases, decreasing the time for searching the case we need

To use `Match`, we first need to import it's constructor:
```Lua

local Match = Magma.Match
```

To create a new Match object, we need to call the constructor with the `input` object and a conidition table.

```Lua
local input = Gem(123)

local output = Match(input, {

})
```

Now, let's fill it with the following cases:

* Case 100: returns 200
* Case 200: returns 100
* default: return input

```Lua

local input = Gem(123)

local output = Match(input, {
    [100] = function()
        return 100 * 2
    end,
    [200] = function()
        return 200 / 2
    end,
    ["default"] = function()
        return input:get()
    end
})
```

To read from `output`, we use the `output:get()` method!

```Lua

print(output:get()) -- 123
```

However, the Match objects also introduces a better dependency support.

To use a dependency for a case, we use the `use` utility that is provided to use in the cases' functions arguments.

```Lua
local input = Gem(123)

local another_dependency = Gem(343)

local output = Match(input, {
    [100] = function()
        return 100 * 2
    end,
    [200] = function()
        return 200 / 2
    end,
    ["default"] = function(use)
        return input:get() * use(another_dependency)
    end
})

```
??? Error "Default is required"
    The default case is required, and omitting it will return in an error. This is because right after the case for the input isn't found, it will search for the defualt case instead.


Now, our default case will now return `input * another_dependency`.

Let's get back to the goals that this object was created to satisfy:

* Proper Dependency Support: Using dependencies will no longer cause unneeded updating - Match objects will update when one of the dependencies for the current-used case updates.
* Super easy  syntax: There isn't an easier syntax than this.
* Constant lookup; No matter the number of your cases, it is O(1) if there is a specified case, and O(2) when there isn't case for the input and Match searches for the `default` case.
