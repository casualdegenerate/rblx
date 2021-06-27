-- / Hope this works out :)

-- / Variables being set that would be used a lot



__Dir = "cmds.lua 3" -- / File director, set this to where you want to set it.
__Commands = __Dir .. "/Commands" -- / The director of all the commands.
Commands = {}
-- / This is so you can refresh the commandslist, so you don't have to rejoin to test things.

function RefreshCommands()
	Commands = {}
	for i,v in next, listfiles(__Commands) do
		warn(i,v)
		local command, errormessage = loadstring(readfile(v))
		if not errormessage then
			command = command()
			warn(i,v)
			warn(i,v,command,command["Name"],command["Description"])
			Commands[i] = command
		else
			game.StarterGui:SetCore("ChatMakeSystemMessage", {
				TextSize = 16,
				Text = v .. " failed to run! " .. errormessage,
				Color = Color3.new(1,.5,0)
			})
		end
	end
end
RefreshCommands()

-- / These are remotes that are disabled when you run my commands, so any that are chat related.
chat_remotes = {
	"SayMessageRequest",
}

-- / Debug info.
print(
	"Chat remotes listed", table.concat(chat_remotes, " "), "\n"
	--[["Commands listed",     table.concat(Commands    , " ")--]]
) 
warn("Commands:")
for i,v in next, Commands do
	print(v["Name"],v["Description"],v["Function"])
	warn('###')
end

-- / Fun stuff :)
mt = getrawmetatable(game) make_writeable(mt) local old = mt.__namecall
mt.__namecall = newcclosure(function(self,...) -- / This is to run over your chatted but not say what you wanted to do.
	local args = {...} -- / I'm not a masochist, (most the time when I do work like this)
	if table.find(chat_remotes, self.Name) and args[1]:sub(1,1) == ";" then -- / Checking if the remote was listed, and if you ran the prefix I have.
		print("Message:", args[1])
		args = args[1]:split(" ")
		local oldTI = syn.get_thread_identity()
		local command = args[1]:sub(2,args[1]:len()) -- / I just want the command bruv
		print("Command:", command)
		if command == "refresh" then -- / Check if you want to refresh commandslist.
			syn.set_thread_identity(7)
			RefreshCommands()
			syn.set_thread_identity(oldTI)
			warn("Refreshed commands!", Commands) -- / Debug on if it worked.
			return -- / It's done.
		end
		local C = (function()for i,v in next, Commands do if v["Name"]:lower() == command:lower() then return v end end end)()
		if C then -- / It found a command inside of the commands list.
			local content = C -- / Will treat it like a module.
			warn("Command detected!", args[1], "Description:", content.Description) -- / If there is data, wikid.
			syn.set_thread_identity(7)
			content["Function"](args)
			syn.set_thread_identity(oldTI)
			return -- / It won't tell anyone you even used a command :)
		end
		return old(self, ...)-- / None if statements passed with any commands? guess you wanted ; at the start of your word.
	end
	
	-- / So you can still play video games :)
	return old(self, ...)
end)

