-- / Please put the ID of the module that does require a bunch. This will work for obfuscated requires, they are easy to read the constants, but I want a faster automatic way, so I made this.
-- / Please run this under a VPN since they can easily IP log you if you run this, and use an alt since they can log the userid. And stay safe <3
if 
_G.id = 7440924558
_G.previd = _G.id
while _G.id do
	print("ID:", _G.id)
	for i, v in next, game:GetObjects("rbxassetid://" .. _G.id) do
		print(i, v)
		if v.Name == "MainModule" then
			loadstring("require = function(num) print('Number', num) _G.id = num end " .. v.Source)()
			if _G.id == _G.previd then
				return
			end
			_G.previd = _G.id
		else
			warn(v, _G.id)
			_G.id = nil
			return
		end
	end
	wait()
end
