_G.RAVE = false
game:GetService("ReplicatedStorage").Network.BuildLocking:InvokeServer{"CHANGELOCKMODE", 3}

wait(.1)
_G.RAVE = true

local parts = {}
local _LOC = game:GetService("Workspace").SecureParts:GetDescendants()

for i, v in next, _LOC do
	if v.ClassName == "Part" then
		spawn(function()
			parts[i] = {
				["RPart"] = game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer("CreatePart", "Normal", v.CFrame, workspace),
				["FPart"] = v
			}
		end)
	end
end

repeat wait() until #parts == #_LOC

local collide = {}

for i, v in next, parts do
	collide[i] = {
		["Part"] = v.RPart,
		["CanCollide"] = false
	}
end
spawn(function()game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer("SyncCollision", collide)end)

local material = {}

for i, v in next, parts do
	material[i] = {
		["Part"] = v.RPart,
		["Material"] = Enum.Material.Neon
	}
end
spawn(function()game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer("SyncMaterial", material)end)



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




while _G.RAVE do 
	for i=1, 10, 2 do
		local recolor = {}
		local _index = i*100-100
		for i1, v in next, parts do
			if _index > i*100 then
				_index = i*100-100
			else
				_index+=1
			end
			recolor[i1] = {
				["Color"] = Color3.fromHSV(_index/1000, 1, 1),
				["Part"] = v.RPart,
				["UnionColoring"] = true
			}
		end
		print(game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer("SyncColor", recolor), i)
	end
	fwait()
end

warn("Finished!")

