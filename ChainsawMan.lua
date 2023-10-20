-- load rayfield library
getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- rayfield library
local Window = Rayfield:CreateWindow({
   Name = "Chainsaw Man Devil's Heart",
   LoadingTitle = "Loading..",
   LoadingSubtitle = "by Cikgu Jong Cena",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "aaa"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

_G.intervall = 0 -- interval between quests

-- Pizza guy tab
local function spamPizza()
	_G.loop = true -- loop
	
	while _G.loop do
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-381.2453, 449.975342, 70.2700043, 0, 0, -1, 0, 1, 0, 1, 0, 0) -- teleport to pizzaman
	wait(0.3)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-381.2453, 449.975342, 70.2700043, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	wait(0.3)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-381.2453, 449.975342, 70.2700043, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	wait(0.3)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-381.2453, 449.975342, 70.2700043, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	wait(0.3)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-381.2453, 449.975342, 70.2700043, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	wait(0.5)
	game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game) -- accept quest / click E
	wait(1)
	local sssposition = game:GetService("Players").LocalPlayer.PlayerGui.dialogGUI.f.sf.option.AbsolutePosition -- variables
	local vim = game.VirtualInputManager
	vim:SendMouseButtonEvent(sssposition.X+50,sssposition.Y+70,0,true,game,0) -- click okay
	vim:SendMouseButtonEvent(sssposition.X+50,sssposition.Y+70,0,false,game,0)
	wait(1)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-569.612732, 449.525299, -662.662109, 0.992915452, -3.08223989e-08, 0.118822969, 2.01627923e-08, 1, 9.09121596e-08, -0.118822969, -8.78722872e-08, 0.992915452) -- go to locations
	wait(0.3)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-263.920532, 459.397522, -949.331421, 0.988396823, -4.89388547e-08, 0.15189369, 3.38532793e-08, 1, 1.01902721e-07, -0.15189369, -9.55782298e-08, 0.988396823)
	wait(0.3)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-672.110229, 449.601288, -698.332153, -0.395301968, -1.08722698e-09, 0.9188551207, -6.00633016e-11, 1, 1.15778398e-09, -0.918551207, 4.02503059e-10, -0.395307968)
	wait(0.3)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-124.623291, 449.525299, -861.09259, 0.98489511, -2.76986967e-09, -0.17315197, 2.06749862e-09, 1, -4.23674296e-09, 0.17315197, 3.81475607e-09, 0.98489511)
	wait(0.3)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-385.606232, 449.52536, -717.923279, 0.394664407, 9.59622568e-08, 0.918825328, 2.19892549e-08, 1, -1.13885228e-07, -0.918825328, 6.51507293e-08, 0.394664407)
	wait(0.3)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5.79220629, 449.525269, -893.760742, 0.657709777, 8.57271729e-08, -0.753271461, -9.43385814e-08, 1, 3.14359028e-08, 0.753271461, 5.03868591e-08, 0.657709777)
	wait(0.3)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-447.196106, 449.525269, -776.301941, -0.632561564, -2.5018295e-08, 0.774510086, 7.41495469e-08, 1, 9.28618675e-08, -0.774510086, 1.16170419e-07, -0.632561564)
	wait(_G.intervall) -- intervals between quests
	end
end

------------ // PIZZA TAB \\ ------------
local PizzaTab = Window:CreateTab("Pizza Guy", 4483362458) -- Title, Image

-- Toggle auto pizza section
local PizzaToggleSection = PizzaTab:CreateSection("Toggle Auto Quest")
local Toggle = PizzaTab:CreateToggle({
   Name = "Toggle Pizza Guy Quest",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
   if Value == true then
			spamPizza()
   end
   
   if Value == false then
			_G.loop = false
   end
   end,
})

local PizzaToggleSlider = PizzaTab:CreateSlider({
   Name = "Intervals between quests",
   Range = {1, 10},
   Increment = 1,
   Suffix = "seconds",
   CurrentValue = 3,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(sliderValue)
   _G.intervall = sliderValue
   -- The function that takes place when the slider changes
   -- The variable (Value) is a number which correlates to the value the slider is currently at
   end,
})

-- TP section
local PizzaSection = PizzaTab:CreateSection("Pizza Guy")
local TP = PizzaTab:CreateButton({
   Name = "TP to pizza guy",
   Callback = function()
   -- The function that takes place when the button is pressed
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-381.2453, 449.975342, 70.2700043, 0, 0, -1, 0, 1, 0, 1, 0, 0)
   end,
})

local PizzaLocationSection = PizzaTab:CreateSection("Location")
local TPloc = PizzaTab:CreateButton({
   Name = "TP to first location",
   Callback = function()
   -- The function that takes place when the button is pressed
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-569.612732, 449.525299, -662.662109, 0.992915452, -3.08223989e-08, 0.118822969, 2.01627923e-08, 1, 9.09121596e-08, -0.118822969, -8.78722872e-08, 0.992915452)
   end,
})

local TPloctwo = PizzaTab:CreateButton({
   Name = "TP to second location",
   Callback = function()
   -- The function that takes place when the button is pressed
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-263.920532, 459.397522, -949.331421, 0.988396823, -4.89388547e-08, 0.15189369, 3.38532793e-08, 1, 1.01902721e-07, -0.15189369, -9.55782298e-08, 0.988396823)
   end,
})

local TPlocthree = PizzaTab:CreateButton({
   Name = "TP to third location",
   Callback = function()
   -- The function that takes place when the button is pressed
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-672.110229, 449.601288, -698.332153, -0.395301968, -1.08722698e-09, 0.9188551207, -6.00633016e-11, 1, 1.15778398e-09, -0.918551207, 4.02503059e-10, -0.395307968)
   end,
})

local TPlocfour = PizzaTab:CreateButton({
   Name = "TP to fourth location",
   Callback = function()
   -- The function that takes place when the button is pressed
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-124.623291, 449.525299, -861.09259, 0.98489511, -2.76986967e-09, -0.17315197, 2.06749862e-09, 1, -4.23674296e-09, 0.17315197, 3.81475607e-09, 0.98489511)
   end,
})

local TPlocfive = PizzaTab:CreateButton({
   Name = "TP to fifth location",
   Callback = function()
   -- The function that takes place when the button is pressed
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-385.606232, 449.52536, -717.923279, 0.394664407, 9.59622568e-08, 0.918825328, 2.19892549e-08, 1, -1.13885228e-07, -0.918825328, 6.51507293e-08, 0.394664407)
   end,
})

local TPlocsix = PizzaTab:CreateButton({
   Name = "TP to sixth location",
   Callback = function()
   -- The function that takes place when the button is pressed
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5.79220629, 449.525269, -893.760742, 0.657709777, 8.57271729e-08, -0.753271461, -9.43385814e-08, 1, 3.14359028e-08, 0.753271461, 5.03868591e-08, 0.657709777)
   end,
})

local TPlocseven = PizzaTab:CreateButton({
   Name = "TP to seventh location",
   Callback = function()
   -- The function that takes place when the button is pressed
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-447.196106, 449.525269, -776.301941, -0.632561564, -2.5018295e-08, 0.774510086, 7.41495469e-08, 1, 9.28618675e-08, -0.774510086, 1.16170419e-07, -0.632561564)
   end,
})
----------------------------------------


------------ // FARM TAB \\ ------------
local FarmTab = Window:CreateTab("Auto Farm", 4483362458)

local function toggleAutoPunch()
	_G.punchloop = true
	while _G.punchloop do
        wait(0.5)
		game:GetService("ReplicatedStorage").events.remote:FireServer("NormalAttack")
	end
end

local function toggleAutoQuest()
	local guiPosition = game:GetService("Players").LocalPlayer.PlayerGui.Quest.Completed.Yes.AbsolutePosition
	local vim = game.VirtualInputManager
	
	getgenv().togglequest = true
	
	if getgenv().togglequest == true then
		while getgenv().togglequest do
			wait(math.random(3, 10))
			vim:SendMouseButtonEvent(guiPosition.X+50,guiPosition.Y+70,0,true,game,0) -- click okay
			vim:SendMouseButtonEvent(guiPosition.X+50,guiPosition.Y+70,0,false,game,0)
		end
	end
		
end

local function toggleAutoFarm()
	local Fiends = {
    "Imposter Fiend",
	"Mantis Shrimp Fiend",
	"Beetle Fiend",
	"Ant Fiend",
	"Cricket Fiend"
	}
	
	getgenv().togglefarm = true
	
	coroutine.wrap(function()
	while wait() do
		if getgenv().togglefarm == true then
			pcall(function()
				for i,v in next, Fiends do
					_G.fiend = v
					for _, fieend in pairs(game.Workspace["Living"]:GetChildren()) do
						if fieend:IsA("Model") and fieend.Name == _G.fiend then
							if fieend.Humanoid.Health > 0 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
							repeat
								wait()
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = fieend.HumanoidRootPart.CFrame * CFrame.new(0, 0, 9) --* CFrame.Angles(math.rad(90),0,0)
							until fieend.Humanoid.Health <= 0 or getgenv().togglefarm == false
							end
						end
					end
				end
			end)
		end
	end
end)()
end

-- TP section
local autoFarmSection = FarmTab:CreateSection("Quest / Auto Farm")
local TPFarm = FarmTab:CreateButton({
   Name = "TP to quest guy",
   Callback = function()
   -- The function that takes place when the button is pressed
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-635.958801, 449.52536, -426.84668, 0.386709094, -0, -0.922201872, 0, 1, -0, 0.922201872, 0, 0.386709094)
   end,
})

local autoFarmToggle = FarmTab:CreateToggle({
   Name = "Toggle Auto Farm",
   CurrentValue = false,
   Flag = "Toggle3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(FarmValue)
   -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
   if FarmValue == true then
			toggleAutoFarm()
   end
   
   if FarmValue == false then
			getgenv().togglefarm = false
   end
   end,
})

local autoQuestToggle = FarmTab:CreateToggle({
   Name = "Toggle Auto Click Accept Quest (Get quest first)",
   CurrentValue = false,
   Flag = "Toggle3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(AcceptValue)
   -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
   if AcceptValue == true then
		toggleAutoQuest()
   end
   
   if AcceptValue == false then
		getgenv().togglequest = false
   end
   
   end,
})

-- Auto Punch section

local autoPunchSection = FarmTab:CreateSection("Auto Punch")

local autoPunchToggle = FarmTab:CreateToggle({
   Name = "Toggle Auto Punch",
   CurrentValue = false,
   Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(PunchValue)
   -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
   if PunchValue == true then
			toggleAutoPunch()
   end
   
   if PunchValue == false then
			_G.punchloop = false
   end
   end,
})

-- Auto skills section
_G.skillone = ""
_G.skilltwo = ""
_G.skillthree = ""

local autoSkillOneSection = FarmTab:CreateSection("Auto Skill 1")

local SkillOneInput = FarmTab:CreateInput({
   Name = "Input Skill One",
   PlaceholderText = "...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
   -- The function that takes place when the input is changed
   -- The variable (Text) is a string for the value in the text box
   _G.skillone = Text
   end,
})

local SkillOneToggle = FarmTab:CreateToggle({
   Name = "Toggle Skill One",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
   if Value == true then
       toggleskillone = true
       wait(0.5)
       if toggleskillone == true then
           while toggleskillone do
               wait(0.3)
               game:GetService("ReplicatedStorage").events.toolremote:FireServer(_G.skillone)
           end
       end
   end
   if Value == false then
       wait(0.3)
       toggleskillone = false
   end
   end,
})

local autoSkillTwoSection = FarmTab:CreateSection("Auto Skill 2")

local SkillTwoInput = FarmTab:CreateInput({
   Name = "Input Skill Two",
   PlaceholderText = "...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
   -- The function that takes place when the input is changed
   -- The variable (Text) is a string for the value in the text box
   _G.skilltwo = Text
   end,
})

local SkillTwoToggle = FarmTab:CreateToggle({
   Name = "Toggle Skill Two",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
   if Value == true then
       toggleskilltwo = true
       wait(0.5)
       if toggleskilltwo == true then
           while toggleskilltwo do
               wait(0.3)
               game:GetService("ReplicatedStorage").events.toolremote:FireServer(_G.skilltwo)
           end
       end
   end
   if Value == false then
       wait(0.3)
       toggleskilltwo = false
   end
   end,
})

local autoSkillThreeSection = FarmTab:CreateSection("Auto Skill 3")

local SkillThreeInput = FarmTab:CreateInput({
   Name = "Input Skill Three",
   PlaceholderText = "...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
   -- The function that takes place when the input is changed
   -- The variable (Text) is a string for the value in the text box
   _G.skillthree = Text
   end,
})

local SkillThreeToggle = FarmTab:CreateToggle({
   Name = "Toggle Skill Three",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
   if Value == true then
       toggleskillthree = true
       wait(0.5)
       if toggleskillthree == true then
           while toggleskillthree do
               wait(0.3)
               game:GetService("ReplicatedStorage").events.toolremote:FireServer(_G.skillthree)
           end
       end
   end
   if Value == false then
       wait(0.3)
       toggleskillthree = false
   end
   end,
})

----------------------------------------


------------ // MISC TAB \\ ------------
local MiscTab = Window:CreateTab("Misc", 4483362458) -- Title, Image

-- Misc section
local GameMiscSection = MiscTab:CreateSection("Extra game things")
local MapTeleportGUI = MiscTab:CreateToggle({
   Name = "Open Map Teleport GUI",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
   if Value == true then
	game:GetService("Players").LocalPlayer.PlayerGui.MapTeleportGUI.Enabled = true
   end
   if Value == false then
	game:GetService("Players").LocalPlayer.PlayerGui.MapTeleportGUI.Enabled = false
   end
   end,
})

local MiscSection = MiscTab:CreateSection("Misc")
local DarkDex = MiscTab:CreateButton({
   Name = "Load DarkDex",
   Callback = function()
   -- The function that takes place when the button is pressed
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
   end,
})

local RemoteSpy = MiscTab:CreateButton({
   Name = "Load RemoteSpy",
   Callback = function()
   -- The function that takes place when the button is pressed
   loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
   end,
})

local InfiniteYield = MiscTab:CreateButton({
   Name = "Load InfiniteYield",
   Callback = function()
   -- The function that takes place when the button is pressed
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local printCframe = MiscTab:CreateButton({
   Name = "Copy player's current CFrame",
   Callback = function()
   -- The function that takes place when the button is pressed
   print(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
   end,
})

local Destroy = MiscTab:CreateButton({
   Name = "Destroy script",
   Callback = function()
   -- The function that takes place when the button is pressed
   Rayfield:Destroy()
   end,
})
----------------------------------------

print("Successfully executed Cikgu Jong's script!")
