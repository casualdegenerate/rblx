local Command = {}

Command["Name"] = "SongName"

Command["Description"] = "Will set the client's clipboard to the music's ID that is playing"

Command["Function"] = function()
	local song = game:GetService("Workspace").Terrain._Game.Folder:FindFirstChild("Sound")
	
	if not song then
		game.StarterGui:SetCore("ChatMakeSystemMessage", {
			TextSize = 16, 
			Text = "There is no music playing.", 
			Color = Color3.new(1,1,0)
		})
		return 
	end
	song = song.SoundId:match("%d+")
	setclipboard(song)
	game.StarterGui:SetCore("ChatMakeSystemMessage", {
		TextSize = 16,
		Text = "Playing: " .. game:GetService("MarketplaceService"):GetProductInfo(song).Name .. ".",
		Color = Color3.new(0,.5,1)
	})
end

return Command
