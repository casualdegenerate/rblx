local plr = Game:GetService("Players").LocalPlayer
local casual_degenerate7475 = (function() return ('0000'):rep(5000);end)()
local music = {
	["gothic"] = "4451458369",
	["epic"] = "565754807",
	["intro"] = "251818328",
	["banjo"] = "2877235648",
	["film"] = "2674790811",
	["hiphop"] = "4575329367",
	["wind"] = "3142277181",
	["rick"] = "4662452515",
	["organ"] = "6137077080",
	["flight"] = "3585481594",
	["nyan"] = "198665867",
	["horror"] = "5580918269",
	["angel"] = "5816232853",
	["outrun"] = "5894776692",
	["training"] = "5039089122",
	["shirts"] = "5039090069",
	["noob"] = "5816113673",
	["corneria"] = "5894792519",
	["strategy"] = "5894828684",
	["rad"] = "5039132411",
	["robloxia"] = "5039118653",
	["social"] = "5016743031",
	["sfoth"] = "5039126586",
	["snow"] = "6027274725",
	["bosslevel"] = "6027295779",
	["mule"] = "5894835329",
	["social2"] = "6234140867",
	["starfox64"] = "5894800018",
	["90s"] = "2920078671"
}
plr.chatted:Connect(function(rawMessageObject)
	if rawMessageObject:split(" ")[1]:lower() == ":music" then
		-- // If your message was :music and the name of the song it will pass.
		game:GetService("Players"):Chat(":music " .. music[rawMessageObject:split(" ")[2]])
	end
end)
