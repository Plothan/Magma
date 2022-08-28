local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Magma = require(ReplicatedStorage.Magma)
local Gem = Magma.Gem
local Listener = Magma.Listener
local ReGem = Magma.ReGem

return {
    {
        title = "Gem Creation - no inital value/type-protection specfication",
        calls = 20000,

        run = function() 
            Gem()
        end
    },
    {
        title = "Gem Creation - with inital value/type-protection specfication",
        calls = 20000,

        run = function() 
            Gem(100, true)
        end
    },
    {
        title = "Gem updating - constant value",
        calls = 20000,

        prerun = function() 
            return Gem(12, true)
        end,

        run = function(result)
            result:set(30)
        end
    },
    {
        title = "Gem updating - dynamic value",
        calls = 20000, 
        
        prerun = function()
            return Gem(20, true) ,ReGem(function() return 2 end)
        end,

        run = function(gemObject, regemObject) 
            gemObject:set(regemObject:get())
        end
    },
    {
        title = "Gem reading",
        calls = 20000,

        prerun = function()
            return Gem(2, true)
        end,

        run = function(result)
            result:get()
        end
    }

}