--[[
README
You need to have an executecmd for this to do anything.
And you need to code your own detection for the build hammer, else it will just select all parts and make it ban people.
And you have to fill in the person's name of who owns the ban hammer so they don't ban themselves.

TLDR:
You need to create functions before running
fwait()
executecmd()
--]]
local BanHammer = {}

for i,v in next, workspace:GetChildren() do
	if v.Name == "Model" then
		for i1,v1 in next, v:GetDescendants() do
			if v1.ClassName == "Part" then
				table.insert(BanHammer, v1)
			end
		end
	end
end

for i, v in next, BanHammer do
	spawn(function()
		while v.Parent do 
			local Hits = part:GetTouchingParts() -- SORRY FORGOT THAT YOU CAN'T DO .TOUCHED ON OTHER PEOPLE!
			for i, Hit in next, Hits do
				if Hit.Parent:FindFirstChild("Humanoid") then
					if Hit.Parent.Name ~= "arrighi96" then
						executecmd(":punish me|:chatnotify all " .. Hit.Parent.Name .. " Has Been Banned!") -- / This is in private server, so it's fine like this.
					end
				end
				print(Hit)
			end
			fwait()
		end
	end)
end

