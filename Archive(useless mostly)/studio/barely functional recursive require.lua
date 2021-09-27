local id = 6285672831
while id do 
	for i, v in next, game:GetObjects("rbxassetid://" .. id) do
		print(i, v)
		if v.Name == "MainModule" then
			id = v.Source:match("%d+")
			print(id)
		else
			warn(v, id)
			id = nil
			return
		end
	end
	wait()
end
