if not syn or #game:GetChildren() < 50 then return end
local gui = Instance.new("ScreenGui")
local s = Instance.new("VideoFrame",gui)
syn.protect_gui(gui)
local data = syn.request({Url = "https://s1.webmshare.com/dPQRx.webm", Method = "GET"}).Body
writefile("hack.webm",data)
s.Video = getsynasset('hack.webm')
s.Volume = 10
s.Size = UDim2.new(1,0,1,36)
s.Position = UDim2.new(0,0,0,-36)
repeat wait() until s.IsLoaded
gui.Parent = game:GetService("CoreGui")
s:Play()
wait(s.TimeLength)
game:Shutdown()
