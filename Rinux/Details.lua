-- / I said, if you don't tell me what happened your moms a hoe
local a,err = pcall(function()
	local o = {""} -- / Variable name stants for output

	local function append(a) -- / Because this shit can't use luau I'd have to compromise
		o[1] = o[1]..a.."\n"
	end

	-- / Name of the file
	append("Details.lua")
	-- / Something to start with
	append("Place Id: " .. game.PlaceId)
	-- / People call this a Job Id or Server Id, I'd just call it a GUID or Server GUID
	append("Server GUID: " .. game.JobId) 
	-- / This property is depricated I think, but it helps me understand the size of a game, if I were in a slow pace working on it. COUGH COUGH
	append("Game data: " .. game.DataCost)
	-- / This is your execution level. So whatever is running this will be the level, and I'm still trying to understand the game with the tools it gave me. I know I can easily look at it through *other* tools, but this is a lot more fun (i feel like a hakzor man)
	append("Level: " .. script.ClassName == "Script"and"Server" or script.ClassName == "LocalScript"and"Client" or "Unkown/Module")


	-- / Did both because I can
	warn(o[1]) 
	return o[1]
end)


if err then
	warn(err)
	return err
end

