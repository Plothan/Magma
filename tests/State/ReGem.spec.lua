local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Gem = require(ReplicatedStorage.Magma.Gem)
local ReGem = require(ReplicatedStorage.Magma.ReGem)

return function ()

    it("should create a regem object", function()
        local Value = ReGem(function() end)

        expect(Value.type).to.equal("regem")
    end)

    it("should be able to stay stable when yielding is involved", function() 
        local reactive = ReGem(function(use)
            task.wait(5)

            return "hi"
        end)
        expect(reactive:get().content).to.equal("Pending")
        task.wait(5)
        expect(reactive:get()).to.equal("hi")

    end)


    it("should update in response to a gem change", function ()
        local health = Gem(100, true)
        local midHealth = ReGem(function (use)
            return use(health) / 2
        end)

        expect(midHealth:get()).to.equal(50)

        health:set(50)

        expect(midHealth:get()).to.equal(25)
    end)
    
    it("should update in response to a regem change", function()
        local value = Gem(100, true)
        local value_double = ReGem(function(use)
            return use(value) * 2
        end)

        local value_double_double = ReGem(function(use) 
            return use(value_double) * 2
        end)

        expect(value_double_double:get()).to.equal(400)

        value:set(50)

        expect(value_double_double:get()).to.equal(200)
    end)

    it("should only update when x change and ignore y", function() 
        local x = Gem(12, true)
        local y = Gem(1, true)

        local object = ReGem(function(use)
            if x:get() > y:get() then
                return use(x) or use(y)
            else
                return use(y) or use(x)
            end
        end)

        y:set(13)

        expect(object:get()).to.equal(x:get())

    end)

end