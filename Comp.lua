local plr = game.Players.LocalPlayer
local TeamList = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tyrphes/Name/main/TeamName.lua"))()
local PlayerNameList = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tyrphes/Name/main/NamePlayer.lua"))
local cn
local plr = game.Players.LocalPlayer
local Team1 = "NAVI"
local Team2 = "Team Liquid"
local function geticonid(TeamName)
	for i,v in pairs(TeamList) do
		if v[1] == TeamName then
			return v[2]
		end
	end
end
for i,v in pairs(game.Players:GetChildren()) do
	for i,v1 in pairs(PlayerNameList) do
		if v1[1] == v.UserId then
			local Ins = Instance.new("StringValue",v)
			Ins.Name = "Display"
			Ins.Value = v1[2]
		end
	end
end

local function CT_TWin()
	local CT1 = game.Players.LocalPlayer.PlayerGui.GUI.CTWin
	local T1 = game.Players.LocalPlayer.PlayerGui.GUI.TWin
	CT1.Changed:Connect(function()
		if CT1.Visible == true then
			wait()
			if plr.Status.Team.Value ~= "CT" then
				CT1.Color.TextLabel.Text = Team1.." Win"
			else
				CT1.Color.TextLabel.Text = Team2.." Win"
			end
			for i,v in pairs(CT1:GetDescendants()) do
				if v:IsA("TextLabel") then
					for i,v1 in pairs(game.Players:GetChildren()) do
						if string.find(tostring(v.Text),v1.Name) then
							local newst, nc = string.gsub(v.Text,v1.Name,v1.Display.Value)
							v.Text = newst
						end
					end
				end
			end
		end
	end)
	T1.Changed:Connect(function()
		if T1.Visible == true then
			wait()
			if plr.Status.Team.Value ~= "T" then
				T1.Color.TextLabel.Text = Team2.." Win"
			else
				T1.Color.TextLabel.Text = Team1.." Win"
			end
			for i,v in pairs(T1:GetDescendants()) do
				if v:IsA("TextLabel") then
					for i,v1 in pairs(game.Players:GetChildren()) do
						if string.find(tostring(v.Text),v1.Name) then
							local newst, nc = string.gsub(v.Text,v1.Name,v1.Display.Value)
							v.Text = newst
						end
					end
				end
			end
		end
	end)
end
local function tabname()
	plr.PlayerGui.GUI.Scoreboard.Changed:Connect(function()
		for i,v in pairs(plr.PlayerGui.GUI.Scoreboard.T:GetChildren()) do

			if v:IsA("Frame") then
				local player = game.Players:FindFirstChild(v.Text) 
				v.player.Text = player.Display.Value
			end
		end
	end)
end
local function changeDeathName()
	game.Workspace:FindFirstChild("KillFeed"):FindFirstChild("10").time.Changed:Connect(function()
		wait()
		for i,v in pairs(game.Workspace:FindFirstChild("KillFeed"):GetChildren()) do
			local getplrkiller = v.Killer.Value
			local getplrvictim = v.Victim.Value
			local getassit = v.Assist.Value

			if getassit then
				for i,v1 in pairs(PlayerNameList) do

					if v1[1] == getassit.UserId then
						game.Workspace:FindFirstChild("KillFeed"):FindFirstChild("10").Victim.Value = v1[2]
						game.Workspace:FindFirstChild("KillFeed"):FindFirstChild("10").Assist.Value = v1[2]
						game.Workspace:FindFirstChild("KillFeed"):FindFirstChild("10").Victim.Value = v1[2]
						game.Workspace:FindFirstChild("KillFeed"):FindFirstChild("10").Victim.Value = v1[2]
						game.Workspace:FindFirstChild("KillFeed"):FindFirstChild("10").Assist.Value = v1[2]
						game.Workspace:FindFirstChild("KillFeed"):FindFirstChild("10").Victim.Value = v1[2]
					end
				end
			end
			if getplrkiller then
				for i,v1 in pairs(PlayerNameList) do

					if v1[1] == getplrkiller.UserId then
						print(v1[2])
						game.Workspace:FindFirstChild("KillFeed"):FindFirstChild("10").Killer.Value = v1[2]
						game.Workspace:FindFirstChild("KillFeed"):FindFirstChild("10").Killer.Value = v1[2]
						game.Workspace:FindFirstChild("KillFeed"):FindFirstChild("10").Killer.Value = v1[2]
						game.Workspace:FindFirstChild("KillFeed"):FindFirstChild("10").Killer.Value = v1[2]
						game.Workspace:FindFirstChild("KillFeed"):FindFirstChild("10").Killer.Value = v1[2]
						game.Workspace:FindFirstChild("KillFeed"):FindFirstChild("10").Killer.Value = v1[2]
					end
				end
			end
			if getplrvictim then
				for i,v1 in pairs(PlayerNameList) do
					if v1[1] == getplrvictim.UserId then
						game.Workspace:FindFirstChild("KillFeed"):FindFirstChild("10").Victim.Value = v1[2]
						game.Workspace:FindFirstChild("KillFeed"):FindFirstChild("10").Victim.Value = v1[2]
						game.Workspace:FindFirstChild("KillFeed"):FindFirstChild("10").Victim.Value = v1[2]
						game.Workspace:FindFirstChild("KillFeed"):FindFirstChild("10").Victim.Value = v1[2]
						game.Workspace:FindFirstChild("KillFeed"):FindFirstChild("10").Victim.Value = v1[2]
						game.Workspace:FindFirstChild("KillFeed"):FindFirstChild("10").Victim.Value = v1[2]
					end
				end
			end
		end
	end)
end
local function changeSpectateName()
	local RealIcon = plr.PlayerGui.GUI.Spectate.PlayerBox.PlayerIcon.Plr:Clone()
	RealIcon.Name = "Plr1"
	RealIcon.Visible = true
	RealIcon.Size = UDim2.new(1,0,1,0)
	RealIcon.Position = UDim2.new(0,0,0,0)
	RealIcon.Parent = plr.PlayerGui.GUI.Spectate.PlayerBox.PlayerIcon
	plr.PlayerGui.GUI.Spectate.PlayerBox.PlayerIcon.Plr.Visible = false
	plr.PlayerGui.GUI.Spectate.PlayerBox.PlayerName.Visible = false
	local Real =  plr.PlayerGui.GUI.Spectate.PlayerBox.PlayerName:Clone()
	Real.Parent = plr.PlayerGui.GUI.Spectate.PlayerBox
	Real.Name = "PlayerName1"
	Real.Visible = true
	plr.PlayerGui.GUI.Spectate.PlayerBox.PlayerPin.Visible = false
	while wait() do
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

local anticheat = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tyrphes/newRAC/main/NEWRAC.lua"))()
spawn(CT_TWin)
spawn(changeSpectateName)
spawn(tabname)
spawn(changeDeathName)
game.Players.PlayerAdded:Connect(function(v)
	for i,v1 in pairs(PlayerNameList) do
		if v1[1] == v.UserId then
			local Ins = Instance.new("StringValue",v)
			Ins.Name = "Display"
			Ins.Value = v1[2]
		end
	end
end)
