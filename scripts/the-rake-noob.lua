if syn then else game.Players.LocalPlayer:Kick("haha no synapse x"); task.wait(0.5) while true do end end 


-- \\ REMOVE OLD GUIS \\ 
for i,v in pairs(game:GetService("CoreGui"):GetDescendants()) do
	if v.Name == "CheatX - The Rake Noob Edition" then 
	    v:Destroy()
	end 
end



-- \\ START COUNTING TIME TO LOAD \\ 
local function displayTime(diff)
	local label = script.Parent
	local milliseconds =  ("%.3s"):format(tostring((diff % 1) * 1000))
	local seconds =  math.floor(diff % 60)
	local minutes =  math.floor(diff / 60) % 60

	if seconds < 10 then
		seconds = "0" .. tostring(seconds)
	end

	return (minutes.. ":" .. seconds.. "." ..milliseconds)
end
local t = tick()

-- \\ DEPENDENCIES \\
local NofiticationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Nofitication = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

local function Notify(Text)
    Nofitication:Nof(
        {Title = "CheatX", Description = Text},
        {OutlineColor = Color3.fromRGB(255, 141, 141),Time = 5, Type = "default"}
    )
end


local warningSound = Instance.new("Sound", game.Workspace)
warningSound.SoundId = "rbxassetid://2265225485"
warningSound.Volume = 3 

--\\ PROXIMITY \\ 
local function fireproximityprompt(Obj, Amount, Skip)
    if Obj.ClassName == "ProximityPrompt" then 
        Amount = Amount or 1
        local PromptTime = Obj.HoldDuration
        if Skip then 
            Obj.HoldDuration = 0
        end
        for i = 1, Amount do 
            Obj:InputHoldBegin()
            if not Skip then 
                wait(Obj.HoldDuration)
            end
            Obj:InputHoldEnd()
        end
        Obj.HoldDuration = PromptTime
    else 
        error("userdata<ProximityPrompt> expected")
    end
end

-- \\ IMPROVE PROMNTS 
for i,v in pairs(game.Workspace:GetDescendants()) do
	if v:IsA("ProximityPrompt") then 
	    v.RequiresLineOfSight = false
	end 
end

-- \\ FUNCTIONS \\ 
local function lookDown()
    workspace.Camera.CFrame = CFrame.new(264.744202, 44.9857788, 19.0272675, 0.917633414, -0.391390145, 0.0690128133, 0, 0.173648611, 0.984807611, -0.397428036, -0.903692365, 0.159345)
end 

-- \\ UI LIBRARY \\
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))(); local venyx = library.new("CheatX - The Rake Noob Edition", 5013109572); local themes = {
    Background = Color3.fromRGB(24, 24, 24),
    Glow = Color3.fromRGB(0, 0, 0),
    Accent = Color3.fromRGB(10, 10, 10),
    LightContrast = Color3.fromRGB(20, 20, 20),
    DarkContrast = Color3.fromRGB(14, 14, 14),  
    TextColor = Color3.fromRGB(255, 255, 255)
}



--\\ MT API \\ 
if not getgenv().MTAPIMutex then loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/lua-releases/main/mt-api.lua", true))() end 

-- \\ ESP LIBRARY \\
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(false); ESP.Players = false; ESP.Tracers = false; ESP.Boxes = false; ESP.Names = false

-- Rake ESP 
ESP:AddObjectListener(workspace, {
    Name = "The_Rake",
    CustomName = "The Rake",
    PrimaryPart = function(obj)
        local root = obj:FindFirstChild("HumanoidRootPart")
        while not root do 
            task.wait()
            root = obj:FindFirstChild("HumanoidRootPart")
        end
        return root 
    end, 
    Color = Color3.fromRGB(255, 0, 0),
    IsEnabled = "theRake"
})

-- Locations ESP 
for i,v in pairs(game:GetService("Workspace").LocationsBillboardGuis:GetDescendants()) do
    if v:IsA("Part") then 
        local newname = tostring(string.gsub(v.Name, "Part", ""))
        ESP:Add(v, {
            Name = newname,
            IsEnabled = "Locations",
            Color = Color3.fromRGB(139, 203, 255)
        })
    end 
end

-- Flare Gun ESP
ESP:AddObjectListener(workspace, {
    Name = "FlareGun",
    Color = Color3.fromRGB(255, 123, 125),
    PrimaryPart = function(obj) -- Set the primary part to the handle 
        local handle = obj:FindFirstChild("Handle")
        while not handle do 
            task.wait()
            handle = obj:FindFirstChild("Handle")
        end
        return handle 
    end, 
    Validator = function(obj)
        if obj:IsA("Tool") then 
            return true 
        else 
            return false 
        end
    end, 
    CustomName = "Flare Gun",
    IsEnabled = "flareGun"
})

-- Supply drop ESP
ESP:AddObjectListener(workspace, {
    Name = "SupplyDrop",
    Type = "Model",
    CustomName = "Supply Drop",
    PrimaryPart = function(obj)
        local root = obj:FindFirstChild("Supply Crate",true)
        while not root do
            task.wait()
            root = obj:FindFirstChild("Supply Crate",true)
        end
        return root
    end, 
    Color = Color3.fromRGB(241, 255, 180),
    IsEnabled = "supplyDrop"
})


Notify("Loaded all dependencies in " .. displayTime(tick() - t))

-- \\ UI \\
local Visuals = venyx:addPage("Visuals", 6031763426); local visualsSettings = Visuals:addSection("ESP Settings"); local visualsTargets = Visuals:addSection("ESP Targets"); local visualsMisc = Visuals:addSection("Misc")

visualsSettings:addToggle("Enable ESP", false, function(value)
    ESP:Toggle(value)
end)

visualsSettings:addToggle("Boxes", false, function(value)
    ESP.Boxes = value
end)

visualsSettings:addToggle("Nametags", false, function(value)
    ESP.Names = value
end)

visualsSettings:addToggle("Tracers", false, function(value)
    ESP.Tracers = value
end)

--

visualsTargets:addToggle("Players", false, function(value)
    ESP.Players = value
end)

visualsTargets:addToggle("The Rake", false, function(value)
    ESP.theRake = value 
end)

visualsTargets:addToggle("Flare Gun", false, function(value)
    ESP.flareGun = value 
end)

visualsTargets:addToggle("Supply Drop", false, function(value)
    ESP.supplyDrop = value 
end)

visualsTargets:addToggle("Locations", false, function(value)
    ESP.Locations = value 
end)

--

visualsMisc:addToggle("Show Shop", false, function(value)
    if value then firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game:GetService("Workspace").LocationsFolder.Shop.EnterShopPart,0) else
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game:GetService("Workspace").LocationsFolder.Shop.EnterShopPart,1)
    end 
end)

visualsMisc:addToggle("Fullbright", false, function(value)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/2dgeneralspam1/lua-releases/main/minified/zzzzz1'))()
end)



-- \\ UI: FEATURES \\ 
local Features = venyx:addPage("Features",6031068423); local featuresMain = Features:addSection("Main"); local featuresLocalPlayer = Features:addSection("Local Player"); local featuresTeleports = Features:addSection("Teleports"); local featuresMisc = Features:addSection("Misc"); local featuresCode = Features:addSection("Codes")

featuresMain:addButton("Fix Power Station",function()
    if game:GetService("Workspace").PowerTimer.Value == 0 then 
        Notify("Attempting to fix Power Station"); lookDown(); local currentpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").LocationsFolder.PowerStation.ControlButtons.Buttons.InteractPart.CFrame; task.wait(0.3)
        fireproximityprompt(game:GetService("Workspace").LocationsFolder.PowerStation.ControlButtons.Buttons.InteractPart.ProximityPrompt,1,true); task.wait(0.3)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = currentpos; Notify("Power Station Fixed; wait a little for it to start up!")
    else 
        Notify("Power Station is already fixed! It's current power is "..tostring(game:GetService("Workspace").PowerTimer.Value).."%")
    end
end) 

featuresMain:addButton("Collect all Scraps",function()
    for i,v in pairs(game:GetService("Workspace").StuffGiversFolder.ScrapMetals:GetDescendants()) do
        if v:IsA("TouchTransmitter") then 
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,1)
        end 
    end
end) 

featuresMain:addButton("Collect all Ducks (1500 Coins)", function()
    for i,v in pairs(workspace.StuffGiversFolder.DuckParts:GetDescendants()) do
        if v:IsA("ClickDetector") then
            fireclickdetector(v)
        end
    end
end) 

featuresMain:addButton("Show Time",function()
    Notify("Time Remaining: "..game:GetService("Workspace").LocationsFolder.DestroyedShelter.Clock.TextPart.SurfaceGui.TimerTextLabel.Text)
end) 

featuresMain:addButton("Show Generator Power",function()
    Notify("Generator Power: "..tostring(game:GetService("Workspace").PowerTimer.Value))
end) 


featuresMain:addToggle("Notify When Rake Close", false, function(value)
    shared.rakenotify = value 
end)

local flareListener; featuresMain:addToggle("Notify When Flare Gun Spawns",false,function(Value)
    if game.Workspace:FindFirstChild("FlareGun") and Value then 
        Nofitication:Nof(
            {Title = "CheatX", Description = "A flare gun is already on the map! Do you want to teleport to it?"},
            {OutlineColor = Color3.fromRGB(163, 255, 163),Time = 10, Type = "option"},
            {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) 
                if State then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace"):FindFirstChild("FlareGun").Handle.CFrame; else Notify("Okay.")
                end 
            end}
        )
    end; if Value then 
        flareListener = workspace.ChildAdded:Connect(function(child)
            if child.Name == "FlareGun" and child:IsA("Tool") then 
                Notify("Flare Gun spawned!")
            end 
        end) 
    else
        flareListener:Disconnect(); Notify("Flare Gun spawn listener disabled")
    end
end) 

featuresMain:addToggle("Auto Collect All Scraps", false, function(value)
    shared.loopCollect = value 
end)

featuresMain:addToggle("Autofarm Wins", false, function(value)
    if value then Notify("You will be teleported somewhere and start moving automatically, THIS IS NORMAL.") end; local savedPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame; shared.autofarm = value; if value == false then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedPos; game:GetService('VirtualInputManager'):SendKeyEvent(false, "LeftShift", false, game); task.wait(0.5); if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
            game.Players.LocalPlayer.Character.Head.CanCollide = true
            game.Players.LocalPlayer.Character.Torso.CanCollide = true
            game.Players.LocalPlayer.Character["Left Leg"].CanCollide = true
            game.Players.LocalPlayer.Character["Right Leg"].CanCollide = true
        elseif game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
            game.Players.LocalPlayer.Character.Head.CanCollide = true
            game.Players.LocalPlayer.Character.UpperTorso.CanCollide = true
            game.Players.LocalPlayer.Character.LowerTorso.CanCollide = true
            game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = true
        end 
    end 
end)

-- 

local getstaminaHook; featuresLocalPlayer:addToggle("Infinite Stamina", false, function(value)
    if value then 
        getstaminaHook = game.Players.LocalPlayer.Character.CharValues.StaminaPercentValue:AddGetHook("Value",100)
    else
        getstaminaHook:Remove()
    end 
end)

local walkspeedSetHook; local jumppowerSetHook; featuresLocalPlayer:addToggle("Bypass WalkSpeed and JumpPower", false, function(Value)
    if Value then 
        walkspeedSetHook = game.Players.LocalPlayer.Character.Humanoid:AddSetHook("WalkSpeed")
        jumppowerSetHook = game.Players.LocalPlayer.Character.Humanoid:AddSetHook("JumpPower")
    else
        walkspeedSetHook:Remove()
        jumppowerSetHook:Remove()
    end 
end)

local sprintSpeedHook; featuresLocalPlayer:addToggle("Bypass Sprint Speed", false, function(Value)
    if Value then 
        sprintSpeedHook = game.Players.LocalPlayer.Character.CharValues.RunSpeed:AddSetHook("Value")
    else
        sprintSpeedHook:Remove()
    end 
end)

featuresLocalPlayer:addSlider("WalkSpeed", 16, 0, 255, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value 
end)

featuresLocalPlayer:addSlider("JumpPower", 50, 0, 255, function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value 
end)

featuresLocalPlayer:addSlider("Sprint Speed", 36, 36, 255, function(value)
    game.Players.LocalPlayer.Character.CharValues.RunSpeed.Value = value 
end)

--

local locations = {"Vending Machine","Autofarm Place"}
for i,v in pairs(game:GetService("Workspace").LocationsBillboardGuis:GetDescendants()) do
	if v:IsA("Part") then 
        local changedName = tostring(string.gsub(v.Name, "Part", "")); table.insert(locations, changedName)
    end 
end

local selection; featuresTeleports:addDropdown("Locations", locations, function(Value)
    selection = Value
end)

featuresTeleports:addButton("Teleport to Location", function()
    if selection == "Vending Machine" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").LocationsFolder.Shop.VendingMachine.Part.CFrame elseif selection == "Autofarm Place" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-840.9910278320312, -54.25994110107422, 157.66748046875) else
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.LocationsBillboardGuis[selection.."Part"].CFrame
    end 
end) 

featuresTeleports:addButton("Teleport to Flare Gun", function()
    if game:GetService("Workspace"):FindFirstChild("FlareGun") then 
        Nofitication:Nof(
            {Title = "CheatX", Description = "Flare gun found! Do you want to teleport to it?"},
            {OutlineColor = Color3.fromRGB(163, 255, 163),Time = 10, Type = "option"},
            {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) 
                if State then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace"):FindFirstChild("FlareGun").Handle.CFrame; else Notify("Okay.")
                end 
            end}
        )
    else
        Notify("Flare gun not found")
    end 
end) 

--


featuresMisc:addButton("Claim Mega Fish(s)", function()
    for i,v in pairs(game:GetService("Workspace").StuffGiversFolder.MegaFishCoalParts:GetDescendants()) do
        if v:IsA("ClickDetector") then 
            fireclickdetector(v)
        end 
    end
end) 

featuresMisc:addButton("Collect All Coins", function()
    local currentpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame; for i,v in pairs(game:GetService("Workspace").StuffGiversFolder.CoinsGiverSpawns:GetDescendants()) do
        if v.Name == "CoinGiverPart" then 
            lookDown(); game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame; task.wait(0.3)
            fireproximityprompt(v:FindFirstChild("ProximityPrompt"),1,true); task.wait(0.3)
        end 
    end; Notify("Coins Collected"); game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentpos
end)

featuresMisc:addButton("Turn in All Coins", function()
    local currentPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame; game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-227.314208984375, 7.062498092651367, -379.88641357421875); task.wait(0.3); for i,v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
        if v.Name == "Coin" then 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-227.314208984375, 7.062498092651367, -379.88641357421875); fireproximityprompt(game:GetService("Workspace").LocationsFolder.Shop.VendingMachine.InteractPart.ProximityPrompt,1,true)
        end 
    end; game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentPos -- Return 
end) 

--

featuresCode:addButton("Claim Bright Flashlight", function()
    local ohString1 = "brightness"; game:GetService("Players").LocalPlayer.PlayerGui.CodeGui.SendTextBoxRE:FireServer(ohString1)
end) 

featuresCode:addToggle("Show Code GUI", false, function(value)
    game:GetService("Players").LocalPlayer.PlayerGui.CodeGui.CodeFrame.Visible = value 
end) 

featuresCode:addToggle("Guess Ban Hammer Code", false, function(value)
    shared.guessing = value 
end)



-- \\ UI: SETTINGS \\ 
local Settings = venyx:addPage("Settings",6031280882); local settingsSection = Settings:addSection("Settings")

settingsSection:addButton("Join Discord", function()
    setclipboard("dsc.gg/garfieldwarez")
    Notify("Copied Discord Link to Clipboard, paste it into your browser to join!")
end)

settingsSection:addKeybind("Toggle Keybind", Enum.KeyCode.RightShift, function()
    venyx:toggle()
end)

settingsSection:addSlider("Client FPS Cap", 80, 1, 300, function(Value)
    setfpscap(Value)
end)


-- \\ LOOPS \\ 
spawn(function()
    pcall(function()
        while task.wait() do 
            if shared.loopCollect then 
                for i,v in pairs(game:GetService("Workspace").StuffGiversFolder.ScrapMetals:GetDescendants()) do
                    if v:IsA("TouchTransmitter") then 
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,0)
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,1)
                    end 
                end
            end
        end 
    end) 
end) 

spawn(function()
    while task.wait() do 
        pcall(function()
            if shared.rakenotify then 
                if game.Workspace:FindFirstChild("The_Rake") then 
                    if game.Players.LocalPlayer:DistanceFromCharacter(game:GetService("Workspace")["The_Rake"].HumanoidRootPart.Position) < 150 then -- I am lazy
                        Notify("The Rake is close! Distance from character: "..game.Players.LocalPlayer:DistanceFromCharacter(game:GetService("Workspace")["The_Rake"].HumanoidRootPart.Position).." studs"); warningSound:Play(); task.wait(0.3); warningSound:Play(); task.wait(0.3); warningSound:Play(); task.wait(3)
                    end 
                end 
            end 
        end) 
    end
end) 

spawn(function()
    game:GetService('RunService').Stepped:connect(function()
        pcall(function()
            if shared.autofarm then 
                if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
					game.Players.LocalPlayer.Character.Head.CanCollide = false
					game.Players.LocalPlayer.Character.Torso.CanCollide = false
					game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
					game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
				elseif game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
					game.Players.LocalPlayer.Character.Head.CanCollide = false
					game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false
					game.Players.LocalPlayer.Character.LowerTorso.CanCollide = false
					game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
				end
            end 

            if shared.guessing then 
                local ohString1 = math.random(0,9)..math.random(0,9)..math.random(0,9)..math.random(0,9)..math.random(0,9); game:GetService("Players").LocalPlayer.PlayerGui.CodeGui.SendTextBoxRE:FireServer(ohString1)
            end 
        end) 
    end) 
end) 
spawn(function()
    pcall(function()
        while task.wait(3) do 
            if shared.autofarm then 
                game:GetService('VirtualInputManager'):SendKeyEvent(true, "LeftShift", false, game); game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-140.4063262939453, 4.999998092651367, 348.97064208984375); game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(-278.0174255371094, 4.999998092651367, 334.7292785644531))
            end 
        end 
    end) 
end) 


-- End 
for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
    v:Disable()
end

venyx:SelectPage(venyx.pages[2], true); Notify("Fully loaded in "..tostring(displayTime(tick()-t))..". Enjoy the gui!")
