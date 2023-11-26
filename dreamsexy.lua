getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Gosling Hub | The Survival Game",
   LoadingTitle = "ESP TESTING",
   LoadingSubtitle = "by gosling.gg",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "tsgfolder",
      FileName = "tsgesp"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", 
      RememberJoins = true 
   },
   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", 
      SaveKey = true, 
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

local ESPTab = Window:CreateTab("ESP", 4483362458) -- Title, Image

local OreSection = ESPTab:CreateSection("Ore")

local function oreESP()
	for i,v in pairs(game:GetService("Workspace").worldResources.mineable:GetDescendants()) do
		if v:IsA("MeshPart") and v.Name == "hitbox" then
			if v.Parent.Name ~= "Stone" or v.Parent.Name ~= "Bluesteel" then
				if getgenv().OreESP == true then
					local BillboardGui = Instance.new('BillboardGui') -- Makes Billboardgui
					local TextLabel = Instance.new('TextLabel') -- makes text label
					BillboardGui.Parent = v.Parent -- what the billboardgui goes into
					BillboardGui.AlwaysOnTop = true -- if its on top or not
					BillboardGui.Size = UDim2.new(0, 50, 0, 50) -- size of it
					BillboardGui.StudsOffset = Vector3.new(0,2,0)
					TextLabel.Parent = BillboardGui -- putting textlabel into billboardgui
					TextLabel.BackgroundColor3 = Color3.new(64, 224, 208) -- color
					TextLabel.BackgroundTransparency = 1 -- transparency
					TextLabel.Size = UDim2.new(1, 0, 1, 0) -- size
					TextLabel.Text = v.Parent.Name -- what the label says
					TextLabel.TextColor3 = Color3.new(1, 0, 0) -- color
					TextLabel.TextScaled = true -- if the text is scaled or not
				end
			end
		end
	end
end

local EnableOreESPButton = ESPTab:CreateButton({
   Name = "Enable Ore ESP",
   Callback = function()
		oreESP()
   end,
})

local DisableOreESPButton = ESPTab:CreateButton({
   Name = "Disable Ore ESP",
   Callback = function()
		for i,v in pairs(game:GetService("Workspace").worldResources.mineable:GetDescendants()) do
			if v:IsA("BillboardGui") then
				v:Destroy()
			end
		end
   end,
})

local ShipwreckSection = ESPTab:CreateSection("Imperial Shipwreck")

local notis = loadstring(game:HttpGet("https://pastebin.com/raw/Gpxq9YKK"))()

local function imperialShipwreckESPOnly()
	for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
		if v:IsA("MeshPart") then
			if string.find(v.Name, "Meshes/ImperialShip_SM_Prop_Shipwreck") then
				notis:Notify("GOSLING HUB", "Found imperial shipwreck", 5, Color3.fromRGB(255, 255, 255))
				local BillboardGui = Instance.new('BillboardGui') -- Makes Billboardgui
				local TextLabel = Instance.new('TextLabel') -- makes text label
				BillboardGui.Parent = v.Parent -- what the billboardgui goes into
				BillboardGui.AlwaysOnTop = true -- if its on top or not
				BillboardGui.Size = UDim2.new(0, 50, 0, 50) -- size of it
				BillboardGui.StudsOffset = Vector3.new(0,2,0)
				TextLabel.Parent = BillboardGui -- putting textlabel into billboardgui
				TextLabel.BackgroundColor3 = Color3.new(64, 224, 208) -- color
				TextLabel.BackgroundTransparency = 1 -- transparency
				TextLabel.Size = UDim2.new(1, 0, 1, 0) -- size
				TextLabel.Text = "Imperial Ship" -- what the label says
				TextLabel.TextColor3 = Color3.new(1, 0, 0) -- color
				TextLabel.TextScaled = true -- if the text is scaled or not	
			else 
				notis:Notify("GOSLING HUB", "Not found", 5, Color3.fromRGB(255, 255, 255))
			end
		end
	end
end

local function serverHopThree()
	local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/11156779721/servers/Public?sortOrder=Asc&limit=100"))
	for i,v in pairs(Servers.data) do
		game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id)
	end
end

local function imperialserverhop()
	if getgenv().imperialHopper == true then
		while getgenv().imperialHopper do
		wait()
			for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
				if v:IsA("MeshPart") then
					if string.find(v.Name, "Meshes/ImperialShip_SM_Prop_Shipwreck") then
						notis:Notify("GOSLING HUB", "Found imperial shipwreck", 5, Color3.fromRGB(255, 255, 255))
						local BillboardGui = Instance.new('BillboardGui') -- Makes Billboardgui
						local TextLabel = Instance.new('TextLabel') -- makes text label
						BillboardGui.Parent = v.Parent -- what the billboardgui goes into
						BillboardGui.AlwaysOnTop = true -- if its on top or not
						BillboardGui.Size = UDim2.new(0, 50, 0, 50) -- size of it
						BillboardGui.StudsOffset = Vector3.new(0,2,0)
						TextLabel.Parent = BillboardGui -- putting textlabel into billboardgui
						TextLabel.BackgroundColor3 = Color3.new(64, 224, 208) -- color
						TextLabel.BackgroundTransparency = 1 -- transparency
						TextLabel.Size = UDim2.new(1, 0, 1, 0) -- size
						TextLabel.Text = "Imperial Ship" -- what the label says
						TextLabel.TextColor3 = Color3.new(1, 0, 0) -- color
						TextLabel.TextScaled = true -- if the text is scaled or not
					else 
						notis:Notify("GOSLING HUB", "Not found", 5, Color3.fromRGB(255, 255, 255))
						serverHopThree()
					end
				end
			end
		end
	end
end

local imperialESPButton = ESPTab:CreateButton({
   Name = "Imperial Shipwreck ESP",
   Callback = function()
		imperialShipwreckESPOnly()
   end,
})

local imperialhopToggle = ESPTab:CreateToggle({
   Name = "Imperial Shipwreck ESP + Server Hop",
   CurrentValue = false,
   Flag = "imperialshipwreckserverhop",
   Callback = function(Value)
		if Value == true then
			getgenv().imperialHopper = true
			wait()
			imperialserverhop()
		end
		if Value == false then
			getgenv().imperialHopper = false
		end
   end,
})

Rayfield:LoadConfiguration()
