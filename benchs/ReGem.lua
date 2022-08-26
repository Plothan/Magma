local ServerStorage = game:GetService("ServerStorage")

local Magma = require(ServerStorage.Magma)
local Gem = Magma.Gem
local Listener = Magma.Listener
local ReGem = Magma.ReGem

return {
    {
        title = "ReGem creation - no dependencies",
        calls = 20000,

        run = function()
            ReGem(function() end)
        end
    },
    {
        title = "ReGem creation - with dependencies",
        calls = 20000,

        prerun = function()
            return Gem(100, true)
        end,

        run = function(result)
            ReGem(function(use) 
                return use(result) / 1
            end)

        end
    },
    {
        title = "ReGem updating",
        calls = 20000,

        prerun = function()
            local gem = Gem(100, true) 
            
            local regem = ReGem(function(use)
                return use(gem)
            end)

            return regem
        end,

        run = function(result)
            result:_update(100, 23)
        end
            
    }

}