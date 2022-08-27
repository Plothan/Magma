# **Why Objects?**
In this page, you will hopefully understand why we use objects to store our state and what are dependencies and dependents.
__________________

# **Dependencies and Dependents**

In this document, you will find a lot of places mentioning "dependencies" and "dependents", but what exactly are those?

Firstly, dependencies are objects that are used to derive new objects from. Consider the following code:
```Lua
local health = 34
local midHealth = health / 2
```
In that case, our `health` variable is a dependency, as we used it in calculating `midHealth`. But the surprizing thing is, that `midHealth` is also a dependency! But ***how***?

Well, because another code can **still** derive new variables from `midHealth`, just like the following:

```Lua

local mid_plus_current_health = health + midHealth
```
In that code, both `health` and `midHealth` were used in calcualting `mid_plus_current_health`, and so, they are dependencies, and guess what is also a dependency? It is `mid_plus_current_health`!

So, generarlly dependencies are objects that we can derive new objects from, but what about "dependents"?

Well, dependents don't "exist", they are just dependencies but their look was changed from their root dependency prespective to dependents. Let's consider the `health` and `midHealth` example.

```Lua

local health = 200
local midHealth = health / 2
```
In that example, we agreed that both health and midHealth are dependencies, but from health's point of view, midHealth is a *dependent*, an object that *depend* on health's value.

So, in general, dependencies are object that we can derive new objects from, and dependents are just dependencies but their name was changed in their dependencies perspective.