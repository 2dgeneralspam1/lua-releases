-- compat...
if syn then 
	game.StarterGui:SetCore("SendNotification", {
		Title = "garfield"; 
		Text = "👋 welcome synapase x user";
		Icon = ""; 
		Duration = 5; 
	})
else
	loadstring(game:HttpGet('https://raw.githubusercontent.com/2dgeneralspam1/lua-releases/main/iris-compat.lua'))()
	game.StarterGui:SetCore("SendNotification", {
		Title = "garfield"; 
		Text = "👋 welcome non-synx user, iris's compat has been executed for you";
		Icon = ""; 
		Duration = 5; 
	})
end

local Config = {
	WindowName = "TLK Prison",
	Color = Color3.fromRGB(255, 170, 255),
	Keybind = Enum.KeyCode.RightBracket
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Main = Window:CreateTab("Main")

local Misc = Window:CreateTab("Misc")

local misc2 = Misc:CreateSection("Credits")

misc2:CreateButton("Join Discord",function()
	setclipboard("https://discord.gg/t8seJmggMH")
	game.StarterGui:SetCore("SendNotification", {
		Title = "garfield"; 
		Text = "invite copied to clipboard";
		Icon = nil; 
		Duration = 5; 
	})
end)

local Features = Main:CreateSection("Rage")


local Player = Main:CreateSection("Player")

local Toggles = {
	KilAlling = false,
	aurakill = false ,
	alwaysrun = false ,
	walksped = 16 
}

Features:CreateLabel("Only works if you are a prisoner!")


Features:CreateToggle("Teleport to All", false, function(State)
	print(State)
	Toggles.KilAlling = State 
end)


Features:CreateToggle("Kill Aura",false,function(t)
	Toggles.aurakill = t 
end)



Player:CreateSlider("WalkSpeed", 0,300,16,true, function(Value)
	Toggles.walksped = Value 
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Toggles.walksped 
end)

Player:CreateToggle("Always Set Walkspeed",false,function(t)
	Toggles.alwaysrun = t 
end)

spawn(function()
	while wait() do 
		pcall(function()
			if Toggles.alwaysrun == true then 
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Toggles.walksped 
			end
		end)
	end
end)


Player:CreateButton("Get Axe",function()
	fireclickdetector(game:GetService("Workspace").Axe.ClickDetector)
end)



while wait() do 
	pcall(function()
		if Toggles.KilAlling == true then 


			local NearestPart = nil
			local Lenght = nil
			local Folder = game:GetService("Workspace")
			local Player = game.Players.LocalPlayer

			for i,v in pairs(Folder:GetDescendants()) do
				if v:IsA("Part") then 
					if v.Name == "HumanoidRootPart" then 
						if v.Parent.Name ~= game.Players.LocalPlayer.Name then 
							if game:GetService("Players"):FindFirstChild(v.Parent.Name) then 
								if tostring(game:GetService("Players"):FindFirstChild(v.Parent.Name).Team) == "Guard" then 
									if v.Parent.Name ~= "HumanoidRootPart"then 
										if game.Workspace[v.Parent.Name].Humanoid.Health ~= 0 then 
											if game.Workspace[v.Parent.Name]:FindFirstChild("ForceField") then 
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(39.900119781494, 3.2001729011536, -8.2586345672607)
											else 
												local LenghtX = Player:DistanceFromCharacter(v.Position)
												if Lenght == nil or LenghtX < Lenght then
													Lenght = LenghtX
													NearestPart = v
												end
											end 

										end 
									end 
								end 
							end 
						end 
					end
				end
			end

			print(NearestPart.Name)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NearestPart.CFrame 
		end

		if Toggles.aurakill == true  then 

			-- Eqiup Axe 
			if not game.Players.LocalPlayer.Character:FindFirstChild("Axe") or game.Players.LocalPlayer.Backpack:FindFirstChild("Axe") then 
				fireclickdetector(game:GetService("Workspace").Axe.ClickDetector)
			end


			if not game.Players.LocalPlayer.Character:FindFirstChild("Axe") then 
				wait(0.7)
				game.Players.LocalPlayer.Backpack.Axe.Parent = game.Players.LocalPlayer.Character
			end



			local NearestPart = nil
			local Lenght = nil
			local Folder = game:GetService("Workspace")
			local Player = game.Players.LocalPlayer

			for i,v in pairs(Folder:GetDescendants()) do
				if v:IsA("Part") then 
					if v.Name == "HumanoidRootPart" then 
						if v.Parent.Name ~= game.Players.LocalPlayer.Name then 
							if game:GetService("Players"):FindFirstChild(v.Parent.Name) then 
								if tostring(game:GetService("Players"):FindFirstChild(v.Parent.Name).Team) == "Guard" then 
									if v.Parent.Name ~= "HumanoidRootPart"then 
										if game.Workspace[v.Parent.Name].Humanoid.Health ~= 0 then 

											local LenghtX = Player:DistanceFromCharacter(v.Position)
											if Lenght == nil or LenghtX < Lenght then
												Lenght = LenghtX
												NearestPart = v
											end
										end 

									end 

								end 
							end 
						end 
					end
				end
			end

			local ohInstance1 = game.Players.LocalPlayer.Character
			local ohInstance2 = workspace[NearestPart.Parent.Name]["Right Arm"]
			local ohInstance3 = game:GetService("Players").LocalPlayer.Character.Axe

			game:GetService("ReplicatedStorage").Combat:FireServer(ohInstance1, ohInstance2, ohInstance3)
		end
	end)  
end 
