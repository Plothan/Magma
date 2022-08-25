local ReplicatedStorage = game:GetService("ReplicatedStorage")
local shouldNeedDestruct = require(ReplicatedStorage.Magma.Util.shouldNeedDestruct)

return function()
    it("should return true with an instance", function() 
        expect(shouldNeedDestruct(Instance.new("Part"))).to.equal(true)
    end)

    it("should return true with an event connection", function()
        local connection = Instance.new("Part").ChildAdded:Connect(function() end)

        expect(shouldNeedDestruct(connection)).to.equal(true)
    end)

    it("should return true with a table that contains :Destroy()", function()
        expect(shouldNeedDestruct({Destroy = true})).to.equal(true)
    end)

    it("should return false without the need-to-be cleaned up objects", function()
        expect(shouldNeedDestruct({})).to.never.equal(true) 
        expect(shouldNeedDestruct(2)).to.never.equal(true) 
        expect(shouldNeedDestruct("sd")).to.never.equal(true) 
        expect(shouldNeedDestruct(true)).to.never.equal(true) 

    end)
end