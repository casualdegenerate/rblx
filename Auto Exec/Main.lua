--game:GetService("CoreGui"):WaitForChild("RobloxLoadingGui"):Destroy()
--script.Name = "Main.lua"

local threads            = {}
getgenv().connections        = {}

local function logfile(content)
	local file = "cd/Log.txt"
	if not isfile(file)then
		writefile(file)
		repeat wait() until isfile(file)
	end
	appendfile(file,content.."\n")
end
--hookfunction(game:GetService("MarketplaceService").UserOwnsGamePassAsync,logfile)
---[[Checks
--local status,err = pcall(function()
	local banlands = {
		close = {
			6647166612,
		},
		disable = {
			698448212,
			4651456521,
		},
	}
	for i,v in pairs(banlands.close) do
		if game.PlaceId == v or game.CreatorId == v or game.GameId == v then
			repeat wait() until game:IsLoaded()
			logfile("0[DEBUG]: Client joined blacklisted(closed) game\t"..game.CreatorId.." "..game.GameId.." "..game.PlaceId.." "..game.JobId)
			game:Shutdown()
		end
	end
	for i,v in pairs(banlands.disable) do
		if game.PlaceId == v or game.CreatorId == v or game.GameId == v then
			logfile("0[DEBUG]: Client joined blacklisted(disabled) game\t"..game.CreatorId.." "..game.GameId.." "..game.PlaceId.." "..game.JobId)
			return
		end
	end

---[[Hide Name
threads["Hide Name"] = coroutine.create(function()
	local RainbowLoop = {}
	local Hue = 0
	game:GetService("CoreGui").DescendantAdded:connect(function(A)
		local status2,err2 = pcall(function()
			if A.ClassName==("TextLabel") then
				local Connection
				if A.Text:find("CasualDegenerate") then
					table.insert(RainbowLoop, A)
				else
					Connection = A:GetPropertyChangedSignal("Text"):Connect(function()
						if A.Text:find("CasualDegenerate") then
						   Connection:Disconnect()
							
							table.insert(RainbowLoop, A)
						end
					end)
				end
			end
		end)
		if not status2 then
			logfile("2[SCRIPT ERROR]: "..err2.."\n")
		end
	end)
	game:GetService("RunService").RenderStepped:Connect(function()
		local status2,err2 = pcall(function()
			for Index, Value in ipairs(RainbowLoop) do
				if Value:IsDescendantOf(game) then
					Value.TextColor3 = Color3.fromHSV(Hue, 1, 1) 
					Value.Text = Value.Text:gsub("CasualDegenerate","cd/")
				else
					table.remove(RainbowLoop, table.find(RainbowLoop, Value))
				end
			end
			Hue += 0.01
			if Hue > 1 then
				Hue = 0
			end 
		end)
		if not status2 then
			logfile("2[SCRIPT ERROR]: "..err2.."\n")
		end
	end)
end)

--]]

--Meat table

threads["Client COM Manipulation"] = coroutine.create(function()
	_G.owoToggle=false
	getgenv().chatbypass = false -- / Rather not >:(
	local owos = {
	  "luwu",
	  "lowo",
	  "^w^",
	  ">w<",
	  "(´•ω•`)",
	  "ヾ(＠＾▽＾＠)ﾉ",
	}
	local hyper_links = {}
	local players = game:GetService("Players")
	local function replace_link(string)
	  table.insert(hyper_links, string)
	  return "lowo" .. #hyper_links
	end
	local function trim(string)
	  return string.match(string, "^%s*(.-)%s*$")
	end
	local function switch(var) 
		if var then var = false else var = true end
	end
	local function owo_convert(speech)
	  local selected_owo = owos[math.random(1, #owos)]
	  local modifier = math.random(1, 5)
	  local output = ""
	  output = speech:gsub("|c.-|r", replace_link)
	  output = output:gsub("[LR]", "W")
	  output = output:gsub("[lr]", "w")
	  if modifier < 5 then
		output = output:gsub("U([^VW])", "UW%1")
		output = output:gsub("u([^vw])", "uw%1")
	  end
	  output = output:gsub("ith " , "if ")
	  output = output:gsub("([fps])([aeio]%w+)", "%1w%2") or output
	  output = output:gsub("n([aeiou]%w)", "ny%1") or output
	  output = output:gsub(" th", " d") or output
	  output = string.format(" %s ", output)
	  for character in string.gmatch(output, "%a+") do
		if math.random(1, 5) == 5 then
		  local first_character = character:sub(1, 1)
		  output = output:gsub(string.format(" %s ", character), string.format(" %s-%s ", first_character, character))
		end
	  end
	  output = trim(output)
	  output = modifier == 5 and output .. " " .. selected_owo or output:gsub("!$", " " .. selected_owo)
	  return output
	end
	local chat_remotes = {
	  "SayMessageRequest",
	  "PlayerChatted",
	  "Chatted",
	  "MessagePosted"
	}
	local mt = getrawmetatable(game) make_writeable(mt) local old = mt.__namecall
	mt.__namecall = newcclosure(function(self,...)
		local args = {...} 
		local m = getnamecallmethod() 
		if game.PlaceId == 3907722122 then
			if self.Name == "IsTyping" or self.Name == "Step" or self.Name == "Blink" or self.Name == "DecreaseBat" then
				return
			elseif self.Name == "SendLatency" then
				if args[1] == nil then
					return old(self,...)
				elseif type(args[1]) == "number" then
					return old(self,666)
				end

			end
		elseif game.PlaceId == 5279671694 or game.PlaceId == 4732111698 or game.PlaceId == 4261187249 or game.PlaceId == 2565760594 then --LOL
			if self.Name == "DamageEvent" then
				args[2].Health = 0
			end
		elseif game.PlaceId == 5130598377 then
			if self.Name == "Death" then
				return --haha funny
			end
		elseif game.PlaceId == 2753915549 then
			if self.Name == "RigControllerEvent" and args[1]=="hit" then
				args[2][1].Parent.Humanoid.Health = 0 
				return old(self,...)
			end
--[[
		elseif game.PlaceId == 333164326 then
			if self.Parent.Name == "JointsService" then
				if tostring(args[3]) == ":cdwashere" then
					args[3] = ":h hi:)"
					return old(self,args)
				end
			end
--]]
		elseif game.PlaceId == 6209557373 then
			if self.Parent then
				if self.Parent.Name == "SpiderMesh" then
					return
				end
			end
		end
		
		
		
		if true then
			if m == "FireServer" then
				for index, name in pairs(chat_remotes) do
					if self.Name == name then
						if args[1] == "owo" then
							if _G.owoToggle then
								_G.owoToggle = false
								return
							else
								_G.owoToggle = true
								return
							end
						end
						if _G.owoToggle==true then
							args[1] = owo_convert(args[1])
							return old(self,unpack(args))
						end
					end
				end
				if self.Name == "afkTog" and args[1] == true then
					return
				end
			end
		end
		
		
		
		
		if game.PlaceId ~= 2000062521 and true then
			if self.Name == "MessagePosted" and not args[1]:find("+rc") and chatbypass and not args[1]:sub(1,1)==":" then
				--logfile('0[DEBUG]: disallow messpost')
				return
			end
			if self.Name == "SayMessageRequest" and args[1]:find("+rc")or self.Name == "SayMessageRequest" and args[1]:sub(1,1)==":" then
				--logfile("0[DEBUG]: disallow sayreq")
				return
			end
		end
		
		return old(self,...)
	end)
end)


loadstring(
	[=====[
--LUAU ROBLOX LUA

--SynXLuaU
--[[ Deprecated for now.
if rconsoleprint then
	--messagebox("Hello SynX user.","cd/library",0)
	
end
--]]
--EXTERNAL LUAU
if getgenv then
	--Easy to write coroutine.
	getgenv().fspawn = function(f)
		coroutine.wrap(f) -- / 5.24.2021 Doing a wrap might work better?
	end
	--Easy to write frame wait.
	getgenv().fwait=function()
		game:GetService("RunService").RenderStepped:Wait()
	end
	--This should just be a function it's self in Lua.
	getgenv().stringtobyte = function(text)
		local output = ""
		for i=1,#text do
			output = output.."\\"..text:sub(i):byte()
		end
		return output
	end
	--This is the say request remote and won't fire any .Chatted connections. So pretty much most basic admin scripts(This includes chat loggers).
	getgenv().fchat = function(input)
		game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(input,"All")
	end
	--Real chat(works in vanilla games that don't mess with the .Chatted or say request remote.
	getgenv().rchat = function(input)
		if chatbypass then 
			getgenv().chatbypass = false
			game:GetService("Players"):Chat(input) 
			getgenv().chatbypass = true
		elseif _G.owoToggle then
			_G.owoToggle = false
			game:GetService("Players"):Chat(input) 
			_G.owoToggle = true
		end
	end
	getgenv().tchat = function(input)
		fchat(input)
		tchat(input)
	end
	--This is proof you are using my library(do you like the way I worded that >3<)
	getgenv().is_cd_caller = function()
		return true
	end
end
]=====])()

-- / The "API shit above" is no longer http so I don't need to wait :)
--repeat fwait() until fspawn and rchat 
--API shit above.



--anti afk.lua
threads["Anti AFK"] = coroutine.create(function()
	repeat wait() until game:IsLoaded()
	repeat wait() until game:GetService("Players").LocalPlayer

	local vu = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:connect(function()
	   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	   wait(1)
	   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end)
end)

--

--afk.lua
threads["afk.lua"] = coroutine.create(function()
	repeat wait() until game:IsLoaded()
	local var1 = false
	local games1 = {115670532,112420803}
	local s1 = "."
	game:GetService("UserInputService").WindowFocused:Connect(function()
		for _,id in pairs(games1) do
			if game.PlaceId == id then
				var1 = false
			end
		end
	end)
	game:GetService("UserInputService").WindowFocusReleased:Connect(function()
		var1 = true
		for _,id in pairs(games1) do
			if game.PlaceId == id then
				while var1 do
					for i=1,3 do
						game.Players:Chat('name me Loading'..s1:rep(i))
						if not var1 then break end --yes
					wait(1)end
				wait()end
				wait(1)
				rchat("unname me")
			end
		end
	end)
end)

--

---[[Thumbnail
threads["Watermark"] = coroutine.create(function()
	repeat wait() until game:IsLoaded()
	repeat wait() until workspace:FindFirstChild("Camera")
	if isfolder("CONFIG/Watermark") then
		local function str2hex(str)local o=''for i=1,#str do local h=string.format('%x',str:byte(i))local t=('00'):sub(tostring(h):len()+1)o=o..t..tostring(h)end return(o)end
		local images = listfiles('CONFIG/Watermark')
		local image  = readfile(images[math.random(1,#images)])
		local camera = workspace.CurrentCamera
		local width  = tonumber( str2hex(image:sub(17,20)),16)
		local width  = width   / 2
		local height = tonumber( str2hex(image:sub(21,24)),16)
		local height = height  / 2
		
		local function drawobjfunc1(obj)
			local function updateUDim()
				obj.Size = Vector2.new(width*(camera.ViewportSize.X/camera.ViewportSize.X),height*(camera.ViewportSize.Y/camera.ViewportSize.Y))
				obj.Position = Vector2.new(camera.ViewportSize.X*1-obj.Size.X,camera.ViewportSize.Y*1-obj.Size.Y)
			end
			updateUDim()
			obj.Transparency = .44
			obj.Visible = true
			--obje = 
			camera.Changed:connect(function(p)
				if p == "ViewportSize" then
					updateUDim()
				end
			end)
		end
		local cdImg = Drawing.new("Image")
		cdImg.Data = image
		drawobjfunc1(cdImg)
		--[[
		local outline = Drawing.new("Square")
		outline.Filled = false
		outline.Thickness = 6
		outline.Color = Color3.new(.1,.1,.1)
		
		drawobjfunc1(outline)
		--]]
	else
		logfile("0[DEBUG]: No image to use for thumbnail?")
	end
end)

--]]

--[[NekO's thing.
local status,err = pcall(function()
	repeat wait() until game:IsLoaded()
	return
	split=function(inputstr,sep)sep=sep or '%s'local t={}for field,s in string.gmatch(inputstr,"([^"..sep.."]*)("..sep.."?)")do table.insert(t,field)if s=="" then return t;end;end;end
	game.Players:Chat('h/Not A Debug Message')
	for a,b in pairs(game.Players:GetChildren())do 
	  local c=Instance.new("StringValue",b)
	  c.Name="LastMessage"
	  local db=false
	  b.Chatted:connect(function(d)
		local sMsg=split(d,' ')
		local that=d:sub(tostring(sMsg[1]):len()+tostring(sMsg[2]):len()+3)
		if c.Value==d and(that:find('10')or that:find('9')or that:find('8'))and d:gsub(' ','')~=''and(sMsg[1]=='size'or sMsg[1]==':size')then db=true
		  game.Players:Chat('reset all')game.Players:Chat('reset all')
		  wait(0.5)
		  db=false
		  wait(0.1)db=true;game.Players:Chat('h/heh')wait(0.1)db=false
		elseif d:gsub(' ','')~=''then
		  c.Value=d
		end
	  end)
	end
	game.Players.PlayerAdded:Connect(function(a)
	  local b=Instance.new("StringValue",a)
	  b.Name="LastMessage"
	  local db=false
	  a.Chatted:connect(function(c)
		local sMsg=split(c,' ')
		local that=c:sub(tostring(sMsg[1]):len()+tostring(sMsg[2]):len()+3)
		if b.Value==c and(that:find('10')or that:find('9')or that:find('8'))and c:gsub(' ','')~=''and(sMsg[1]=='size'or sMsg[1]==':size')then db=true
		  game.Players:Chat('reset all')game.Players:Chat('reset all')
		  wait(0.5)
		  db=false
		  wait(0.1)db=true;game.Players:Chat('h lmao')wait(0.1)db=false
		elseif c:gsub(' ','')~=''then
		  b.Value=c
		end
	  end)
	end)
end)
if not status then
	logfile("2[SCRIPT ERROR]: "..err.."\n")
end
--]]

--Kohl's Main
threads["AGS Patch"] = coroutine.create(function()
	repeat wait() until game:IsLoaded()
	if game.PlaceId ~= 115670532 and game.PlaceId ~= 112420803 then return end
	repeat wait()until fwait
	fspawn(function()
		local b=game:GetService("Workspace").Terrain["_Game"].Workspace:WaitForChild("Baseplate",5)
		if not b then
			return
		end
		b.Transparency = 1
	end)

	fspawn(function()
		HasMemeName = function(player)
			local start,_ = player.Name:find("_")
			if start ~= nil then
				for i2,v2 in pairs(game.Players:GetPlayers()) do
					if start ~= nil then
						if player.Name:lower():sub(1,start-1) == v2.Name:sub(1,start-1):lower() then
							return true
						end
					end
				end
			else
				for i2,v2 in pairs(game.Players:GetPlayers()) do
					local start,_ = v2.Name:find("_")
					if start ~= nil then
						if v2.Name:sub(1,start-1):lower() == player.Name:sub(1,start-1):lower() then
							return true
						end
					end
				end
			end
			return false
		end
		AntiVamp = function(player)
			if player.Character then
				player.Character.ChildAdded:connect(function(a)
					if a.Name == "VampireVanquisher" then
						for i = 1,5 do
							if not HasMemeName(player) then
								rchat('ungear '..player.Name.." robot.txt")
							else
								rchat("ungear all robot.txt")
							end
							wait()
						end
					end
				end)
				for _,v in pairs(player.Character:GetChildren()) do
					if v.Name == "VampireVanquisher" then
						for i = 1,5 do
							if not HasMemeName(player) then
								rchat('ungear '..player.Name.." robot.txt")
							else
								rchat("ungear all robot.txt")
							end
							wait()
						end
					end
				end
			end
			player.CharacterAdded:connect(function(c)
				c.ChildAdded:connect(function(a)
					if a.Name == "VampireVanquisher" then
						for i = 1,5 do
							if not HasMemeName(player) then
								rchat('ungear '..player.Name.." robot.txt")
							else
								rchat("ungear all robot.txt")
							end
							wait()
						end
					end
				end)
				player.Backpack.ChildAdded:connect(function(t)
					if t.Name == "VampireVanquisher" then
						for i = 1,5 do
							if not HasMemeName(player) then
								rchat('ungear '..player.Name.." robot.txt")
							else
								rchat("ungear all robot.txt")
							end
							wait()
						end
					end
				end)
			end)
		end
		AntiIce = function(player)
			if player.Character then
				player.Character.ChildAdded:connect(function(a)
					if a.Name == "ice" then
						for i = 1,5 do
							if not HasMemeName(player) then
								rchat('reload '..player.Name)
							else
								rchat("reload all")
							end
							wait()
						end
					end
				end)
			end
			player.CharacterAdded:connect(function(c)
				c.ChildAdded:connect(function(a)
					if a.Name == "ice" then
						for i = 1,5 do
							if not HasMemeName(player) then
								rchat('reload '..player.Name)
							else
								rchat("reload all")
							end
							wait()
						end
					end
				end)
			end)
		end
		game:GetService("Players").PlayerAdded:connect(function(v)
			AntiIce(v)
			AntiVamp(v)
		end)
		game:GetService("Workspace").ChildAdded:connect(function(c)
			if c.ClassName==("Tool") then
				if c.Name == "VampireVanquisher" then
					rchat("Clear robot.txt")
				end
			end
		end)
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			AntiIce(v)
			AntiVamp(v)
		end
	end)
	fspawn(function()
		local Disco = Instance.new("Folder",game:GetService("Workspace"))
		Disco.Name = "Baseplatev3"
		local xm = 100
		local zm = 100
		for x=1,xm do --wait()
			for z=1,zm do
				local p = Instance.new("Part")
				--local s = Instance.new("SelectionBox")
				p.Anchored = true
				p.Name = "Disco Part"
				p.Size = Vector3.new(2048,6,2048)
				p.Position = Vector3.new(-1*(xm*2048/2)+x*p.Size.X*1.001,-2,-1*(zm*2048/2)+z*p.Size.Z*1.001)
				p.Material = Enum.Material.Neon
				p.Color = Color3.new(0,0,0)
				
				--s.Adornee = p
				--s.LineThickness = .2
				--s.Color3 = Color3.fromRGB(127,0,128)
				
				--s.Parent = Disco
				p.Parent = Disco
			end
		end
		repeat wait() until game:GetService("Workspace"):FindFirstChild("Terrain")
		repeat wait() until game:GetService("Workspace").Terrain:FindFirstChild("_Game")
		while true do 
			if game:GetService("Workspace").Terrain._Game.Workspace:FindFirstChild("Baseplate") then 
				game:GetService("Workspace").Terrain._Game.Workspace.Baseplate:Destroy()
			else
				break
			end
		fwait()end
	end)
	fspawn(function()
		repeat wait() until game:GetService("CoreGui"):FindFirstChild("RobloxLoadingGui")
		game:GetService("CoreGui").RobloxLoadingGui:Destroy()
	end)
	fspawn(function()
		game:GetService("UserInputService").MouseDeltaSensitivity = 1
	end)
end)

--

--[[Cheat Detection
fspawn(function()
	if false then 
		for i,v in pairs(game:GetService("Workspace"):GetDescendants())do
			
		end
	end
end)
--]]

--[[Rebind
fspawn(function()
	getgenv().cd.aa = true
	local mt = getrawmetatable(game) make_writeable(mt) local old = mt.__namecall
	mt.__namecall = newcclosure(function(self,...)
		if getgenv().cd.aa then
			if not self.ClassName==("BasePart")then
				rconsoleprint("self: "..tostring(self).."\tL: "..self.ClassName.."\tType: "..type(self).."\tData\n")
				for i,v in pairs({...})do
					rconsoleprint(tostring(i).."\t"..tostring(v))
				end
			end
		end
		return old(self,...)
	end)
end)
--]]

--[[Discord Rich PRESCENSE
fspawn(function()
	local file = "Dumb Stuff/Info.txt"
	repeat wait(.5) until game:IsLoaded()
	writefile(file,tostring(game.PlaceId))
	game:GetService("Players").PlayerRemoving:connect(function(p)
		if p == game:GetService("Players").LocalPlayer then
			writefile(file,"")
		end
	end)
end)
--]]

--[[Crystal KEKW (edit: he patched it :sadface:)
fspawn(function()
	local CrystalScript
	local CrystalScriptLoaded = false
	local BXor32 = bit32.bxor

	hookfunction(bit32.bxor, function(...)
		if checkcaller() then return BXor32(bit32, ...) end
		
		return BXor32(...)
	end)
end)
--]]


---[[Chat Logger
threads["Chat Logger"] = coroutine.create(function()
	while not game:IsLoaded()do wait()end
	------------------------------------------------------
	_G.cLogSettings={
		dateformat = true,
		spamCut = 30,
		clrSpeed = 1,
		holdFor = 60
	}
	local activeConnected=true
	local saidLeave=false
	local localPlrName=game:GetService('Players').LocalPlayer.Name
	------------------------------------------------------
	local AntiSpam={}
	local timDate=os.date('%Y-%m-%d')
	local logFile=os.date('%H-%M-%S').."_"..tostring(game.PlaceId)..'.txt'
	local function createFile(file)
		local splits = file:split("/")
		local dir = ""
		local function func1(a,b)
			a = a..b
			if not isfile(a) then
				makefolder(a)
			end
			return a
		end
		for i,v in pairs(splits) do
			if i~=#splits and v:sub(-4) ~= ".txt" then
				dir = func1(dir,v)
				dir = dir.."/"
			elseif v:sub(-4) ~= ".txt" then
				dir = func1(dir,v)
			else
				writefile(dir..v,"")
			end
		end
	end
	------------------------------------------------------
	local file = ""
	if _G.cLogSettings.dateformat then
		file = "cd/ChatLog/"..timDate.."/"..logFile
		if not isfile(file) then createFile(file) end
		  local x={}
		  for i,v in pairs(game:GetService("Players"):GetPlayers())do table.insert(x,'[ '..v.Name..(' '):rep(20):sub(v.Name:len()+1)..'|'..(' '):rep(10):sub(tostring(v.UserId):len()+1)..tostring(v.UserId)..' ]')end
		  writefile(file,'V1.2\nGame  : '..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name..'\nGameID: '..tostring(game.PlaceId)..'\nServerID: '..game.JobId..'\nTime  : '..os.date('%Y/%m/%d-%H:%M:%S')..'\n| |  |  | - |  |  | |\nConnected Players:\n'..table.concat(x,'\n')..'\n\n--- [CLog];Start. ---\n')
	else
	end
	if file == "" then
		return
	end
	repeat wait() until isfile(file)
	------------------------------------------------------
	coroutine.resume(coroutine.create(function()
		while wait((tonumber(_G.cLogSettings.clrSpeed)or 1))do
			for i in pairs(AntiSpam)do
				AntiSpam[i]=AntiSpam[i]-1
			end
		end
	end))
	local function func2(plr)
		AntiSpam[tostring(plr.UserId)]=0
		plr.Chatted:connect(function(msg)
			AntiSpam[tostring(plr.UserId)]=AntiSpam[tostring(plr.UserId)]+1
			if AntiSpam[tostring(plr.UserId)]<=_G.cLogSettings.spamCut then
				local userSaid='['..plr.Name..'|'..tostring(plr.UserId)..']: 'userSaid=(' '):rep(34):sub(userSaid:len()+1)..userSaid
				appendfile(file,'\n{'..os.date('%Y/%m/%d-%H:%M:%S')..'} # '..userSaid..msg:gsub('[\n\r]','\\n'))
			end
		end)
	end
	for _,plr in pairs(game.Players:GetChildren())do
		func2(plr)
	end
	game:GetService('Players').PlayerAdded:Connect(function(plr)
		local userSaid='['..plr.Name..(' '):rep(20):sub(plr.Name:len()+1)..'|'..(' '):rep(10):sub(tostring(plr.UserId):len()+1)..tostring(plr.UserId)..']--'
		appendfile(file,'\n{'..os.date('%Y/%m/%d-%H:%M:%S')..'} # '..userSaid..'(Connected)')
		func2(plr)
	end)
	game:GetService('Players').PlayerRemoving:Connect(function(plr)
		if plr.Name==localPlrName and activeConnected then activeConnected=false
			local userSaid='['..plr.Name..(' '):rep(20):sub(plr.Name:len()+1)..'|'..(' '):rep(10):sub(tostring(plr.UserId):len()+1)..tostring(plr.UserId)..']--'
			appendfile(file,'\n{'..os.date('%Y/%m/%d-%H:%M:%S')..'} # '..userSaid..'(Disconnected)')
			wait(_G.cLogSettings.holdFor)
			if not game:GetService('Players'):FindFirstChild(plr.Name)then
				AntiSpam[tostring(plr.UserId)]=nil
			end
		end
		if not activeConnected and not saidLeave then saidLeave=true
			appendfile(file,'\n\n-- [CLog];Stopped. --\n\nTime: '..os.date('%Y/%m/%d-%H:%M:%S'))
		end
	end)
end)
--]]

---[[Was bored so I killed a few games?
coroutine.resume(coroutine.create(function()
repeat wait() until game:IsLoaded()
repeat wait() until game:GetService("Players").LocalPlayer
local JSOND = function(a)return game:GetService("HttpService"):JSONDecode(a)end

if game.PlaceId == 5780800069 then
	UserSettings():GetService("UserGameSettings").MasterVolume = 0 --Shit get's loud ingame.
	repeat wait() until game:GetService("ReplicatedStorage"):FindFirstChild("Assets")
	repeat wait() until game:GetService("ReplicatedStorage").Assets:FindFirstChild("OtherEvents")
	repeat wait() until game:GetService("ReplicatedStorage").Assets.OtherEvents:FindFirstChild("Shop")
	repeat wait(1) until game:GetService("Players").LocalPlayer.Character
	wait(10)
	game:GetService("Workspace").ChildAdded:connect(function(c)
		if c.Name == "Stand Arrow"and c.ClassName==("Tool")then
			fwait()c:Remove()
		end
	end)

	game:GetService("Players").LocalPlayer.Backpack.ChildAdded:connect(function(c)
		if c.ClassName==("Tool")then
			wait()c.Parent = game:GetService("Players").LocalPlayer.Character
			wait()c.Parent = workspace
		end
	end)

	game:GetService("Players").LocalPlayer.Character["Right Arm"].ChildAdded:connect(function(c)
		if c.Name == "RightGrip"then
			wait()c:Destroy()
		end
	end)

	for i = 1, 1000 do
		game:GetService("ReplicatedStorage").Assets.OtherEvents.Shop:FireServer("StandArrow")
	end
	local i1 = tick()
	while #game:GetService("Players"):GetPlayers()>6 and i1+120 > tick() do fwait() end
	while true do
		local h = syn.request{Url = "https://games.roblox.com/v1/games/"..tostring(game.PlaceId).."/servers/Public?sortOrder=Asc&limit=100", Method = "GET"}
		if h.StatusCode == 200 then
			local data = JSOND(h.Body).data
			for i,v in pairs(data)do
				if v.playing< 14 and v.playing>10 then
					game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id)
					break
				end
			end
		end
	for i=1,10 do fwait()end end
elseif game.PlaceId == 4617883539 and true then
	UserSettings():GetService("UserGameSettings").MasterVolume = 0
	--wait(math.random(30,60))
	local crash1 = game:GetService("ReplicatedStorage"):WaitForChild("Anchor",10)
	if not crash1 then return "fuck" end
	function lock(plr)
		local status2,err2 = pcall(function()
			if plr.Character then
				for i,v in pairs(plr.Character:GetDescendants())do
					if v.ClassName==("BasePart")then
						v.Changed:connect(function(a)
							if tostring(a) == "Anchored" then
								if v.Anchored == false then
									game:GetService("ReplicatedStorage").Anchor:FireServer(v,true)
								end
							end
						end)
						game:GetService("ReplicatedStorage").Anchor:FireServer(v,true)
					end
				end
			end
		end)
		if not status2 then
			logfile("2[SCRIPT ERROR]: "..err2.."\n")
		end
	end
	function fire()
		for i1,plr in pairs(game:GetService("Players"):GetPlayers())do
			lock(plr)
			plr.CharacterAdded:connect(function(chr)
				local status2, err2 = pcall(function()
					wait(.3)
					if chr then
						lock(plr)
					end
				end)
				if not status2 then
					logfile("2[SCRIPT ERROR]: "..err2.."\n")
				end
			end)
		end

		game:GetService("Players").PlayerAdded:connect(function(plr)
			local status2, err2 = pcall(function()
				repeat wait() until plr.Character
				lock(plr)
				plr.CharacterAdded:connect(function(chr)
					local status3, err3 = pcall(function()
						wait(.3)
						if chr then
							lock(plr)
						end
					end)
					if not status3 then
						logfile("2[SCRIPT ERROR]: "..err3.."\n")
					end
				end)
			end)
			if not status2 then
				logfile("2[SCRIPT ERROR]: "..err2.."\n")
			end
		end)
	end
	repeat wait() until game:GetService("Lighting").TS.Value == true
	fire()
end
end))
--]]

---[[Kaderth's Admin House
threads["Kaderth's Admin House Patch"] = coroutine.create(function()
	repeat wait() until game:IsLoaded() and game:GetService("Players").LocalPlayer
	local lplr = game:GetService("Players").LocalPlayer
	if game.PlaceId ~= 333164326 then return end
	local targetJobId = ''
	getgenv().removebuilds = true
	if removebuilds then
		coroutine.wrap(function()
			if game:GetService("Workspace"):FindFirstChild('BuildingBlocks')then
			  game:GetService("Workspace").BuildingBlocks:Destroy()
			end
			function plrFromChr(character)for _, player in pairs(game:GetService("Players"):GetPlayers())do if player.Character==character then return(player)end end end
			--while removebuilds do
				for i,v in pairs(workspace:GetChildren())do
					if not plrFromChr(v)and v.ClassName~='Camera'and v.ClassName~='Terrain'and v.Name~='SecureParts'and not v.Name:match('^'..tostring(game:GetService('Players').LocalPlayer.Name)..'_ADONISJAIL$') and v.ClassName ~= 'Sound' then
						v:Destroy()
					end
				end
				for i,v in pairs(workspace:GetDescendants())do
					if v.ClassName=='Smoke'or v.ClassName=='Fire'then
						v:Destroy()
					  elseif v.ClassName=='ForceField'then
						v.Visible = false
					  elseif v.ClassName=='Sound'then
						if v.Volume ~= .1 then v.Volume = .1 end
					end
				end
			game:GetService('RunService').RenderStepped:connect(function()
				for i,v in pairs(workspace:GetChildren())do
					if not plrFromChr(v)and v.ClassName~='Camera'and v.ClassName~='Terrain'and v.Name~='SecureParts'and not v.Name:match('^'..tostring(game:GetService('Players').LocalPlayer.Name)..'_ADONISJAIL$') and v.ClassName ~= 'Sound' then
						print(v)v:Destroy()
					end
					if v.Name == (lplr.Name.."_ADONISJAIL") then
						for i1,v1 in pairs(v:GetDescendants()) do
							if v1.ClassName == "BasePart" then
								if admin then
									v1.Color = Color3.new(0,1,0)
								else
									v1.Color = Color3.new(1,0,0)
								end
								v1.Transparency = 0.8
								v1.CanCollide = false
							end
						end
					end
				end
				for i,v in pairs(workspace:GetDescendants())do local a=""
					if v.ClassName=='Smoke'then
						v:Destroy()
					  elseif v.ClassName=='ForceField'then
						v.Visible = false
					  elseif v.ClassName=='Sound'then
						if v.Volume ~= .1 then v.Volume = .1 end
					end
				end
			end)
			--end
		end)()
	end
	--game:GetService("GuiService").IsWindows = false
	settings():GetService("PhysicsSettings").AreAnchorsShown = true
	if targetJobId ~= '' then
		if game.JobId ~= targetJobId then 
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, targetJobId)
		end
	end
	local cmdbox
	local LS = game:GetService("Lighting")
	local antilogger1 = "0000000000000"
	antilogger1 = antilogger1:rep(20)
	local jaildebounce = 0
	local icedebounce = 0
	local admindebounce = 0
	local resetdebounce = 0
	local unpunishdebounce = 0
	local velocitydebounce = 0
	local VampireVanquisherfixdebounce = 0
	local fixcharacterdebounce = 0
	local camerafixdebounce = 0
	local f3xrainbow = 0
	local firstrun = true
	local troll = false
	local permadmin
	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(lplr.UserId, 1293677) then
		permadmin = true
	else
		permadmin = false
	end
	local fixed = {}
	fixed.speed = true
	local banlist = {"Lendiz","DeAnxgelo","azizaziz150","GreenGoldenCat","Hong_williamisnoob","Pine_Josh","Kittenpower45677","Glel667","Glel6677","SoIdotna","TheMegGaming","JohnLePro1108","Bacon_Guy10100","Baqacc","derleereHerr"}
	local whitelist = {lplr.Name,"KlownCrimson"}
	local commandrequest = {}
	local rubberband
	local rubberbandrotation
	repeat fwait() until lplr.Character
	local hrp = lplr.Character:WaitForChild("HumanoidRootPart",1)
	if hrp then
		rubberband = hrp.Position
		rubberbandrotation = hrp.Rotation
	else
		rubberband = Vector3.new(0,25,0)
		rubberbandrotation = CFrame.Angles(0,0,0)
	end
	local rubberbandc
	local rubberbandcf
	local camera = workspace:WaitForChild("Camera",1)
	if camera then
		rubberbandc = camera.CFrame
	else
		rubberbandcf = camera.Focus
	end
	getgenv().rubber = true
	getgenv().songs = readfile("cd/Config/Music.txt"):split("\n")
	getgenv().songsn = {}
	getgenv().hideme = false
	getgenv().serverhop = true
	if lplr.Name ~= "CasualDegenerate" then
		getgenv().hideme = true
	end




	--Functions

	local function output(inp)
		if not hideme then
			rchat(":chatnotifyc me 255 0 255 "..inp)
		end
	end

	local function request(t)
		local cookie='.ROBLOSECURITY=_|WARNING:-DO-NOT-SHARE-THIS.--Sharing-this-will-allow-someone-to-log-in-as-you-and-to-steal-your-ROBUX-and-items.|_'
		local res = syn.request({
			Url = t.Url,
			Method = t.Method,
			Headers = {
				['cookie']=cookie,
				['User-Agent']='Dino/6.9 (Hackintosh; Hack) AppleWebKit/537.36 (KHTML, like Gecko) MSIE/8.0 Safari/537.36',
			}
		})
		local body 
		local a,b = pcall(function()
			body = game:GetService("HttpService"):JSONDecode(res.Body)
		end)
		if a then 
			return res,body
		else
			rconsoleprint(tostring(b).."\n")
			logfile(tostring(b))
		end
	end

	local function findf3x()
		if lplr.Backpack:FindFirstChild("Folder") then
			if lplr.Backpack.Folder:FindFirstChild("SyncAPI") then
				if lplr.Backpack.Folder.SyncAPI:FindFirstChild("ServerEndpoint") then
					f3x = lplr.Backpack.Folder.SyncAPI.ServerEndpoint
				end
			end
		end
	end

	local function f3xRemove(chr)
		if lplr:WaitForChild("Backpack") then
			while not f3x or not lplr.Backpack:FindFirstChild("Building Tools") do
				rchat(":f3x")
				wait(.5)
				findf3x()
			end
		end
		f3x:InvokeServer("Remove",{chr})
	end


	local Folder = workspace:WaitForChild("SecureParts",10)
	if not Folder then 
		logfile("1[SCRIPT WARN]: Kaderth's Admin House Folder does not exist")
		return
	end
	local baseplate = Folder:WaitForChild("Baseplate",5)
	if not baseplate then
		for i,v in pairs(workspace:GetChildren()) do
			if v.Name == "SecureParts" and v.ClassName == "Model" then
				if v:FindFirstChild("Baseplate") then
					Folder = v
					break
				end
			end
		end
	end
	local pads = Folder:WaitForChild("AdminPads",10)
	if not pads then
		logfile("1[SCRIPT WARN]: Kaderth's Admin huose AdminPads does not exist")
		return
	end

	--Wait times
	coroutine.wrap(function()
		while wait() do
			
			coroutine.wrap(function()
				if not permadmin then
					admindebounce = admindebounce+1
					if admindebounce < 60 then return end
					if pads:FindFirstChild(lplr.Name.."'s admin") then
						admin = true
						getgenv().rubber = true
					else
						admin = false
						getgenv().rubber = false
					end
					if admin then 
						return
					end
					if lplr.Character then 
						if lplr.Character:FindFirstChild("HumanoidRootPart") then 
							for i,v in pairs(pads:GetChildren())do
								if v.Name == "Touch to get admin"and v:FindFirstChild("Head") then
									lplr.Character.HumanoidRootPart.CFrame = CFrame.new(v.Head.Position + Vector3.new(0,5,0))
									firetouchinterest(lplr.Character.HumanoidRootPart,v.Head,0)
									firetouchinterest(lplr.Character.HumanoidRootPart,v.Head,1)
									admindebounce = 0
									break
								end
							end
						end
					end
				elseif not admin then
					admin = true
				end
			end)()
			
			
			coroutine.wrap(function()
				jaildebounce = jaildebounce+1
				icedebounce = icedebounce+1
				if jaildebounce > 30 then
					jaildebounce = 0
					if workspace:FindFirstChild(lplr.Name.."_ADONISJAIL") then
						if admin then rchat(":unjail me") end
						for i,v in pairs(workspace[lplr.Name.."_ADONISJAIL"]:GetDescendants())do
							if v.ClassName==("BasePart") then
								v.CanCollide = false
								v.Transparency = 0.96
								if admin then
									v.Color = Color3.new(0,1,0)
								else
									v.Color = Color3.new(1,0,0)
								end
								return
							end
						end
					end
				end
			end)()
			
			coroutine.wrap(function()
				while not admin do wait(.3) end
				if firstrun and not hideme then
					--rchat(":talk all @casual_degenerate#7475")
					rchat(":runc scriptinfo0")
					output("./cd/Main.lua ran by "..lplr.Name)
					firstrun = false
					wait(1)
					--local scamble = "@casual_degenerate#7475 was here"
					--for i=1,100 do
					--	rchat(scamble)
					--end
					--for i=1,100 do
					--	rchat(":unff @casual_degenerate#7475 was here "..i)
					--end
				end
			end)()
			
			
			
			coroutine.wrap(function()
				resetdebounce=resetdebounce+1
				if lplr.Character then
					if lplr.Character:FindFirstChild("Part") then
						lplr.Character.Part:Destroy()
					end
					if lplr.Character:FindFirstChild("Humanoid") then
						if lplr.Character.Humanoid.Health == 0 then
							if admin and resetdebounce > 200 then
								local hrp = lplr.Character:WaitForChild("HumanoidRootPart",5)
								local prevh = lplr.Character.HumanoidRootPart
								local prevcf = prevh.CFrame
								rchat(":reset me")
								resetdebounce = 0
								while prevh do fwait() end
								if not hrp then return end
								hrp.CFrame = prevcf
							end
						end
						if lplr.Character.Humanoid.WalkSpeed ~= 16 then
							lplr.Character.Humanoid.WalkSpeed = 16
						end
						if lplr.Character.Humanoid.Sit == true then
							lplr.Character.Humanoid.Sit = false 
						end
						if lplr.Character.Humanoid.PlatformStand == true then
							lplr.Character.Humanoid.PlatformStand = false
						end
						if lplr.Character.Humanoid:FindFirstChild("ADONIS_NoClip") then
							lplr.Character.Humanoid.ADONIS_NoClip.Disabled = true
							lplr.Character.Humanoid.ADONIS_NoClip:Destroy()
						end
					end
				end
			end)()
			
			coroutine.wrap(function()
				camerafixdebounce = camerafixdebounce + 1
				if workspace:FindFirstChild("Camera") then
					if workspace.Camera.FieldOfView ~= 70 then
						workspace.Camera.FieldOfView = 70
					end
					if workspace.Camera.CameraSubject.Name:find("ADONIS_LOCALCAMERA") and camerafixdebounce>120 then
						rchat(":re")
						camerafixdebounce = 0
					end
				end
			end)()
			
			---[[
			
			--]]
			
			
			--[[Crash why? Don't need it.
			coroutine.wrap(function()
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if i~=1 then
						if v.Character then
							for i1,v1 in pairs(v.Character:GetChildren()) do
								if v1.Name ~= "HumanoidRootPart" and v1.Transparency == 1 then
									if v1.Transparency ~= .3 then
										v1.Transparency = .3
									end
									if v1.Material ~= Enum.Material.Glass then
										v1.Material = Enum.Material.Glass
									end
								end
							end
						end
					end
				end
			end)()
			--]]
			
			coroutine.wrap(function()
				unpunishdebounce = unpunishdebounce + 1
				fixcharacterdebounce = fixcharacterdebounce + 1
				if lplr.Character then
					if lplr.Character.Parent == LS and unpunishdebounce > 120 then
						if admin then
							rchat(":unpunish me")
							unpunishdebounce=0
						end
					end
				elseif fixcharacterdebounce > 120 then
					rchat(":re")
					fixcharacterdebounce = 0
				end
			end)()
			
			coroutine.wrap(function()
				local waitchild = Folder:WaitForChild("Lava",10)
				if waitchild then
					for i,v in pairs(Folder.Lava:GetChildren())do
						if v:WaitForChild("Kill",10) then
							if v.Kill:WaitForChild("TouchInterest",10) then
								v.Kill.TouchInterest:Remove()
							end
						end
					end
				end
			end)()
			
			coroutine.wrap(function()
				velocitydebounce = velocitydebounce+1
				if velocitydebounce > 120 then
					for i,v in pairs(workspace.SecureParts:GetDescendants()) do
						if v.ClassName==("BasePart") then
							if v.Velocity ~= Vector3.new(0,0,0) then
								v.Velocity = Vector3.new(0,0,0)
							end
						end
					end
					for i,v in pairs(workspace.SecureParts:GetChildren()) do
						if v.ClassName==("BasePart") then
							if v.Velocity ~= Vector3.new(0,0,0) then
								v.Velocity = Vector3.new(0,0,0)
							end
						end
					end
					velocitydebounce = 0
				end
			end)()
			
			-- // Fixes VampireVanquisher from breaking the camera
			coroutine.wrap(function()
				VampireVanquisherfixdebounce = VampireVanquisherfixdebounce+1
				if workspace.Camera.CameraType == Enum.CameraType.Scriptable then
					if admin and VampireVanquisherfixdebounce > 120 then
						rchat(":re")
						VampireVanquisherfixdebounce=0
					end
				end
			end)()
			
			coroutine.wrap(function()
				local function rainbow(plr)
					local plr = game:GetService("Players"):FindFirstChild(plr)
					if plr then
						if plr.Character then
							if plr.Character:FindFirstChild("Building Tools") then
								if plr.Character["Building Tools"]:FindFirstChild("Handle") then
									if plr.Character["Building Tools"].Handle.Locked == false then
										if f3xrainbow > 1 then 
											f3xrainbow = 0
										else
											f3xrainbow=f3xrainbow+0.01
										end
										local ohTable2 = {
											[1] = {
												["Color"] = Color3.fromHSV(f3xrainbow,1,1),
												["Part"] = workspace.CasualDegenerate["Building Tools"].Handle,
												["UnionColoring"] = true
											}
										}
										game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer("SyncColor", ohTable2)
									end
								end
							end
						end
					end
				end
				rainbow(lplr.Name)
				--rainbow("Cr0ckee")
			end)()
			
			
			--game:GetService("GuiService"):ClearError()
			
			
			
		end
	end)()

	--[[
	coroutine.wrap(function()
		while true do
			if commanddebounce<10 then
				local command = next(commandrequest,nil)
				if command ~= nil then
					rchat(command)
					commanddebounce=commanddebounce+1
				end
			end
		fwait()end
	end)()

	coroutine.wrap(function()
		while wait(1) do
			commanddebounce = commanddebounce - 1
		end
	end)()
	--]]


	---[[
	game:GetService("RunService").RenderStepped:connect(function()
		--Rubberband
		coroutine.wrap(function()
			if rubber then
				if lplr.Character then
					if lplr.Character:FindFirstChild("HumanoidRootPart") then
						if (lplr.Character.HumanoidRootPart.Position-rubberband).Magnitude > 5 then
							print((lplr.Character.HumanoidRootPart.Position-rubberband).Magnitude)
							lplr.Character.HumanoidRootPart.CFrame = CFrame.new(rubberband) * CFrame.Angles(math.rad(rubberbandrotation.X),math.rad(rubberbandrotation.Y),math.rad(rubberbandrotation.Z))
							camera.CFrame = rubberbandc
							camera.Focus = rubberbandcf
						else
							rubberband = lplr.Character.HumanoidRootPart.Position
							rubberbandrotation = lplr.Character.HumanoidRootPart.Rotation
							rubberbandc = camera.CFrame
							rubberbandcf = camera.Focus
						end
					end
				end
			end
		end)()
		
		--Fix my eyes
		coroutine.wrap(function()
			if LS.FogEnd ~= tonumber'inf' then 
				LS.FogEnd = tonumber'inf' 
			end
			if LS.FogStart ~= tonumber'inf' then
				LS.FogStart = tonumber'inf'
			end
			if LS.Brightness ~= 3 then
				LS.Brightness = 3
			end
			if LS.Ambient ~= Color3.fromRGB(138,138,138) then
				LS.Ambient = Color3.fromRGB(138,138,138)
			end
			if LS.OutdoorAmbient ~= Color3.fromRGB(128,128,128) then
				LS.OutdoorAmbient = Color3.fromRGB(128,128,128)
			end
			if LS.FogColor ~= Color3.fromRGB(138,138,138) then
				LS.FogColor = Color3.fromRGB(138,138,138)
			end
		end)()
		
		--Fix camera zoom zoom
		coroutine.wrap(function()
			if lplr.CameraMaxZoomDistance ~= tonumber'inf' then
				lplr.CameraMaxZoomDistance = tonumber'inf'
			end
		end)()
		
		--Patches over character
		coroutine.wrap(function()
			if lplr.Character then
				if lplr.Character:FindFirstChild("HumanoidRootPart") then
					if lplr.Character.HumanoidRootPart.Position.Y < -50 then
						rubber=false
						lplr.Character.HumanoidRootPart.CFrame = CFrame.new(0,25,0)
						rubberband = lplr.Character.HumanoidRootPart.Position
						fwait()
						rubber=true
					end
					if lplr.Character.HumanoidRootPart:FindFirstChild("Glitchify") then
						lplr.Character.HumanoidRootPart.Glitchify.Disabled = true
						lplr.Character.HumanoidRootPart.Glitchify:Destroy()
					end
					if lplr.Character.HumanoidRootPart:FindFirstChild("Black Hole Gravitation") then
						lplr.Character.HumanoidRootPart["Black Hole Gravitation"]:Destroy()
					end
					for i1,v1 in pairs(lplr.Character.HumanoidRootPart:GetChildren()) do
						if v1.Name == "SUPER_FLING" or v1.Name == "ADONIS_GRAVITY" then
							v1.Disabled = true
							v1:Destroy()
						end
					end
				end
			end
		end)()
		
		--[[Find CommandBox
		coroutine.wrap(function()
			
		end)()--]]
		
			
	end)

	--bans
	coroutine.wrap(function()
		while true do
			for _,c in pairs(workspace:GetChildren()) do
				for i,v in pairs(banlist) do
					if v == c.Name then
						f3xRemove(c)
					end
				end
			end
		wait(1)end
	end)()
	--]]
	--[[
	LS.Changed:connect(function()
		if LSC then
			
		end
	end)
	--]]
	workspace.Camera.ChildAdded:connect(function(c)
		if c.Name == "GrayScale" then
			wait(6)
			if c.Parent ~= nil then
				c:Destroy()
			end
		elseif c.ClassName == "Explosion" then
			fwait()c:Destroy()
		end
	end)

	--Remove Velocity.
	coroutine.wrap(function()
		for i,v in pairs(workspace.SecureParts:GetDescendants()) do
			if v.ClassName == "Part" then
				v.Velocity = Vector3.new(0,0,0)
				v.Changed:connect(function()
					if v.Velocity ~= Vector3.new(0,0,0) then
						v.Velocity = Vector3.new(0,0,0)
					end
				end)
			end
		end
	end)()

	lplr.PlayerGui.DescendantAdded:connect(function(c)
		if c.Name == "CameraShake" then
			c.Disabled = true
			fwait()c:Destroy()
		end
		if c.ClassName==("TextLabel") then
			if c.Text:find("Follow: ") then
				if c.Parent then
					if c.Parent.Parent then
						if c.Parent.Parent ~= nil then
							fwait()c.Parent.Parent:Destroy()
						end
					end
				end
			end
		end
		if c.ClassName == "TextLabel" then
			if c.Text == "Command Box" then
				cmdbox = c.Parent.Parent.Parent
			end
		end
	end)
	---[[
	lplr.CharacterAdded:connect(function(chr)
		--[[
		rubber = false
		local hrp = chr:WaitForChild("HumanoidRootPart",5)
		local min = Vector3.new(29.6996, 23, -54.1994)
		local max = Vector3.new(-32.8061, 68.321, 51.593)
		local region = Region3.new(min,max)
		
		if hrp then
			if rubberband 
				hrp.CFrame = CFrame.new(50,20,0)
			end
		end
		--]]
		if admin then
			rchat(":ff me")
		end
		local hrp = chr:WaitForChild("Head",5)
		if hrp then
			hrp.Changed:connect(function()
				if hrp.Anchored == true then
					rchat(":thaw me")
				end
			end)
		end
	end)
	--]]

	--[[
	coroutine.wrap(function()
		for i=1,10 do
			local hehe = false
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v.Parent ~= game:GetService("Lighting") then
					hehe = true
				end
			end
			if hehe and admin then
				rchat(":punish others")
			end
		wait(10)end
		local res,body = syn.request(Url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100", Method = "GET")
		print(res,body)
	end)()
	--]]
	--[[
	coroutine.wrap(function()
		while false do
			local snipe = {
				"WhyamIthenoobhere",
				"Lendiz",
				"FIuenza",
				"GreenGoldenCat",
				"Ciocks157",
				"English_UK",
				"Hong_williamisnoob",
				--"GX56X",
				"EyezOnMyGwoppa",
				"PartyDontStopXd",
				"Mybedmyroom",
				"Bacon_Guy10100",
				"Error_279brother",
				"azizaziz150",
				"PaperHasWhiteTrash",
				"pigpaintgun1",
				"almdral666",
				--""
			}
			
			local stayvar = true
			while stayvar do
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if table.find(snipe,v.Name) then
						stayvar = true
						break
					else
						stayvar = false
					end
				end
			wait(5)end
			
			local thumbnail = ""
			for i,v in pairs(snipe) do
				print(v,"prior changes")
				if tonumber(v) == nil then
					local res, body = request{
						Url = "https://api.roblox.com/users/get-by-username?username="..v,
						Method = "GET"
					}
					v = body.Id
					print(v,"Id changed")
				end
				if i~=#snipe then
					thumbnail = thumbnail..v.."%2C"
				else
					thumbnail = thumbnail..v
				end
			end
			local thumbnails = {}
			
			local res, body = request{
				Url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="..thumbnail.."&size=48x48&format=Png&isCircular=false",
				Method = "GET"
			}
			
			
			
			
			local servers = {'0'}
			while servers ~= {} do
				local res, body = request{
					Url = "https://www.roblox.com/games/getgameinstancesjson?placeId=333164326&startIndex="..start, 
					Method = "GET"
				}
				
				for i1,v1 in pairs(body.Collection) do
					for i2,v2 in pairs(v1.CurrentPlayers) do
						if table.find(snipe,v2.Thumbnail.Url) then
							game:GetService("TeleportService"):TeleportToPlaceInstance(333164326, v1.guid)
						end
					end
				end
				servers = body.Collection
			end
			
		wait(10)end
		end
	end)()
	--]]

	--autohopper
	coroutine.wrap(function()
		while false do
			wait(15)
			
			local stayvar = true
			while stayvar do
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if table.find(banlist,v.Name) then
						stayvar = true
						break
					else
						stayvar = false
					end
				end
			wait(5)end
			
			if serverhop then
				local s1 = "!join "
				for i,v in pairs(banlist) do
					s1 = s1..v.."|!join "
				end
				s1 = s1:sub(1,-8)
				rchat(s1)
			end
		end
	end)()

	--Active Commands
	coroutine.wrap(function()
		if false then return end
		
		
		local rconsoleprint = function(input,color)
			fspawn(function()
				if color then
					fspawn(function()rconsoleprint(color)end)
				else
					fspawn(function()rconsoleprint("@@WHITE@@")end)
				end
				fspawn(function()rconsoleprint(input.."\n")end)
				fwait()
				fspawn(function()rconsoleprint("@@WHITE@@")end)
			end)
		end
		
		function GetPlayer(a)
			local b={}
			local c=a:lower()
			if c=="all"then 
				for d,e in pairs(game.Players:GetPlayers())do 
					table.insert(b,e)
				end 
			elseif c=="others"then 
				for d,e in pairs(game.Players:GetPlayers())do 
					if e.Name~=game.Players.LocalPlayer.Name then 
						table.insert(b,e)
					end 
				end 
			elseif c=="me"then 
				for d,e in pairs(game.Players:GetPlayers())do 
					if e.Name==game.Players.LocalPlayer.Name then 
						table.insert(b,e)
					end 
				end 
			else 
				for d,e in pairs(game.Players:GetPlayers())do 
					if e.Name:lower():sub(1,#a)==a:lower()then 
						table.insert(b,e)
					end 
				end 
			end
			if unpack(b) == nil then --This is to fix any useless uses of the function so if it does spam I can return those parts in the script it does if I'm a dummy.
				rconsoleprint("Player is not ingame or you spelt it wrong.","@@RED@@") 
			end 
			return b 
		end

		local Commands = {
			["cmds"] = {
				funk = function()
					local out1 = ""
					for i,v in pairs(Commands) do
						out1 = out1..i.."\n\tthing".."\n"
					end
					rconsoleprint(out1)
				end,
			},
			["snipe"] = {
				funk = function(msg)
					local args = msg:lower():split(" ")
					if not args[2] then
						rconsoleprint("You need to add a 2nd argument","@@YELLOW@@")
						return
					end
					if GetPlayer(args[2]) then
						local plrs = GetPlayer(args[2])
						if #plrs>1 then
							local out1 = ""
							for i,v in pairs(plrs) do
								if i~=#plrs then
									out1 = out1..v.Name..", "
								else
									out1 = out1..", and "..v.Name.."!"
								end
							end
							local out1 = out1:sub(1,out1:len()-2)
							output("Targeting "..out1)
							local msg1 = ""
							for i,v in pairs(plrs) do
								if i~=#plrs then
									local msg2 = "explode "..v.Name:sub(1,v.Name:len()/2).."|"
									local msg2 = msg2:rep(5)
									msg1 = msg1..msg2
								else	
									local msg2 = "explode "..v.Name:sub(1,v.Name:len()/2)
									local msg2 = msg2:rep(5)
									msg1 = msg1..msg2
								end
							end
							local msg1 = msg1:sub(1,msg1:len()-1)
							rchat(msg1)
						end
					end
				end,
			},
			["ban"] = {
				alias = {"pp"},
				funk = function(msg)
					local args = msg:lower():split(" ")
					if GetPlayer(args[2]) then
						for i,v in pairs(GetPlayer(args[2])) do
							table.insert(banlist,v.Name)
							if v.Character then
								f3xRemove(v.Character)
							end
							output(lplr.Name.." has bannished "..v.Name.." to the shadow realm")
						end
					end
				end,
			},
			["fixed"] = {
				funk = function(msg)
					local args = msg:split(" ")
					if args[2]:lower() == "speed" then
						if fixed.speed then 
							fixed.speed = false
						else
							fixed.speed = true
						end
					end
				end,
			},
			--[[ ["crash"] = {
				funk = function()
					local ohString1 = "CreatePart"
					local ohString2 = "Normal"
					local ohCFrame3 = CFrame.new(0, 500, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
					local ohInstance4 = workspace

					local part = game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(ohString1, ohString2, ohCFrame3, ohInstance4)
					local clone = {}
					for i=1,9000 do
						spawn(function()
							local ohString1 = "Clone"
							local ohTable2 = {
								[1] = part
							}
							local ohInstance3 = workspace
							
							clone[i] = {["Part"] = game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(ohString1, ohTable2, ohInstance3),["Anchored"] = false}
						end)
					end
					repeat print(#clone) fwait() until #clone == 9000
					local ohString1 = "SyncAnchor"
					local ohTable2 = clone

					game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(ohString1, ohTable2)
				end,
			},
			--]]
			["regen"] = {
				funk = function()
					fireclickdetector(game:GetService("Workspace").SecureParts.ResetPads.ClickDetector)
				end,
			},
			["shuffle"] = {
				--allies = {""},
				description = "Plays a random song.",
				funk = function()
					local song = songs[math.random(1,#songs)]
					rchat(":music "..antilogger1..song)
					--if unpack(songsn) == nil then
						--rconsoleprint("[cd.lua]: Enjoy! ^-^ Playing "..gpi(song).Name)
					--else
					--    rconsoleprint("[cmds.lua]: Enjoy! ^-^ Playing "..songsn[])
				end,
			},
			["fix"] = {
				funk = function()
					local t1 = {
						'clr',
						'clearterrain',
						'fix',
						'free all',
						'undeadlands all',
						'unview all',
						'setmessage @casual_degenerate#7475 was here.',
						're all',
						'ff all',
						'god all',
						'sm haha cd/Main.lua go for i, v in pairs(t1) do rchat(v) end'
					}
					local s1 = ":"
					for i,v in pairs(t1) do
						s1 = s1..v.."|:"
					end
					rchat(s1)
				end,
			},
			["blind"] = {
				funk = function()
					rchat(":runc a")
				end,
			},
			["hideui"] = {
				funk = function()
					rchat(":runc b")
				end,
			},
			["outfits"] = {
				funk = function()
					local c = listfiles("cd/Outfits")
					local s1 = ""
					for i,v in pairs(c) do
						s1 = s1.."["..i.."] "..v.."\n"
					end
					rconsoleprint(s1,"@@MAGENTA@@")
				end,
			},
			["outfit"] = {
				description = "Set's cd/Outfits/<args[2]>.cd as your outfit.",
				funk = function(msg)
					if not lplr.Character then
						rconsoleprint("WARNING: No character found","@@YELLOW@@")
						return
					end
					if not lplr.Character:FindFirstChild("Head") then
						rconsoleprint("WARNING: No head found","@@YELLOW@@")
						return
					end
					local rchat = function(i)
						rchat(i)
						wait(.8)
					end
					local args = msg:lower():split(" ")
					local input = tostring(args[2])
					local s1 = ""
					local i = 0
					reeeeeeee=false
					if msg:lower():find("+random") then 
						reeeeeeee=true
						local c = listfiles("cd/Outfits")[math.random(1,#listfiles("cd/Outfits"))]
						local c = c:gsub("\\","/")
						Outfit=loadstring(readfile(c))()
					end
					if not reeeeeeee then
						local err = pcall(function()Outfit=loadstring(readfile("cd/Outfits/"..input..".cd"))()end)
						if not err then
							rconsoleprint("ERROR: Outfit Input Invalid \(Does Not Exist!!\)","@@RED@@")
							return
						end
					end
					for _,v in pairs(args) do
						if v:find("+e") then
							rchat(":removehats me|")
							for i,v in pairs(lplr.Character:GetChildren()) do
								if v.ClassName=='Shirt'or v.ClassName=='Pants'then
									v:Destroy()
								end
							end
						end
					end
					for _,v in pairs(lplr.Character:GetDescendants()) do
						if v.Name == "face" and v.ClassName==("Decal") then
							v:Destroy()
						end
					end
					for _,v in pairs(Outfit.Hat) do
						rchat(":hat me "..v)
					end
					rchat(":shirt me "..Outfit.Shirt)
					rchat(":pants me "..Outfit.Pants)
					if tonumber(Outfit.Face) ~= 0 then
						rchat(":face me "..Outfit.Face)
					end
					if Outfit.Creator then 
						rchat(":h "..Outfit.Creator)
					end --if you wanted to give credit
					for _,v in pairs(lplr.Character:GetDescendants()) do
						if v.Name == "face" and v.ClassName==("Decal") then
							i=i+1
						end
					end
					fspawn(function()
						wait(2)
						for _,v in pairs(lplr.Character.Head:GetChildren()) do
							if v.Name == "face" and _ ~= #lplr.Character.Head:GetChildren()-1 and i>1 then
								v:Destroy()
							end
						end
					end)
				end,
			},
			["?"] = {
				funk = function()
					if workspace:FindFirstChild("ADONIS_SOUND") then
						if workspace.ADONIS_SOUND.ClassName == "Sound" then
							local id = workspace.ADONIS_SOUND.SoundId:match("%d+"):sub(-10) --%d+ will grab digits and it will sub last ten numbers so 00000 does not show on the copy.
							setclipboard(id)
						end
					end
				end,
			},
			["serverlock"] = {
				funk = function()
					local function funk6(a)
						local b = false
						for _,c in next, whitelist do
							if a.Name == c or a.UserId == c then
								b = true
							end
						end
						if not b then
							table.insert(banlist,a.Name)
							if v.Character then
								f3xRemove(a.Character)
							end
						end
					end
					for i1,plr in next, game:GetService("Players"):GetPlayers() do
						funk6(plr)
					end
					game:GetService("Players").PlayerAdded:connect(function(plr)
						funk6(plr)
					end)
				end,
			},
		}
		
		while true do
			local msg = rconsoleinput()
			local args = msg:lower():split(" ")
			if args[1] == "exit" or args[1] == "stop" or args[1] == "restart" or args[1] == "reboot" or args[1] == "reload" then break end
			for _,v in pairs(Commands) do
				if type(v) == "table" then
					if v.allies then
						for _1,v1 in pairs(v.allies) do 
							if args[1] == v1 then 
								local a,err = pcall(function()v.funk(msg)end)
								if err then
									rconsoleprint(err,"@@RED@@")
								end
							end
						end
					end
					if args[1] == _ then
						local a,err = pcall(function()v.funk(msg)end)
						if err then
							rconsoleprint(err,"@@RED@@")
						end
					end
				end
			end
		end
	end)()
end)
--]]

--[[Cache info
local status,err = pcall(function()
	local func4=function(a,b)
		local c = game:HttpGet("https://inventory.roblox.com/v1/users/"..tostring(a).."/items/GamePass/"..tostring(b)):sub(65)
		if c ~= "" then 
			return true
		else 
			return false
		end
	end
	local function func5(a)
		if func4(a.UserId, 1293677) then
			if not readfile("cd/Kaderth/Perm.txt"):find("\t"..a.UserId) then
				appendfile("cd/Kaderth/Perm.txt",a.Name.."\t"..a.UserId.."\n")
			end
		end
	end
	game:GetService("Players").PlayerAdded:connect(function(plr)
		func5(plr)
	end)
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		func5(v)
	end
end)
if not status then
	logfile("[SCRIPT ERROR]: "..err.."\n")
end
--]]

--[=======[AutoHotkey API
coroutine.resume(coroutine.create(function()
local rblx = "ahk_exe RobloxPlayerBeta.exe"
--local previnput = "" -- / removed for now.
local function code(inp)
	writefile("AHK/AutoHotkey1.ahk","#NoTrayIcon\n;"..math.random(-1000,1000).."\n"..inp)
end

getgenv().CDENV = {
	["window"] = {
		["name"] = function(inp)
			code("WinSetTitle,"..rblx..",,"..inp)
		end,
		["alwaysontop"] = function(mode)
			local v1 = "off"
			local mode = tostring(mode):lower()
			if mode == "on" or mode == "true" then
				mode = "On"
			elseif mode == "off" or mode == "false" then
				mode = "Off"
			--[=====[
			elseif mode == "nil" then -- / This will just act like a switch :) so if you do CDENV.window.alwaysontop() it will switch from what it was
				code(
	[[
WinGet,ExStyle,ExStyle,]]..rblx..[[
;MsgBox,ExStyle
if (ExStyle & 0x8) 
{
	MsgBox,on
	WinSet,AlwaysOnTop,On,]]..rblx..[[
} else {
MsgBox,off
WinSet,AlwaysOnTop,Off,]]..rblx.."\n}"
				)
				return
				--]=====]
			else
				error("Argument not allowed, please give a boolean or a string of 'on' or 'off'") -- / hehe fuck you
			end
			code("WinSet,AlwaysOnTop,"..mode..","..rblx)
		end,
		["transparency"] = function(int)
			local int = tonumber(int)
			if not int then
				error("Argument1 must be a number")
			end
			if int > 1 then int = 1 end
			if int <= 0 then 
				int = 0 
--				code("WinSet,Transparent,Off,"..rblx)
--				return false
			end
			code(
	[[
WinSet,Transparent,]]..(((int-1)*-1)*255)..','..rblx
			)
		end,
		
	}
}
end))
--]=======]

---[[Cosmetics
threads["Cosmetics"] = coroutine.create(function()
	if game.PlaceId ~= 1068523756 then
		return "Not allowed to run."
	end
	if not _G.CDENV then _G.CDENV = {
		cosmetic = true
	}
	else
		_G.CDENV.cosmetic = true
	end
	local function func1(text,pos,size)
		local gui = Instance.new("SurfaceGui")
		--syn.protect_gui(gui)
		gui.AlwaysOnTop = true
		--local obj = game:GetService("Players").LocalPlayer.Character.Head
		gui.CanvasSize = Vector2.new(800,600)
		local tl = Instance.new("TextLabel")
		tl.Text = text
		tl.BackgroundColor3 = Color3.new(0,0,0)
		tl.TextColor3 = Color3.new(.7,0,0)
		tl.Position = pos
		tl.Size = size

		tl.TextSize = 100
		tl.Font = Enum.Font.PermanentMarker
		tl.Parent = gui

		gui.Parent = game:GetService("CoreGui")
		return gui
	end
	local guis = {}
	--table.insert(guis,func1("BITCH",UDim2.new(.245,0,.59,0),UDim2.new(.5,0,.3,0)))
	table.insert(guis,func1("HENTAI",UDim2.new(.19,0,.08,0),UDim2.new(.6,0,.4,0)))
	while true do 
		if _G.CDENV.cosmetic then
			if game:GetService("Players").LocalPlayer then
				if game:GetService("Players").LocalPlayer.Character then
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Head") then
						--if game:GetService("Players").LocalPlayer.Character.Head.ClassName == "Part" then
							for i,gui in next, guis do
								gui.Adornee = game:GetService("Players").LocalPlayer.Character.Head
							end
						--end
					end
				end            
			end
		else
			for i,gui in next, guis do
				gui.Adornee = nil
			end
		end
	fwait()end
end)
--]]


threads["Church Patch"] = coroutine.create(function()
	if game.PlaceId ~= 1068523756 then
		return "Wrong game to execute"
	end
	repeat wait() until game:GetService("Players").LocalPlayer
	local plr = game:GetService("Players").LocalPlayer 
	
	local func1 = function(chr)
		local head = chr:WaitForChild("Head",tonumber'inf')
		local tag = head:WaitForChild("NameTag",tonumber'inf')
		for i=1,1000 do
			if #tag:GetChildren() == 4 then
				break
			end
			fwait()
		end
		tag:ClearAllChildren()
		local animate = chr:WaitForChild("Animate",tonumber'inf')
		animate:WaitForChild("idle",tonumber'inf')
		wait(1)
		for i,v in next, animate.idle:GetChildren() do
			v.AnimationId = "rbxassetid://0"
		end
	end
	
	table.insert(connections,plr.CharacterAdded:Connect(function(chr)
		func1(chr)
	end))
	
	if plr.Character then
		func1(plr.Character)
	end
	
	local admins = {
		"AsynchronousMatrix",
		"aaro102",
		
	}
	local commands = {}
	commands = {
		["info"] = {
			["Level"] = 5,
			["Fire"] = function(tbl)
				if not tbl["rawObjectMessage"] then
					return "No message?"
				end
				if not tbl["Caller"] then
					return "No caller?"
				end
				
				local output = "/w "..tbl["Caller"].Name.." "
				
				for i,v in next, commands do
					output = output .. i .. " "
				end
				
				
				fchat(output)
				return output
			end,
		}
	}
	
	local level = function(player)
		if player == plr then 
			return 5
		end
		if table.find(admins,player.UserId and player.Name) then
			return 4
		end
		return 0 -- / Set to -1 for nothing.
	end
	
	local func2 = function(player)
		table.insert(connections,player.Chatted:Connect(function(rawObjectMessage)
			local args = rawObjectMessage:split(" ")
			
			if args[1]:sub(1,1) == ":" then
				for i,v in next, commands do
					if args[1]:sub(2,args[1]:len()):lower() == tostring(i):lower() then
						if v["Level"] <= level(player) then
							local message = v["Fire"]{["rawObjectMessage"] = rawObjectMessage,["Arguments"] = args,["Caller"] = player}
							if message then
								printconsole("Command : "..tostring(i).." : Caller : "..player.Name.."$"..player.UserId.." : Message : "..tostring(message))
							end
						end
					end
				end
			end
		end))
	end
	
	table.insert(connections,game:GetService("Players").PlayerAdded:Connect(function(player)
		func2(player)
	end))
	for i,v in next, game:GetService("Players"):GetPlayers() do
		func2(v)
	end
	
	
end)



---[[
for i,v in next, threads do
	if type(v) == "thread" then
		local success, result = coroutine.resume(v)
		if success then
			printconsole("Running "..tostring(i))
		else
			messagebox(result,"ERROR: "..tostring(i),0)
		end
	end
end
--]]