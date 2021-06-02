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
_G.MINEAURA = false -- / Default off



-- / Namecall manipulation for grabbing remotes ;)
local mt = getrawmetatable(game) make_writeable(mt) local old = mt.__namecall
mt.__namecall = newcclosure(function(self,...)
	local args = {...} 
	
	return old(self,...)
end)


-- / UI
Fmining:Toggle(
	"Mine Aura", 
	function(bool)
		if bool then
			print("active")
			_G.MINEAURA = true
			coroutine.wrap(function()while _G.MINEAURA do -- / This is the function for mine aura, when you turn it off it will stop.
				if lplr.Character then
					if lplr.Character:FindFirstChild("Head") then
						for i1,v1 in next, game:GetService("Workspace")["WORKSPACE_Interactables"].Mining.OreDeposits:GetDescendants() do -- / This is a bit shit tbh, and I'll rewrite this later so it has all the ore deposits it can use in a table.
							if v1.Name:sub(-3) == "Ore" or v1.Name:sub(-4) == "Base" then
								if v1.Parent:FindFirstChild("DepositInfo") then
									if v1.Parent.DepositInfo:FindFirstChild("OreRemaining") then
										if v1.Parent.DepositInfo.OreRemaining.Value ~= 0 then
											if (game:GetService("Players").LocalPlayer.Character.Head.Position-v1.Position).Magnitude < 8 then -- / This is your client side reach(it will have a limit on server side)
												hit(v1)
												wait(.5) -- / Serverside has a cooldown around this.
											end
										end
									end
								end
							end
						end
					end
				end
			wait(.3)end;end)() -- / wait so it does not die for now. ALSO I have to make a coroutine because how this UI library works.
		else
			print("inactive")
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

