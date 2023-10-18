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


-- Pizza guy tab
local function spamPizza()
	
	_G.loop = true
	
	while _G.loop do
	-- teleport to pizzaman
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-381.2453, 449.975342, 70.2700043, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	wait(0.3)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-381.2453, 449.975342, 70.2700043, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	wait(0.3)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-381.2453, 449.975342, 70.2700043, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	wait(0.3)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-381.2453, 449.975342, 70.2700043, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	wait(0.3)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-381.2453, 449.975342, 70.2700043, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	wait(0.5)
	
	-- accept quest
	game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game) -- click E
	wait(1)
	
	-- variables
	local sssposition = game:GetService("Players").LocalPlayer.PlayerGui.dialogGUI.f.sf.option.AbsolutePosition
	local vim = game.VirtualInputManager
	
	vim:SendMouseButtonEvent(sssposition.X+50,sssposition.Y+70,0,true,game,0) -- click okay
	vim:SendMouseButtonEvent(sssposition.X+50,sssposition.Y+70,0,false,game,0)
	
	wait(1)
	
	-- go to locations
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-569.612732, 449.525299, -662.662109, 0.992915452, -3.08223989e-08, 0.118822969, 2.01627923e-08, 1, 9.09121596e-08, -0.118822969, -8.78722872e-08, 0.992915452)
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
	wait(2)
	
	end
end

local PizzaTab = Window:CreateTab("Pizza Guy", 4483362458) -- Title, Image

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

-- Misc tab
local MiscTab = Window:CreateTab("Misc", 4483362458) -- Title, Image
local PizzaSection = MiscTab:CreateSection("Misc")

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


local printCframe = MiscTab:CreateButton({
   Name = "Copy player's current CFrame",
   Callback = function()
   -- The function that takes place when the button is pressed
   print(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
   setclipboard(print(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame))
   end,
})

local Destroy = MiscTab:CreateButton({
   Name = "Destroy script",
   Callback = function()
   -- The function that takes place when the button is pressed
   Rayfield:Destroy()
   end,
})
