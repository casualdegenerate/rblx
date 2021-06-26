local Command = {}

Command["Name"] = "Snipe"

Command["Description"] = "This is a test command to test out the newest version of cmds.lua 3.0.0"

Command["Function"] = function(args)
	game:GetService("Players"):Chat("Explode " .. (args[2] .. " "):rep(3) .. "cd")
end

return Command
