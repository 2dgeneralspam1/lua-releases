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


local Config = {
	WindowName = "GARFIELDWAREZ - Labor Island Tycoon",
	Color = Color3.fromRGB(96, 86, 185),
	Keybind = Enum.KeyCode.RightShift
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))


-- FUNCTIONS 
local function notif(text)
	game.StarterGui:SetCore("SendNotification", {
		Title = "Script"; 
		Text = text;
		Icon = ""; 
		Duration = 5; 
	})
end

local function idiot()
	game.StarterGui:SetCore("SendNotification", {
		Title = "Script"; 
		Text = "You haven't pressed 'Set Team' in a valid tycoon yet. (Also don't forget to toggle back off the toggle)";
		Icon = ""; 
		Duration = 5; 
	})
end

-- TOGGLES 
local Toggles = {
	playerteam = nil, 
	autopressbaby = false,
	autocollectprofits = false,
	autobuy = false,
	autorebirth = false,
	autoclatycoonim = false,
	autostealmoney = false,
	autoteleport = false,
	cratesniper = false,
	amountOfRebirths = 1,
	loopExplodeLands = false,
	loopsummonNuke = false,
	chatspam = false 
}

-- DISABLER 
firsttime = true 

-- MAIN TAB 
local Main = Window:CreateTab("Main")


-- MISC 
local AutofarmMisc = Main:CreateSection("Misc")

AutofarmMisc:CreateButton("Set Team", function()
	if  tostring(game.Players.LocalPlayer.Team) ~= "For Hire" then 
		Toggles.playerteam = tostring(game.Players.LocalPlayer.Team)
		notif("Your team has been set to '"..Toggles.playerteam.."'.")
	else
		notif("Claim a valid tycoon before using this.")
	end
end)

AutofarmMisc:CreateButton("Buy All Upgrades",function()
	if Toggles.playerteam ~= nil then 
		for i,v in pairs(game:GetService("Workspace")["Zednov's Tycoon Kit"].Tycoons[Toggles.playerteam].Buttons:GetDescendants()) do 
			if v:IsA("TouchTransmitter") then 
				firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,0)
				firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,1)
			end 
		end 
	else
		idiot()
	end
end)

AutofarmMisc:CreateButton("Claim All Crates",function()
	for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do 
		if v.Name == "hitbox" then 
			if v.Parent.Name == "Crate" then 
				game.StarterGui:SetCore("SendNotification", {
					Title = "Script"; 
					Text = "Claimed a Airdrop/Crate";
					Icon = ""; 
					Duration = 5; 
				})
				firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v,0)
				firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v,1)
			end 
		end 
	end 
end)

AutofarmMisc:CreateButton("Steal All Money",function()
	for i,v in pairs(game:GetService("Workspace")["Zednov's Tycoon Kit"]:GetDescendants()) do 
		if v:IsA("Part") then 
			if v.Name == "Giver" then 
				if v.Parent.Name == "Essentials" then 
					firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v,0)
					firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v,1)
				end 
			end 
		end 
	end 
end)

-- AUTOFARMS 
local Autofarms = Main:CreateSection("Autofarms")

Autofarms:CreateToggle("Auto Press Baby", false, function(value)
	if firsttime == false then 
		if Toggles.playerteam ~= nil then 
			Toggles.autopressbaby = value 
		else
			idiot()
		end
	end
end)

Autofarms:CreateToggle("Auto Collect Profits",false,function(value)
	if firsttime == false then 
		if Toggles.playerteam ~= nil then 
			Toggles.autocollectprofits = value 
		else
			idiot()
		end
	end
end)

Autofarms:CreateToggle("Auto Steal Money",false,function(value)
	if firsttime == false then 
		if Toggles.playerteam ~= nil then 
			Toggles.autostealmoney = value 
		else
			idiot()
		end
	end
end)


Autofarms:CreateToggle("Auto Claim Crates",false,function(value)
	if firsttime == false then 
		if Toggles.playerteam ~= nil then 
			Toggles.cratesniper = value 
		else
			idiot()
		end
	end
end)

Autofarms:CreateToggle("Auto Buy Upgrades",false,function(value)
	if firsttime == false then 
		if Toggles.playerteam ~= nil then 
			Toggles.autobuy = value 
		else
			idiot()
		end
	end
end)

-- REBIRTHS 
local Rebirths = Main:CreateSection("Rebirths")

rebirthslider = Rebirths:CreateTextBox("Amount Of Rebirths", "Number", true, function(Value)
	if firsttime == false then 
		Toggles.amountOfRebirths = Value
		rebirthslider:SetValue(Toggles.amountOfRebirths)
	end
end)

rebirthslider:AddToolTip("1 Rebirth = normally rebirth, anything more than that you get that amount every time you rebirth")

servicedistruption = Rebirths:CreateButton("Rebirth Once",function()
	local args = {
		[1] = Toggles.amountOfRebirths
	}

	game:GetService("ReplicatedStorage")["RebirthEvent (Don't Move)"]:FireServer(unpack(args))
end)

 Rebirths:CreateToggle("Auto Rebirth",false,function(value)
	if firsttime == false then 
		if Toggles.playerteam ~= nil then 
			Toggles.autorebirth = value 
		else
			idiot()
		end
	end
end)


Rebirths:CreateToggle("Auto Reclaim Tycoon When Rebirthed",false,function(value)
	if firsttime == false then 
		if Toggles.playerteam ~= nil then 
			Toggles.autoclatycoonim = value 
		else
			idiot()
		end
	end
end)

local Protects = Main:CreateSection("Protections")

Protects:CreateButton("Teleport To Safe Autofarm Place",function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-135.92668151855, 33.214160919189, -774.56585693359)
end)

Protects:CreateToggle("Loop Teleport To Safe Autofarm Place",false,function(value)
	if firsttime == false then 
		Toggles.autoteleport = value 
	end
end)


-- MISC/WORLD 
local World = Window:CreateTab("Misc")

local PlayerOfLocals = World:CreateSection("Player")
local antiAFKACTIVE = false 
PlayerOfLocals:CreateButton("Anti-AFK",function()
	if antiAFKACTIVE == false then
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
			vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
			wait(1)
			vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
		antiAFKACTIVE = true
		notif("Anti-AFK Has Been Turned On.")
	else
		notif("Anti-AFK Already Active.")
	end
end)


PlayerOfLocals:CreateButton("FPS Booster by e621",function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/2dgeneralspam1/lua-releases/main/scripts/fps-ting.lua'))()
end)

PlayerOfLocals:CreateToggle("Chat Spam",false,function(t)
	if firsttime == false then 
		Toggles.chatspam = t 
	end
end)


local LocalPlayer = World:CreateSection("Badges")

local function bypassTeleport()
	game.Players.LocalPlayer.Character.Humanoid.Health = 0 
	game.StarterGui:SetCore("SendNotification", {
		Title = "Please wait..."; 
		Text = "Just like 99.9% of anticheats, there's a short window after you die where you can teleport freely. XD!!!!";
		Icon = ""; 
		Duration = 5; 
	})
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(-1.558287858963, 52.99800491333, 410.37203979492)
end


LocalPlayer:CreateButton("Teleport to 'Secret Baby' Badge",function()
	bypassTeleport()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").BadgeAwarder.Platform.CFrame 
end)

LocalPlayer:CreateButton("Teleport to 'Secret Meow' Badge",function()
	bypassTeleport()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-611.44622802734, 479.48049926758, -595.35308837891)
end)


local Teleports = World:CreateSection("Teleports")



Teleports:CreateButton("Trampoline Factory",function()
	bypassTeleport()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(-1.558287858963, 52.99800491333, 410.37203979492)
end)

Teleports:CreateButton("Furby Factory",function()
	bypassTeleport()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  =  CFrame.new(-367.63458251953, 52.994686126709, 354.29379272461)
end)

Teleports:CreateButton("Yeezys Factory",function()
	bypassTeleport()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(-379.01736450195, 52.935749053955, -12.963190078735)
end)

Teleports:CreateButton("Pool Floatie World Factory",function()
	bypassTeleport()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(-337.56771850586, 54.627540588379, -351.45520019531)
end)

Teleports:CreateButton("Bouncy Ball Factory",function()
	bypassTeleport()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  =  CFrame.new(-22.98681640625, 52.9931640625, -378.66528320313)
end)

Teleports:CreateButton("Adidas Factory",function()
	bypassTeleport()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(331.69650268555, 54.189517974854, -335.8935546875) 
end)

Teleports:CreateButton("IPhone Factory",function()
	bypassTeleport()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(344.03945922852, 53.040493011475, -6.1640796661377) 
end)

Teleports:CreateButton("Samsung Factory",function()
	bypassTeleport()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(344.68054199219, 52.946857452393, 348.35998535156)
end)

local Explosives = World:CreateSection("Explosives")

Explosives:CreateButton("Explode All Landmines",function()
	for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do 
		if v.Name == "Trigger" and v.Parent.Name == "Landmine" then 
			firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v,0)
			firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v,1)
		end 
	end 
end)

Explosives:CreateButton("Summon Nuke",function()
	notif("Hold Nuke Tool")
	local args = {
		[1] = Vector3.new(-304.45172119141, 50.096000671387, 273.87557983398)
	}

	game:GetService("Players").LocalPlayer.Character.Nuke.RemoteEvent:FireServer(unpack(args))
end)

Explosives:CreateToggle("Loop Summon Nuke",false,function(value)
	if firsttime == false then 
		notif("Hold Nuke Tool")
		Toggles.loopsummonNuke = value 
	end
end)

Explosives:CreateToggle("Loop Explode All Landmines",false,function(value)
	if firsttime == false then 
		Toggles.loopExplodeLands = value 
	end
end)

-- UI SETTINGS  TAB
local UISettings = Window:CreateTab("Settings")
local Section1 = UISettings:CreateSection("UI Settings")

local UIToggle = Section1:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
UIToggle:AddToolTip("Set the keybind for the UI, or just toggle it off.")

UIToggle:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
UIToggle:SetState(true)

AKSDEHKJAWKEJHAKWJEHKJWAEHJKWAHJEAWE = Section1:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)
	if firsttime == false then 
		if Name == "Default" then
			Window:SetBackground("2151741365")
		elseif Name == "Hearts" then
			Window:SetBackground("6073763717")
		elseif Name == "Abstract" then
			Window:SetBackground("6073743871")
		elseif Name == "Hexagon" then
			Window:SetBackground("6073628839")
		elseif Name == "Circles" then
			Window:SetBackground("6071579801")
		elseif Name == "Lace With Flowers" then
			Window:SetBackground("6071575925")
		elseif Name == "Floral" then
			Window:SetBackground("5553946656")
		end
	end
end)

AKSDEHKJAWKEJHAKWJEHKJWAEHJKWAHJEAWE:SetOption("Default")

local Colorpicker3 = Section1:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)

Colorpicker3:AddToolTip("Change the UI's theme color.")
Colorpicker3:UpdateColor(Config.Color)



local DiscordSection = UISettings:CreateSection("Discord")

DiscordSection:CreateButton("Copy Discord to Clipboard",function()
	setclipboard('https://dsc.gg/garfieldproductions')
	notif("Copied to clipboard!")
end)

local chatinsults = {
	"hey developers, your anticheat detected 0 of my GUI's features!!! uall proud of urself??? ✊✊✊✊",
	"developers omg u guys are soooo good you added a fly anticheat that detects fly after 5 seconds 😋😋😋",
	"developers your anticheat testers used krnl??? omg i shaking 😶😶😶",
	"omg anticheat??? more like 50000000 rebirths in 1 second-cheat 🙄🙄🙄",
	"1e+5 rebirth speedrun: finished in 30 seconds thanks to GARFIELDWARZZZ 😎😎😎",
	"developers: he must be using teleport and auto rebirth to get 1e+5 rebirths in 30 seconds ofc 😂😂",
	"'the rebirths are probbaly just for show' - lead developer",
	"he must be using teleport and auto rebirth to get 1e+5 rebirths in 30 seconds ofc - lead developer"
}

-- Loops 
spawn(function()
	while wait(3) do 
		pcall(function()

			if Toggles.loopExplodeLands == true then 
				for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do 
					if v.Name == "Trigger" and v.Parent.Name == "Landmine" then 
						firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v,0)
						firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v,1)
					end 
				end 
			end

			if Toggles.cratesniper == true then 
				for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do 
					if v.Name == "hitbox" then 
						if v.Parent.Name == "Crate" then 
							game.StarterGui:SetCore("SendNotification", {
								Title = "Script"; 
								Text = "Claimed a Airdrop/Crate";
								Icon = ""; 
								Duration = 5; 
							})
							firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v,0)
							firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v,1)
						end 
					end 
				end 
			end


			-- loops n shit 
			if Toggles.autostealmoney == true then 
				for i,v in pairs(game:GetService("Workspace")["Zednov's Tycoon Kit"]:GetDescendants()) do 
					if v:IsA("Part") then 
						if v.Name == "Giver" then 
							if v.Parent.Name == "Essentials" then 
								firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v,0)
								firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v,1)
							end 
						end 
					end 
				end 
			end


			if Toggles.autobuy == true then 
				pcall(function() -- it works ??? 
					for i,v in pairs(game:GetService("Workspace")["Zednov's Tycoon Kit"].Tycoons[Toggles.playerteam].Buttons:GetDescendants()) do 
						if v:IsA("TouchTransmitter") then 
							firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,0)
							firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Parent,1)
						end 
					end 
				end)
			end
			
			if Toggles.chatspam == true then
				local ohString1 = chatinsults[math.random(1, #chatinsults)]
				local ohString2 = "All"

				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(ohString1, ohString2)
			end


			if Toggles.autoclatycoonim == true then 
				pcall(function() -- it works ??? 
					firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game:GetService("Workspace")["Zednov's Tycoon Kit"].Tycoons[Toggles.playerteam].Entrance["touch to claim tycoon"].Head,0)
					firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game:GetService("Workspace")["Zednov's Tycoon Kit"].Tycoons[Toggles.playerteam].Entrance["touch to claim tycoon"].Head,1)
				end)
			end

		end)
	end
end)


-- no dealay one here
spawn(function()
	while wait() do 
		pcall(function()
			if Toggles.loopsummonNuke == true then 
				local args = {
					[1] = Vector3.new(-304.45172119141, 50.096000671387, 273.87557983398)
				}

				game:GetService("Players").LocalPlayer.Character.Nuke.RemoteEvent:FireServer(unpack(args))
			end


			if Toggles.autoteleport == true then 
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-135.92668151855, 33.214160919189, -774.56585693359)
			end

			if Toggles.autopressbaby == true then  -- this one needs to be fast 
				fireclickdetector(game:GetService("Workspace")["Zednov's Tycoon Kit"].Tycoons[Toggles.playerteam].PurchasedObjects.Mine.Clicker.ClickDetector)
			end

			if Toggles.autocollectprofits == true then  -- same 
				firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game:GetService("Workspace")["Zednov's Tycoon Kit"].Tycoons[Toggles.playerteam].Essentials.Giver,0)
				firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game:GetService("Workspace")["Zednov's Tycoon Kit"].Tycoons[Toggles.playerteam].Essentials.Giver,1)
			end


			if Toggles.autorebirth == true then -- fast!!
				local args = {
					[1] = Toggles.amountOfRebirths
				}

				game:GetService("ReplicatedStorage")["RebirthEvent (Don't Move)"]:FireServer(unpack(args))
			end

		end)


	end
end)

firsttime = false 
