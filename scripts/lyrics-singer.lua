shared.sayDelay = 3
shared.botTooltip = true 
shared.botTooltipDelay = 6 

--\\ DO NOT MODIFY UNDER THIS 

-- Anti AFK 
spawn(function()
	for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
		v:Disable()
	end
end)

shared.inUse = false 

--\\ Bypass time delay 
if shared.botTooltip == true then 
	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🤖 I am a robot that can sing any song. Don't believe me? Type ;lyrics [song name] into the chat to request a song!", "All")
end

spawn(function() -- \\ Bot Loop Tooltip
	while wait(shared.botTooltipDelay) do 
		if shared.botTooltip == true and shared.inUse == false then 
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🤖 I am a robot that can sing any song. Don't believe me? Type ;lyrics [song name] into the chat to request a song!", "All")
		end
	end
end)



game.Players.PlayerChatted:Connect(function(PlayerChatType, sender, message, recipient)
	if string.match(message, ";lyrics") then 
		print("found viable message. "..message)
		--\\ setup for api search 
		local foundCommand = message 
		local songName = tostring(string.gsub(message, ";lyrics ", ""))
		print(songName)
		local songRequester = sender 
		
		-- make sure bot isn't already in use 
		if shared.inUse == false then 
			--\\ do api search
			if songName ~= nil and not string.match(songName, "#") then 
				shared.inUse = true
				--\\ Notify User  
				print("inuse set to true")
				game.StarterGui:SetCore("SendNotification", {
					Title = "🟡 Bot Notification"; 
					Text = "The bot is now in use and unable to get lyrics requests.";
					Icon = ""; 
					Duration = 5; 
				})
				print("song name: "..tostring(songName))
				game.StarterGui:SetCore("SendNotification", {
					Title = "🟢 Bot Notification"; 
					Text = "Currently singing song "..tostring(songName).." requested by "..tostring(songRequester)..".";
					Icon = ""; 
					Duration = 5; 
				})
				-- delay 
				wait(0.5)
				-- announce current song 
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🤖 Now singing song '"..tostring(songName).."' requested by "..tostring(songRequester)..".", "All")
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🤖 Please keep in mind that I am now unable to recieve song requests. Please wait until the current song is finished!", "All")
				local request = game:HttpGet("https://lyrics.flc.bar/search?song=" .. tostring(songName))
				if tostring(request) ~= '{"lyrics":{}}' then 
					local decoded = game.HttpService:JSONDecode(request)

					local lyrics = {}
					for i in decoded.lyrics:gmatch("[^\r\n]+") do
						table.insert(lyrics, i)
					end

					for i, v in pairs(lyrics) do
						wait(shared.sayDelay)
						game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🎵 "..v, "All")
					end

					shared.inUse = false 
					-- \\ Notify User 
					print("inuse set to false")
					game.StarterGui:SetCore("SendNotification", {
						Title = "🟢 Bot Notification"; 
						Text = "The bot is now free to get lyrics requests.";
						Icon = ""; 
						Duration = 5; 
					})
					if shared.botTooltip == true then 
						game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🤖 I've finished singing! Type ;lyrics [song name] into the chat to request a song!", "All")
					end
				else
					shared.inUse = false 
					game.StarterGui:SetCore("SendNotification", {
						Title = "🟢 Bot Notification"; 
						Text = "The bot is now free to get lyrics requests.";
						Icon = ""; 
						Duration = 5; 
					})
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🤖 I'm sorry, but I couldn't find that song. Try another one.", "All")
					game.StarterGui:SetCore("SendNotification", {
						Title = "🔴 Bot Warning"; 
						Text = "Invalid song was requested. Skipping.";
						Icon = ""; 
						Duration = 5; 
					})
				end
			else -- incase of nil or hashtags 
				wait(0.5)
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🤖 You cannot request hashtags, "..tostring(songRequester)..". Use your brain.", "All")
			end 
		else
			--\\ warn user 
			print("🔴 bot in use")
			game.StarterGui:SetCore("SendNotification", {
				Title = "🔴 Bot Warning"; 
				Text = "A song was requested, however the Bot is currently in use.";
				Icon = ""; 
				Duration = 5; 
			})
		end
	end
end)
