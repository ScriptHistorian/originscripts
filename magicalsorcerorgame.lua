local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local function getexploit()
  local exploit =
      (syn and not is_sirhurt_closure and not pebc_execute and "Synapse") or
      (secure_load and "Sentinel") or
      (is_sirhurt_closure and "Sirhurt") or
      (pebc_execute and "ProtoSmasher") or
      (KRNL_LOADED and "Krnl") or
      (WrapGlobal and "WeAreDevs") or
      (isvm and "Proxo") or
      (shadow_env and "Shadow") or
      (jit and "EasyExploits") or
      (getscriptenvs and "Calamari") or
      (unit and not syn and "Unit") or
      (OXYGEN_LOADED and "Oxygen U") or
      (IsElectron and "Electron") or
      ("Unsupported")

  return exploit
end

local Window = Rayfield:CreateWindow({
   Name = "[PRIVATE] Jujutsu Chronicles | " .. getexploit(),
   LoadingTitle = "fraudjo satoru",
   LoadingSubtitle = "",
   
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
   
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "BEST JUJUTSU CHRONICLES SCRIPT!",
      Subtitle = "",
      Note = "No key no use, ok?",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"keymark" , "tontolou"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

-- farm
local FarmTab = Window:CreateTab("Farm", 4483362458)
local FarmSection = FarmTab:CreateSection("Basic Farm")

local function spamAttack()
	local pName = game:GetService("Players").LocalPlayer.Name
	local UIStats = game:GetService("Players").LocalPlayer.UIStats
	local args = {
		[1] = {
			["Character"] = workspace:WaitForChild(pName),
			["Action"] = "M1",
			["Combo"] = 1,
			["Target"] = workspace:WaitForChild("Dummy"),
			["BehindPlayer"] = false
		}
	}
	if getgenv().dummy == true then
		while getgenv().dummy do
			wait(0.1)
			game:GetService("ReplicatedStorage").Events.CombatEvent:FireServer(unpack(args))
		end
	end
end

local function spamStamina()
	if getgenv().Stamina == true then
		while getgenv().Stamina do
			wait(0.1)
			game:GetService("Players").LocalPlayer.Character.Client.Server.RewardStamina:FireServer()
		end
	end
end

local function spamEndurance()
	local pName = game.workspace[game:GetService("Players").LocalPlayer.Name]
	local UIStats = game:GetService("Players").LocalPlayer.UIStats
	local args = {
		[1] = {
			["Character"] = pName,
			["Action"] = "Endurance",
			["MiscData"] = UIStats
		}
	}
	if getgenv().Endurance == true then
		while getgenv().Endurance do
			wait(0.1)
			game:GetService("ReplicatedStorage").Events.CombatEvent:FireServer(unpack(args))
		end
	end
end

local AttackToggle = FarmTab:CreateToggle({
   Name = "Combat Farm (Dummy)",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
		if Value == true then
			getgenv().dummy = true
			wait(0.5)
			spamAttack()
		end
			if Value == false then
			getgenv().dummy = false
		end
   end,
})

local StaminaToggle = FarmTab:CreateToggle({
   Name = "Stamina Farm",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
		if Value == true then
			getgenv().Stamina = true
			wait(0.5)
			spamStamina()
		end
		if Value == false then
			getgenv().Stamina = false
		end
   end,
})

local EnduranceToggle = FarmTab:CreateToggle({
   Name = "Endurance Farm",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
		if Value == true then
			getgenv().Endurance = true
			wait(0.5)
			spamEndurance()
		end
		if Value == false then
			getgenv().Endurance = false
		end
   end,
})

local FarmSection = FarmTab:CreateSection("Skill Farm")

local function basicSkill()
	local plr = game:GetService("Players").LocalPlayer
	local plrWork = game.Workspace[plr.Name]
	local plrTech = plrWork.Current_Curse.Value
	local plrVessel = plrWork.Has_Vessel.Value
	local plrSkill = plr.PlayerGui.SkillInv.Frame.Frame
	local currentEnergy = plr.UIStats.CursedEnergy.Value
	local maxEnergy = plr.UIStats.CursedEnergyMax.Value
		
	if getgenv().basicSkill == true then
		while getgenv().basicSkill do
			while currentEnergy >= 100 and getgenv().basicSkill do
				wait(0.5)
				for i, v in pairs(plrSkill:GetChildren()) do
					if v:IsA("TextButton") then
						--repeat
							local args = {
								[1] = {
								["Character"] = workspace:WaitForChild(plr.Name),
								["Action"] = "CursedTechnique",
								["MiscData"] = plr:WaitForChild("UIStats"),
								["Technique"] = plrTech,
								["Skill"] = tostring(v)
									}
								}
							--wait(0.5)
							game:GetService("ReplicatedStorage").Events.CombatEvent:FireServer(unpack(args))
						--until currentEnergy <= 100 or getgenv().basicSkill == false
					end
				end
			end
		end
	end
end

local function vesselSkill()
	local plr = game:GetService("Players").LocalPlayer
	local plrWork = game.Workspace[plr.Name]
	local plrTech = plrWork.Current_Curse.Value
	local plrVessel = plrWork.Has_Vessel.Value
	local plrSkill = plr.PlayerGui.SkillInv.Frame.Frame
	local currentEnergy = plr.UIStats.CursedEnergy.Value
	local maxEnergy = plr.UIStats.CursedEnergyMax.Value
	
	if getgenv().vesselSkill == true then
		while getgenv().vesselSkill do
			while currentEnergy >= 100 and getgenv().vesselSkill do
				wait(5)
				for i, v in pairs(plrSkill:GetChildren()) do
					if v:IsA("TextButton") then
						--repeat
							local args = {
								[1] = {
								["Character"] = workspace:WaitForChild(plr.Name),
								["Action"] = "CursedTechnique",
								["MiscData"] = plr:WaitForChild("UIStats"),
								["Technique"] = "Vessel",
								["Skill"] = tostring(v),
								["Aim"] = CFrame.new(260.4534912109375, 9.3402099609375, 242.9306182861328, -0.5704750418663025, -0.47526979446411133, 0.6698334217071533, -0, 0.8155622482299805, 0.5786693692207336, -0.8213149309158325, 0.3301164209842682, -0.4652579128742218)
									}
								}
							--wait(0.5)
							game:GetService("ReplicatedStorage").Events.CombatEvent:FireServer(unpack(args))
						--until currentEnergy <= 100 or getgenv().vesselSkill == false 
					end
				end
			end
		end
	end
end

local basicSkillToggle = FarmTab:CreateToggle({
   Name = "Cursed Technique Farm",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
		if Value == true then
			getgenv().basicSkill = true
			wait(0.5)
			basicSkill()
		end
			if Value == false then
			getgenv().basicSkill = false
		end
   end,
})

local vesselSkillToggle = FarmTab:CreateToggle({
   Name = "Vessel Cursed Technique Farm (Must have vessel)",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
		if Value == true then
			getgenv().vesselSkill = true
			wait(0.5)
			vesselSkill()
		end
			if Value == false then
			getgenv().vesselSkill = false
		end
   end,
})

-- items
local ItemsTab = Window:CreateTab("Items", 4483362458)
local ItemsSection = ItemsTab:CreateSection("Auto Farm Items")

local function orbfarm()
	_G.item = ""
	local vim = game:GetService("VirtualInputManager")
	local SpawnableItem = {
    "ClanSpinOrb",
	"CurseSpinOrb",
	"MiscOrb"
	}
	
	for i, v in pairs(workspace:GetDescendants()) do
		if v.ClassName == "ProximityPrompt" then
			v.HoldDuration = 0
		end
	end
	
	if getgenv().Orb == true then
		while getgenv().Orb do
			wait(0.1)
			for _, spawnitem in next, SpawnableItem do
				_G.item = spawnitem
				for i, v in pairs(game.Workspace["Game_FX"]:GetChildren()) do
					if v:IsA("Model") and v.Name == _G.item then
						for i, b in pairs(v:GetChildren()) do
							if b:IsA("Part") and b.Name == _G.item then
								print("Found ", b.Name)
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = b.CFrame - Vector3.new(0, 0, 0)
								wait(0.3)
								vim:SendKeyEvent(true,Enum.KeyCode.T,false,game)
							end
						end
					end
				end
			end
		end
	end
end

local function fingerFarm()
	_G.item = ""
	local vim = game:GetService("VirtualInputManager")
	
	for i, v in pairs(workspace:GetDescendants()) do
		if v.ClassName == "ProximityPrompt" then
			v.HoldDuration = 0
		end
	end
	
	if getgenv().Finger == true then
		while getgenv().Finger do
			wait(0.1)
			for _, spawnitem in next, SpawnableItem do
				_G.item = spawnitem
				for i, v in pairs(game.Workspace["Game_FX"]:GetChildren()) do
					if v:IsA("Model") and v.Name == "Vessel_Finger" then
						for i, b in pairs(v:GetChildren()) do
							if b:IsA("MeshPart") and b.Name == "Finger" then
								print("Found ", b.Name)
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = b.CFrame - Vector3.new(0, 0, 0)
								wait(0.3)
								vim:SendKeyEvent(true,Enum.KeyCode.C,false,game)
							end
						end
					end
				end
			end
		end
	end
end

local OrbToggle = ItemsTab:CreateToggle({
   Name = "Farm Orbs",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
		if Value == true then
			getgenv().Orb = true
			wait(0.5)
			orbfarm()
		end
		if Value == false then
			getgenv().Orb = false
		end
   end,
})

local FingerToggle = ItemsTab:CreateToggle({
   Name = "Farm Sukuna Finger",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
		if Value == true then
			getgenv().Finger = true
			wait(0.5)
			fingerFarm()
		end
		if Value == false then
			getgenv().Finger = false
		end
   end,
})

-- vessel
local VesselTab = Window:CreateTab("Vessel", 4483362458)
local VesselSection = VesselTab:CreateSection("Sukuna Vessel")

local function instantsukuna()
	local plrName = game:GetService("Players").LocalPlayer.Name
	local workplr = game.Workspace[plrName]
    local args = {
    [1] = {
        ["Object"] = "Vessel_Finger",
        ["Action"] = "Use"
             }
        }
	if getgenv().sukuna == true then
		if workplr.Has_Vessel.Value == nil or workplr.Has_Vessel.Value == "" then
			while getgenv().sukuna do
				wait(0.3)
				game:GetService("Players").LocalPlayer.PlayerGui.Main_UI.Handle.Server.Inv:FireServer(unpack(args))
			end
			end
		end
end

local SukunaToggle = VesselTab:CreateToggle({
   Name = "Unlock Sukuna Vessel",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
		if Value == true then
			getgenv().sukuna = true
			wait(0.5)
			instantsukuna()
		end
		if Value == false then
			getgenv().sukuna = false
		end
   end,
})

local KashimoVesselSection = VesselTab:CreateSection("Kashimo Vessel (Temporary)")

local function kashimounlock()
	local plr = game:GetService("Players").LocalPlayer
	local workplr = game.Workspace[plr.Name]
	local kashimoGUI = plr.PlayerGui.Mastery.Frame.KashimoVessel
	
	if getgenv().kashimo == true then
		while getgenv().kashimo do
			wait(0.5)
			if workplr.Has_KashimoVessel.Value == nil or workplr.Has_KashimoVessel.Value == "" then
				for i, v in pairs(workplr:GetChildren()) do
					if v:IsA("StringValue") then
						if v.Name == "Has_KashimoVessel" then
							v.Value = "Yes"
						end
						if v.Name == "Z" then
							v.Value = "ThunderGod"
						end
						if v.Name == "X" then
							v.Value = "ThunderStrike"
						end
						if v.Name == "C" then
							v.Value = "ThunderFlash"
						end
					end
				end
			if kashimoGUI.Visible == false then
				kashimoGUI.Visible = true
			end
			elseif workplr.Has_KashimoVessel.Value == "Yes" or workplr.Has_KashimoVessel.Value ~= nil or workplr.Has_KashimoVessel.Value ~= "" then
				print("Kashimo vessel is already enabled.")
			end
		end
	end
end

--[[local KashimoToggle = VesselTab:CreateToggle({
   Name = "Unlock Kashimo Vessel (Replaces Z, X, C skills)",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
		if Value == true then
			getgenv().kashimo = true
			wait(0.3)
			kashimounlock()
		end
		if Value == false then
			getgenv().kashimo = false
		end
   end,
}) ]]--

local KashimoButton = VesselTab:CreateButton({
   Name = "Unlock Kashimo Vessel (Replaces Z, X, C skills)",
   Callback = function()
			getgenv().kashimo = true
			wait(0.3)
			kashimounlock()
   end,
})

-- credits
local CreditsTab = Window:CreateTab("Credits", 4483362458)
local CreditsSection = CreditsTab:CreateSection("Credits")

local Paragraph = CreditsTab:CreateParagraph({Title = "Made by:", Content = "emporeo#0"})
