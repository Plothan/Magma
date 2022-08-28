# **Why Objects?**

## **The Problem**

Our code is normally managed by internal variables, and when those change, we want our systems to reflect those thanges. However, it isn't really possible to listen to changes from a variable in Lua - So it's often your responsibility to update all parts of code that use those variables.

## **Building Self-Aware Variables**
To combat this issue, we need to fundamentally extend what variables can do. In particular, we need three additional features:

* We need to save a list of dependents - other places currently using our variable. This is so we know who to notify when the value changes.
* We need to save a list of dependencies - other places we are currently using their variables. This is so we know who to notify when we don't need them anymore
* We need to run some code when the variable is set to a new value. If we can do that, then we can go through the list and notify everyone.

Magma introduces the concept of "state objects", they are objects that store a list dependents to notify everyone using their values, and optionally a list of dependencies so their dependents can notify them when they don't depend on them anymore.