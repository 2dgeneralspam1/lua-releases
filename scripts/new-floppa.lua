firstgate = false -- thiny that like disables the weird thing
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

for i,v in pairs(game.Workspace:GetDescendants()) do
	if v:IsA("ProximityPrompt") then 
	    v.RequiresLineOfSight = false
	end 
end

local function lookDown()
    workspace.Camera.CFrame = CFrame.new(264.744202, 44.9857788, 19.0272675, 0.917633414, -0.391390145, 0.0690128133, 0, 0.173648611, 0.984807611, -0.397428036, -0.903692365, 0.159345)
end 

fireclickdetector(game:GetService("Workspace").Floppa.ClickDetector)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "flop ui", HidePremium = true, SaveConfig = _G.configEnabled, ConfigFolder = "garfieldwarez"})
local function notifyuser(content,id)
    OrionLib:MakeNotification({
        Name = "flop",
        Content = content,
        Image = "rbxassetid://"..id,
        Time = 5
    })    
end 
local main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://6031265971",
	PremiumOnly = false
})

local visuals = Window:MakeTab({
    Name = "Visuals",
    Icon = "rbxassetid://6031763426",
    PremiumOnly = false
})
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(false); ESP.Players = false; ESP.Tracers = false; ESP.Boxes = false; ESP.Names = false

visuals:AddLabel("ESP Settings")

visuals:AddToggle({
    Name = "ESP",
    Default = true,
    Save = true, 
    Flag = "toggle1",
    Callback = function(Value)
        ESP:Toggle(Value)
    end
})

visuals:AddToggle({
    Name = "Boxes",
    Default = false,
    Save = true,
    Flag = "toggle2",
    Callback = function(Value)
        ESP.Boxes = Value
    end
})

visuals:AddToggle({
    Name = "Nametags",
    Default = false,
    Save = true,
    Flag = "toggle3",
    Callback = function(Value)
        ESP.Names = Value
    end
})

visuals:AddToggle({
    Name = "Tracers",
    Default = false,
    Save = true,
    Flag = "toggle4",
    Callback = function(Value)
        ESP.Tracers = Value
    end
})
visuals:AddLabel("ESP Targets")
ESP:AddObjectListener(game:GetService("Workspace"), {
    Name = "Floppa",
    PrimaryPart = function(obj)
        local root = obj:FindFirstChild("HumanoidRootPart")
        while not root do 
            task.wait(); root = obj:FindFirstChild("HumanoidRootPart")
        end 
        return root 
    end, 
    Validator = function(obj)
        if obj:IsA("Model") then 
            return true 
        else
            return false 
        end 
    end,
    CustomName = "Floppa",
    Color = Color3.fromRGB(101, 255, 122),
    IsEnabled = "floppaESP"
})
ESP:AddObjectListener(game:GetService("Workspace").Backrooms, {
    Name = "???",
    PrimaryPart = function(obj)
        local root = obj:FindFirstChild("HumanoidRootPart")
        while not root do 
            task.wait(); root = obj:FindFirstChild("HumanoidRootPart")
        end 
        return root 
    end, 
    Validator = function(obj)
        if obj:IsA("Model") then 
            return true 
        else
            return false 
        end 
    end,
    CustomName = "Bingus",
    Color = Color3.fromRGB(255, 0, 0),
    IsEnabled = "bingusESP"
})

visuals:AddToggle({
    Name = "Bingus",
    Default = false,
    Save = true,
    Flag = "toggle5",
    Callback = function(Value)
        ESP.bingusESP = Value
    end
})

visuals:AddToggle({
    Name = "Floppa",
    Default = false,
    Save = true,
    Flag = "toggle6",
    Callback = function(Value)
        ESP.floppaESP = Value
    end
})


main:AddLabel("Automation")

main:AddButton({
    Name = "Save game",
    Callback = function()
        local currentpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-81.27365112304688, 7.799998760223389, -24.59555435180664); lookDown(); task.wait(0.3)
        fireproximityprompt(game:GetService("Workspace")["Floppy Disk"].ProximityPrompt,1,true)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentpos
    end 
})

main:AddButton({
    Name = "Collect all money",
    Callback = function()
        for i,v in pairs(game.Workspace:GetDescendants()) do
            if v.Name == "Money" and v:IsA("MeshPart") then 
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v,0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v,1)
            end 
        end
    end
})

main:AddButton({
    Name = "Forage All Mushrooms",
    Callback = function()
        if game.Workspace:FindFirstChild("Mushroom",true) then 
            
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.Name == "Mushroom" and v:IsA("MeshPart") then 
                    lookDown(); game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame; task.wait(0.3)
                    fireproximityprompt(v.ForagePrompt,1,true); task.wait(0.3)
                end 
            end
        else
            OrionLib:MakeNotification({
                Name = "flop",
                Content = "outdoor not unlocked yet",
                Image = "rbxassetid://6031071053",
                Time = 5
            })
        end 
    end
})



main:AddToggle({
	Name = "Auto press floppa",
	Default = false,
    Save = true,
    Flag = "toggle7",
	Callback = function(value)
		shared.floppapress = value 
	end    
})

local moneyListener; main:AddToggle({
    Name = "Auto collect money",   
    Default = false,
    Save = true,
    Flag = "toggle8",
    Callback = function(value)
        if firstgate then 
            if value then 
                for i,v in pairs(game.Workspace:GetDescendants()) do
                    if v.Name == "Money" and v:IsA("MeshPart") then 
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v,0)
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v,1)
                    end 
                end; moneyListener = game.Workspace.ChildAdded:Connect(function(Obj)
                    if Obj.Name == "Money" and Obj:IsA("MeshPart") then 
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,Obj,0)
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,Obj,1)
                    end 
                end)
            else
                moneyListener:Disconnect()
            end 
        end 
    end
})


main:AddLabel("Shops / Teleports")

main:AddButton({
    Name = "Backrooms shop",
    Callback = function()
        lookDown()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Backrooms.PC.CFrame; task.wait(0.3)
        fireproximityprompt(game:GetService("Workspace").Backrooms.PC.ProximityPrompt,1,true); task.wait(0.3)
    end
})

main:AddButton({
    Name = "Witch shop",
    Callback = function()
        lookDown()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Jinx' Cauldron"]["Jinx Witch"].jinx.CFrame; task.wait(0.3)
        fireproximityprompt(game:GetService("Workspace")["Jinx' Cauldron"].Cauldron.Cauldron.ProximityPrompt,1,true)
    end
})

main:AddButton({
    Name = "Teleport to backrooms",
    Callback = function()
        lookDown()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12558.9306640625, 57.98476028442383, -16148.994140625)
    end
})
main:AddButton({
    Name = "Go home",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").HomeTeleport.CFrame
    end
})

main:AddLabel("Misc")

main:AddButton({
    Name = "Remove accended obby",
    Callback = function()
        if game.Workspace:FindFirstChild("Temple",true) then 
            game:GetService("Workspace").Temple.Obby:Destroy()
        else
            OrionLib:MakeNotification({
                Name = "flop",
                Content = "no obby found (did you accend yet?)",
                Image = "rbxassetid://6031071053",
                Time = 5
            })
        end    
    end
})

main:AddButton({
    Name = "Max Altar (uses all cash)",
    Callback = function()
        if game.Workspace:FindFirstChild("Altar") then 
            OrionLib:MakeNotification({
                Name = "flop",
                Content = "setting up altar...",
                Image = "rbxassetid://6031075926",
                Time = 5
            }); game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Altar["Floppa Cube"].Ears.CFrame; task.wait(0.3); lookDown(); task.wait(0.3)
            local thing = 0; while thing < 50 do 
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Altar["Floppa Cube"].Ears.CFrame; lookDown()
                fireproximityprompt(game:GetService("Workspace").Altar["Thin Wall"].ProximityPrompt,1,true)
                thing = thing +1 
            end; OrionLib:MakeNotification({
                Name = "flop",
                Content = "finished offering",
                Image = "rbxassetid://6031075926",
                Time = 5
            }); task.wait(3); OrionLib:MakeNotification({
                Name = "flop",
                Content = "done!",
                Image = "rbxassetid://6023426945",
                Time = 5
            })
        else
            OrionLib:MakeNotification({
                Name = "flop",
                Content = "no altar",
                Image = "rbxassetid://6031071053",
                Time = 5
            })
        end 
    end
})

local almond; local moneyrequired; main:AddSlider({
	Name = "Almond Water Amount",
	Min = 1,
	Max = 25,
	Default = 1,
	Increment = 1,
    Save = true,
    Flag = "slider1",
	ValueName = "Almond Wilk Cartons",
	Callback = function(Value)
		almond = Value; moneyrequired = Value * 1000 
	end    
})

main:AddButton({
    Name = "Buy Almond Water",
    Callback = function()
        if tonumber(game.Players.LocalPlayer.leaderstats.Money.Value) < moneyrequired then 
            OrionLib:MakeNotification({
                Name = "flop",
                Content = "not enough money (oops!)",
                Image = "rbxassetid://6031071053",
                Time = 5
            })
        else
            lookDown()
            local counter=  0 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Backrooms.PC.CFrame; task.wait(0.3)
            fireproximityprompt(game:GetService("Workspace").Backrooms.PC.ProximityPrompt,1,true); task.wait(0.3)
            while counter ~= almond do 
                local ohString1 = "Almond Water"
                game:GetService("ReplicatedStorage").Purchase2:FireServer(ohString1)
                counter = counter + 1
            end; game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").HomeTeleport.CFrame
        end 
    end
})




local playertab = Window:MakeTab({
    Name = "Player",
    Icon = "rbxassetid://6031289449",
    PremiumOnly = false
})

local playerspeed
local playerjumpspeed 
playertab:AddSlider({
	Name = "Walkspeed",
	Min = 16,
	Max = 255,
	Default =16,
	Increment = 0.5,
	ValueName = "Studs Per Second",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        playerspeed = Value
	end    
})

playertab:AddSlider({
    Name = "JumpPower",
    Min = 50,
    Max = 255,
    Default =50,
    Increment = 0.5,
    ValueName = "Studs Per Second",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        playerjumpspeed = Value
    end    
})

playertab:AddToggle({
    Name = "Keep values",
    Default = false,
    Callback = function(value)
        shared.keepvalues = value
    end
})

local misctab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://6034509993",
    PremiumOnly = false
})

misctab:AddParagraph("credits",[[garfield - scripting
sowd guy - the proximity prtomnt]])
misctab:AddButton({
    Name = "Join Discord",
    Callback = function()
        setclipboard("dsc.gg/garfieldwarez")
        OrionLib:MakeNotification({
            Name = "flop",
            Content = "paste link that was copied to ur clip board into ur browser to join !!",
            Image = "rbxassetid://6034457067",
            Time = 5
        })
    end 
})
spawn(function()
    while wait(0.1) do 
        if shared.floppapress then 
            fireclickdetector(game:GetService("Workspace").Floppa.ClickDetector)
        end

        if shared.keepvalues then 
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = playerspeed
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = playerjumpspeed
        end
    end
end)

firstgate = true; notifyuser("Config saving is set to "..tostring(_G.configEnabled)..", if you want to change this, change the value on the top of the script.",6031302918)
OrionLib:Init() -- LMAO 
