local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Gem = require(ReplicatedStorage.Magma.Gem)
local ReGem = require(ReplicatedStorage.Magma.ReGem)
local listener = require(ReplicatedStorage.Magma.listener)

return function()
    it("should fire in response to a gem object", function()
        local value = Gem(100, true)
        local didFire = false
        listener(value):onChange(function(oldValue, newValue)
            didFire = true
        
            expect(didFire).to.equal(true)

        end)

        value:set(200)
    end)

    it("should fire in response to a regem object", function() 
        local didfire = false
        local value = Gem(100, true)
        
        local revalue = ReGem(function(use)
            return use(value) * 2
        end)

        listener(revalue):onChange(function()
            didfire = true

            expect(didfire).to.equal(true)
        end)

        value:set(50)
    end)

    it("should provide accurate paramters", function()
        local value = Gem(100, true)

        listener(value):onChange(function(oldValue,newValue)
            expect(oldValue).to.equal(100)
            expect(newValue).to.equal(50)
        end)
        
        value:set(50)
    end)

end