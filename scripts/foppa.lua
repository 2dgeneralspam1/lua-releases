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
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame; task.wait(0.3); lookDown()
                    fireproximityprompt(v.ForagePrompt,1,true); task.wait(0.3)
                end 
            end
        else
            OrionLib:MakeNotification({
                Name = "flop",
                Content = "no mush room",
                Time = 5
            })
        end 
    end
})

main:AddButton({
    Name = "Offer Altar",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Altar["Floppa Cube"].Ears.CFrame;task.wait(0.3)
        fireproximityprompt(game:GetService("Workspace").Altar["Thin Wall"].ProximityPrompt,1,true)
    end
})

main:AddToggle({
	Name = "Auto press floppa",
	Default = false,
	Callback = function(value)
		shared.floppapress = value 
	end    
})

main:AddToggle({
    Name = "Auto collect money",   
    Default = false,
    Callback = function(value)
        shared.autocollectmoney = value
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

spawn(function()
    while wait(0.1) do 
        if shared.floppapress then 
            fireclickdetector(game:GetService("Workspace").Floppa.ClickDetector)
        end
    end
end)

spawn(function()
    pcall(function()
        while task.wait(2) do 
            if shared.autocollectmoney then 
                for i,v in pairs(game.Workspace:GetDescendants()) do
                    if v.Name == "Money" and v:IsA("MeshPart") then 
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v,0)
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v,1)
                    end 
                end
            end 
        end 
    end) 
end) 
