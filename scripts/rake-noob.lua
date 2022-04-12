local UILibrary = loadstring(game:HttpGet("https://pastebin.com/raw/V1ca2q9s"))()

local MainUI = UILibrary.Load("CheatX - The Rake Noob")
local Home = MainUI.AddPage("Visuals")

-- notif function
local function Notify(Text)
    game.StarterGui:SetCore("SendNotification", {
        Title = "CheatX";
        Text = Text;
        Icon = "";
        Duration = 5;
    })
end

-- anti afk
for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
    v:Disable()
end

Notify("Anti-AFK enabled")


--proximity
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

-- ESP 
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(false)
ESP.Players = false 
ESP.Tracers = false 
ESP.Boxes = false 
ESP.Names = false

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
    CustomName = "Flare Gun",
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

Home.AddToggle("ESP", false, function(Value)
    ESP:Toggle(Value)
end)

Home.AddToggle("ESP Boxes", false, function(Value)
    ESP.Boxes = Value  
end)

Home.AddToggle("ESP Tracers", false, function(Value)
    ESP.Tracers = Value 
end)

Home.AddToggle("ESP Nametags", false, function(Value)
    ESP.Names = Value 
end)

Home.AddToggle("Show Players", false, function(Value)
    ESP.Players = Value 
end)

Home.AddToggle("Show Rake", false, function(Value)
    ESP.theRake = Value 
end)

Home.AddToggle("Show Locations",false,function(Value)
    ESP.Locations = Value 
end) 

Home.AddToggle("Show Flare Gun", false, function(Value)
    ESP.flareGun = Value 
end)

Home.AddToggle("Show Supply Drop", false, function(Value)
    ESP.supplyDrop = Value 
end)

Home.AddToggle("Fullbright",false,function(Value)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/2dgeneralspam1/lua-releases/main/minified/zzzzz1'))()
end) 

Home.AddToggle("Shop", false, function(Value)
    if Value then 
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game:GetService("Workspace").LocationsFolder.Shop.EnterShopPart,0)
    else
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game:GetService("Workspace").LocationsFolder.Shop.EnterShopPart,1)
    end 
end)

Home.AddButton("OP Flashlight",function()
    game.Players.LocalPlayer.Character.Flashlight.LightPart.LightAttachment.Light.Angle = 180
    game.Players.LocalPlayer.Character.Flashlight.LightPart.LightAttachment.Light.Brightness = 500
    game.Players.LocalPlayer.Character.Flashlight.LightPart.LightAttachment.Light.Range = 100
end) 



local Features = MainUI.AddPage("Features")


Features.AddToggle("Autofarm Wins",false,function(Value)
    shared.AutoFarm = Value
end) 

Features.AddToggle("Infinite Stamina", false, function(Value)
    shared.stamina = Value 
end)

Features.AddSlider("Walkspeed", {Min = 0, Max = 255, Def = 16}, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    shared.walkspeedvalue = Value 
end)

Features.AddSlider("JumpPower", {Min = 0, Max = 255, Def = 50}, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    shared.jumppowervalue = Value 
end)

Features.AddToggle("No Slowdown", false, function(Value)
    shared.dontchange = Value 
end)

Features.AddButton("Fix Power Station",function()
    if game:GetService("Workspace").PowerTimer.Value == 0 then 
        Notify("Attempting to fix Power Station")
        local currentpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").LocationsFolder.PowerStation.ControlButtons.Buttons.InteractPart.CFrame; task.wait(0.3)
        fireproximityprompt(game:GetService("Workspace").LocationsFolder.PowerStation.ControlButtons.Buttons.InteractPart.ProximityPrompt,1,true); task.wait(0.3)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = currentpos
        Notify("If it didn't work move your camera so you can see the power station")
    else 
        Notify("Power Station is already fixed! It's current power is "..tostring(game:GetService("Workspace").PowerTimer.Value).."%")
    end
end) 


Features.AddButton("Collect all Scraps",function()
    for i,v in pairs(game:GetService("Workspace").StuffGiversFolder.ScrapMetals:GetDescendants()) do
        if v:IsA("TouchTransmitter") then 
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,1)
        end 
    end
end) 

Features.AddToggle("Loop Collect all Scraps",false,function(Value)
    shared.loopcollectscraps = Value 
end) 

local teleportsPage = MainUI.AddPage("Teleports")

local locations = {"Vending Machine"}
for i,v in pairs(game:GetService("Workspace").LocationsBillboardGuis:GetDescendants()) do
	if v:IsA("Part") then 
        local changedName = tostring(string.gsub(v.Name, "Part", ""))
        table.insert(locations, changedName)
    end 
end

local selection = ""
teleportsPage.AddDropdown("Locations", locations, function(Value)
    selection = Value
end)

teleportsPage.AddButton("Teleport to Location", function()
    if selection == "Vending Machine" then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").LocationsFolder.Shop.VendingMachine.Part.CFrame 
    else 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.LocationsBillboardGuis[selection.."Part"].CFrame
    end 
end) 




local miscFeatures = MainUI.AddPage("Misc")

miscFeatures.AddButton("Collect All Coins",function()
    for i,v in pairs(game:GetService("Workspace").StuffGiversFolder.CoinsGiverSpawns:GetDescendants()) do
        if v.Name == "CoinGiverPart" then 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame; task.wait(0.3)
            fireproximityprompt(v:FindFirstChild("ProximityPrompt"),1,true); task.wait(0.3)
        end 
    end; Notify("Coins Collected")
end) 

miscFeatures.AddToggle("Loop Turn In Coins",false,function(Value)
    shared.loopturnincoin = Value 
end)

miscFeatures.AddButton("Show Time",function()
    Notify("Time Remaining: "..game:GetService("Workspace").LocationsFolder.DestroyedShelter.Clock.TextPart.SurfaceGui.TimerTextLabel.Text)
end) 

miscFeatures.AddButton("Show Generator Power",function()
    Notify("Generator Power: "..tostring(game:GetService("Workspace").PowerTimer.Value))
end) 

miscFeatures.AddButton("Collect all Ducks",function()
    for i,v in pairs(workspace.StuffGiversFolder.DuckParts:GetDescendants()) do
        if v:IsA("ClickDetector") then
            fireclickdetector(v)
        end
    end
end) 



-- Loops
spawn(function()
    while wait() do 
        pcall(function()
            if shared.stamina then 
               game.Players.LocalPlayer.Character.CharValues.StaminaPercentValue.Value = 100
            end 

            if shared.loopcollectscraps then 
                for i,v in pairs(game:GetService("Workspace").StuffGiversFolder.ScrapMetals:GetDescendants()) do
                    if v:IsA("TouchTransmitter") then 
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,0); firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,1)
                    end 
                end
            end 

            if shared.dontchange then 
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = shared.walkspeedvalue; game.Players.LocalPlayer.Character.Humanoid.JumpPower = shared.jumppowervalue
            end 

            if shared.loopturnincoin then 
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-227.314208984375, 7.062498092651367, -379.88641357421875)
                fireproximityprompt(game:GetService("Workspace").LocationsFolder.Shop.VendingMachine.InteractPart.ProximityPrompt,1,true)
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
