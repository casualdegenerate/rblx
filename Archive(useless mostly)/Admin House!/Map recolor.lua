local parts = {}

for i, v in next, game:GetService("Workspace").SecureParts.House:GetChildren() do
	spawn(function()
		parts[i] = {
			["RPart"] = game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer("CreatePart", "Normal", v.CFrame, workspace),
			["FPart"] = v
		}
	end)
end

repeat wait() until #parts == #game:GetService("Workspace").SecureParts.House:GetChildren()


local resize = {}

for i, v in next, parts do
--	local s = v.FPart.Size
--	local p = v.FPart.Position
	resize[i] = {
		["Part"] = v.RPart,
		["CFrame"] = v.FPart.CFrame,
		["Size"] = v.FPart.Size*1.001
	}
end


spawn(function()game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer("SyncResize", resize)end)

local recolor = {}

for i, v in next, parts do
	recolor[i] = {
		["Color"] = Color3.fromRGB(math.random(1,255),math.random(1,255),math.random(1,255)),
		["Part"] = v.RPart,
		["UnionColoring"] = true
	}
end

spawn(function()game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer("SyncColor", recolor)end)


warn("Finished!")

-- Still working on this, and yes it's rushed.
