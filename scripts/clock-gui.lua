local time = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local clock = Instance.new("TextLabel")
local date = Instance.new("TextLabel")

time.Name = "time"
time.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
time.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = time
Frame.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
Frame.Position = UDim2.new(0.886636734, 0, 0.0132771228, 0)
Frame.Size = UDim2.new(0, 142, 0, 71)

clock.Name = "clock"
clock.Parent = Frame
clock.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
clock.BackgroundTransparency = 1.000
clock.Position = UDim2.new(0, 0, -0.0845070407, 0)
clock.Size = UDim2.new(0, 142, 0, 70)
clock.Font = Enum.Font.GothamBold
clock.TextColor3 = Color3.fromRGB(255, 255, 255)
clock.TextSize = 18.000
spawn(function()
	while wait(0.001) do 
		clock.Text = os.date("%I:%M:%S")
	end
end)

date.Name = "date"
date.Parent = Frame
date.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
date.BackgroundTransparency = 1.000
date.Position = UDim2.new(0, 0, 0.444486558, 0)
date.Size = UDim2.new(0, 142, 0, 25)
date.Font = Enum.Font.Gotham
date.TextColor3 = Color3.fromRGB(176, 176, 176)
date.TextSize = 12.000
date.Text = os.date("%B %d, %Y") -- assuming none of you play more than a day 
