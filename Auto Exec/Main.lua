--[[ --
I don't know what to put here other than hope you can understand what I wrote.
--]] --
local start = tick()
printconsole("EXECUTING?")
--game:GetService("CoreGui"):WaitForChild("RobloxLoadingGui"):Destroy() -- / This is a thing, but I'd rather not do it for everything since it will maybe be detected.
-- / Seems like it was depricated from devs and they can't access it. Sweet!
for i, v in next, game:GetService("CoreGui"):WaitForChild("RobloxLoadingGui"):GetDescendants() do
	pcall(function()v.BackgroundTransparency = 0.7 end)
end

-- / Panic function
getgenv().a = function()
	game:Shutdown()
	wait()
	while true do end
end

getgenv().togglemusic = function()
	_G.playmusic = false
	getgenv().introVol = 0
	getgenv().intro:Destroy()
end

pcall(function()
	coroutine.wrap(function()
		_G.playmusic = true
		local function _folder(FolderName)
			if isfolder(FolderName) then
			else
				makefolder(FolderName)
			end
		end
		local _dir = "Playlist"
		getgenv().introVol = .1
		_folder(_dir)
		local files = listfiles(_dir)
		getgenv().intro = Instance.new("Sound")
		syn.protect_gui(intro)
		intro.Name = "\000"
		intro.Volume = getgenv().introVol
		intro.Parent = game
		local func1
		while _G.playmusic do
			for i, file in next, files do
				intro.SoundId = getsynasset(file:gsub("\\", "/"))
				intro:Play()
				intro.Ended:Wait()
			end
			wait()
		end
	end)()
end)


--script.Name = "Main.lua" -- / Sad

local threads                = {} -- / This is how I run my shit.
getgenv().Connections        = {} -- / So if you wanted to disconnect things I connected onto.

local function logfile(content) -- / This was a method of caching my logging.
	local file = "cd/Log.txt"
	if not isfile(file)then
		writefile(file)
		repeat wait() until isfile(file)
	end
	appendfile(file,content.."\n")
	printconsole(tostring(content))
end

--[[
local function recursiveTbl(tbl)
	if type(tbl) == "table" then
		recursiveTbl(tbl)
	else
		return tbl
	end
end
--]]

--local function print(...)
--	local str = recursiveTbl({...})
--	printconsole(tostring(str))
--end

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
	for i,v in next, banlands.close do
		if game.PlaceId == v or game.CreatorId == v or game.GameId == v then
			repeat wait() until game:IsLoaded()
			logfile("0[DEBUG]: Client joined blacklisted(closed) game\t"..game.CreatorId.." "..game.GameId.." "..game.PlaceId.." "..game.JobId)
			game:Shutdown()
		end
	end
	for i,v in next, banlands.disable do
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

-- Binds

getgenv().bind = Instance.new("BindableEvent")
syn.protect_gui(bind)

-- / This is just incase some shithead runs fucky stuff on my client. I'd rather be safe.
threads["SynX Patch"] = {
	["Active"] = true,
	["Thread"] = coroutine.create(function()
		-- / File exploits I don't want running...
		getgenv().delfolder = nc(function(...)
			error("Tried to delete folder\t" .. (...) .. "\t" .. debug.traceback())
		end)
		getgenv().delfile = nc(function(...)
			error("Tried to delete file\t" .. (...) .. "\t" .. debug.traceback())
		end)
		
		
		
		
		-- / Macro exploits I don't want to run.
		if false then
		-- / Mouse 1
		getgenv().mouse1click = nc(function(...)
			error("mouse1click\t" .. debug.traceback())
		end)
		getgenv().mouse1press = nc(function(...)
			error("mouse1press\t" .. debug.traceback())
		end)
		getgenv().mouse1release = nc(function(...)
			error("mouse1release\t" .. debug.traceback())
		end)
		-- / Mouse 2
		getgenv().mouse2click = nc(function(...)
			error("mouse2click\t" .. debug.traceback())
		end)
		getgenv().mouse2press = nc(function(...)
			error("mouse2press\t" .. debug.traceback())
		end)
		getgenv().mouse2release = nc(function(...)
			error("mouse2release\t" .. debug.traceback())
		end)
		-- / Mouse 3
		getgenv().mousescroll = nc(function(...)
			error("mousescroll\t" .. debug.traceback())
		end)
		getgenv().mousemoveabs = nc(function(...)
			error("mousemoveabs\t" .. debug.traceback())
		end)
		getgenv().mousemoverel = nc(function(...)
			error("mousemoverel\t" .. debug.traceback())
		end)
		end
		
		
		
		---[[ / Functions that can crash(Not needed, but I'd rather not fuck myself over, and rather tell myself I'm fucking up.)
		local __setfpscap = setfpscap
		getgenv().setfpscap = nc(function(int)
			if int < 1 then
				error("setfpscap is less than 0.01!\t" .. debug.traceback())
			else
				__setfpscap(int)
			end
		end)
		--]]
		
		-- / Tampering with functions to work how I want them to.
		local __appendfile = appendfile
		getgenv().appendfile = nc(function(file, content)
			local fileExist
			for i=1,30 do
				if isfile(file) then
					fileExist = true
					break
				end
				wait(.1)
			end
			if fileExist then
				__appendfile(file, content)
			else
				writefile(file, content)
			end
		end)
		
		
		---[[ / This is used to sandbox the env(so I can tell if something is being used.(haxor man menu)
		local __oldappendfile = print
		local l = ''
		for i, v in next, getgenv() do
			local __t = type(v)
			if __t == "function" then
				---[[
				--getgenv()[i] = function(...)
				--	__oldappendfile("sandbox.txt", tostring(i) .. "(" .. table.concat({...},", ") .. ")\n")
					--v(...)
				--end
				
				--[==[
				__oldappendfile("sandbox.txt", tostring(i) .. "\n")
				l = ([[
					local a = ]] .. i .. [[
					getgenv().]] .. i .. [[ = function(...)
						print(i, ...)
						a(...)
					end;
				]]) .. l
				--]==]
				
				--[[ / Live Sandbox
				local info = ''
				if v ~= rconsoleprint then
					getgenv()[i] = function(...)
--						if getcallingscript() == script then
--							return v(...)
--						end
						--if not table.concat({...}, ""):sub(1,10):find("cd/ChatLog") then
							info = (tostring(i) .. "(" .. table.concat({...}, ",") .. ")\t" .. debug.traceback() .. "\n") .. info
						--end
						v(...)
					end
				end
				coroutine.wrap(function()
					while true do
						rconsoleclear()
						appendfile("sandbox.txt", info)
						rconsoleprint(info)
						info = ''
						wait(1)
					end
				end)()
				--]]
				--setfenv()
			elseif __t == 'table' then
				
			end
		end
		--print(l)
		--loadstring(l)()
		--]]
		
		local _printconsole = printconsole
		getgenv().printconsole = function(...)
			if not isfolder("cd/Logs") then
				makefolder("cd/Logs")
			else
				if not isfile("cd/Logs/Debug.txt") then
					writefile("cd/Logs/Debug.txt", "")
				end
			end
			appendfile("cd/Logs/Debug.txt", os.date('[%Y/%m/%d-%H:%M:%S]: ') .. table.concat({...}, "\t") .. "\t" .. debug.traceback() .. "\n")
			return _printconsole(...)
		end
		
	end)
}

-- / So I don't fuck the meat

JS = game:GetService("JointsService")
lplrname = ''
spawn(function()
	repeat wait() until game:GetService("Players").LocalPlayer
	lplrname = game:GetService("Players").LocalPlayer.Name
end)

--Meat table

threads["Client COM Manipulation"] = coroutine.create(function()
	_G.owoToggle=false
	getgenv().chatbypass = true -- / Rather not >:(
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
	local chat_remotes1 = {
		"SayMessageRequest"
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
				return --Ban rates go ^
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
		elseif game.PlaceId == 333164326 then
			if self.Name == "MessagePosted" and not checkcaller() then
				return
			end
		end
		
		
		
		if true and m == "FireServer" then
			for i, v in next, chat_remotes do if self.Name == v or m == v then
				--print(self, self.ClassName, args[1], args[2], args[3])
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
				if game.PlaceId == 333164326 then
					bind:Fire(args[1])
					return
				end
			end end
--			if self.Name == "afkTog" and args[1] == true then
--				return
--			end
		end
		
		
		--[[This is depricated, please Ctrl F for ADONISHOOK and you will see where I done this at.
		if game.PlaceId == 333164326 then
			if self.ClassName == "RemoteEvent" then
				print(1, self, args[2], args[3])
				if args[3] == ":fly " .. lplrname then
					print(2, self:GetFullName(), args[2], args[3])
				end
				if self.Parent == JS then
					print(3, self:GetFullName(), args[2], args[3])
				end
				if self.Parent == JS then
					print(self:GetFullName(), args[2], args[3])
					if args[1] and args[3] == ":fly " .. lplrname then
						getgenv().cmdInfo = args[1]
						getgenv().cmdKey = args[2]
						print(cmdKey)
						return
					end
				end
			end
		end
		--]]
		
		if game.PlaceId ~= 2000062521 and false then
			for i,v in next, chat_remotes do
				if self.Name == v then
					if args[1]:sub(1,1)==":"or args[1]:sub(1,1)==";"or args[1]:sub(1,1)=="!" then
						if self.Name==chat_remotes[1] then bind:Fire(args[1])end
						logfile("0[DEBUG]: disallow " .. v)
						return
					end
				end
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

if not getgenv then
	function getgenv()
		return _G
	end
end

--if getgenv then

	-- // SERVICES
	
	getgenv().Players = game:GetService("Players")
	getgenv().FirstReplicated = nil
	getgenv().UIS = game:GetService("UserInputService")
	
	
	-- // #############

	--Easy to write coroutine.
	getgenv().fspawn = function(f)
		coroutine.wrap(f)() -- / 5.24.2021 Doing a wrap might work better?
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
		else
			game:GetService("Players"):Chat(input)
		end
	end
	getgenv().tchat = function(input)
		fchat(input)
		rchat(input)
	end
	--This is proof you are using my library(do you like the way I worded that >3<)
	getgenv().is_cd_caller = function()
		return true
	end
	
	-- / This is WaitFor it's a form of WaitForChild() that will only take strings of code and convert them to wait for each instance.
	getgenv().WaitFor = function(objectString)
		splits = objectString:split(".")
		local out = splits[1]
		for i,v in next, splits do
			if i~=1 then out = out .. ":WaitForChild('" .. v .. "')" end
		end
		return out
	end
	
	-- / Rejoin
	getgenv().Rejoin = function()
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
	end
	
	-- / Disable Rendering
	getgenv().NoRender = function()
		game:GetService("RunService"):Set3dRenderingEnabled(false)
	end
	
	-- / FPSCAP
	
	-- / Better name
	getgenv().nc = newcclosure
	
	-- / JSONDecode
	getgenv().JSOND = function(a)return game:GetService("HttpService"):JSONDecode(a)end
	
	-- / JSONEncode
	getgenv().JSONE = function(a)return game:GetService("HttpService"):JSONEncode(a)end
	
	-- / Improved appendfile
	__appendfile = appendfile
	getgenv().appendfile = function(file, content)
		if not isfile(file) then
			writefile(file, content)
		else
			__appendfile(file, content)
		end
	end
	
	-- / Faster swiching of a varible like false to true or nil to true
	getgenv().switch = function(variable)
		if variable and type(variable) == 'boolean' then
			variable = false
		else
			variable = true
		end
	end
	
	-- / A method to see what I'm doing without tabbing out some console, pretty much notfi on what something is being done that will disapear.
	getgenv().debugp_index = {}
	for i=1, 16 do
		getgenv().debugp_index[i] = false
	end
	getgenv().debugp = function(Contents)
		spawn(function()
			local Message, Time
			if type(Contents) == 'string' then
				Message = Contents
				Time = 1
			else
				Message = Contents["Message"] or Contents[1] or "Nothing?"
				Time = Contents["Time"] or Contents[2] or 1
			end
			local Index = 0
			while Index == 0 do
				for i, v in next, getgenv().debugp_index do
					if v == false then
						Index = i
						getgenv().debugp_index[i] = true
						break
					end
				end
				wait()
			end
			local Output = Drawing.new("Text")
			
			Output.Color = Color3.new(1,0,0)
			Output.Text = Message
			Output.Size = 42
			Output.Outline = true
			Output.OutlineColor = Color3.new(0,0,0)
			Output.Position = Vector2.new(5, 300 + (Index * Output.TextBounds.Y) + 5)
			print(Output.TextBounds)
			
			Output.Visible = true
			wait(Time)
			Output.Visible = false
			Output:Remove()
			getgenv().debugp_index[Index] = false
		end)
	end
	
	getgenv().findnil = function(Name)
		for i, v in next, getnilinstances() do
			if v.Name == Name then
				return v
			end
		end
	end
	
--end
]=====])()

-- / The "API shit above" is no longer http so I don't need to wait :)
--repeat fwait() until fspawn and rchat 
--API shit above.



--anti afk.lua
threads["Anti AFK"] = {
	["Active"] = true,
	["Thread"] = coroutine.create(function()
		repeat wait() until game:IsLoaded()
		repeat wait() until game:GetService("Players").LocalPlayer

		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
	end)
}

--

--afk.lua
threads["afk.lua"] = {
	["Active"] = false,
	["Thread"] = coroutine.create(function()
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
						fwait()
					end
					wait(1)
					rchat("unname me")
				end
			end
		end)
	end)
}

--

---[[Thumbnail
threads["Watermark"] = {
	["Active"] = true,
	["Thread"] = coroutine.create(function()
		repeat wait() until game:IsLoaded()
		repeat wait() until workspace:FindFirstChild("Camera")
		if isfolder("CONFIG/Watermark") then
			local function str2hex(str)local o=''for i=1,#str do local h=string.format('%x',str:byte(i))local t=('00'):sub(tostring(h):len()+1)o=o..t..tostring(h)end return(o)end
			local images = listfiles('CONFIG/Watermark')
			local image = images[math.random(1,#images)]
			printconsole("Loading image for watermark, " .. image)
			image        = readfile(image)
			local camera = workspace.CurrentCamera
			local width  = tonumber( str2hex(image:sub(17,20)),16)
			local width  = width   / 2
			local height = tonumber( str2hex(image:sub(21,24)),16)
			local height = height  / 2
			
			local function drawobjfunc1(obj)
				local function updateUDim()
					obj.Size = Vector2.new(width*(camera.ViewportSize.X/camera.ViewportSize.X),height*(camera.ViewportSize.Y/camera.ViewportSize.Y))
					obj.Position = Vector2.new(camera.ViewportSize.X*1-obj.Size.X,(camera.ViewportSize.Y*1-obj.Size.Y)+1)
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
}

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
threads["AGS Patch"] = {
	["Active"] = true,
	["Thread"] = coroutine.create(function()
		repeat wait() until game:IsLoaded()
		if game.PlaceId ~= 115670532 and game.PlaceId ~= 112420803 then return end
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
								rchat("ungear all robot.txt")
								wait()
							end
						end
					end)
					for _,v in pairs(player.Character:GetChildren()) do
						if v.Name == "VampireVanquisher" then
							rchat("ungear all robot.txt")
							rchat("reload all")
						end
					end
				end
				player.CharacterAdded:connect(function(c)
					c.ChildAdded:connect(function(a)
						if a.Name == "VampireVanquisher" then
							rchat("ungear all robot.txt")
							rchat("reload all")
						end
					end)
					player.Backpack.ChildAdded:connect(function(t)
						if t.Name == "VampireVanquisher" then
							rchat("ungear all robot.txt")
							rchat("reload all")
						end
					end)
				end)
			end
			AntiIce = function(player)
				if player.Character then
					player.Character.ChildAdded:connect(function(a)
						if a.Name == "ice" then
							rchat("reload all")
							rchat("clr")
						end
					end)
				end
				player.CharacterAdded:connect(function(c)
					c.ChildAdded:connect(function(a)
						if a.Name == "ice" then
							rchat("reload all")
							rchat("clr")
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
						rchat("reload all")
					end
				end
			end)
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				AntiIce(v)
				AntiVamp(v)
			end
		end)
		---[[
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
		end)--]]
		fspawn(function()
			repeat wait() until game:GetService("CoreGui"):FindFirstChild("RobloxLoadingGui")
			game:GetService("CoreGui").RobloxLoadingGui:Destroy()
		end)
		fspawn(function()
			--game:GetService("UserInputService").MouseDeltaSensitivity = .5
		end)
		fspawn(function()
			local debounce = false
			local ui = game:GetService("UserInputService")
			local l__ContextActionService__7 = game:GetService("ContextActionService");
			local l__RunService__1 = game:GetService('RunService')
			spawn(function()
				l__RunService__1:UnbindFromRenderStep("ShoulderCameraUpdate");
			end)
			spawn(function()
				l__ContextActionService__7:UnbindAction("ShoulderCameraZoom");
			end)
			spawn(function()
				l__ContextActionService__7:UnbindAction("ShoulderCameraSprint");
			end)
			while true do
				repeat fwait() until game.Workspace.CurrentCamera.CameraType == Enum.CameraType.Scriptable
				l__RunService__1:UnbindFromRenderStep("ShoulderCameraUpdate");
				l__ContextActionService__7:UnbindAction("ShoulderCameraZoom");
				l__ContextActionService__7:UnbindAction("ShoulderCameraSprint");
				local wepsys = game:GetService("ReplicatedStorage"):FindFirstChild('WeaponsSystem')
				if not wepsys then return end
				if not debounce then printconsole("Shift lock detected!") end
				debounce = true
				for i,v in pairs(wepsys:GetDescendants()) do
					if v:IsA("Script") then
						v.Disabled = true
					end
					v:Destroy()
				end
				local wep = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ClientWeaponsScript")
				local gui = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("WeaponsSystemGui")
				local sc = game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("ClientWeaponsScript")
				if wep then wep.Disabled = true wep:Destroy() end
				if gui then gui:Destroy() end
				if sc then
					sc.Disabled = true
					sc:Destroy()
				end
				ui.MouseIconEnabled = true
				game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
				game.Workspace.CurrentCamera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
				game:GetService("Players").LocalPlayer.Character.Humanoid.AutoRotate = true
			end
		end)
	end)
}

--
-- / Never gotten to do this yet.
--[[Cheat Detection
fspawn(function()
	if false then 
		for i,v in pairs(game:GetService("Workspace"):GetDescendants())do
			
		end
	end
end)
--]]

-- / What
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

-- / This is somewhat possible with my bot
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

-- / Truely sad
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

-- / I will turn this into a logger later, so pretty much logs everything in game into a file, and since chat does not take enough space I will save even more data about someone on it.
-- / I've updated the logger to be AGS friendly, so if someone uses a music visualizer it won't prevent them from being logged.(.Chatted is no longer being logged!)
-- / I FORKED THIS CHAT LOGGER FROM NekO#1337 [699357570015559680]
---[[Chat Logger
threads["Logger"] = {
	["Active"] = true,
	["Thread"] = coroutine.create(function()
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
			local name
			while not name do
				pcall(function()name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name;end)
				wait(3)
			end
			file = "cd/ChatLog/"..timDate.."/"..logFile
			if not isfile(file) then createFile(file) end
			  local x={}
			  for i,v in pairs(game:GetService("Players"):GetPlayers())do table.insert(x,'[ '..v.Name..(' '):rep(20):sub(v.Name:len()+1)..'|'..(' '):rep(10):sub(tostring(v.UserId):len()+1)..tostring(v.UserId)..' ]')end
			  writefile(file,'V1.4 AGS Friendly!\nGame  : '..name..'\nGameID: '..tostring(game.PlaceId)..'\nServerID: '..game.JobId..'\nTime  : '..os.date('%Y/%m/%d-%H:%M:%S')..'\n| |  |  | - |  |  | |\nConnected Players:\n'..table.concat(x,'\n')..'\n\n--- [CLog];Start. ---\n')
			  writefile(file:sub(1,-3) .. ".Chatted.txt",'V1.3\nGame  : '..name..'\nGameID: '..tostring(game.PlaceId)..'\nServerID: '..game.JobId..'\nTime  : '..os.date('%Y/%m/%d-%H:%M:%S')..'\n| |  |  | - |  |  | |\nConnected Players:\n'..table.concat(x,'\n')..'\n\n--- [CLog];Start. ---\n')
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
					appendfile(file:sub(1,-3) .. ".Chatted.txt",'\n{'..os.date('%Y/%m/%d-%H:%M:%S')..'} # '..userSaid..msg:gsub('[\n\r]','\\n'))
				end
			end)
		end
		---[[
		for _,plr in pairs(game.Players:GetChildren())do
			func2(plr)
		end
		--]]
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
				--if not game:GetService('Players'):FindFirstChild(plr.Name)then
				--	AntiSpam[tostring(plr.UserId)]=nil
				--end
			end
			if not activeConnected and not saidLeave then saidLeave=true
				appendfile(file:sub(1,-3) .. ".Chatted.txt",'\n\n-- [CLog];Stopped. --\n\nTime: '..os.date('%Y/%m/%d-%H:%M:%S'))
			end
		end)
		if game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents", 5) and game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents:WaitForChild("OnMessageDoneFiltering", 5) then
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(d)
				local userSaid='['..d.FromSpeaker..'|'..tostring(d.SpeakerUserId)..']: 'userSaid=(' '):rep(34):sub(userSaid:len()+1)..userSaid
				appendfile(file,'\n{'..os.date('%Y/%m/%d-%H:%M:%S')..'} # '..userSaid..d.Message:gsub('[\n\r]','\\n'))
			end)
		else
			appendfile(file, "\nThis file can not be writen, game does not have default chat. Please fix. " .. game.PlaceId)
		end
	end)
}
--]]

-- / Sheeeeesh, imagine breaking federal laws.
--[[Was bored so I killed a few games?
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

-- / I'm a bit proud :sunglasses:
-- / It's another cmds.lua for Kaderth's, but mostly passive.
---[[Kaderth's Admin House
threads["Kaderth's Admin House Custom Commands"] = {
	["Active"] = true,
	["Thread"] = coroutine.create(function()
		if game.PlaceId ~= 333164326 then return end
		local targetJobId = ''
		getgenv().removebuilds = true
		repeat wait() until game:IsLoaded() and game:GetService("Players").LocalPlayer
		local JSOND = function(a)return game:GetService("HttpService"):JSONDecode(a)end
		local lplr = game:GetService("Players").LocalPlayer
		function plrFromChr(character)for _, player in pairs(game:GetService("Players"):GetPlayers())do if player.Character==character then return(player)end end end
		
		workspace.ChildAdded:Connect(function(v) 
			if removebuilds then
				fwait()
				if not plrFromChr(v)and v.ClassName~='Camera'and v.ClassName~='Terrain'and v.Name~='SecureParts'and not v.Name:match('^'..tostring(lplr.Name)..'_ADONISJAIL$') and v.ClassName ~= 'Sound' then
					v:Destroy()
				end
			end
			if v.Name == (lplr.Name.."_ADONISJAIL$") then
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
		end)
		
		
		workspace.DescendantAdded:Connect(function(v)
			if v.ClassName=='Smoke'then
				fwait()
				v:Destroy()
			elseif v.ClassName=='ForceField'then
				v.Visible = false
--[[			elseif v.ClassName == "Sound" then
				v:GetPropertyChangedSignal("Volume"):Connect(function()
					if v.Volume ~= .1 then 
						v.Volume = .1
					end
				end)
				v.PlaybackSpeed
--]]
			end
		end)
		
		
		if removebuilds then
			spawn(function()
				wait(3)
				if game:GetService("Workspace"):FindFirstChild('BuildingBlocks')then
					game:GetService("Workspace").BuildingBlocks:Destroy()
				end
				
				for i,v in next, workspace:GetChildren() do
					if not plrFromChr(v)and v.ClassName~='Camera'and v.ClassName~='Terrain'and v.Name~='SecureParts'and not v.Name:match('^'..tostring(lplr.Name)..'_ADONISJAIL$') and v.ClassName ~= 'Sound' then
						v:Destroy()
					end
				end
				for i,v in next, workspace:GetDescendants() do
					if v.ClassName=='Smoke'or v.ClassName=='Fire'then
						v:Destroy()
					elseif v.ClassName=='ForceField'then
						v.Visible = false
					elseif v.ClassName=='Sound'then
						if v.Volume ~= .1 then v.Volume = .1 end
					end
				end
			end)
		end
		
--		game:GetService("GuiService").IsWindows = false
--		settings():GetService("PhysicsSettings").AreAnchorsShown = true
		if targetJobId ~= '' then
			if game.JobId ~= targetJobId then 
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, targetJobId)
			end
		end
		local cmdbox
		local LS = game:GetService("Lighting")
		local antilogger1 = "0"
		antilogger1 = antilogger1:rep(100)
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
		local antilogging = false
		local permadmin = true
		local isPassed = false
		--[[
		if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(lplr.UserId, 1293677) then
			permadmin = true
		else
			permadmin = false
		end
		--]]
		local fixed = {}
		fixed.speed = true
		
		
		local banlist = {"Lendiz","DeAnxgelo","azizaziz150","GreenGoldenCat","Hong_williamisnoob","Pine_Josh",--[["Kittenpower45677",--]]"Glel667","Glel6677","SoIdotna","TheMegGaming","JohnLePro1108","Bacon_Guy10100","Baqacc","derleereHerr","Remy_Bigcitygreens","Gloria_Bigcitygreens","BetrayalBro","Heinrich_Dietrich",--[["fatahabahusni2",--]] --[["j0hanwest1",--]] "demonprince_1231", "lilshorty0619", "starlessof822726", 'UltraInstintodom34', 'H3luvzsky', 'Icy_IcyCube', 'ididkdididlld'}
		local crashers = {"Kad_Mikami", "SoilderViking147", "xXCartooneyCatXx", "rakehunter1935", "miggy337992", "h3ilcl0wn", "usernoobf"}
		local whitelist = {lplr.Name, "Aaro102", "cornmissile"}
		local NAME = ""
		
		
		local commandrequest = {}
		local blacklistSongs = {}
		getgenv().rubberband = Vector3.new(0,50,0)
		getgenv().rubberbandrotation = CFrame.Angles(0,0,0)
		getgenv().RubberbandRange = .7
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
		getgenv().songinfo = {}
		getgenv().hideme = false
		getgenv().serverhop = true
		if lplr.Name ~= "CasualDegenerate" then
			getgenv().hideme = true
		end

		-- / Hooking shit.
		
		local Remote = game:GetService("JointsService"):FindFirstChildOfClass("RemoteEvent")
		local OldFireServer
		OldFireServer = hookfunction(Remote.FireServer, newcclosure(function(Event, ...)
			if not checkcaller() then
				local args = {...}
				if args[3] == ":fly me" then
					getgenv().cmdInfo = args[1]
					getgenv().cmdKey = args[2]
				end
			end
			return OldFireServer(Event, ...)
		end))
		
		local _Remote = Remote['']
		local _OldFireServer
		_OldFireServer = hookfunction(_Remote.InvokeServer, newcclosure(function(Event, ...)
			if not checkcaller() then
				local args = {...}
				if args[3] == "JoinLogs" then
					getgenv().logsInfo = args[1]
					getgenv().logsKey = args[2]
				end
			end
			return _OldFireServer(Event, ...)
		end))


		--Functions

		local function request(t)
			local cookie='.ROBLOSECURITY=_|WARNING:-DO-NOT-SHARE-THIS.--Sharing-this-will-allow-someone-to-log-in-as-you-and-to-steal-your-ROBUX-and-items.|_EAF87C7A940 oh wait...'
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
			if lplr:FindFirstChild("Backpack") and lplr.Backpack:FindFirstChild("Folder") and lplr.Backpack.Folder:FindFirstChild("SyncAPI") and lplr.Backpack.Folder.SyncAPI:FindFirstChild("ServerEndpoint") then
				f3x = lplr.Backpack.Folder.SyncAPI.ServerEndpoint
			end
		end
		

		getgenv().executecmd = function(content)
			--[[ Old Version
			if _G.cmdName == 30 or type(_G.cmdName) ~= 'number' then
				_G.cmdName = 0
			end
			_G.cmdName = _G.cmdName+1
			local cs = game:GetService("ReplicatedStorage"):WaitForChild("Network", 10)
			if not cs then return end
			local cs = cs:WaitForChild("CommandSaving", 10)
			if not cs then return end
			cs:InvokeServer({"SAVE", "temp" .. _G.cmdName, content})
			rchat(":runc temp" .. _G.cmdName)
			--]]
			
			---[[ New Version(Not working currently ffs)
			if lplr.Name == "CasualDegenerate" then
				while not cmdKey do
					game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.BackSlash,false,game)
					wait(5)
				end
			else
				while not cmdKey do
					rchat(":cmdbox")
					local VirtualUser = game:GetService("VirtualUser");
					local UserInputService = game:GetService("UserInputService");
					local RunService = game:GetService("RunService");
					local PlayerGui = lplr.PlayerGui;

					local executebutton, cords, mousePos, mouseCon do
						repeat
							for _,v in pairs (PlayerGui:GetDescendants()) do
								if v.Name == "Execute" and v:IsA("TextButton") then
									executebutton = v
								end
							end
							wait()
						until executebutton ~= nil and iswindowactive() == true
						executebutton.Parent.ScrollingFrame.ComText.Text = ":fly me"
						cords = UDim2.fromOffset(executebutton.AbsolutePosition.X+executebutton.AbsoluteSize.X/2, executebutton.AbsolutePosition.Y+executebutton.AbsoluteSize.Y*2) 
						mousePos = UDim2.fromOffset(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
					end
					local CO = -1
					local function CU()
						if CO == 1 then
							CO = -1
						else
							CO = 1
						end
						return CO
					end
					mouseCon = RunService.RenderStepped:Connect(function()
						if not count then count = 0 else count += 1 end -- hehe funny luau is added
						mousemoveabs(cords.X.Offset, cords.Y.Offset)
						if count >= 100 then 
							mouseCon:Disconnect() 
							mousemoverel(CU(), CU())
							wait()
							mouse1click() 
						end
					end)
					wait(8)
				end
			end
			game:GetService("JointsService"):FindFirstChildWhichIsA("RemoteEvent"):FireServer(cmdInfo, cmdKey, content)
			--]]
		end
		
		getgenv().savecmd = function(name, content)
		
		end

		local function output(inp)
			if not hideme then
				executecmd(":chatnotifyc all 255 0 0 " .. inp)
			end
		end

		local function f3xRemove(tbl)
			print("Deleting", tbl[1])
			if lplr:WaitForChild("Backpack") then
				while not f3x or not lplr.Backpack:FindFirstChild("Building Tools") do
					lplr.Backpack:ClearAllChildren()
					executecmd(":f3x")
					wait(2)
					findf3x()
					warn("trying to find it")
				end
			end
			pcall(function()
				f3x:InvokeServer("Remove",tbl)
			end)
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

		-- / Connections
		
		local function func1(Object)
			Object.Volume = .1
			Object:GetPropertyChangedSignal("Volume"):Connect(function()
				if Object.Volume > .1 then
					Object.Volume = .1
				end
			end)
			Object.PlaybackSpeed = 1
			Object:GetPropertyChangedSignal("PlaybackSpeed"):Connect(function()
				if Object.PlaybackSpeed ~= 1 then
					Object.PlaybackSpeed = 1
				end
			end)
		end
		
		for i, Object in next, workspace:GetChildren() do
			if Object.Name == "ADONIS_SOUND" then
				func1(Object)
			end
		end
		workspace.ChildAdded:Connect(function(Object)
			if Object.Name == "ADONIS_SOUND" then
				func1(Object)
			end
		end)
		
		
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
										for i1=1,5 do
											firetouchinterest(lplr.Character.HumanoidRootPart,v.Head,0)
											firetouchinterest(lplr.Character.HumanoidRootPart,v.Head,1)
											admindebounce = 0
											wait(0.5)
										end
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
							if admin then executecmd(":unjail me") end
							for i,v in next, workspace[lplr.Name.."_ADONISJAIL"]:GetDescendants() do
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
					if icedebounce > 30 then
						icedebounce = 0
						if lplr.Character and lplr.Character:FindFirstChild("Adonis_ice") then
							
						end
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
									--local hrp = lplr.Character:WaitForChild("HumanoidRootPart",5)
									--local prevh = hrp
									--local prevcf = prevh.CFrame
									--rchat(":reset me")
									resetdebounce = 0
									--while prevh do fwait() end
									--if not hrp then return end
									--hrp.CFrame = prevcf
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
						if workspace.Camera.CameraSubject == nil or workspace.Camera.CameraSubject.Name:find("ADONIS_LOCALCAMERA") and camerafixdebounce>120 then
							--rchat(":re")
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
								executecmd(":unpunish me")
								unpunishdebounce=0
							end
						end
					elseif fixcharacterdebounce > 120 then
						--rchat(":re")
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
							executecmd(":re")
							VampireVanquisherfixdebounce=0
						end
					end
				end)()
				
				coroutine.wrap(function()
					local function rainbow(plr)
						local plr = game:GetService("Players"):FindFirstChild(plr)
						if plr and plr.Character and plr.Character:FindFirstChild("Building Tools") and plr.Character["Building Tools"]:FindFirstChild("Handle") and plr.Character["Building Tools"].Handle.Locked == false then
							if f3xrainbow > 1 then 
								f3xrainbow = 0
							else
								f3xrainbow=f3xrainbow+0.01
							end
							local ohTable2 = {
								[1] = {
									["Color"] = Color3.fromHSV(f3xrainbow,1,1),
									["Part"] = plr.Character["Building Tools"].Handle,
									["UnionColoring"] = true
								}
							}
							game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer("SyncColor", ohTable2)
						end
					end
					rainbow(lplr.Name)
					rainbow("j0hanwest1")
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
							if (lplr.Character.HumanoidRootPart.Position-rubberband).Magnitude > getgenv().RubberbandRange then
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
						if lplr.Character.HumanoidRootPart.Position.Y < 10 then
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
								v1:Destroy()
							end
						end
					end
				end
			end)()
			
			-- / Patches over other people's cahracters
			
			coroutine.wrap(function()
				for i, v in next, game:GetService("Players"):GetPlayers() do
					if v.Character and v.Character:FindFirstChild("Part") then
						v.Character.Part:Destroy()
					end
				end
			end)()
			
			--[[Find CommandBox
			coroutine.wrap(function()
				
			end)()--]]
			
			coroutine.wrap(function()
				for i, v in next, workspace:GetDescendants() do
					if v.ClassName == "Weld" and v.Name == "SeatWeld" then
						if lplr.Character and lplr.Character:FindFirstChild("HumanoidRootPart") and v.Part1 == lplr.Character.HumanoidRootPart then
							v.Part1 = nil
							v:Destroy()
						end
					end
				end
			end)()
			
				
		end)

		--bans
		coroutine.wrap(function()
			while wait(1) do
				local characters = {}
				for _,c in next, workspace:GetChildren() do
					for i,v in next, banlist do
						if v == c.Name then
							table.insert(characters, c)
						end
					end
				end
				if #characters>0 then
					print("Bans", characters[1])
					pcall(function()
						f3xRemove(characters)
					end)
				end
			end
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
			for i,v in next, workspace.SecureParts:GetDescendants() do
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

		lplr.PlayerGui.DescendantAdded:connect(function(Descendant)
			if Descendant.Name == "CameraShake" then
				Descendant.Disabled = true
				fwait()
				Descendant:Destroy()
			end
			if Descendant.ClassName==("TextLabel") then
				if Descendant.Text:find("Follow: ") and false then
					if Descendant.Parent then
						if Descendant.Parent.Parent then
							if Descendant.Parent.Parent ~= nil then
								fwait()
								Descendant.Parent.Parent:Destroy()
							end
						end
					end
				end
			end
			if Descendant.ClassName == "TextLabel" then
				if Descendant.Text == "Command Box" then
					cmdbox = Descendant.Parent.Parent
				end
			end
			if Descendant.ClassName == "ScreenGui" then
				if Descendant.DataCost == 40 then
					fwait()
					Descendant:Destroy()
				end
			end
			---[[
			if pcall(function()if type(Descendant.Text) == 'string' then return true else return false end end) and not pcall(function()Descendant.Text:GetFullName()end) then
				Descendant.Changed:Connect(function()
					if #Descendant.Text > 1000 then
						Descendant.Text = Descendant.Text:sub(1, 1000)
					end
				end)
			end
			---]]
		end)
		
		lplr.PlayerGui.ChildAdded:Connect(function(Child)
			if Child.ClassName == "ScreenGui" then
				if Child:FindFirstChild("Drag") and Child.Drag:FindFirstChild("Title") and Child.Drag.Title.Text == "Message from " .. lplr.Name then
					Child.Enabled = false
					fwait()
					Child:Destroy()
					debugp("Destroying Joined Message")
--				elseif Child:FindFirstChild("LABEL") and Child.LABEL.Text == "" then -- / Depricated code, please Ctrl F (executecmd(":setmessage " .. getgenv().advert)) to understand what I was about to do.
					
				end
			end
		end)
		
		--- / Other players being patched.
		local function Patch(Player)
			local func1 = function(Character)
				spawn(function()
					Character.ChildAdded:Connect(function(Object)
						if Object.Name == "Part" then
							fwait()
							Object:Destroy()
						elseif Object:FindFirstChild("NameTag") then
							fwait()
							Object:Destroy()
						end
					end)
					local HRP = Character:WaitForChild("HumanoidRootPart")
					local Torso = Character:WaitForChild("Torso", 5) or Vector3.new(2, 2, 1)
					
					HRP.Size = (function()if type(Torso) == 'vector' then return Torso else return Torso.Size end end)() * 1.05
					
					local C = {}
					HRP.Transparency = 0
					C[0] = HRP:GetPropertyChangedSignal("Transparency"):Connect(function()
						if HRP.Transparency ~= 0 then
							HRP.Transparency = 0
						end
					end)
					---[[
					HRP.Material = Enum.Material.ForceField
					C[1] = HRP:GetPropertyChangedSignal("Material"):Connect(function()
						if HRP.Material ~= Enum.Material.ForceField then
							HRP.Material = Enum.Material.ForceField
						end
					end)
					HRP.Color = Color3.new(1,0,0)
					C[2] = HRP:GetPropertyChangedSignal("Color"):Connect(function()
						if HRP.Color ~= Color3.new(1,0,0) then
							HRP.Color = Color3.new(1,0,0)
						end
					end)
					while HRP.Parent.Parent do
						wait(.1)
					end
					for _, Connection in next, C do
						Connection:Disconnect()
					end
					debugp{"haha memory leak go", .07}
					--]]
				end)
			end
			if Player.Character then
				func1(Player.Character)
				Player.CharacterAdded:Connect(function(Chr)
					func1(Chr)
				end)
			else
				Player.CharacterAdded:Connect(function(Chr)
					func1(Chr)
				end)
			end
		end
		
		game:GetService("Players").PlayerAdded:Connect(function(Player)
			Patch(Player)
		end)
		for i, v in next, game:GetService("Players"):GetPlayers() do
			Patch(v)
		end
		
		
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
			end--
			--]]
			if admin then
				executecmd(":ff me")
			end
			local hrp = chr:WaitForChild("Head",5)
			if hrp then
				hrp.Changed:connect(function()
					if hrp.Anchored == true then
						executecmd(":thaw me")
						for i, v in next, chr:GetChildren() do
							if v:IsA("BasePart") then
								v.Anchored = false
							end
						end
					end
					local joint = hrp:WaitForChild("RootJoint", 3)
					if not joint then
						--executecmd(":re")
					end
				end)
			end
			
			chr.DescendantAdded:Connect(function(Object)
				if Object.Name == "Adonis_Rope_Attachment" or Object.Name == "Adonis_Rope_Constraint" or Object.Name == "Seize" or Object.Name == "HippityHopitus" then
					fwait()
					Object:Destroy()
				end
			end)
			
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
			spawn(function()
				--local banlist = {"fatahabahusni2", "j0hanwest1"}
				while false do
					wait(13)
					
					local stayvar = true
					while stayvar do
						for i,v in next, game:GetService("Players"):GetPlayers() do
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
						for i,v in next, banlist do
							s1 = s1..v.."|!join "
						end
						s1 = s1:sub(1,-8)
						executecmd(s1)
					end
				end
			end)
--			wait(30)
--			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
		end)()
		
		-- / Connecting the camera for making it none manipulatable. hhhhhhh
		
		coroutine.wrap(function()
			local camera = workspace:WaitForChild("Camera",10)
			if not camera then
				debugp("What the fuck? Camera is not found?")
			end
		end)()

		--Active Commands
		coroutine.wrap(function()
			if false then return end
			
			
			local rconsoleprint = function(input,color)
				printconsole(tostring(input) .. "\t" .. color .. debug.traceback())
				--return
				--[[
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
				--]]
			end
			
			function GetPlayer(a)
				local b={}
				local c=a:lower()
				if c=="all+"then 
					for d,e in next, game.Players:GetPlayers()do 
						table.insert(b,e)
					end 
				elseif c=="others+"then 
					for d,e in next, game.Players:GetPlayers()do 
						if (e.Name and e.DisplayName)~=(lplr.Name and lplr.DisplayName) then 
							table.insert(b,e)
						end 
					end 
				elseif c=="me+"then 
					table.insert(b,lplr)
				else 
					for d,e in next, game.Players:GetPlayers()do 
						if e.Name:lower():sub(1,#a)==a:lower() or e.DisplayName:lower():sub(1,#a)==a:lower() then 
							table.insert(b,e)
						end 
					end 
				end
				if unpack(b) == nil then --This is to fix any useless uses of the function so if it does spam I can return those parts in the script it does if I'm a dummy.
					rconsoleprint("Player is not ingame or you spelt it wrong.","@@RED@@") 
				end 
				return b 
			end
			local Commands = {}
			Commands = {
				["cmds"] = {
					description = "This will list all commands in chat, if someone asked",
					funk = function()
						local out1 = ""
						for i,v in next, Commands do
							out1 = out1 .. "[Command]: " .. i .. "\n[Description]: " .. (v["description"] or "None") .. (v["disabled"] and "\n#isDisabled" or "") .. "\n\n"
						end
						executecmd(":chatnotifyc all 150 150 150 " .. out1)
					end,
				},
				["snipe"] = {
					description = "It was a test command.",
					disabled = true,
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
								for i,v in next, plrs do
									if i~=#plrs then
										out1 = out1..v.Name..", "
									else
										out1 = out1..", and "..v.Name.."!"
									end
								end
								local out1 = out1:sub(1,out1:len()-2)
								output("Targeting "..out1)
								local msg1 = ""
								for i,v in next, plrs do
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
								executecmd(msg1)
							end
						end
					end,
				},
				["ban"] = {
					description = "Will prevent the player from reseting/respawning character, this is slightly bugged since it can break and never work on that session, and you'd have to rejoin.",
					alias = {"pp"},
					funk = function(msg)
						local args = msg:lower():split(" ")
						local Banned = GetPlayer(args[2])
						if Banned then
							for i,v in next, Banned do
								if not table.find(banlist,v.Name) then
									table.insert(banlist,v.Name)
									if v.Character then
										f3xRemove({v.Character})
									end
									if not msg:find("-s") then
										output(v.Name .. " Has been bannished to the shadow realm")
									end
									if args[3] and args[2] ~= "all" and args[2] ~= "others" then
										local reason = ''
										for i1, v1 in next, args do
											if i1>2 then
												reason = reason .. v1 .. " "
											end
										end
										reason = reason:sub(1,-2)
										if not isfile("cd/Logs/Banned.txt") then writefile("cd/Logs/Banned.txt", "") end
										appendfile("cd/Logs/Banned.txt", v.Name .. "|" .. v.UserId .. "\t" .. reason .. "\t" .. game.JobId  .. "\t" .. os.date('%Y-%m-%d %X') .. "\n")
									end
								end
							end
						end
					end,
				},
				["fixed"] = {
					description = "Allows the client to set fixed variables to their character", 
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
					description = "Easy way to regen admin",
					funk = function()
						fireclickdetector(game:GetService("Workspace").SecureParts.ResetPads.ClickDetector)
					end,
				},
				["shuffle"] = {
					--allies = {""},
					description = "Plays a random song",
					funk = function(rawObjectMessage)
						local song = songs[math.random(1,#songs)]
						local args = rawObjectMessage:split(" ")
						executecmd(":shuffle " .. (antilogger1 .. song .. ","):rep(math.random(1,5))) -- / It's faster if you don't have to send 200KB of data at once. So I just have to give the client a command for B later.
						-- / Hey this is me in the future, 9/18/2021 So, AD just used :shuffle in front of me, and I was like wuuuuuut, it's tagged dude! and then I just ctrl c that stuff into here, thanks to the dude showing me that.
						--if unpack(songsn) == nil then
							--rconsoleprint("[cd.lua]: Enjoy! ^-^ Playing "..gpi(song).Name)
						--else
						--    rconsoleprint("[cmds.lua]: Enjoy! ^-^ Playing "..songsn[])
						if songinfo and songinfo[song] then
							debugp{Message = "Playing " .. songinfo[song].Name, Time = 3}
						else
							debugp"Could not find songname."
						end
					end,
				},
				["fix"] = {
					description = "Will attempt fixing server crashes by removing most of everything that could cause it, else it's a very good way of cleaning up the server's lighting and map",
					funk = function()
						local t1 = {
							'clr',
							'clearterrain',
							'fix',
							'free all',
							'undeadlands all',
							'unview all',
							're all',
							'bring others',
							'fly all'
						}
						local s1 = ":"
						for i,v in next, t1 do
							s1 = s1..v.."|:"
						end
						executecmd(s1)
					end,
				},
				["blind"] = {
					description = "Will blind everyone", 
					funk = function()
						executecmd(":tm 10e10 imagine trying to understand " .. ("#"):rep(100000))
					end,
				},
				["hideui"] = {
					description = "Will hide everyones UI",
					funk = function()
						executecmd(":n imagine reading this and not your playergui lol " .. ("#"):rep(100000))
					end,
				},
				["outfits"] = {
					description = "Will list all the outfits on client side",
					funk = function()
						local c = listfiles("cd/Outfits")
						local s1 = ""
						for i,v in next, c do
							s1 = s1.."["..i.."] "..v.."\n"
						end
						rconsoleprint(s1,"@@MAGENTA@@")
					end,
				},
				["outfit"] = {
					description = "Set's cd/Outfits/<args[2]>.cd as your outfit",
					funk = function(msg)
						local commandOut = "" -- since adonis is nice :)
						if not lplr.Character then
							rconsoleprint("WARNING: No character found","@@YELLOW@@")
							return
						end
						if not lplr.Character:FindFirstChild("Head") then
							rconsoleprint("WARNING: No head found","@@YELLOW@@")
							return
						end
						local append = function(i)
							commandOut = commandOut .. i .. "|:wait 1|" -- :)
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
							local err = pcall(function()Outfit=loadstring(readfile("cd/Outfits/"..input..".cd"):lower())()end)
							if not err then
								rconsoleprint("ERROR: Outfit Input Invalid \(Does Not Exist!!\)","@@RED@@")
								return
							end
						end
						for i,v in next, Outfit do
							print(i,v)
						end
						
						for _,v in next, args do
							if v:find("+e") then
								append(":removehats me")
								--[[ / This is client side now.
								for i,v in next, lplr.Character:GetChildren() do
									if v.ClassName=='Shirt'or v.ClassName=='Pants'then
										v:Destroy()
									end
								end
								--]]
							end
						end
						if Outfit.hat then
							for _,v in next, Outfit.hat do
								append(":hat me "..v)
							end
						end
						append(":shirt me "..Outfit.shirt)
						append(":pants me "..Outfit.pants)
						if tonumber(Outfit.face) ~= 0 and Outfit.face then
							append(":face me "..Outfit.face)
						end
						if Outfit.Creator then 
							append(":h "..Outfit.creator)
						end --if you wanted to give credit
						
						print(commandOut)
						executecmd(commandOut)
					end,
				},
				["?"] = {
					description = "Will copy the song id that is playing",
					funk = function()
						if workspace:FindFirstChild("ADONIS_SOUND") then
							if workspace.ADONIS_SOUND.ClassName == "Sound" then
								local id = workspace.ADONIS_SOUND.SoundId:match("%d+"):sub(-10) --%d+ will grab digits and it will sub last ten numbers so 00000 does not show on the copy.
								setclipboard(id)
							end
						end
					end,
				},
				["lockserver"] = {
					description = "Will do the same as ban which will delete characters if seen",
					funk = function()
						if BanningConnection then
							BanningConnection:Disconnect()
							banlist = {}
							BanningConnection = nil
							return
						end
						
						local function funk6(a)
							local c = lplr:IsFriendsWith(a.UserId)
							print(c)
							local b
							print(a.Name, a.UserId)
							for _,c in next, whitelist do
								if (a.Name or a.UserId) == c then
									print(c, a.UserId, a.Name, "he's whitelisted")
									b = true
								end
							end
							print(b,a)
							if not b then
								print("Banned: " .. a.Name)
								table.insert(banlist,a.Name)
							else
								print("Not banned: " .. a.Name)
							end
						end
						for i1,plr in next, game:GetService("Players"):GetPlayers() do
							funk6(plr)
						end
						BanningConnection = game:GetService("Players").PlayerAdded:connect(function(plr)
							funk6(plr)
						end)
					end,
				},
				["playerinfo"] = {
					disabled = true,
					description = "Should show playerinfo such as if they are verified with an email, but it's currently being tagged(so it's only client side for now)",
					funk = function()
						local msg = ':m isVerified\n'
						for i, plr in next, game:GetService("Players"):GetPlayers() do
							local body = game:HttpGet("https://api.roblox.com/ownership/hasasset?userId=" .. plr.UserId .. "&assetId=102611803")
							msg = msg .. plr.Name .. ": " .. (body=='true' and "isVerified" or "isNotVerified")
						end
						executecmd(msg)
					end,
				},
				["bye"] = {
					description = "Will superfling everyone",
					funk = function()
						executecmd(":sfling others 10e10")
					end
				},
				["say"] = {
					funk = function(rawObjectMessage)
						local content = rawObjectMessage:sub(4,rawObjectMessage:len())
						
						executecmd(":m >" .. content)
					end
				},
				["tp"] = {
					description = "Will allow the client to tp themselves without turning off rubberband/anti tp",
					funk = function(rawObjectMessage)
						local args = rawObjectMessage:lower():split(" ")
						if GetPlayer(args[2]) and GetPlayer(args[2])[1] and GetPlayer(args[2])[1].Character and GetPlayer(args[2])[1].Character:FindFirstChild("HumanoidRootPart") and lplr.Character and lplr.Character:FindFirstChild("HumanoidRootPart") then
							rubberband = GetPlayer(args[2])[1].Character.HumanoidRootPart.Position
						end
					end
				},
				["close"] = {
					description = "Will close the client since it's faster",
					funk = function()
						executecmd(":tm 1 Closing Client.")
						game:Shutdown()
					end
				},
				["unban"] = {
					disabled = false,
					funk = function(rawObjectMessage)
						local args = rawObjectMessage:lower():split(" ")
						for i, v in next, GetPlayer(args[2]) do
							if v and table.find(banlist, v.Name) then
								table.remove(banlist, v.Name)
							end
						end
					end
				},
				["antilogger"] = {
					level = 0,
					funk = function()
						if antilogging then
							getgenv().antilogging = false
						else
							getgenv().antilogging = true
						end
						executecmd(":clearguis others true")
					end
				},
				["anticrasher"] = {
					description = "Will prevent the client from crashing.",
					funk = function()
						if removebuilds then
							getgenv().removebuilds = false
						else
							getgenv().removebuilds = true
							for i, v in next, workspace:GetChildren() do
								if not plrFromChr(v)and v.ClassName~='Camera'and v.ClassName~='Terrain'and v.Name~='SecureParts'and not v.Name:match('^'..tostring(game:GetService('Players').LocalPlayer.Name)..'_ADONISJAIL$')and v.ClassName ~= 'Sound' then
									v:Destroy()
								end
							end
						end
					end
				},
				["virus"] = {
					funk = function()
						executecmd(":charaudio all 7230922780")
					end
				},
				["q"] = {
					funk = function(rawObjectMessage)
						local responce
						pcall(function()
							responce = syn.request{
								Url = "https://ddg.nekoware.lgbt",
								Method = "POST",
								Body = 'q=' .. game:GetService("HttpService"):UrlEncode(rawObjectMessage:sub(3))
							}
						end)
						if responce.StatusCode == 200 then
							print("HTTPGET", "https://ddg.nekoware.lgbt", rawObjectMessage:sub(3), 'q=' .. game:GetService("HttpService"):UrlEncode(rawObjectMessage:sub(3)))
							for i,v in next, responce do
								print(i, v)
							end
							print("Headers")
							for i, v in next, responce.Headers do
								print(i, v)
							end
							print("EOHTTP")
							if false then
								
							end
						else
							warn("HTTPGET", "https://ddg.nekoware.lgbt", rawObjectMessage:sub(3))
							for i, v in next, responce do
								print(i, v)
							end
							warn("EOEHTTP")
						end
					end
				},
				["paste"] = {
					funk = function(rawObjectMessage)
						local responce
						pcall(function()
							responce = syn.request{
								Url = "https://ddg.nekoware.lgbt",
								Method = "POST",
								Body = 'ni&q=' .. game:GetService("HttpService"):UrlEncode('site:pastebin.com ' .. rawObjectMessage:sub(7))
							}
						end)
						if responce.StatusCode == 200 then
							local f1 
							f1 = function(tbl)
								local output = ''
								if type(tbl) == 'table' then
									f1(tbl)
								else
									output = tbl .. '\n'
								end
							end
							
							print("HTTPGET", "https://ddg.nekoware.lgbt", rawObjectMessage:sub(7), game:GetService("HttpService"):UrlEncode('site:pastebin.com ' .. rawObjectMessage:sub(7)))
							for i,v in next, responce do
								print(i, v)
							end
							print("Headers")
							for i, v in next, responce.Headers do
								print(i, v)
							end
							print("EOHTTP")
							setclipboard(responce.Body)
							if true then
								local body = JSOND(responce.Body)
								print(body)
								for i, v in next, body do
									warn(i)
									print(f1(v))
									print('\n')
								end
							end
						else
							warn("HTTPGET", "https://ddg.nekoware.lgbt", rawObjectMessage:sub(7))
							for i, v in next, responce do
								print(i, v)
							end
							warn("EOEHTTP")
						end
					end
				},
				["rainbow"] = {
					disabled = true,
					funk = function(rawObjectMessage)
						
					end
				},
				["lag"] = {
					funk = function()
						-- / This will have a runc for my lag command :)
						executecmd(":runc @casual_degenerate#7475\nLAG1") -- / This has to be a runc because of client side lag sorry.
						-- / btw it takes forever to load this, but it's only about 10 or so seconds :3
					end,
				},
				["unlag"] = {
					funk = function()
						executecmd(":undisplayname me|:clear")
					end,
				},
				["crash"] = {
					funk = function(rawObjectMessage)
						local args = rawObjectMessage:split(" ")
						if args[2] then
							local Players = GetPlayer(rawObjectMessage:split(" ")[2])
							for i, v in next, Players do
								executecmd(":loadb inf2|:wait 2|:re " .. v.Name .. "|:forceviewcam " .. v.Name .. " inf2|:tp " .. v.Name .. " waypoint-inf2")
							end
						end
					end,
				},
				["uncrash"] = {
					funk = function()
						executecmd(":unloadb inf2")
					end
				},
				["download"] = {
					funk = function()
						if DOWNLOADING_1_ then
							debugp("You are already downloading silly!")
							return
						end
						DOWNLOADING_1_ = true
						while not getgenv().logsKey do
							executecmd(":JoinLogs " .. ("\n@casual_degenerate#7475 Has logged this server."))
							local VirtualUser = game:GetService("VirtualUser");
							local UserInputService = game:GetService("UserInputService");
							local RunService = game:GetService("RunService");
							local PlayerGui = lplr.PlayerGui;

							local executebutton, cords, mousePos, mouseCon do
								repeat
									for _,v in pairs (PlayerGui:GetDescendants()) do
										if v.Name == "Spinner" and v.ClassName == "ImageLabel" and v.Image == "rbxassetid://69395121" then
											executebutton = v.Parent
										end
									end
									wait()
								until executebutton ~= nil and iswindowactive() == true
								cords = UDim2.fromOffset(executebutton.AbsolutePosition.X+executebutton.AbsoluteSize.X/2, executebutton.AbsolutePosition.Y+executebutton.AbsoluteSize.Y*2.5) 
								mousePos = UDim2.fromOffset(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
							end
							local CO = -1
							local function CU()
								if CO == 1 then
									CO = -1
								else
									CO = 1
								end
								return CO
							end
							mouseCon = RunService.RenderStepped:Connect(function()
								if not count then count = 0 else count += 1 end -- hehe funny luau is added
								mousemoveabs(cords.X.Offset, cords.Y.Offset)
								if count >= 100 then 
									mouseCon:Disconnect() 
									mousemoverel(CU(), CU())
									wait()
									mouse1click() 
								end
							end)
							wait(2)
						end
						local Logs = {
							'JoinLogs',
							'ChatLogs',
							'CommandLogs',
							'PartCountUpdate'
						}
						while true do 
							for i, _log in next, Logs do
								local RET = game:GetService("JointsService"):FindFirstChildWhichIsA("RemoteEvent")['']:InvokeServer(getgenv().logsInfo, getgenv().logsKey, _log)
								debugp{Message = _log .. " Downloaded! (" .. i .. "/3)", Time = .03}
								if not isfolder("cd/Downloads/ServerLogs/Admin House/" .. game.JobId) then
									makefolder("cd/Downloads/ServerLogs/Admin House/" .. game.JobId)
								end
								writefile("cd/Downloads/ServerLogs/Admin House/" .. game.JobId .. "/" .. _log .. ".json", JSONE(RET))
							end
							wait(15)
						end
					end,
				},
				["memez"] = {
					funk = function()
						print(getgenv().memez)
						if getgenv().memez then
							getgenv().memez = false
							return
						else
							getgenv().memez = true
						end
						local Memes = readfile("cd/Config/Unmoderated Random Messages.txt"):split("\n")
						
						while memez do
							local Message = Memes[math.random(1, #Memes)]
							executecmd(":sm " .. Message)
							--print(Message)
							wait(3)
						end
						
					end
				},
				["rave"] = {
					funk = function()
						if not _G.RAVE then
							loadstring(game:HttpGet("https://raw.githubusercontent.com/casualdegenerate/rblx/main/Archive(useless%20mostly)/Admin%20House!/Recolor/RAVE%20PARTY!.lua"))()
						else
							_G.RAVE = false
							local destroy = {}
							
							for i, v in next, getgenv().parts do
								destroy[i] = v["RPart"]
							end
							
							lplr.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer("Remove", destroy)
						end
					end
				},
				["fakemap"] = {
					funk = function()
						getgenv().RubberbandRange = 6000
						executecmd(":loadb car1|:wait 3|:unfly all|:skydive all 200")
						wait(5)
						getgenv().RubberbandRange = 1.5
					end
				},
				["nosound"] = {
					funk = function()
						if nosound then
							nosound:Disconnect()
							nosound = nil
						else
							nosound = workspace.DescendantAdded:Connect(function(Object)
								if Object.ClassName == "Sound" then
									Object.Volume = 0
									fwait()
									Object.Parent = nil
								end
							end)
							for i, v in next, workspace:GetDescendants() do
								if v.ClassName == "Sound" then
									v.Parent = nil
								end
							end
						end
					end
				},
				["noturn"] = {
					funk = function()
						executecmd(":spin all|:spin all")
					end
				},
				["click"] = {
					disabled = true,
					funk = function()
					
					end,
				},
				["clnomusic"] = {
					funk = togglemusic
				},
				["booba"] = {
					funk = function()
						executecmd(":charaudio me " .. [===[ 
██████╗░░█████╗░░█████╗░██████╗░░██████╗
██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝
██████╦╝██║░░██║██║░░██║██████╦╝╚█████╗░
██╔══██╗██║░░██║██║░░██║██╔══██╗░╚═══██╗
██████╦╝╚█████╔╝╚█████╔╝██████╦╝██████╔╝
╚═════╝░░╚════╝░░╚════╝░╚═════╝░╚═════╝░ ]===])
					end
				},
				["ascii"] = {
					function(rawObjectMessage)
						local wanted = rawObjectMessage:split(" ")[2]
						if ascii[wanted] then
						
						end
					end
				}
			}
			-- / Allow normal commands for client
			
			-- / Onii chan! you can't just make a whitle true doo!
			--[[for some reason this crashes T_T
			spawn(function()
				while wait(.3) do -- hehe while true do end go <Roblox is not responding>
					local rawObjectMessage = rconsoleinput()
					spawn(function()
						local args = rawObjectMessage:split(" ")
						
						if rawObjectMessage:sub(1,1) == ";" then
							rawObjectMessage = rawObjectMessage:sub(2)
							local args = rawObjectMessage:lower():split(" ")
							for _,v in next, Commands do
								if type(v) == "table" then
									if v.allies then
										for _1,v1 in next, v.allies do 
											if args[1] == v1 then 
												local a,err = pcall(function()v.funk(rawObjectMessage)end)
												if err then
													rconsoleprint(err,"@@RED@@")
												end
											end
										end
									end
									if args[1] == _ then
										local a,err = pcall(function()v.funk(rawObjectMessage)end)
										if err then
											rconsoleprint(err,"@@RED@@")
										end
									end
								end
							end
						elseif rawObjectMessage:sub(1,1) == ":" then
							executecmd(rawObjectMessage)
						elseif rawObjectMessage:sub(1,1) == "!" then
							if rawObjectMessage == "!ns" then
								executecmd("!newserver")
							elseif rawObjectMessage == ("!rj" or "!rejoin") then
								game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
							end
						elseif rawObjectMessage:sub(1,1) == "~" then
							fchat(rawObjectMessage:sub(2))
						else
							executecmd(":chatnotifyc all 0 200 0 [cd/]: " .. rawObjectMessage .. "|:talk me " .. rawObjectMessage)
						end
					end)
				end
			end)
			--]]
			
			Connections["Player Chatted"] = bind.Event:Connect(function(rawObjectMessage)
				if rawObjectMessage:sub(1,1) == ";" then
					rawObjectMessage = rawObjectMessage:sub(2)
					local args = rawObjectMessage:lower():split(" ")
					for _,v in next, Commands do
						if type(v) == "table" then
							if v.allies then
								for _1,v1 in next, v.allies do 
									if args[1] == v1 then 
										local a,err = pcall(function()v.funk(rawObjectMessage)end)
										if err then
											rconsoleprint(err,"@@RED@@")
										end
									end
								end
							end
							if args[1] == _ then
								local a,err = pcall(function()v.funk(rawObjectMessage)end)
								if err then
									rconsoleprint(err,"@@RED@@")
								end
							end
						end
					end
				elseif rawObjectMessage:sub(1,1) == ":" then
					executecmd(rawObjectMessage)
				elseif rawObjectMessage:sub(1,1) == "!" then
					if rawObjectMessage == "!ns" then
						executecmd("!newserver")
					elseif rawObjectMessage == ("!rj" or "!rejoin") then
						game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
					else
						executecmd(rawObjectMessage)
					end
				elseif rawObjectMessage:sub(1,1) == "~" then
					fchat(rawObjectMessage:sub(2))
				else
					local changes = {
						['`tou'] = "東",
						['`hou'] = "方"
					}
					for _find, _change in next, changes do
						rawObjectMessage = rawObjectMessage:gsub(_find, _change)
					end
					executecmd(":chatnotifyc all 0 200 0 " .. NAME .. rawObjectMessage .. "|:talk me " .. rawObjectMessage)
				end
			end)
			
			local function playerschatted(plr)
				appendfile("cd/Config/Unmoderated Random Messages.txt", plr.DisplayName .. "\n")
				plr.Chatted:Connect(function(msg)
					for i, v in next, whitelist do
						if (plr.Name and plr.UserId) == v then
							executecmd(":m Welcome " .. plr.Name)
						end
					end
					
					if msg:lower():find("logs") and getgenv().antilogging then
						executecmd(":clearguis others true")
					end
				end)
			end
			
			for i, v in next, game:GetService("Players"):GetPlayers() do
				if v ~= lplr then
					if lplr:IsFriendsWith(v.UserId) then
						print("Friend detected!", v.Name, v.UserId)
						table.insert(whitelist,v.Name)
					end
					playerschatted(v)
				end
			end
			game:GetService("Players").PlayerAdded:Connect(function(player)
				local function getServerType()
					if game.PrivateServerId ~= "" then
						if game.PrivateServerOwnerId ~= 0 then
							return "VIPServer"
						else
							return "ReservedServer"
						end
					else
						return "StandardServer"
					end
				end
				print(lplr:IsFriendsWith(player.UserId))
				if lplr:IsFriendsWith(player.UserId) then
					table.insert(whitelist, player.Name)
				end
				if getServerType() == "StandardServer" then
					for i, v in next, crashers do
						if (player.Name or player.UserId) == v then
							appendfile("debug.txt", "[INFO " .. os.date('%Y-%m-%d/%H:%M:%S') .. "]: Crasher joined ingame, leaving\t" .. player.Name .. "\t" .. player.UserId .. "\n")
							local h
							pcall(function()
								while not pcall(function()print(h.data)end) do
									local r = game:HttpGet("https://games.roblox.com/v1/games/"..tostring(game.PlaceId).."/servers/Public?sortOrder=Asc&limit=100")
									h = JSOND(r)
									wait(2)
								end
							end)

							for i,v in pairs(h.data)do
								print("check",v.id)
								if v.playing~=v.maxPlayers and v.id ~= game.JobId then
									print("grab",v.id)
									--appendfile("cd/bin/Cache.data",tostring(v.id).."\n")
									if pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id)end) then
										break
									end
								end
							end
						end
					end
					return
				end
				playerschatted(player)
			end)
			local serverCache = isfile("cd/serverCache.txt") and readfile("cd/serverCache.txt"):split("\n") or {}
			local sameServer
			for i1, v1 in next, serverCache do
				if v1:split("\t")[1] == game.JobId then
					sameServer = true
					break
				end
			end
			if not sameServer then
				wait(3)
				local message = (
	[===[.\Main.lua
	Injector: ]===] .. lplr.DisplayName .. [===[
	
	
	You can build whatever you want, including nonoes, just as long as the server does not slow down because of it.
	
	Not following my standards will make me cry ;(
	
	Debug info:
	
	]===] .. (function()local i = 0 for i1,v in next, Commands do i=i+1 end return i end)() .. [===[ Commands loaded
	
	Made by @casual_degenerate#7475
	t.me/casuals_funnychat]===]
	)
				--[====[ Old message that takes fucking ages
				
	]===] .. (function()
		local out1 = ""
		for i,v in next, Commands do
			out1 = out1 .. i .. "\n" .. (v["description"] or "None") .. (v["disabled"] and "\n#Disabled" or "") .. "\n\n"
		end
		return out1
	end)() .. [===[
				--]====]
				executecmd(":clearguis others true|:textw all " .. message .. "|:setmessage t.me/casuals_funnychat|:displayname me cd/|:m >Hello")
				appendfile("cd/serverCache.txt", game.JobId .. "\t" .. tick() .. "\n")
				rchat("Speak no evil.") -- / If I get warned for this. Bullshit.
			else
				executecmd(":m >Hello|:displayname me cd/")
			end
		end)()
		
		--[[ / Memez inside the Chat Logs
		spawn(function()
			local _Memes = {
				"What's that?"
			}
--			Memes = readfile("cd/Config/Random Messages.txt"):split("\n")
			for i, v in next, Memes do
				rchat(v)
				wait(60)
			end
		end)
		--]]
		
		-- / Advertize
		
		spawn(function()
			getgenv().advert = '@casual_degenerate#7475 was here.'
			while true do
				for i, v in next, lplr.PlayerGui:GetChildren() do
					if v:FindFirstChild("LABEL") and v.LABEL.Text == getgenv().advert then
						FOUNDADVERT = true
					else
						FOUNDADVERT = false
					end
				end
				if not FOUNDADVERT then
					executecmd(":setmessage " .. getgenv().advert)
				end
				wait(15)
			end
		end)
		
		-- // Buffering shit.
		
		-- // Audio clean up.
		print("Checking " .. #songs .. " songs")
		for _, input in next, songs do
			--print(input)
			local success
			local Info
			while not success do
				success, msg = pcall(function()Info = game:GetService("MarketplaceService"):GetProductInfo(tonumber(input))end)
				if not success then
					print(success, msg)
					wait(10)
				end
				wait()
			end
			if not Info.IsPublicDomain then
				warn("Detected deleted audio", Info.AssetId, Info.Name)
				table.remove(songs, _)
			else
				songinfo[tostring(input)] = Info
				--print(Info.Name, Info.AssetId)
			end
		end
		local temptbl = {}
		for i, v in next, songs do
			table.insert(temptbl,v)
		end
		songs = temptbl
		print("Finished checking songs~", #songs)
		
		
		
	end)
}
--]]

-- / So I can see people's assets on things I want to know already stored, without the need of api that might change.
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

-- / A fun project, if you want, just message me for that AHK
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

-- / This is client side cosmetics, I made it so I can feel more pleased by my looks(since I can't change it anymore because of my exploit)
---[[Cosmetics
threads["Cosmetics"] = {
	["Active"] = true,
	["Thread"] = coroutine.create(function()
		--[[if game.PlaceId ~= 1068523756 and game.PlaceId ~= 115670532 and game.PlaceId ~= 112420803 then
			return "Not allowed to run."
		end --It can run in other places I guess :/ hope no bans from it.]]
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
}
--]]

-- / This is a patch/modfication to a game that does fun stuff and what I'm currently working on.
threads["Church Patch"] = {
	["Active"] = true,
	["Thread"] = coroutine.create(function()
		if game.PlaceId ~= 1068523756 then
			return "Wrong game to execute"
		end
		repeat wait() until game:GetService("Players").LocalPlayer
		local plr = game:GetService("Players").LocalPlayer 
		
		fspawn(function()
			-- / Remove patches (stuff I don't want rn)
			local L_T_1 = {workspace:WaitForChild("CORE"):WaitForChild("verb"):WaitForChild("key"):WaitForChild("out"):WaitForChild("TouchInterest"),workspace:WaitForChild("CORE"):WaitForChild("Main"):WaitForChild("tp"):WaitForChild("Part"):WaitForChild("TouchInterest")}
			
			for i, v in next, L_T_1 do
				v:Destroy()
			end
			for i, v in next, workspace:GetDescendants() do
				if v.ClassName == "Part" or v.ClassName == "UnionOperation" then
					if v.Material == Enum.Material.Glass then
						v:Destroy()
					end
				end
			end
		end)
		
		
		local func1 = function(chr)
			local head = chr:WaitForChild("Head",tonumber'inf')
			local tag = head:WaitForChild("NameTag",tonumber'inf')
			tag:ClearAllChildren()
			local animate = chr:WaitForChild("Animate",tonumber'inf')
			animate:WaitForChild("idle",tonumber'inf')
			wait(1)
			for i,v in next, animate.idle:GetChildren() do
				v.AnimationId = "rbxassetid://0"
			end
		end
		
		Connections["Remove Nametag"] = plr.CharacterAdded:Connect(function(chr)
			func1(chr)
		end)
		
		if plr.Character then
			func1(plr.Character)
		end
		
		local admins = {
			"AsynchronousMatrix",
			"aaro102",
			"CasualDegenerate"
		}
		local commands = {}
		commands = {
			["info"] = {
				["Level"] = 0,
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
			},
			["tools"] = {
				["Level"] = 5,
				["Fire"] = function(tbl)
					if not tbl["rawObjectMessage"] then
						return "No message?"
					end
					
					
					
					
				end
			},
			["outfit"] = {
				["Level"] = 5,
				["Fire"] = function(tbl)
					local c1,c2,c3,output = "No message?", "No arguments?", "No file found by that outfit name?",""
					
					if not tbl["rawObjectMessage"] then
						return c1
					end
					if not tbl["Arguments"] then
						return c2
					end
					local file = "cd/Outfits/" .. tbl["Arguments"][2] .. '.cd'
					if not isfile(file) then
						return c3 .. ' ' .. file
					end
					if plr.Character and plr.Character:FindFirstChild("Head") then
						for i,v in next, plr.Character.Head:GetChildren() do
							if v.ClassName == "Decal" then
								v:Destroy()
							end
						end
					end
					local module = loadstring(readfile(file):lower())() -- / Should return a table and do nothing much
					
					game:GetService("ReplicatedStorage").CapeService:FireServer("shirt", tonumber(module.shirt))
					wait(1)
					game:GetService("ReplicatedStorage").CapeService:FireServer("pants", tonumber(module.pants))
					wait(1)
					if module.hat then
						game:GetService("ReplicatedStorage").CapeService:FireServer("hat", module.hat)
					end
					
					return "Method changed(8/29/2021)"
					
				end
			},
			["cache"] = {
				["Level"] = 6,
				["Fire"] = function(tbl)
					local c1,c2,c3,output,playersF = "No message?", "No arguments?", "Player by that name.","",{}
					
					if not tbl["rawObjectMessage"] then
						return c1
					end
					if not tbl["Arguments"] then
						return c2
					end
					
					local eh = function(idname,userid,plr)local idname, userid = tostring(idname), tostring(userid) 
						spawn(function()if hasAsset(userid,102611803) == "true" then
							lchat("["..idname.."]: I'm Verified!","@@GREEN@@") 
						else
							lchat("["..idname.."]: I'm Not verified?","@@RED@@") 
						end;end)
						if not isfolder("cd/Accounts") then
							makefolder("cd/Accounts")
						end
						local f = "cd/Accounts/Outfits "..userid.." "..idname.." "..userid..tostring(tick())..".txt"
						local h = Fetch.Get("https://avatar.roblox.com/v1/users/"..userid.."/outfits?itemsPerPage=50")
						--debugp(h)
						local u = JSOND(h)
						if #u.data == 0 then
							lchat("["..idname.."]: I have no outfits!","@@RED@@")
						elseif #u.data == 1 then
							lchat("["..idname.."]: I have only one outfit!","@@YELLOW@@")
						else
							lchat("["..idname.."]: I have "..tostring(#u.data).." outfits!","@@GREEN@@")
						end
						local id = ""
						local images = ""
						local data = ""
						if u.data[1] == nil then writefile(f,"") return end
						for _,v in pairs(u.data) do
							id = id..v.id..","
						end
						local id = id:sub(1,-2)
						local h = Fetch.Get("https://thumbnails.roblox.com/v1/users/outfits?userOutfitIds="..id.."&size=420x420&format=png")
						local j = JSOND(h)
						for _,v in pairs(j.data) do --print(v.targetId,v.imageUrl)
						--    table.insert(images,v.imageUrl)
							if v.targetId and v.imageUrl then 
								images = images.."[".._.."] "..v.targetId.." "..v.imageUrl.." | "..u.data[_].name.."\n" 
							elseif not v.targetId and v.imageUrl then
								images = images.."[".._.."] Id lost... "..v.imageUrl.."\n" 
							elseif v.targetId and not v.imageUrl then
								images = images.."[".._.."] "..v.targetId.." Image lost...\n" 
							end
						end
						--for _,v in pairs(images) do
						--    local h = game:HttpGet(v)
						--    
						--end
						--writefile("cd/cache/"..v.Name..v.UserId)
						local id = id:split(",")
						for _,v in pairs(id) do --print(v)
							local h = Fetch.Get("https://avatar.roblox.com/v1/outfits/"..v.."/details")
							local j = JSOND(h)
							data = data.."[".._.."]\n"
							for ef,he in pairs(j) do
								writefile("")
								for a,b in next, j.assets do
									data = data..b.name.." "..b.id.." | "..b.assetType.name.."\n"
								end
							end
						end
						--print(images)
						--print(data)
						

						writefile(f,images..data:sub(1,-2))
					end
					for _,v in pairs(args) do
						if v:find("+f") then
							if tonumber(args[2]) == nil then
								local h = Fetch.Get("https://api.roblox.com/users/"..args[2])
								local j = JSOND(h)
								eh(j.Username,args[2],GetPlayer(j.Username))
							else
								local h = Fetch.Get("https://api.roblox.com/users/get-by-username?username="..args[2])
								local j = JSOND(h)
								eh(args[2],j.Id,GetPlayer(args[2]))
							end
						end
					end
					for _,v in pairs(GetPlayer(args[2])) do
						spawn(function()eh(v.Name,v.UserId)end)
					end
					
				end
			},
			["friends"] = {
				["Level"] = 5,
				["Fire"] = function(tbl)
					local c1,c2,fPlayer,output = "No message?", "No arguments?",nil,""
					
					if not tbl["rawObjectMessage"] then
						return c1
					end
					if not tbl["Arguments"] then
						return c2
					end
					
					for i,v in next, game:GetService("Players"):GetPlayers() do
						if v.Name:lower():find(tbl["Arguments"][2]:lower()) then
							fPlayer = v
							break
						end
					end
					
					for i,v in next, game:GetService("Players"):GetPlayers() do
						if fPlayer:IsFriendsWith(v.UserId) then
							lchat(v.Name)
						end
					end
					
				end
			},
			["copy"] = {
				["Level"] = 5,
				["Fire"] = function(tbl)
					local c1,c2,c3,output,userId,IsReal = "No message?", "No arguments?", "No player selected?", "",nil,false
					
					if not tbl["rawObjectMessage"] then
						return c1
					end
					if not tbl["Arguments"] then
						return c2
					end
					if not tbl["Arguments"][2] then
						return c3
					end
					
					local a = function(id,real)
						if not real then
							local h = syn.request({Url = "https://avatar.roblox.com/v1/users/" .. tostring(id) .. "/avatar", Method = "GET"})
							warn("https://avatar.roblox.com/v1/users/" .. tostring(id) .. "/avatar")
							for i,v in next, h do
								print(i,v)
							end
							local j = JSOND(h.Body)
							if not isfolder("cd/Accounts/" .. id) then
								makefolder("cd/Accounts/" .. id)
							end
							local file = "cd/Accounts/" .. id .. "/" .. tick() ..".cd"
							writefile(file,"")
							local hats = {8}
							for i=41,47 do 
								table.insert(hats,i)
							end
							local content={{}}
							for _,v in next, j.assets do
								for k,f in next, hats do
									if v.assetType.id == f then
										table.insert(content[1],v.id)
									end
								end
								if v.assetType.name == "Shirt" then
									content[2] = v.id
								elseif v.assetType.name == "Pants" then
									content[3] = v.id
								elseif v.assetType.name == "Face" then
									content[4] = v.id
								end
							end
							
							for _,v in next, content do
								if _ == 1 then
									for i=1,#v,2 do
										if v[i+1] then
											rchat("!hat " .. v[i] .. "|!hat " .. v[i+1])wait(.5)
										else
											rchat("!hat " .. v[i])wait(.5)
										end
									end
								elseif _ == 2 then
									output = output .. "!shirt " .. v .. "|"
								elseif _ == 3 then
									output = output .. "!pants " .. v .. "|"
								elseif _ == 4 then
									output = output .. "!face " .. v
								end
							end
							appendfile(file,"Module = {}\n\n")
							for _,v in next, content do
								if _ == 1 then 
									appendfile( file, "Module.hat = {\n" )
									for i=1,#v do
										appendfile( file, "\t'" .. v[i] .. "',\n" )
									end
								elseif _ == 2 then
									appendfile( file, "}\nModule.shirt = '" .. v .. "'\n" )
								elseif _ == 3 then
									appendfile( file, "Module.pants = '" .. v .. "'\n" )
								elseif _ == 4 then
									appendfile( file, "Module.face = '" .. v .. "'\n" )
								end
							end
							appendfile( file, "\nreturn Module" )
						else
							for i,v in next, game:GetService("Players"):GetPlayers() do
								if v.UserId == id then
									local file = "cd/Accounts/" .. id .. "/CHARACTER " .. tick() ..".cd"
									writefile(file, "")
									appendfile(file, "Module = {}\n")
									if v.Character then
										if v.Character.Shirt then
											warn(v.Character.Shirt.ShirtTemplate:match("%d+"))
											output = output .. "!shirt " .. v.Character.Shirt.ShirtTemplate:match("%d+") .. "|"
											appendfile(file, "shirt = '" .. v.Character.Shirt.ShirtTemplate:match("%d+") .. "'\n")
										end
										if v.Character.Pants then
											warn(v.Character.Pants.PantsTemplate:match("%d+"))
											output = output .. "!pants " .. v.Character.Pants.PantsTemplate:match("%d+") .. "|"
											appendfile(file, "pants = '" .. v.Character.Pants.PantsTemplate:match("%d+") .. "'\n")
										end
									end
								end
							end
						end
						
						rchat(output)
						
					end
					for _,u in next, tbl["Arguments"] do 
						if u:find("+e") then 
							rchat"!removehats|!shirt 6816866895|!pants 1197893613"wait(.66)
						end
						if u:find("+f") then
							if tonumber(tbl["Arguments"][2]) ~= nil then
								userId = tbl["Arguments"][2]
							else
								local h = syn.request({Url = "https://api.roblox.com/users/get-by-username?username="..tbl["Arguments"][2], Method = "GET"})
								local j = JSOND(h.Body)
								userId = j.Id
							end
						end
						if u:find("+c") then
							IsReal = true
						end
					end
					if not userId then print("no userId")
						for _,v in next, game:GetService("Players"):GetPlayers() do
							if v.Name:lower():find(tbl["Arguments"][2]:lower()) then
								userId = v.UserId
								print(v.Name)
							end
						end
					end
					if not userId then return "No user found of that name?" end
					a(userId,IsReal)
				end
			},
		}
		
		local level = function(player)
			if player == plr then 
				return 5
			end
			if table.find(admins,player.UserId and player.Name) then
				return 4
			end
			return -1 -- / Set to -1 for nothing.
		end
		
		local func2 = function(player)
			Connections["Player Chatted"] = bind.Event:Connect(function(rawObjectMessage)
				local args = rawObjectMessage:split(" ")
				
				if args[1]:sub(1,1) == ":" then
					for i,v in next, commands do
						if args[1]:sub(2):lower() == tostring(i):lower() and v["Level"] then
							if v["Level"] <= level(player) then
								local message = v["Fire"]{["rawObjectMessage"] = rawObjectMessage,["Arguments"] = args,["Caller"] = player}
								if message then
									printconsole("Command : "..tostring(i).." : Caller : "..player.Name.."$"..player.UserId.." : Message : "..tostring(message))
								end
							end
						end
					end
				end
			end)
		end
		
		Connections["Whitelist Players"] = game:GetService("Players").PlayerAdded:Connect(function(player)
			func2(player)
		end)
		for i,v in next, game:GetService("Players"):GetPlayers() do
			func2(v)
		end	
	end)
}

-- / This is a patch to the low FPS my PC get's from this game... More of me wanting to save my data on my settings...
threads["Stay-Alive(macalads) Patch"] = {
	["Active"] = true,
	["Thread"] = coroutine.create(nc(function()
		repeat wait() until game:IsLoaded() and game:GetService("Players").LocalPlayer
		local button = loadstring('return ' .. game:GetService("Players").LocalPlayer:GetFullName() .. WaitFor('.PlayerGui.GlobalGui.SettingsPage.MainFrame.ToggleLDM'))()
		repeat wait() until #getconnections(button.MouseButton1Down) > 0
		getconnections(button.MouseButton1Down)[1]:Fire()
	end))
}



-- / This patch will just be stuff to help the client so turning FPS down if they are tabbed out, or not active for certain amount of time.
threads["Roblox Patch"] = {
	["Active"] = true,
	["Thread"] = coroutine.create(function()
		local focusedfps = 165 --It's how much my monitor displays.
		local unfocusedfps = 8
		
		setfpscap((iswindowactive() and focusedfps or unfocusedfps))
		
		getgenv().afk = Drawing.new("Image")
		afk.Data = readfile("cd/Images/afk.png")
		afk.Size = Vector2.new(268,192)
		
		game:GetService("RunService").RenderStepped:Connect(function()
			if workspace:FindFirstChild("Camera") then
				local View = workspace.Camera.ViewportSize
				afk.Position = Vector2.new(View.X/2-(afk.Size.X/2), View.Y/2-(afk.Size.Y/2))
			end
		end)
		
		Connections["FPS-Focus"] = UIS.WindowFocused:Connect(function()
			setfpscap(focusedfps)
			getgenv().afk.Visible = false
		end)
		Connections["FPS-Unfocus"] = UIS.WindowFocusReleased:Connect(function()
			setfpscap(unfocusedfps)
			getgenv().afk.Visible = true
		end)
	end)
}

-- / This is for you to join ;)
threads["Join plzplzplzplz"] = {
	["Active"] = false,
	["Thread"] = coroutine.create(function()
		local invite = "pZVMHtbZ6y"
		setclipboard(invite)
		local json = {
			["cmd"] = "INVITE_BROWSER",
			["args"] = {
				["code"] = invite
			},
			["nonce"] = '#AGS'
		}
		local req = syn.request{
			Url = 'http://127.0.0.1:6463/rpc?v=1',
			Method = 'POST',
			Headers = {
				['Content-Type'] = 'application/json',
				['Origin'] = 'https://discord.com'
			},
			Body = game:GetService('HttpService'):JSONEncode(json),
		}
		if not (req.StatusCode < 300) then
			error(req.StatusCode .. "\t" .. req.StatusMessage)
		end
	end)
}

-- / This is for whenever I use OBS to record ingame. It's a sort of funny thing I like to do to show off, I don't really know, I guess I just love fucking with my client and shit I work with.
threads["Controller"] = {
	["Active"] = true,
	["Thread"] = coroutine.create(function()
		local fps = '0'
		
		
		coroutine.wrap(function()
			while wait(1) do
				fps = game:GetService("Stats").PerformanceStats.CPU:GetValueString()
				writefile("cd/OBS Overlay/FPS.txt", "Update Rate: " .. fps)
			end
		end)()
		
	end)
}

threads["Presence Check"] = {
	["Active"] = true,
	["Thread"] = coroutine.create(function()
		local SEARCH = {
			['userIds'] = {
				[1550707812] = "F4reD3mon",
				[318058156]  = "Co-Owner"
			}
		}
		local userIds = {}
		for i, v in next, SEARCH.userIds do
			userIds[#userIds+1] = i
			print(i)
		end
		local Responce
		local success
		while true do
			success, _ = pcall(function()
				Responce = syn.request{
					Url = "https://presence.roblox.com/v1/presence/users",
					Method = "POST",
					Body = JSONE{
						['userIds'] = userIds
					},
					Headers = {
						['Content-Type'] = 'application/json',
						['Origin'] = 'https://skidware.nekoware.lgbt',
						['User-Agent']='casual_degenerate/7475 (Literally SynapseX) AppleWebKit/537.36 (KHTML, like Gecko) MSIE/8.0 Safari/537.36'
					}
				}
			end)
			if success then
				local DATA = JSOND(Responce.Body)
				for i, v in next, DATA.userPresences do
					if v["userPresenceType"] == 2 then -- / Online
--						printconsole(v.userId .. " Is Active!")
--						printconsole(SEARCH.userIds[v.userId] .. " Is Active!")
						debugp(SEARCH.userIds[v.userId] .. "(" .. v.userId .. ") Is Active!", 10)
					else
						printconsole(SEARCH.userIds[v.userId] .. "(" .. v.userId .. ") Is offline!")
					end
				end
				wait(20)
			else
				wait(3)
			end
			wait(.5)
		end
	end)
}

-- / Testing around
threads["Test"] = {
	["Active"] = true,
	["Thread"] = coroutine.create(function()
		printconsole(tostring(game.PlaceId), 0, 0, 0)
	end)
}


-- / This is how I run all my threads, in a place where I can be told if it errors.
---[[Threads
for i,v in next, threads do 
	if type(v) == "thread" then
		local success, result = coroutine.resume(v)
		if success then
			printconsole("Ran "..tostring(i))
		else
			printconsole(result .. "\tERROR: " .. tostring(i), 1, 0, 0)
		end
	elseif type(v) == "table" then
		---[[ / This will be updated later.
	
		if v["Thread"] and v["Active"] then
			local success, result = coroutine.resume(v["Thread"])
			if success then
				printconsole("Ran "..tostring(i))
			else
				printconsole(result .. "\tERROR: " .. tostring(i), 1, 0, 0)
			end
		end
		--]]
	end
end
--]]



















printconsole(tostring(tick()-start) .. " Time took to finish execution.")
-- Just some lines so I can still look in the middle of my screen to edit code that is down here.
