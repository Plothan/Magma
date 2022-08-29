local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Gem = require(ReplicatedStorage.Magma.Gem)
local ReGem = require(ReplicatedStorage.Magma.ReGem)
local Match = require(ReplicatedStorage.Magma.Match)

local doNothing = require(ReplicatedStorage.Magma.Util.doNothing)

return function()
    it("should create a new match object", function()
        local matchObject = Match(Gem(100), {
            ["default"] = function()
                
            end
        })

        expect(matchObject.type).to.equal("match")
    end)

    it("should update when it's dependency is changed - static object", function()
        local value = Gem(100)

        local matchObject = Match(value, {
            [100] = function()
                return 100
            end,
            ["default"] = function()
                return 1
            end
        })

        expect(matchObject:get()).to.equal(100)
        value:set(1)
        expect(matchObject:get()).to.equal(1)

    end)

    it("should change once it's dependency change - dynamic object", function()
        local value = Gem(100)
    
        local secondaryGem = Gem(24)
        local matchObject = Match(value, {
            [100] = function(use)
                return use(secondaryGem) * 2
            end,
            [50] = function(use)
                return use(secondaryGem) * 3
            end,
            ["default"] = function() end
        })

        expect(matchObject:get()).to.equal(secondaryGem:get() * 2)
        value:set(50)
        expect(matchObject:get()).to.equal(secondaryGem:get() * 3)

    end)

    it("should change once any of it's current case dependencies change", function()
        local input = Gem(100)

        local _dependency = Gem(10)

        local matchObject = Match(input, {
            [100] = function(use)
                return use(_dependency) * 100
            end,
            ["default"] = function()
                return input:get()
            end,
        })

        expect(matchObject:get()).to.equal(_dependency:get() * 100)

        _dependency:set(30)
        expect(matchObject:get()).to.equal(_dependency:get() * 100)

    end)
end