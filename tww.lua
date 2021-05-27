if game.PlaceId ~= 2317712696 then
	game:Shutdown() -- / Hello, my name's RealTwisted :)
end


-- / Function overwrite

print = printconsole

-- / Variables

local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua'))() -- / My friend uses this too and a lot of other people, and I'd rather not make my own library, so I'll just use this one
local WMain = library:CreateWindow("pZVMHtbZ6y/Skidware") -- / Before the slash is an invite to my media server, and the stuff after is just a joke name I like to use for my stuff :3
local Fmining = WMain:CreateFolder("Mining") -- / This is the mining folder in the UI
--local Fesp = WMain:CreateFolder("Announce ESP") -- / This is ESP stuff i guess?
local WWarp = library:CreateWindow("Warp/WIP") -- / This will have things inside later~

local lplr = game:GetService("Players").LocalPlayer -- / Defining the local player!
_G.MINEAURA = false -- / Default off

-- / Namecall manipulation for grabbing remotes ;)
local mt = getrawmetatable(game) make_writeable(mt) local old = mt.__namecall
mt.__namecall = newcclosure(function(self,...)
	local args = {...} 
	
    if args[2] == "MineDeposit" then -- / Haha stupid methods go if else if else if else if end end ned end end
        _G.MINEREMOTE = self
        _G.MINEINDEX = args[1]
        for i,v in next, args do
            printconsole(tostring(i).." "..tostring(v)) -- / Used for debuging
        end
	end
	
	return old(self,...)
end)



local function hit(obj) -- / This is to organize things. So pretty much a function to hit mine deposits/ore vains
    if _G.MINEREMOTE then
        local ohNumber1 = _G.MINEINDEX
        local ohString2 = "MineDeposit"
        local ohInstance3 = obj.Parent
        local ohVector34 = obj.Position
        local ohVector35 = Vector3.new(-0.165507436, 0.740951896, -0.65084374)
        _G.MINEREMOTE:FireServer(ohNumber1, ohString2, ohInstance3, ohVector34, ohVector35)
    end
end

Fmining:Toggle(
	"Mine Aura", 
	function(bool)
		if bool then
			print("active")
			_G.MINEAURA = true
		else
			print("inactive")
			_G.MINEAURA = false
		end
	end
)

-- / All togglable while loops will be in here, until I get my head straighthh
coroutine.wrap(function()
while true do 
  -- / This is the mine aura.
	while _G.MINEAURA do
		print("mine")
		for i1,v1 in next, game:GetService("Workspace")["WORKSPACE_Interactables"].Mining.OreDeposits:GetDescendants() do -- / This is a bit shit tbh, and I'll rewrite this later so it has all the ore deposits it can use in a table.
			if v1.Name:sub(-3) == "Ore" or v1.Name:sub(-4) == "Base" then
				if v1.Parent:FindFirstChild("DepositInfo") then
					if v1.Parent.DepositInfo:FindFirstChild("OreRemaining") then
						if v1.Parent.DepositInfo.OreRemaining.Value ~= 0 then
							if (game:GetService("Players").LocalPlayer.Character.Head.Position-v1.Position).Magnitude < 14 then
								hit(v1)
								wait(.5)
							end
						end
					end
				end
			end
		end
	wait()end
wait()end
end)()



