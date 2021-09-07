--[[
Please join https://discord.gg/YYWgJd35Mk and go to the #chat, that is where my backup community is if you get banned. 
Also, I have a media channel in the same server if you want access to that.
And remember, that @casual_degenerate#7475 made this. Not you.
--]]
-- / Switch \/
if getgenv().removebuilds then
  getgenv().removebuilds = false
elseif not getgenv().removebuilds and not getgenv().BUILDSREMOVER then
  getgenv().removebuilds = true
end

getgenv().BUILDSREMOVER = true
getgenv().removebuilds = true
		if removebuilds then
			coroutine.wrap(function()
				if game:GetService("Workspace"):FindFirstChild('BuildingBlocks')then
				  game:GetService("Workspace").BuildingBlocks:Destroy()
				end
				function plrFromChr(character)for _, player in pairs(game:GetService("Players"):GetPlayers())do if player.Character==character then return(player)end end end
				--while removebuilds do
					for i,v in pairs(workspace:GetChildren())do
						if not plrFromChr(v)and v.ClassName~='Camera'and v.ClassName~='Terrain'and v.Name~='SecureParts'and not v.Name:match('^'..tostring(game:GetService('Players').LocalPlayer.Name)..'_ADONISJAIL$') and v.ClassName ~= 'Sound' then
							v:Destroy()
						end
					end
					for i,v in pairs(workspace:GetDescendants())do
						if v.ClassName=='Smoke'or v.ClassName=='Fire'then
							v:Destroy()
						  elseif v.ClassName=='ForceField'then
							v.Visible = false
						  elseif v.ClassName=='Sound'then
							if v.Volume ~= .1 then v.Volume = .1 end
						end
					end
				game:GetService('RunService').RenderStepped:connect(function()
					if removebuilds then
						for i,v in pairs(workspace:GetChildren())do
							if not plrFromChr(v)and v.ClassName~='Camera'and v.ClassName~='Terrain'and v.Name~='SecureParts'and(586141923048161291~=nil)and not v.Name:match('^'..tostring(game:GetService('Players').LocalPlayer.Name)..'_ADONISJAIL$') and v.ClassName ~= 'Sound' then
								--print(v)
								v:Destroy()
							end
							if v.Name == (lplr.Name.."_ADONISJAIL$") then
								for i1,v1 in pairs(v:GetDescendants()) do
									if v1.ClassName == "BasePart" then
										if admin then
											v1.Color = Color3.new(0,1,0)
										else
											v1.Color = Color3.new(1,0,0)
										end
										v1.Transparency = 0.8
										v1.CanCollide = false
									end
								end
							end
						end
					end
					for i,v in pairs(workspace:GetDescendants())do local a=""
						if v.ClassName=='Smoke'then
							v:Destroy()
						  elseif v.ClassName=='ForceField'then
							v.Visible = false
						  elseif v.ClassName=='Sound'then
							if v.Volume ~= .1 then v.Volume = .1 end
						end
					end
				end)
				--end
			end)()
		end
