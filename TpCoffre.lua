local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("หนังหมา hub", "DarkTheme")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Credit : kaito#5505")
local Tab = Window:NewTab("Auto Chests")
local Section = Tab:NewSection("Auto Chests ")
Section:NewToggle("Auto Farm Chests 1", "CLick to Farm Chests", function(state)
   _G.loop = state -- true/false
while _G.loop do wait()
for i,v in pairs(game:GetService("Workspace").Chest1:GetDescendants()) do
   if v.Name == "TouchInterest" then
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
       wait(0.1)
   end
end
end 
if state then
        print("Toggle On")
    else
        print("Toggle Off")
    end
end)
Section:NewToggle("Auto Farm Chests 2", "Click to Farm Chests", function(state)
       _G.loop = state -- true/false
while _G.loop do wait()
for i,v in pairs(game:GetService("Workspace").Chest2:GetDescendants()) do
   if v.Name == "TouchInterest" then
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
       wait(0.1)
   end
end
end 
if state then
        print("Toggle On")
    else
        print("Toggle Off")
    end
end)
Section:NewToggle("Auto Farm Chests 3", "Click to Farm Chests", function(state)
_G.loop = state -- true/false
while _G.loop do wait()
for i,v in pairs(game:GetService("Workspace").Chest3:GetDescendants()) do
   if v.Name == "TouchInterest" then
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
       wait(0.1)
   end
end
end   
    if state then
        print("Toggle On")
    else
        print("Toggle Off")
    end
end)
Section:NewKeybind("KeybindText", "KeybindInfo", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)
