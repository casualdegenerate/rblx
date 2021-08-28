-- / Only execute this once, and it will disable the anticheat.
-- / If this closes your game, just message me.
if not game:IsLoaded() then return end
game:GetService("Players").LocalPlayer.CharacterAdded:connect(function(char)
    local anticheat = char:WaitForChild("LocalScript", 10)
    if anticheat then
        anticheat.Disabled = true
    else
        game:Shutdown()
    end
end)
for i, v in next, getconnections(game:GetService("Players").LocalPlayer.Character.Humanoid.Changed) do
    if getfenv(v.Function)['script'].Parent == game:GetService("Players").LocalPlayer.Character then
        v:Disable()
        spawn(function()
            getfenv(v.Function)['script'].Disabled = true
        end)
    end
end
for i, v in next, getconnections(game:GetService("RunService").RenderStepped) do
    if getfenv(v.Function)['script'] ~= nil then
        printconsole(tostring(getfenv(v.Function)['script']:GetFullName()))
        if getfenv(v.Function)['script'].Parent == game:GetService("Players").LocalPlayer.Character then
            v:Disable()
        end
    end
end
