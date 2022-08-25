local TestEZ = require(script.Parent.TestEZ)
local TestContainer = game:GetService("ReplicatedStorage").tests:GetChildren()



TestEZ.TestBootstrap:run(TestContainer)