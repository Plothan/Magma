local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Gem = require(ReplicatedStorage.Magma.Gem)

return function ()
    it("should create a gem object", function()
        local Value = Gem()

        expect(Value.type).to.equal("gem")
    end)

    it("should not change value when they are the same", function ()
        local Value = Gem(true)

        local result = Value:set(true)

        expect(string.match(result, "same")).to.be.ok()
    end)

    it("should update from 20 to 50", function()
        local Value = Gem(20)

        expect(Value:get()).to.equal(20)

        Value:set(50)
        expect(Value:get()).to.equal(50)

    end)

    it("should protect types", function()
        local Value = Gem(true, true)

        local isFine, result = pcall(function()
           return  Value:set(23)
        end)
        expect(isFine).to.be.equal(false)
    end)
end
