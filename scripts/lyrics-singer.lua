--[[
 ██▓   ▓██   ██▓ ██▀███   ██▓ ▄████▄    ██████ 
▓██▒    ▒██  ██▒▓██ ▒ ██▒▓██▒▒██▀ ▀█  ▒██    ▒ 
▒██░     ▒██ ██░▓██ ░▄█ ▒▒██▒▒▓█    ▄ ░ ▓██▄   
▒██░     ░ ▐██▓░▒██▀▀█▄  ░██░▒▓▓▄ ▄██▒  ▒   ██▒
░██████▒ ░ ██▒▓░░██▓ ▒██▒░██░▒ ▓███▀ ░▒██████▒▒
░ ▒░▓  ░  ██▒▒▒ ░ ▒▓ ░▒▓░░▓  ░ ░▒ ▒  ░▒ ▒▓▒ ▒ ░
░ ░ ▒  ░▓██ ░▒░   ░▒ ░ ▒░ ▒ ░  ░  ▒   ░ ░▒  ░ ░
  ░ ░   ▒ ▒ ░░    ░░   ░  ▒ ░░        ░  ░  ░  
    ░  ░░ ░        ░      ░  ░ ░            ░  
        ░ ░                  ░                
        
What is logged when you are using this script: 
 - Your HASHED IP 
 - The game you execute this script on 
 - FPS on execution 
 - Ping on exeuction 
]]

--\\ Iris Compat 
if syn then 

else
	loadstring(game:HttpGet('https://raw.githubusercontent.com/2dgeneralspam1/lua-releases/main/iris-compat.lua'))()
end
-- my take on why i use custom loadstrings: https://paste.sh/WuQf3Z9l#-9vdpfOakqXpZXv6UyjF5rBA


--\\ PLEASE PLEASE PLEASE DON'T TURN THIS OFF 
shared.provideStats = true -- if you wanna provide usage stats 

if shared.provideStats then 
	-- No use in obfuscating, you can just use a HTTP spy anyways... 
	spawn(function()game:GetService("RunService").RenderStepped:Connect(function(a)shared.fps=math.round(1/a)end)end)local b=game:GetService("MarketplaceService")local c,d=pcall(b.GetProductInfo,b,game.PlaceId)if c then gameName=d.Name end;local e={["content"]="",["embeds"]={{["title"]="Script Executed!",["description"]="Script 'Lyrics Bot' has been executed.",["type"]="rich",["color"]=tonumber(0xfff800),["fields"]={{["name"]="Data",["value"]="Game Name: "..gameName.."\nPing At Execution: "..game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString().."\nFPS At Execution: "..tonumber(shared.fps).."\nHashed IP: <ip>"}}}}}local f=syn.request({Url="https://websec.services/ws/send/YrArUHJFMYL1DknCNygPncxDgWWLyjEpZRfjcmvr",Method="POST",Headers={["Content-Type"]="application/json"},Body=game:GetService("HttpService"):JSONEncode(e)})
end


if shared.sayDelay < 3 and shared.sayDelay ~= 3 then -- If its smaller than 3 and not equal to 3 then 
	game.Players.LocalPlayer:Kick("🤡🤡🤡🤡🤡🤡🤡🤡🤡\nPlease learn how to read. Hint: line 4") -- kick yo ass!
	wait(0.3)
	while true do -- insane 
		while true do end 
		while true do end 
		while true do end 
	end
end

-- Check if logs are on 
local function checkLogs() 
	if shared.botLogs == true then 
		return true 
	else 
		return false 
	end
end


-- Set up logs 
if checkLogs() then 
	rconsoleclear()
	rconsolename("Lyrics Bot Logs")
	rconsoleprint('@@WHITE@@')
	rconsoleprint("Made by garfieldcatto on V3rmillion\n")
end

-- Anti-Fling
spawn(function()
	if checkLogs() then 
		rconsoleprint("Anti-Fling/Noclip enabled.\n")
	end
	
	-- Noclip here 
	game:GetService('RunService').Stepped:connect(function()
		pcall(function() -- less gay than spamming i,v pairs bullshit (which will fuck your pc [sometimes])
			if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
				game.Players.LocalPlayer.Character.Head.CanCollide = false
				game.Players.LocalPlayer.Character.Torso.CanCollide = false
				game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
				game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
			elseif game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
				game.Players.LocalPlayer.Character.Head.CanCollide = false
				game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false
				game.Players.LocalPlayer.Character.LowerTorso.CanCollide = false
				game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
			end
		end)
	end)
end)


-- Anti-AFK 
spawn(function()
	if checkLogs() then 
		rconsoleprint("Anti-AFK enabled.\n\n")
		rconsoleprint("Lyrics Bot v1.06 waiting...\n")
	end
	
	-- Advanced antiafk?!@?#?!@ crazy! 
	for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
		v:Disable()
	end
end)

--\\ DO NOT MODFIY THESE 
shared.inUse = false -- ⚠️ DO NOT MODIFY THIS 
shared.songCount = 0  -- DO NOT MODIFY THIS EITHER 
--\\ DO NOT MODFIY THESE  

-- Send first tooltip 
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🤖 Hello! I'm a robot that was built with an API that allows me access to millions of songs! Use the command ;lyrics [song name] to see if I can sing your favorite songs.", "All")


-- Loop tooltips 
spawn(function()
	while wait(7) do 
		if shared.inUse == false then 
			local drawLots = math.random(1,10) -- ha ha ha ha ha ha ha ha ha ha ha ha ha ha ha ha ha ha ha 

			if drawLots == 10 then 
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🤖 Fun fact: Did you know that this script was made by a user called 'garfieldcatto'?.", "All")		
			elseif drawLots == 9 then 
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🤖 Fun fact: I'm gay. Robots can have a choice, too!", "All")
			elseif drawLots == 8 then 
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🤖 Am I flooding the chat? Am I annoying you? Why don't you pay me some attention and try me out, then!", "All")
			elseif drawLots == 7 then 
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🤖 Fun fact: My owner was not very happy when coding me. You can tell from the nature of the code...", "All")
			else 
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🤖 Hello! My name is "..game.Players.LocalPlayer.Name..", and I'm a robot! I was built with an API that allows me access to millions of songs! Use the command ;lyrics [song name] to see if I can sing your favorite songs.", "All")
			end
		end
	end
end)

--\\ Lyrics functions 

local function validSong(checkSong) -- Check if its actually a valid fucking song/get song 
	local request = game:HttpGet("https://lyrics.flc.bar/search?song=" ..checkSong) 
	
	if tostring(request) ~= '{"lyrics":{}}' then 
		return game.HttpService:JSONDecode(request) -- actually send back the shit or whatever idk kill me 
	else
		return false 
	end
end


local function saySomething(text) -- so my code isn't filled with 5400000 fucking same things 
	wait(0.1)
	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(text, "All")
end

--\\ Main lyrics bot function 
--\\ get ready for the most gay code you've ever seen 
game.Players.PlayerChatted:Connect(function(PlayerChatType, sender, message, recipient) -- Log messages 
	local sentMessage = tostring(message) -- im gay 
	
	if string.match(sentMessage, ";lyrics") and shared.inUse == false then -- Find message with ;lyrics in it AND don't respond if there's already a thing going 
		local songRequester = tostring(sender) -- Get sender's name 
		if not string.match(sentMessage,"#") then -- check if there's hashtags
			if sentMessage ~= ";lyrics" and sentMessage ~= ";lyrics " then -- Make sure it's not some retard just sending ;lyrics 
				shared.inUse = true -- we're singing now [also prevents the tooptip thing form spamming the fucking chat even if its a invalid song]

				local songName = tostring(string.gsub(message, ";lyrics ", "")) -- Song name 

				if checkLogs() then 
					rconsoleprint('@@YELLOW@@')
					rconsoleprint("\nFound command: '"..tostring(message).."'. Requested by "..tostring(sender))
				end 

				--\\ Check if the shit actually is a song / Get the song's lyrics 
				local songLyrics = validSong(songName) 
				if songLyrics ~= false then  
					if checkLogs() then -- no fucking way! its a valid song. send it on the consoles 
						rconsoleprint('@@GREEN@@')
						rconsoleprint("\nSong valid! Singing song "..songName)
					end 

					-- Put the lyrics in a table 
					local lyrics = {}
					for i in songLyrics.lyrics:gmatch("[^\r\n]+") do
						table.insert(lyrics, i)
					end

					-- Print out lyrics part 1 
					if checkLogs() then 
						rconsoleprint('@@LIGHT_CYAN@@')
						rconsoleprint("\n\nRequested Lyrics: \n")
						rconsoleprint('@@LIGHT_GRAY@@')
					end


					for i, v in pairs(lyrics) do
						if checkLogs() then -- Print out lyrics part 2 
							rconsoleprint(v.." ")
						end -- optimizing code by putting the same shit in the shit shit! 

						-- find how damn long the song will be 
						shared.songCount = shared.songCount + 3 
					end

					shared.songMinutesCount = math.round(shared.songCount/60) -- crazy math innit 

					if checkLogs() then -- Print how long the song will be lmao and other stuff ig 
						rconsoleprint('@@LIGHT_CYAN@@')
						rconsoleprint("\nSong will last for "..shared.songCount.." seconds. Thats about "..shared.songMinutesCount.." minutes.") -- insane 
						rconsoleprint('@@WHITE@@')
						rconsoleprint("\n\nWaiting for song to finish...\n")
					end

					saySomething("🤖 Success, "..songRequester.."! The song was found in my API's libraries. The requested song will last for about "..tostring(shared.songMinutesCount).." minutes. Please keep in mind that I cannot take song requests during my singing time.") -- announce the bullshit 

					-- reset the bullshit 
					shared.songCount = 0 
					shared.songMinutesCount = 0 

					-- ACTUALYL SING THE BULLSHIT 
					for i, v in pairs(lyrics) do
						wait(shared.sayDelay)
						game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🎵 | "..v, "All")
					end
					
					-- Announce that he's finished
					saySomething("🤖 I'm finished with singing! I am now open for more song requests.")
					-- the tooltip is gonna fire so no need to say anything more 


					-- we're done! 
					shared.inUse = false


				else -- say that it's a fucking invalid song 
					saySomething("🤖 Sorry "..songRequester..", that song wasn't found by my API.")
					if checkLogs() then 
						rconsoleprint('@@RED@@')
						rconsoleprint("\nInvalid song requested. Song name: "..songName)
					end
					shared.inUse = false
					-- we're done! 
				end



			else -- send that the user is a retard 
				if checkLogs() then 
					rconsoleprint('@@RED@@')
					rconsoleprint("\n"..songRequester.." just said ;lyrics for some reason. Their opinion was automaticlly filtered.")
				end
			end
			
		else 
			-- send that the user is a retard 
			saySomething("🤖 I cannot read hashtags,"..songRequester..". Please try a more SFW song.") -- requester isn't set yet? 
			if checkLogs() then 
				rconsoleprint('@@RED@@')
				rconsoleprint("\n"..songRequester.." requested a song with a hashtag in it. Their opinion was automaticlly filtered.")
			end
		end
	else -- shield your eyes from the ugly code 
		-- why not a function? because stfu 
		if shared.inUse then  -- Show that the bot is in use when something was requested 
			-- i didn't do the thing so i have to do it again here lMAO
			-- doing it here again so it doesn't spam 
			if not string.match(sentMessage,"#") then -- check if there's hashtags
				if sentMessage ~= ";lyrics" and sentMessage ~= ";lyrics " then -- Make sure it's not some retard just sending ;lyrics 
					if checkLogs() then 
						rconsoleprint('@@RED@@')
						rconsoleprint("\nA song was requested while the bot was singing.")
					end
				end
			end
		end
	end
end)
