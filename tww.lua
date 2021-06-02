repeat wait() until game:GetService("Players").LocalPlayer
if game.PlaceId ~= 2317712696 then
	game:Shutdown() -- / Hello, my name's RealTwisted :)
end
syn.queue_on_teleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/casualdegenerate/rblx/main/tww.lua"))()]])

-- / Function overwrite
if printconsole then
	print = printconsole
else
	print = function()end
end
print("Test")

fwait = wait

-- / Variables
local function js(i)return game:GetService("HttpService"):JSONDecode(i)end
local lplr = game:GetService("Players").LocalPlayer -- / Defining the local player!
local Players = game:GetService("Players");
local Lighting = game:GetService("Lighting");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local VirtualUser = game:GetService("VirtualUser");
local RunService = game:GetService("RunService");
local UserInputService = game:GetService("UserInputService");
local Mouse = lplr:GetMouse();
local CurrentCamera = workspace.CurrentCamera;
local Entities = game.workspace:FindFirstChild("WORKSPACE_Entities");
local LoadModule = require(ReplicatedStorage.Modules.Load);
local LoadSharedModule = require(ReplicatedStorage.SharedModules.Load);
local Global = require(game:GetService("ReplicatedStorage").SharedModules.Global);
local AnimalModule, BreakableGlassModule, CameraModule, ClientProjectiles, GunItemModule, NetworkModule, PlayerCharacterModule, SharedUtilsModule, UtilsModule; do
AnimalModule = LoadModule("Animal");
BreakableGlassModule = LoadModule("BreakableGlass");
CameraModule = LoadModule("Camera");
ClientProjectiles = LoadModule("ClientProjectiles");
GunItemModule = LoadModule("GunItem");
NetworkModule = LoadSharedModule("Network");
PlayerCharacterModule = LoadModule("PlayerCharacter");
SharedUtilsModule = LoadSharedModule("SharedUtils");
CharRepUtilsModule = LoadSharedModule("CharRepUtils");
UtilsModule = LoadModule("Utils");
end


_G.MINEAURA = false -- / Default off





-- / Remote manipulation

--[[
local mt = getrawmetatable(game) make_writeable(mt) local old = mt.__namecall
mt.__namecall = newcclosure(function(self,...)
	local args = {...} 
	
	return old(self,...)
end)
--]]

coroutine.wrap(function()
    while wait() do
        if _G.MINEAURA then
			local item = PlayerCharacterModule:GetEquippedItem()
			if string.match(item.Name, "Pickaxe") then
				for _,ore in next, game:GetService("Workspace")["WORKSPACE_Interactables"].Mining.OreDeposits:GetDescendants() do 
					if (string.match(ore.Name, "Ore") or string.match(ore.Name, "Base")) and ore.Parent:FindFirstChild("DepositInfo") and ore.Parent.DepositInfo:FindFirstChild("OreRemaining") and ore.Parent.DepositInfo.OreRemaining.Value ~= 0 and LocalPlayer.Character:FindFirstChild("Head") then
						if (LocalPlayer.Character.Head.Position-ore.Position).Magnitude < 10 then
							item:NetworkActivate("MineDeposit", ore.Parent, ore.Position, Vector3.new(-0.165507436, 0.740951896, -0.65084374))
						end
					end
				end
			end
		end
    end
end)()


-- / UI


local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua'))() -- / My friend uses this too and a lot of other people, and I'd rather not make my own library, so I'll just use this one
local WMain = library:CreateWindow("pZVMHtbZ6y/Skidware") -- / Before the slash is an invite to my media server, and the stuff after is just a joke name I like to use for my stuff :3
local Fmining = WMain:CreateFolder("Mining") -- / This is the mining folder in the UI
--local Fesp = WMain:CreateFolder("Announce ESP") -- / This is ESP stuff i guess?
local FWarp = WMain:CreateFolder("Warp/WIP") -- / This will have things inside later~
local WMisc = library:CreateWindow("Misc")
local FServer = WMisc:CreateFolder("Server")
local FBlant = WMisc:CreateFolder("Blant")



Fmining:Toggle(
	"Mine Aura", 
	function(bool)
		if bool then
			_G.MINEAURA = true
		else
			_G.MINEAURA = false
		end
	end
)

local places = {
	{"Bronze City","Bronze"},
	{"Puerto Dorado","Dorado"},
	{"Tribal Village","Tribal"},
	{"Callahan Manor","Delores"},
	{"Howling Peak","HowlingPeak"},
	{"Windmill Camp(+5)","WindmillCamp"},
	{"Outlaw's Perch(+5)","CanyonCamp"}
}
for i,v in next, places do
	FWarp:Button(
		v[1],
		function()
			game:GetService("ReplicatedStorage").Communication.Functions.Respawn:InvokeServer(v[2])
		end
	)
end


local function race(val)
	game:GetService("ReplicatedStorage").Communication.Events.SelectSkinColor:FireServer(val)
end
FBlant:Toggle(
	"Racist",
	function(bool)
		if bool then
			_G.RACIST = true
			coroutine.wrap(function()while _G.RACIST do
				for i=1,10 do
					race(i)
				wait(.1)end
				for i=10,1,-1 do
					race(i)
				wait(.1)end
			wait()end;end)()
		else
			_G.RACIST = false
		end
	end
)

FBlant:Toggle(
	"Duel All",
	function(bool)
		if bool then
			_G.AUTODUEL = true
			coroutine.wrap(function()while _G.AUTODUEL do
				if not lplr.PlayerGui.Notifications.Duel.Visible and lplr.Character then
					--if lplr.Character:FindFirstChild("Humanoid") then -- / too depressed to finish, but I added a bit more optimization.
					
					for i,plr in next, game:GetService("Players"):GetPlayers() do
						if plr ~= lplr and plr.Character then
							game:GetService("ReplicatedStorage").Communication.Events.DuelRequest:FireServer(plr)
							wait(.5)
						end
					end
				end
			wait()end;end)()
		else
			_G.AUTODUEL = false
		end
	end
)



FServer:Button(
	"ServerHop",
	function()
		if _G.MAXPLAYERS then
			local index = 0
			while index do
				if index == 0 then index = "" end
				local res = syn.request{
					Url = "https://games.roblox.com/v1/games/2317712696/servers/Public?sortOrder=Asc&limit=100&cursor="..index,
					Method = "GET"
				}
				for i,v in next, js(res.Body).data do
					if v.playing <= _G.MAXPLAYERS then
						if _G.NEWSERVERS and not readfile("servers cache.txt"):find(v.id) then
							print("Attempting to join\n"..tostring(v.id).."\n"..tostring(v.playing).."/"..tostring(v.maxPlayers))
							appendfile("servers cache.txt",v.id.."\n")
							game:GetService("TeleportService"):TeleportToPlaceInstance(2317712696,tostring(v.id))
							wait(15)
						else
							print("Attempting to join\n"..tostring(v.id).."\n"..tostring(v.playing).."/"..tostring(v.maxPlayers))
							game:GetService("TeleportService"):TeleportToPlaceInstance(2317712696,tostring(v.id))
							wait(15)
						end
					else
						print(tostring(v.id).." | "..tostring(v.playing).."/"..tostring(v.maxPlayers))
					end
				end
				index = js(res.Body).nextPageCursor
			wait()end
			print("There are no servers with your settings or there might have been a critical flaw. If you think this is a bug please contact casual_degenerate#7475 or go to pZVMHtbZ6y",255,0,0)
		end
	end
)

FServer:Slider(
	"Max Players",
	{
		min = 1,
		max = 29,
		precise = false,
	}, 
	function(range)
		_G.MAXPLAYERS = range
	end
)

FServer:Toggle(
	"New Servers",
	function(bool)
		_G.NEWSERVERS = bool
	end
)



FBlant:Toggle(
	"Drip",
	function(bool)
		if bool then
			_G.WATERWALK = true
			coroutine.wrap(function()while _G.WATERWALK do
				if lplr.Character then
					if lplr.Character:FindFirstChild("Head") then
						game:GetService("ReplicatedStorage").Communication.Events.CreateWaterSplash:FireServer(lplr.Character.Head.Position)
					end
				end
			wait(.1)end;end)()
		else
			_G.WATERWALK = false
		end
	end
)

