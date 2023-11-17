local HttpService = game:GetService("HttpService")
local SHA2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Egor-Skriptunoff/pure_lua_SHA/master/sha2.lua"))()
local Iris = loadstring(game:HttpGet("https://raw.githubusercontent.com/x0581/Iris-Exploit-Bundle/main/bundle.lua"))().Init(game.CoreGui)

local Identifier = {49,101,49,100,53,56,101,56,51,101,51,98}
local Nonce = 0
for i, Byte in next, Identifier do for j = 1, Byte do if j%2 == 2 then Nonce = Nonce + math.random() else Nonce = Nonce + Random.new():NextNumber() end end end
local NonceEnd = SHA2.sha256(table.concat(Identifier,""))
local ShaNonce = SHA2.sha256(tostring(Nonce) .. NonceEnd)

local Status = "Check key"
local CanPress = true
local Verified = false

local function Verify(Key)
  local Response = game:HttpGet(("https://mikecash.co/api/keyverify?key=%s&project=1e1d58e83e3b&nonce=%s"):format(Key, tostring(Nonce)))
  local Decode = HttpService:JSONDecode(Response)
  Verified = Decode.success and Decode.nonce == ShaNonce
end

if isfile("remember_me_1e1d58e83e3b.txt") then
  Verify(readfile("remember_me_1e1d58e83e3b.txt"))
end

Iris:Connect(function()
  if not Verified then
    Iris.Window({"Jujutsu Chronicles Script - Key System", [Iris.Args.Window.NoClose] = true, [Iris.Args.Window.NoResize] = true, [Iris.Args.Window.NoScrollbar] = true, [Iris.Args.Window.NoCollapse] = true}, {size = Iris.State(Vector2.new(350, 125))}) do
	  Iris.Text({"Get key here: https://mikecash.co/key/1e1d58e83e3b"})
      Key = Iris.InputText({"", [Iris.Args.InputText.TextHint] = "Put key here."}, {value = Iris.State(Key)}).text.value
        if Iris.Button({"Check key"}).clicked then
          if CanPress then
            task.spawn(function()
              CanPress = false
              Status = "Verifying key.."
              Verify(Key)
              Status = Verified and "Valid key!" or "Invalid key!"
              if Verified then
                writefile("remember_me_1e1d58e83e3b.txt", Key)
              end
              task.wait(2)
              Status = "Check key"
              CanPress = true
            end)
          end
        end
      Iris.End()
    end
  end
end)

repeat task.wait() until Verified

warn("Verified! Now loading: Jujutsu Chronicles Script.")

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
   Name = "Gosling Hub | Jujutsu Chronicles V4 | " .. getexploit(),
   LoadingTitle = "fraudjo satoru",
   LoadingSubtitle = "..",
   
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "fraudjo",
      FileName = "satoru"
   },
   
   Discord = {
      Enabled = true,
      Invite = "nocturn",
      RememberJoins = false
   },
   
   KeySystem = false,
   KeySettings = {
      Title = "",
      Subtitle = "",
      Note = "",
      FileName = "",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = ""
   }
})

-- farm
local FarmTab = Window:CreateTab("Farm", 4483362458)
local FarmSection = FarmTab:CreateSection("Basic Farm")

local function spamAttack()
	local pName = game:GetService("Players").LocalPlayer.Name
	local UIStats = game:GetService("Players").LocalPlayer.UIStats
	
	-- set dummy names
	local count = 0
	for i,v in next,game.Workspace:GetChildren() do
		if v:IsA("Model") and v.Name == "Dummy" then
			count+=1
			v.Name = "Dummy" .. count
		end
	end
	
	local args = {
		[1] = {
			["Character"] = workspace:WaitForChild(pName),
			["Action"] = "M1",
			["Combo"] = 1,
			["Target"] = workspace:WaitForChild("Dummy1"),
			["BehindPlayer"] = false
		}
	}

	coroutine.wrap(function()
		if getgenv().dummy == true then
			while getgenv().dummy do
				pcall(function()
					for i,v in pairs(game.Workspace:GetChildren()) do
						if v:IsA("Model") and v.Name == "Dummy1" then
							if v.Humanoid.Health > 0 then
								repeat
									wait()
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,5,0)
									game:GetService("ReplicatedStorage").Events.CombatEvent:FireServer(unpack(args))
								until getgenv().dummy == false
							end
						end
					end
				end)
			end
		end
	end)()
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

local function passBlackFlash()
	local args = {
		[1] = {
			["Passed"] = true,
			["Action"] = "PassBlackFlash"
			}
		}

	game:GetService("Players").LocalPlayer.PlayerGui.BlackFlashMiniGame.MiniGame.Play.Actions:FireServer(unpack(args))
end

local AttackToggle = FarmTab:CreateToggle({
   Name = "Combat Farm (Dummy)",
   CurrentValue = false,
   Flag = "Combat",
   Callback = function(Value)
		if Value == true then
			getgenv().dummy = true
			wait(0.1)
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
   Flag = "Stamina",
   Callback = function(Value)
		if Value == true then
			getgenv().Stamina = true
			wait(0.1)
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
   Flag = "Endurance",
   Callback = function(Value)
		if Value == true then
			getgenv().Endurance = true
			wait(0.1)
			spamEndurance()
		end
		if Value == false then
			getgenv().Endurance = false
		end
   end,
})

local BlackFlashButton = FarmTab:CreateButton({
   Name = "Pass Black Flash instantly",
   Callback = function()
		passBlackFlash()
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
   Flag = "CTFarm",
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
   Flag = "VesselCTFarm",
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
	local vim = game:GetService("VirtualInputManager")

	for i, v in pairs(workspace:GetDescendants()) do
		if v.ClassName == "ProximityPrompt" then
			v.HoldDuration = 0
		end
	end

	getgenv().Items = {
		"ClanSpinOrb",
		"CurseSpinOrb",
		"MiscOrb"
	}

	if getgenv().Orb == true then
		while getgenv().Orb do
			wait(0.5)
			for _,b in next,getgenv().Items do
				for i,v in pairs(game.Workspace:GetDescendants()) do
					if v:IsA("Part") and v.Name == b then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame - Vector3.new(0, 0, 0)
						wait(0.3)
						vim:SendKeyEvent(true,Enum.KeyCode.T,false,game)
						wait(0.1)
						vim:SendKeyEvent(true,Enum.KeyCode.C,false,game)
					end
				end
			end
		end
	end
end

local function rareItemFarm()
	local vim = game:GetService("VirtualInputManager")

	for i, v in pairs(workspace:GetDescendants()) do
		if v.ClassName == "ProximityPrompt" then
			v.HoldDuration = 0
		end
	end

	if getgenv().Rare == true then
		while getgenv().Rare do
			wait(0.5)
			for i,v in pairs(game.Workspace:GetDescendants()) do
				if v.Name == "Finger" or v.Name == "Meshes/YutaRingy_Torus" or v.Name == "Kashimo_Scroll" then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame - Vector3.new(0, 0, 0)
						wait(0.3)
						vim:SendKeyEvent(true,Enum.KeyCode.T,false,game)
						wait(0.1)
						vim:SendKeyEvent(true,Enum.KeyCode.C,false,game)
						
				end
			end
		end
	end
end

local OrbToggle = ItemsTab:CreateToggle({
   Name = "Farm Orbs",
   CurrentValue = false,
   Flag = "FarmOrbs",
   Callback = function(Value)
		if Value == true then
			getgenv().Orb = true
			wait(0.1)
			orbfarm()
		end
		if Value == false then
			getgenv().Orb = false
		end
   end,
})

local RareItemToggle = ItemsTab:CreateToggle({
   Name = "Farm Rare Items (Finger, Scroll, Ring)",
   CurrentValue = false,
   Flag = "FarmRareItems",
   Callback = function(Value)
		if Value == true then
			getgenv().Rare = true
			wait(0.5)
			rareItemFarm()
		end
		if Value == false then
			getgenv().Rare = false
		end
   end,
})

local ItemsSection = ItemsTab:CreateSection("Hopper")

local function serverHop()
	local tpservice = game:GetService("TeleportService")
	local plr = game.Players.LocalPlayer
	tpservice:Teleport(game.PlaceId, plr)
end

local function serverHopThree()
	local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/11200494415/servers/Public?sortOrder=Asc&limit=100"))
	for i,v in pairs(Servers.data) do
		if v.playing ~= v.maxPlayers then
			game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id)
		end
	end
end

local function orbHopperFarm()
	
	local vim = game:GetService("VirtualInputManager")
	
	for i, v in pairs(workspace:GetDescendants()) do
		if v.ClassName == "ProximityPrompt" then
			v.HoldDuration = 0
		end
	end
	
	getgenv().OrbHopperItems = {
		"ClanSpinOrb",
		"CurseSpinOrb",
		"MiscOrb"
	}
	
	if getgenv().OrbHopper == true then
		while getgenv().OrbHopper do
		wait(0.1)
			if game.Workspace:FindFirstChild(OrbHopperItems) then
				for _,b in next,getgenv().OrbHopperItems do
					for i,v in pairs(game.Workspace:GetDescendants()) do
						if v:IsA("Part") and v.Name == b then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame - Vector3.new(0, 0, 0)
							wait(0.1)
							vim:SendKeyEvent(true,Enum.KeyCode.T,false,game)
							wait(0.1)
							vim:SendKeyEvent(true,Enum.KeyCode.C,false,game)
						end
					end
				end
			else
			--serverHop()
			serverHopThree()
			end
		end
	end
end

local function RareHopperFarm()
	
	local vim = game:GetService("VirtualInputManager")
	
	for i, v in pairs(workspace:GetDescendants()) do
		if v.ClassName == "ProximityPrompt" then
			v.HoldDuration = 0
		end
	end
	
	if getgenv().RareHopper == true then
		while getgenv().RareHopper do
		wait(0.1)
			if game.Workspace:FindFirstChild("Vessel_Finger") then
				for i,v in pairs(game.Workspace:GetDescendants()) do
					if v:IsA("MeshPart") then 
						if v.Name == "Finger" or v.Name == "Meshes/YutaRingy_Torus" or v.Name == "Kashimo_Scroll" then
							print("Found ", v.Name)
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame - Vector3.new(0, 0, 0)
							wait(0.3)
							vim:SendKeyEvent(true,Enum.KeyCode.T,false,game)
							wait(0.1)
							vim:SendKeyEvent(true,Enum.KeyCode.C,false,game)
						end
					end
				end
			else 
			--serverHop()
			serverHopThree()
			end
		end
	end
end

local OrbHopperToggle = ItemsTab:CreateToggle({
   Name = "Farm Orbs (Server hop if there's not any)",
   CurrentValue = false,
   Flag = "orbhopper",
   Callback = function(Value)
		if Value == true then
			getgenv().OrbHopper = true
			wait(0.5)
			orbHopperFarm()
		end
		if Value == false then
			getgenv().OrbHopper = false
		end
   end,
})

local RareHopperToggle = ItemsTab:CreateToggle({
   Name = "Farm Rare Items (Server hop if there's not any)",
   CurrentValue = false,
   Flag = "rareitemshopper",
   Callback = function(Value)
		if Value == true then
			getgenv().RareHopper = true
			wait(0.5)
			RareHopperFarm()
		end
		if Value == false then
			getgenv().RareHopper = false
		end
   end,
})

-- vessel
local VesselTab = Window:CreateTab("Vessel", 4483362458)

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
				--print("Kashimo vessel is already enabled.")
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
local MiscTab = Window:CreateTab("Misc", 4483362458)
local MiscSection = MiscTab:CreateSection("Redeem Codes")

local Button = MiscTab:CreateButton({
   Name = "Redeem Codes",
   Callback = function()
		local function redeem(c)
			local args = {
				[1] = c
			}

			game:GetService("Players").LocalPlayer.PlayerGui.Main_UI.Codes.Enter.CheckCode.EnterCode.RemoteEvent:FireServer(unpack(args))
		end
		
		for _,v in pairs(getgenv().Codes) do
			redeem(v)
		end
   end,
})

local MiscSection = MiscTab:CreateSection("Autofarm Player")


local function genocide()
	coroutine.wrap(function()
		if getgenv().genocide == true then
			while getgenv().genocide do
			wait(0.1)
				pcall(function()
					for i,b in pairs(game.Players:GetChildren()) do
						for i,v in pairs(game.Workspace:GetChildren()) do
							if v:IsA("Model") and v.Name == b.Name then
								local args = {
									[1] = {
										["Character"] = game:GetService("Players").LocalPlayer.Character,
										["Action"] = "M1",
										["Combo"] = 5,
										["Target"] = v.Character,
										["BehindPlayer"] = false
									}
								}
								if v.Humanoid.Health > 0 then
									repeat
										wait()
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,5,0)
										game:GetService("ReplicatedStorage").Events.CombatEvent:FireServer(unpack(args))
									until getgenv().genocide == false or v.Humanoid.Health <= 0
								end
							end
						end
					end
				end)
			end
		end
	end)()
end


local PlayerFarmToggle = MiscTab:CreateToggle({
   Name = "toggle genocide.",
   CurrentValue = false,
   Flag = nil,
   Callback = function(Value)
		if Value == true then
			getgenv().genocide = true
			wait(0.1)
			genocide()
		end
		if Value == false then
			getgenv().genocide = false
		end
   end,
})

local CreditsTab = Window:CreateTab("Credits", 4483362458)
local CreditsSection = CreditsTab:CreateSection("Credits")
local Paragraph = CreditsTab:CreateParagraph({Title = "Made by:", Content = "emporeo & gosling.gg"})

Rayfield:LoadConfiguration() 
