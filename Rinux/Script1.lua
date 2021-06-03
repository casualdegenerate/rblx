
p = print

local Windows = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.Windows

local Output = ""


local v1="a"
do
	local v1="b"
end
if v1~="a" then
	return "funny"
end


Output = Output.."Services:\n"
for _,service in next, game:GetChildren() do
	local loc
	local check = pcall(function()loc = service:GetFullName()end)
	if check then
		Output = Output.."[Yes]: "..loc.."\n"
	else
		Output = Output.."[No]: ".._.."\n"
	end
end

Output = Output.."Attempting to modify icon.\n"



Windows.Dock:FindFirstChild("Shortcut").Icon.TextLabel.Text = ">cd"

Output = Output.."-----------------\nScript: "..script:GetFullName()

p(Output)
return Output
