local SE = game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint
local ohCFrame3 = CFrame.new(-114.409836, 24.0000038, -1.97518921, 1, 0, 0, 0, 1, 0, 0, 0, 1)
local parts = {}

local part = SE:InvokeServer("CreatePart", "Normal", ohCFrame3, workspace)


local ohTable2 = {
    [1] = {
        ["Color"] = Color3.new(0, 0, 1),
        ["Part"] = part,
        ["UnionColoring"] = true
    }
}

SE:InvokeServer("SyncColor", ohTable2)


while part.Parent do
--part.Touched:Connect(function(Hit)
    local Hits = part:GetTouchingParts()
    for i, Hit in next, Hits do
        print(Hit:GetFullName())
        if Hit.Parent:FindFirstChild("Humanoid") then
            local ohTable2 = {
                [1] = {
                    ["Color"] = Color3.new(1, 0, 0),
                    ["Part"] = part,
                    ["UnionColoring"] = true
                }
            }
            
--            SE:InvokeServer("Remove", {[1] = Hit.Parent})
            
            executecmd(":kill " .. Hit.Parent.Name)
            
            if Hit.Parent:FindFirstChild("Head") then
--                SE:InvokeServer("SyncMove", {[1] = {["Part"] = Hit.Parent.Head, ["CFrame"] = CFrame.new(0, -20, 0, -0.223193184, -0.001482483, 0.974773109, -1.07642209e-05, 0.999998808, 0.00151837966, -0.974774301, 0.000328395341, -0.22319296)}})
            end
            
            SE:InvokeServer("SyncColor", ohTable2)
            wait(1)
            local ohTable2 = {
                [1] = {
                    ["Color"] = Color3.new(0, 0, 1),
                    ["Part"] = part,
                    ["UnionColoring"] = true
                }
            }
            
            SE:InvokeServer("SyncColor", ohTable2)
        end
    end
--end)
    wait()
end
