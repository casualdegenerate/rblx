if not syn then return end
local gui = Instance.new("ScreenGui")
local s = Instance.new("VideoFrame",gui)
syn.protect_gui(gui)
local data = game:HttpGet("https://raw.githubusercontent.com/casualdegenerate/rblx/main/Server Crash.lua")
writefile("hack.webm",data)
gui.Parent = game:GetService("CoreGui")
s.Video = getsynasset('hack.webm')
s.Volume = 10
s.Size = UDim2.new(1,0,1,36)
s.Position = UDim2.new(0,0,0,-36)
repeat wait() until s.IsLoaded

s:Play()

wait(s.TimeLength)
gui:Destroy()
