getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Gosling Hub | The Survival Game",
   LoadingTitle = "ESP only",
   LoadingSubtitle = "by gosling.gg",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "thesurvivalgamefolder", -- Create a custom folder for your hub/game
      FileName = "thesurvivalgame"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
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

local function addGUI(name, color1, color2, color3)
	local BillboardGui = Instance.new('BillboardGui') -- Makes Billboardgui
	local TextLabel = Instance.new('TextLabel') -- makes text label
	BillboardGui.Parent = v.Parent -- what the billboardgui goes into
	BillboardGui.AlwaysOnTop = true -- if its on top or not
	BillboardGui.Size = UDim2.new(0, 50, 0, 50) -- size of it
	BillboardGui.StudsOffset = Vector3.new(0,2,0)
	TextLabel.Parent = BillboardGui -- putting textlabel into billboardgui
	TextLabel.BackgroundColor3 = Color3.new(color1, color2, color3) -- color
	TextLabel.BackgroundTransparency = 1 -- transparency
	TextLabel.Size = UDim2.new(1, 0, 1, 0) -- size
	TextLabel.Text = name -- what the label says
	TextLabel.TextColor3 = Color3.new(1, 0, 0) -- color
	TextLabel.TextScaled = true -- if the text is scaled or not
end

local Tab = Window:CreateTab("ESP", 4483362458) -- Title, Image

local imperialShipwreckSection = Tab:CreateSection("Imperial Shipwreck ESP")

local function imperialShipwreckESPOnly()
	local plr = game.Players.LocalPlayer
	local chr = plr.Character
	local root = chr.HumanoidRootPart

	local notis = loadstring(game:HttpGet("https://pastebin.com/raw/Gpxq9YKK"))()
	
	for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
		if v:IsA("MeshPart") then
			if string.find(v.Name, "Meshes/ImperialShip_SM_Prop_Shipwreck") then
				notis:Notify("GOSLING HUB", "Found imperial shipwreck", 5, Color3.fromRGB(255, 255, 255))
				addGUI("Imperial Ship", 64, 224, 208)
			else 
				notis:Notify("GOSLING HUB", "Not found", 5, Color3.fromRGB(255, 255, 255))
			end
		end
	end
end

local imperialESPButton = Tab:CreateButton({
   Name = "Imperial Shipwreck ESP",
   Callback = function()
		imperialShipwreckESPOnly()
   end,
})

local function serverHopThree()
	local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/11156779721/servers/Public?sortOrder=Asc&limit=100"))
	for i,v in pairs(Servers.data) do
		game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id)
	end
end
	
local function imperialserverhop()
	local plr = game.Players.LocalPlayer
	local chr = plr.Character
	local root = chr.HumanoidRootPart

	local notis = loadstring(game:HttpGet("https://pastebin.com/raw/Gpxq9YKK"))()
	
	if getgenv().imperialHopper == true then
		while getgenv().imperialHopper do
			for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
				if v:IsA("MeshPart") then
					if string.find(v.Name, "Meshes/ImperialShip_SM_Prop_Shipwreck") then
						notis:Notify("GOSLING HUB", "Found imperial shipwreck", 5, Color3.fromRGB(255, 255, 255))
						addGUI("Imperial Ship", 64, 224, 208)
					else 
						notis:Notify("GOSLING HUB", "Not found", 5, Color3.fromRGB(255, 255, 255))
						serverHopThree()
					end
				end
			end
		end
	end
end



local imperialhopToggle = Tab:CreateToggle({
   Name = "Imperial Shipwreck ESP + Server Hop",
   CurrentValue = false,
   Flag = "imperialshipwreckserverhop",
   Callback = function(Value)
		if Value == true do
			getgenv().imperialHopper = true
			wait()
			imperialserverhop()
		end
		if Value == false do
			getgenv().imperialHopper = false
		end
   end,
})

Rayfield:LoadConfiguration()
