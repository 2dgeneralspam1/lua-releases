firstgate = false 
game.Players.LocalPlayer.DisplayName = "User"
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
local Window = OrionLib:MakeWindow({Name = "flop"})

local main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://6031265971",
	PremiumOnly = false
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
	Callback = function(value)
		shared.floppapress = value 
	end    
})

local moneyListener; main:AddToggle({
    Name = "Auto collect money",   
    Default = false,
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

misctab:AddParagraph("credits",[[garfield - scripting\nsowd guy - the proximity prtomnt]])
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

firstgate = true 
