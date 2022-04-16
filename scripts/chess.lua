-- \\ REMOVE OLD GUIS \\ 
for i,v in pairs(game:GetService("CoreGui"):GetDescendants()) do
	if v.Name == "garfield.warez - chess" then 
	    v:Destroy()
	end 
end

local NofiticationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Nofitication = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

local function Notify(Text)
    Nofitication:Notify(
        {Title = "garfield.warez", Description = Text},
        {OutlineColor = Color3.fromRGB(255, 141, 141),Time = 5, Type = "default"}
    )
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))(); local venyx = library.new("garfield.warez - chess", 5013109572); local themes = {
    Background = Color3.fromRGB(24, 24, 24),
    Glow = Color3.fromRGB(0, 0, 0),
    Accent = Color3.fromRGB(10, 10, 10),
    LightContrast = Color3.fromRGB(20, 20, 20),
    DarkContrast = Color3.fromRGB(14, 14, 14),  
    TextColor = Color3.fromRGB(255, 255, 255)
}



-- \\ Get skins 
local whiteSkins = {}
local blackSkins = {}

for i,v in pairs(game:GetService("ReplicatedStorage").Assets.White:GetChildren()) do
	table.insert(whiteSkins, v.Name)
end

for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Black:GetChildren()) do
    table.insert(blackSkins, v.Name)
end

local features = venyx:addPage("Features", 6031068423); local featuresSection = features:addSection("Skins"); local miscSection = features:addSection("Misc")

local skinWhite; featuresSection:addDropdown("White Skin", whiteSkins, function(value)
    skinWhite = value 
end)

local skinBlack; featuresSection:addDropdown("Black Skin", blackSkins, function(value)
    skinBlack = value 
end)

featuresSection:addButton("Apply Skins",function()
    if skinWhite and skinBlack then 
        game:GetService("ReplicatedStorage").Connections.SelectSkin:FireServer(skinWhite); Notify("set white skin to "..skinWhite)
        game:GetService("ReplicatedStorage").Connections.SelectSkin:FireServer(skinBlack); Notify("set black skin to "..skinBlack)
    else
        Notify("please select both skins")
    end 
end) 

--

miscSection:addButton("Preview Skins",function()
    Notify("note: press remis to not loose points"); for i,v in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
        if v:IsA("RemoteEvent") then v:FireServer() end end
end) 

venyx:SelectPage(venyx.pages[1], true)
