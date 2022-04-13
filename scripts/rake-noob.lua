-- UI 
local UILibrary = loadstring(game:HttpGet("https://pastebin.com/raw/V1ca2q9s"))()
local MainUI = UILibrary.Load("CheatX - The Rake Noob")
local Home = MainUI.AddPage("Visuals")

-- Notify Function
local function Notify(Text)
    game.StarterGui:SetCore("SendNotification", {
        Title = "CheatX";
        Text = Text;
        Icon = "";
        Duration = 5;
    })
end

-- MT API 
if not getgenv().MTAPIMutex then loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/lua-releases/main/mt-api.lua", true))() end

-- Sound affects
local notifSound = Instance.new("Sound", game.Workspace)
notifSound.SoundId = "rbxassetid://216917652"


local clickSound = Instance.new("Sound", game.Workspace)
clickSound.SoundId = "rbxassetid://2668781453"
clickSound.Volume = 2 

local errorSound = Instance.new("Sound", game.Workspace)
errorSound.SoundId = "rbxassetid://8972685129"
errorSound.Volume = 2

local function playClick()
    clickSound:Play()
end 

-- Anti AFK
for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
    v:Disable()
end

--proximity by sowd
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

-- look down 
local function lookDown()
    workspace.Camera.CFrame = CFrame.new(264.744202, 44.9857788, 19.0272675, 0.917633414, -0.391390145, 0.0690128133, 0, 0.173648611, 0.984807611, -0.397428036, -0.903692365, 0.159345)
end 

-- ESP 
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(false)
ESP.Players = false 
ESP.Tracers = false 
ESP.Boxes = false 
ESP.Names = false

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
    Validator = function(obj)
        if obj:FindFirstChild("Scream") then 
            return true
        else 
            return false
        end
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




--\\ GUI Features 
Home.AddToggle("ESP", false, function(Value)
    ESP:Toggle(Value)
    playClick()
end)

Home.AddToggle("ESP Boxes", false, function(Value)
    ESP.Boxes = Value  
    playClick()
end)

Home.AddToggle("ESP Tracers", false, function(Value)
    ESP.Tracers = Value 
    playClick()
end)

Home.AddToggle("ESP Nametags", false, function(Value)
    ESP.Names = Value 
    playClick()
end)

Home.AddToggle("Show Players", false, function(Value)
    ESP.Players = Value 
    playClick()
end)

Home.AddToggle("Show Rake", false, function(Value)
    ESP.theRake = Value 
    playClick()
end)

Home.AddToggle("Show Locations",false,function(Value)
    ESP.Locations = Value 
    playClick()
end) 

Home.AddToggle("Show Flare Gun", false, function(Value)
    ESP.flareGun = Value 
    playClick()
end)

Home.AddToggle("Show Supply Drop", false, function(Value)
    ESP.supplyDrop = Value 
    playClick()
end)

Home.AddToggle("Fullbright",false,function(Value)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/2dgeneralspam1/lua-releases/main/minified/zzzzz1'))(); playClick()
end) 

Home.AddToggle("Show Shop", false, function(Value)
    playClick(); if Value then 
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game:GetService("Workspace").LocationsFolder.Shop.EnterShopPart,0)
    else
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game:GetService("Workspace").LocationsFolder.Shop.EnterShopPart,1)
    end 
end)



local Features = MainUI.AddPage("Features")

local flareListener 
Features.AddToggle("Notify when Flare Gun spawns",false,function(Value)
    playClick()
    if game.Workspace:FindFirstChild("FlareGun") and Value then 
        Notify("A flare gun is already on the map")
    end 
    if Value then 
        flareListener = workspace.ChildAdded:Connect(function(child)
            if child.Name == "FlareGun" and child:IsA("Tool") then 
                Notify("Flare Gun spawned!")
                notifSound.Volume = 3 
                notifSound:Play()
            end 
        end) 
    else
        flareListener:Disconnect(); Notify("Flare Gun spawn listener disabled")
    end
end)

Features.AddToggle("Autofarm Wins",false,function(Value)
    playClick()
    shared.AutoFarm = Value
end) 

local getstaminaHook 
Features.AddToggle("Infinite Stamina", false, function(Value)
    playClick()
    if Value then 
        getstaminaHook = game.Players.LocalPlayer.Character.CharValues.StaminaPercentValue:AddGetHook("Value",100)
    else
        getstaminaHook:Remove()
    end 
end)

local walkspeedHook 
local jumppowerHook 
Features.AddToggle("Bypass WalkSpeed and JumpPower", false, function(Value)
    playClick()
    if Value then 
        walkspeedHook = game.Players.LocalPlayer.Character.Humanoid:AddPropertyEmulator("WalkSpeed")
        jumppowerHook = game.Players.LocalPlayer.Character.Humanoid:AddPropertyEmulator("JumpPower")
    else
        walkspeedHook:Remove()
        jumppowerHook:Remove()
    end 
end)

Features.AddSlider("Walkspeed", {Min = 0, Max = 255, Def = 16}, function(Value)
    playClick()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)

shared.jumppowervalue = 50 
Features.AddSlider("JumpPower", {Min = 0, Max = 255, Def = 50}, function(Value)
    playClick()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end)

Features.AddButton("Fix Power Station",function()
    playClick()
    if game:GetService("Workspace").PowerTimer.Value == 0 then 
        Notify("Attempting to fix Power Station"); lookDown(); local currentpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").LocationsFolder.PowerStation.ControlButtons.Buttons.InteractPart.CFrame; task.wait(0.3)
        fireproximityprompt(game:GetService("Workspace").LocationsFolder.PowerStation.ControlButtons.Buttons.InteractPart.ProximityPrompt,1,true); task.wait(0.3)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = currentpos; Notify("Power Station Fixed; wait a little for it to start up")
    else 
        Notify("Power Station is already fixed! It's current power is "..tostring(game:GetService("Workspace").PowerTimer.Value).."%")
        errorSound:Play()
    end
end) 


Features.AddButton("Collect all Scraps",function()
    playClick()
    for i,v in pairs(game:GetService("Workspace").StuffGiversFolder.ScrapMetals:GetDescendants()) do
        if v:IsA("TouchTransmitter") then 
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,1)
        end 
    end
end) 

Features.AddToggle("Loop Collect all Scraps",false,function(Value)
    playClick()
    shared.loopcollectscraps = Value 
end) 

local teleportsPage = MainUI.AddPage("Teleports")

local locations = {"Vending Machine","Autofarm Place"}
for i,v in pairs(game:GetService("Workspace").LocationsBillboardGuis:GetDescendants()) do
	if v:IsA("Part") then 
        local changedName = tostring(string.gsub(v.Name, "Part", ""))
        table.insert(locations, changedName)
    end 
end

local selection = ""
teleportsPage.AddDropdown("Locations", locations, function(Value)
    playClick()
    selection = Value
end)

teleportsPage.AddButton("Teleport to Location", function()
    playClick()
    if selection == "Vending Machine" then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").LocationsFolder.Shop.VendingMachine.Part.CFrame 
    elseif selection == "Autofarm Place" then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-840.9910278320312, -54.25994110107422, 157.66748046875)
    else
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.LocationsBillboardGuis[selection.."Part"].CFrame
    end 
end) 

local miscFeatures = MainUI.AddPage("Misc")

miscFeatures.AddButton("Collect All Coins",function()
    playClick()
    local currentpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    for i,v in pairs(game:GetService("Workspace").StuffGiversFolder.CoinsGiverSpawns:GetDescendants()) do
        if v.Name == "CoinGiverPart" then 
            lookDown()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame; task.wait(0.3)
            fireproximityprompt(v:FindFirstChild("ProximityPrompt"),1,true); task.wait(0.3)
        end 
    end; Notify("Coins Collected")
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentpos
end) 

miscFeatures.AddToggle("Loop Turn In Coins",false,function(Value)
    playClick()
    shared.loopturnincoin = Value 
end)

miscFeatures.AddButton("Show Time",function()
    playClick()
    Notify("Time Remaining: "..game:GetService("Workspace").LocationsFolder.DestroyedShelter.Clock.TextPart.SurfaceGui.TimerTextLabel.Text)
end) 

miscFeatures.AddButton("Show Generator Power",function()
    playClick()
    Notify("Generator Power: "..tostring(game:GetService("Workspace").PowerTimer.Value))
end) 

miscFeatures.AddToggle("NV annoy",false,function(Value)
    playClick()
    shared.annoy = Value 
end)

miscFeatures.AddButton("Collect all Ducks",function()
    playClick()
    for i,v in pairs(workspace.StuffGiversFolder.DuckParts:GetDescendants()) do
        if v:IsA("ClickDetector") then
            fireclickdetector(v)
        end
    end
end) 

miscFeatures.AddSlider("Client FPS Cap", {Min = 0, Max = 300, Def = 80}, function(Value)
    playClick()
    setfpscap(Value)
end)


-- Loops
spawn(function()
    while wait() do 
        pcall(function()
            if shared.loopcollectscraps then 
                for i,v in pairs(game:GetService("Workspace").StuffGiversFolder.ScrapMetals:GetDescendants()) do
                    if v:IsA("TouchTransmitter") then 
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,0); firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,1)
                    end 
                end
            end 

            if shared.loopturnincoin then 
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-227.314208984375, 7.062498092651367, -379.88641357421875)
                fireproximityprompt(game:GetService("Workspace").LocationsFolder.Shop.VendingMachine.InteractPart.ProximityPrompt,1,true)
            end 

            if shared.annoy then 
                game.Players.LocalPlayer.Character.NVGoggles.Handle.PlayDeactivate:FireServer()
                game.Players.LocalPlayer.Character.NVGoggles.Handle.PlayActivate:FireServer()   
            end 
        end) 
    end 
end)

spawn(function()
    pcall(function()
        while wait(3) do 
            if shared.AutoFarm then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-840.9910278320312, -54.25994110107422, 157.66748046875)
            end 
        end 
    end) 
end) 
