local plr = game.Players.LocalPlayer
local TeamList = {{"NAVI",10186009648}}
local PlayerNameList = {{1572447078,"3con","NAVI"},{1635709227,"Galaxy","NAVI"},{397984949,"Akuma","NAVI"},{145158047,"Dawid","NAVI"},{498435664,"diff","NAVI"},{2583235221,"fern","NAVI"},{2202955325,"BinMC","NAVI"},{378191085,"Bap","NAVI"},{2649959498,"Kite","NAVI"},{218402157,"tri","NAVI"}
local cn
local function geticonid(TeamName)
	for i,v in pairs(TeamList) do
		if v[1] == TeamName then
			return v[2]
		end
	end
end
for i,v1 in pairs(PlayerNameList) do
	if v1[1] == plr.UserId then
		local Name = Instance.new("StringValue",plr)
		Name.Name = "okokok"
		Name.Value = v1[2]
	end
end
spawn(function()
	plr.Status.Team.Changed:Connect(function()
		for i,v1 in pairs(PlayerNameList) do
			if v1[1] == plr.UserId then
				if cn then
					cn:Disconnect()
				end

				cn = plr.PlayerGui.GUI:FindFirstChild(plr.Status.Team.Value.."Win").Changed:Connect(function()
					if plr.PlayerGui.GUI:FindFirstChild(plr.Status.Team.Value.."Win").Visible == true then
						for i,v in pairs(plr.PlayerGui.GUI:FindFirstChild(plr.Status.Team.Value.."Win"):GetDescendants()) do
							if v:IsA("TextLabel") then
								for i,v1 in pairs(game.Players:GetChildren()) do
									if string.find(v.Text,v1.Name)  then
										local newst, rep = string.gsub(v.Text, v1.Name, "")
										for i,v2 in pairs(PlayerNameList) do
											if v2[1] == v1.UserId then
												v.Text = v2[1]..newst
											end
										end
									end
								end
							end
						end

					end
				end)
			end
		end

	end)

end)


function changeSpectateName()
	local RealIcon = plr.PlayerGui.GUI.Spectate.PlayerBox.PlayerIcon.Plr:Clone()
	RealIcon.Name = "Plr1"
	RealIcon.Visible = true
	RealIcon.Size = UDim2.new(1,0,1,0)
	RealIcon.Position = UDim2.new(0,0,0,0)
	RealIcon.Parent = plr.PlayerGui.GUI.Spectate.PlayerBox.PlayerIcon
	plr.PlayerGui.GUI.Spectate.PlayerBox.Visible = false
	local Real =  plr.PlayerGui.GUI.Spectate.PlayerBox.PlayerName:Clone()
	Real.Parent = plr.PlayerGui.GUI.Spectate.PlayerBox
	Real.Name = "PlayerName1"
	Real.Visible = true
	plr.PlayerGui.GUI.Spectate.PlayerBox.PlayerPin.Visible = false
	while plr.PlayerGui.GUI.Spectate.Visible == true do
		wait()
		local spectatingplr = game.Players:FindFirstChild(plr.PlayerGui.GUI.Spectate.Current.Value)
		if spectatingplr then
			for i,v in pairs(PlayerNameList) do
				if v[1] == spectatingplr.UserId then
					Real.Text = v[2]
					RealIcon.Image = "http://www.roblox.com/asset/?id="..geticonid(v[3])
					if spectatingplr.Status.Team.Value == "CT" then
						Real.TextColor3 = Color3.fromRGB(13, 105, 172)
					else
						Real.TextColor3 = Color3.fromRGB(245, 205, 48)
					end

				end
			end
		else
			Real.Text = "Unknown"
		end
	end
end
function changeDeathName()
	for i,v in pairs(game.Workspace.KillFeed:GetChildren()) do
		v.time.Changed:Connect(function()

			local getplrkiller = game.Players:FindFirstChild(v.Killer.Value)
			local getplrvictim = game.Players:FindFirstChild(v.Victim.Value)
			local getassit = game.Players:FindFirstChild(v.Assist)
			if getassit then
				for i,v1 in pairs(PlayerNameList) do

					if v1[1] == getassit.UserId then
						v.Assist.Value = v1[2]
					end
				end
			end
			if getplrkiller then
				for i,v1 in pairs(PlayerNameList) do

					if v1[1] == getplrkiller.UserId then

						v.Killer.Value = v1[2]
					end
				end
			end
			if getplrvictim then
				for i,v1 in pairs(PlayerNameList) do
					if v1[1] == getplrvictim.UserId then
						v.Victim.Value = v1[2]
					end
				end
			end


		end)
	end
end
local anticheat = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tyrphes/newRAC/main/NEWRAC.lua"))()

spawn(changeSpectateName)

spawn(changeDeathName)
