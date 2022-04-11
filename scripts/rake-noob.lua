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
ESP:Toggle(true)
ESP.Players = false 
ESP.Tracers = false 
ESP.Boxes = false 
ESP.Names = false

ESP:AddObjectListener(game:GetService("Workspace"), {
    Name = "The_Rake",
    CustomName = "The Rake",
    Color = Color3.fromRGB(255, 0, 0),
    IsEnabled = "theRake"
})

for i,v in pairs(game:GetService("Workspace").LocationsBillboardGuis:GetDescendants()) do
	if v:IsA("Part") then 
	   ESP:Add(v, {
            Name = v.Name,
            IsEnabled = "Locations",
            Color = Color3.fromRGB(139, 203, 255)
        })
	end 
end

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

Features.AddToggle("Don't Change My Values 😭", false, function(Value)
    shared.dontchange = Value 
end)

Features.AddButton("Show Time",function()
    Notify("Time Remaining: "..game:GetService("Workspace").LocationsFolder.DestroyedShelter.Clock.TextPart.SurfaceGui.TimerTextLabel.Text)
end) 


Features.AddButton("Collect all ducks",function()
    for i,v in pairs(workspace.StuffGiversFolder.DuckParts:GetDescendants()) do
        if v:IsA("ClickDetector") then
            fireclickdetector(v)
        end
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

Features.AddButton("Show Generator Power",function()
    Notify("Generator Power: "..tostring(game:GetService("Workspace").PowerTimer.Value))
end) 


local locations = {}
for i,v in pairs(game:GetService("Workspace").LocationsBillboardGuis:GetDescendants()) do
	if v:IsA("Part") then 
        table.insert(locations, v.Name)
    end 
end

local selection = ""
Features.AddDropdown("Locations", locations, function(Value)
    selection = Value
end)

Features.AddButton("Teleport to Location", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.LocationsBillboardGuis[selection].CFrame
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
