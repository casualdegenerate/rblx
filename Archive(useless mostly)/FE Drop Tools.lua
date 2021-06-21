-- / This will lag you when you run this, so you know it does run. 
-- / This will pretty much act as a FE drop tool.
for i,v in next, game:GetService("Players").LocalPlayer.Character["Right Arm"]:GetChildren() do
    if v.Name == "RightGrip" then
        v:Destroy()
    end
end
for i,v in next, game:GetService("Players").LocalPlayer.Character:GetChildren() do
    if v.ClassName == 'Tool' then
        v.Parent = workspace
    end
end
