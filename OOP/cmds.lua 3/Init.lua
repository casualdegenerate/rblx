-- / Hope this works out :)

-- / Variables being set that would be used a lot

function require(file) -- / I use files as modules so this helps a bit.
	return loadfile(file)()
end

__Dir = "cmds.lua 3" -- / File director, set this to where you want to set it.
__Commands = __Dir .. "/Commands" -- / The director of all the commands.

-- / This is so you can refresh the commandslist, so you don't have to rejoin to test things.
function RefreshCommands()
	Commands = {}
	for i,v in next, listfiles(__Commands) do
		warn(i,v,require(v),require(v)["Name"])
		Commands[#Commands] = require(v)
	end
	warn("Commands refreshed!", table.concat(Commands, " "))
end
RefreshCommands()

-- / These are remotes that are disabled when you run my commands, so any that are chat related.
chat_remotes = {
	"SayMessageRequest",
}

-- / Debug info.
print(
	"Chat remotes listed", table.concat(chat_remotes, " "), "\n",
	"Commands listed",     table.concat(Commands    , " ")
) 


-- / Fun stuff :)
mt = getrawmetatable(game) make_writeable(mt) local old = mt.__namecall
mt.__namecall = newcclosure(function(self,...) -- / This is to run over your chatted but not say what you wanted to do.
	local args = {...} -- / I'm not a masochist, (most the time when I do work like this)
	if table.find(chat_remotes, self.Name) and args[1]:sub(1,1) == ";" then -- / Checking if the remote was listed, and if you ran the prefix I have.
		args = args[1]:split(" ")
		local oldTI = syn.get_thread_identity()
		local command = args[1]:sub(2,args[1]:len()) -- / I just want the command bruv
		print("Command:", command)
		if command == "refresh" then -- / Check if you want to refresh commandslist.
			RefreshCommands()
			syn.set_thread_identity(7)
			warn("Refreshed commands!", Commands) -- / Debug on if it worked.
			syn.set_thread_identity(oldTI)
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

