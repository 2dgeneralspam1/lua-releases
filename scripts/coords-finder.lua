-- compat for ui 
if syn then 
	print("synapse x detected! not executing compat")
	game.StarterGui:SetCore("SendNotification", {
		Title = "Script"; 
		Text = "Welcome Synapse X User!";
		Icon = ""; 
		Duration = 5; 
	})
else
	print("not synx, executing compat")
	game.StarterGui:SetCore("SendNotification", {
		Title = "Script"; 
		Text = "Welcome Non-Synapse X User! ";
		Icon = ""; 
		Duration = 5; 
	})
	loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterCompat.lua"))() -- better compat 
end

-- start 
local Config = {
	WindowName = "Garfieldwarez - Teleport Script Generator",
	Color = Color3.fromRGB(96, 86, 185),
	Keybind = Enum.KeyCode.RightShift
}

firsttime = true 

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Mains = Window:CreateTab("Main")

local Main = Mains:CreateSection("Teleport Script Generator")

Main:CreateButton("Copy current coords",function()
		pcall(function()
			setclipboard(tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position))  
		end)
end)

Main:CreateButton("Generate teleport script",function()
	pcall(function()
		local pos = tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
		setclipboard("game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new("..pos..")")  
	end)
end)

local Stuff = {
	timetotween = 3 
}

Main:CreateSlider("Time For Tween", 0,15,3,false, function(Value)
	if firsttime == false then 
		Stuff.timetotween = Value 
	end
end)

Main:CreateButton("Generate Tween Script",function()
	pcall(function()
		local pos = tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
		setclipboard('tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new('..Stuff.timetotween..', Enum.EasingStyle.Linear)\ntweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new('..pos..')}):Play()')  
	end)
end)

local Misc = Mains:CreateSection("Misc")

-- Credits to Kiriot 
local ESP = loadstring(game:HttpGet('https://raw.githubusercontent.com/2dgeneralspam1/lua-releases/main/fanciesp.lua'))()

ESP:Toggle(true)
ESP.Boxes = false 
ESP.Names = false
ESP.Tracers = false 
ESP.TeamColor = true 
ESP.FaceCamera = false

Misc:CreateToggle("Boxes",false,function(t)
	if firsttime == false then 
		ESP.Boxes = t 
	end
end)

Misc:CreateToggle("Nametags",false,function(t)
	if firsttime == false then 
		ESP.Names = t 
	end
end)

Misc:CreateToggle("Tracers",false,function(t)
	if firsttime == false then 
		ESP.Tracers = t 
	end
end)

Misc:CreateToggle("Team Colors",true,function(t)
	if firsttime == false then 
		ESP.TeamColor = t 
	end
end)

Misc:CreateToggle("Face Camera",false,function(t)
	if firsttime == false then 
		ESP.FaceCamera = t 
	end
end)

firsttime = false 
