_G.Active = true 


while _G.Active == true do 
	pcall(function()
		local NearestPart = nil
		local Lenght = nil
		local Folder = game:GetService("Workspace").Blocks.Block
		local Player = game.Players.LocalPlayer

		Currentcolor = game:GetService("Players").LocalPlayer.PlayerGui.inGameGui.Frame.Color.BackgroundColor
		print("Current color "..tostring(Currentcolor))

		for i,v in pairs(Folder:GetDescendants()) do
			if v.Name =="Wedge" or v.Name == "Part" or v.Name == "Star" then 
				if v.BrickColor == Currentcolor then 
					local LenghtX = Player:DistanceFromCharacter(v.Position)
					if Lenght == nil or LenghtX < Lenght then
						Lenght = LenghtX
						NearestPart = v
					end
				end 
			end 
		end

		print("moving to "..tostring(NearestPart).." which has brickcolor "..tostring(NearestPart.BrickColor))
		game.Players.LocalPlayer.Character.Humanoid:MoveTo(NearestPart.Position)
	end) 
	wait(0.1)
end 
