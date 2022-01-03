

--[[
 ██▓   ▓██   ██▓ ██▀███   ██▓ ▄████▄    ██████              ▄▄▄▄    ▒█████  ▄▄▄█████▓
▓██▒    ▒██  ██▒▓██ ▒ ██▒▓██▒▒██▀ ▀█  ▒██    ▒             ▓█████▄ ▒██▒  ██▒▓  ██▒ ▓▒
▒██░     ▒██ ██░▓██ ░▄█ ▒▒██▒▒▓█    ▄ ░ ▓██▄               ▒██▒ ▄██▒██░  ██▒▒ ▓██░ ▒░
▒██░     ░ ▐██▓░▒██▀▀█▄  ░██░▒▓▓▄ ▄██▒  ▒   ██▒            ▒██░█▀  ▒██   ██░░ ▓██▓ ░ 
░██████▒ ░ ██▒▓░░██▓ ▒██▒░██░▒ ▓███▀ ░▒██████▒▒            ░▓█  ▀█▓░ ████▓▒░  ▒██▒ ░ 
░ ▒░▓  ░  ██▒▒▒ ░ ▒▓ ░▒▓░░▓  ░ ░▒ ▒  ░▒ ▒▓▒ ▒ ░            ░▒▓███▀▒░ ▒░▒░▒░   ▒ ░░   
░ ░ ▒  ░▓██ ░▒░   ░▒ ░ ▒░ ▒ ░  ░  ▒   ░ ░▒  ░ ░            ▒░▒   ░   ░ ▒ ▒░     ░    
  ░ ░   ▒ ▒ ░░    ░░   ░  ▒ ░░        ░  ░  ░               ░    ░ ░ ░ ░ ▒    ░      
    ░  ░░ ░        ░      ░  ░ ░            ░               ░          ░ ░           
        ░ ░                  ░                                   ░                   

VERSION 1.04 
MADE BY GARFIELD THE CAT ON V3RMILLION 
SCRIPTBLOX ACCOUNT: https://scriptblox.com/u/garfieldcatto


***PLEASE DO NOT MODIFY UNDER THIS*** 
]]




--\\ Anti-AFK 
spawn(function()
	for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
		v:Disable()
	end
end)

--\\ Set up logs 
if shared.botLogs == true then 
	rconsoleclear()
	rconsoleprint('@@WHITE@@')
	rconsoleprint("Lyrics Bot v1.04 waiting...\n")
end

shared.inUse = false -- ⚠️ DO NOT MODIFY THIS 
shared.songCount = 0 

--\\ Send first tooltip 
if shared.botTooltip == true then 
	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🤖 Hello! I'm a robot that can sing any song. Use the command ;lyrics [Song Name] to request a song!", "All")
end

spawn(function() -- \\ Bot Loop Tooltip
	while wait(shared.botTooltipDelay) do 
		if shared.botTooltip == true and shared.inUse == false then 
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🤖 Hello! I'm a robot that can sing any song. Use the command ;lyrics [Song Name] to request a song!", "All")
		end
	end
end)



game.Players.PlayerChatted:Connect(function(PlayerChatType, sender, message, recipient)
	if string.match(message, ";lyrics") then 
		--\\ setup for api search 
		local foundCommand = message 
		local songName = tostring(string.gsub(message, ";lyrics ", ""))
		local songRequester = sender 
		if shared.botLogs == true then 
			rconsoleprint('@@YELLOW@@')
			rconsoleprint("\nFound command: '"..tostring(message).."'. Requested by "..tostring(sender))
		end
		
		
		
		--\\ make sure bot isn't already in use 
		if shared.inUse == false then 
			--\\ do api search
			if songName ~= nil and not string.match(songName, "#") then 
				shared.inUse = true
				--\\ Notify User  
				game.StarterGui:SetCore("SendNotification", {
					Title = "🟡 Bot Notification"; 
					Text = "The bot is now in use and unable to get lyrics requests.";
					Icon = ""; 
					Duration = 5; 
				})
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
				if shared.botLogs == true then 
					rconsoleprint('@@YELLOW@@')
					rconsoleprint("\nTesting song "..tostring(songName))
				end
				
				
				local request = game:HttpGet("https://lyrics.flc.bar/search?song=" .. tostring(songName))
				if tostring(request) ~= '{"lyrics":{}}' then 
					if shared.botLogs == true then 
						rconsoleprint('@@GREEN@@')
						rconsoleprint("\nSong valid! Singing song "..tostring(songName))
					end

					local decoded = game.HttpService:JSONDecode(request)

					local lyrics = {}
					for i in decoded.lyrics:gmatch("[^\r\n]+") do
						table.insert(lyrics, i)
					end
					
					-- Print out lyrics 
					if shared.botLogs == true then 
						rconsoleprint('@@LIGHT_CYAN@@')
						rconsoleprint("\n\nRequested Lyrics: \n")
					end
					
					if shared.botLogs == true then 
						rconsoleprint('@@LIGHT_GRAY@@')

					end
					
					for i, v in pairs(lyrics) do
						if shared.botLogs == true then 
							rconsoleprint(v.." ")
						end
						
						shared.songCount = shared.songCount + 3 
					end
					
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🤖 The requested song will last for "..tostring(shared.songCount).." seconds. Please keep in mind that I cannot take song requests in this time.", "All")
					
					game.StarterGui:SetCore("SendNotification", {
						Title = "🟢 Bot Notification"; 
						Text = "Song will last for "..shared.songCount.." seconds.";
						Icon = ""; 
						Duration = 5; 
					})
					
					if shared.botLogs == true then 
						rconsoleprint('@@LIGHT_CYAN@@')
						rconsoleprint("\nSong will last for "..shared.songCount.." seconds.")
					end
					
					
					shared.songCount = 0 
					
					if shared.botLogs == true then 
						rconsoleprint('@@WHITE@@')
						rconsoleprint("\n\nWaiting for song to finish...\n")
					end

					for i, v in pairs(lyrics) do
						wait(shared.sayDelay)
						game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🎵 "..v, "All")
					end

					shared.inUse = false 
					-- \\ Notify User 
					game.StarterGui:SetCore("SendNotification", {
						Title = "🟢 Bot Notification"; 
						Text = "The bot is now free to get lyrics requests.";
						Icon = ""; 
						Duration = 5; 
					})
					if shared.botTooltip == true then 
						game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🤖 I've finished singing! Type ;lyrics [song name] into the chat to request a song!", "All")
					end
					if shared.botLogs == true then 
						rconsoleprint('@@GREEN@@')
						rconsoleprint("\nBot now clear for more requests!")
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
					if shared.botLogs == true then 
						rconsoleprint('@@RED@@')
						rconsoleprint("\nInvalid song requested. Song name: "..tostring(songName))
					end
				end
			else -- incase of nil or hashtags 
				wait(0.5)
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🤖 You cannot request hashtags, "..tostring(songRequester)..". Try another song.", "All")
				if shared.botLogs == true then 
					rconsoleprint('@@RED@@')
					rconsoleprint("\nInvalid title requested by "..tostring(songRequester))
				end
			end 
		else
			--\\ warn user 
			game.StarterGui:SetCore("SendNotification", {
				Title = "🔴 Bot Warning"; 
				Text = "A song was requested, however the Bot is currently in use.";
				Icon = ""; 
				Duration = 5; 
			})
			if shared.botLogs == true then 
				rconsoleprint('@@LIGHT_RED@@')
				rconsoleprint("\nSong was requested while bot was in use.")
			end
		end
	end
end)
