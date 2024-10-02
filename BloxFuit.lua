local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Solaria - Blox Fruits",
   LoadingTitle = "Solaria - Blox Fruits",
   LoadingSubtitle = "by Solaria",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "BloxFruitHub"
   },
   Discord = {
      Enabled = true,
      Invite = "KnND58kgrd", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Clé",
      Subtitle = "",
      Note = "La Clé Est Sur Le Serv Discord",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"SolariaBypassBloxFruits"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local PlayerTab = Window:CreateTab("Player", 106444352314041) -- Title, Image

local Slider = PlayerTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {1, 100},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 1,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   game.Players.LocalPlayer.Character:SetAttribute("SpeedMultiplier", Value)
   end,
})

 local Slider = PlayerTab:CreateSlider({
    Name = "Dash length",
    Range = {10, 1000},
    Increment = 1,
    Suffix = "Length",
    CurrentValue = 10,
    Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
     game.Players.LocalPlayer.Character:SetAttribute("DashLength", Value)
    end,
 })

 local Slider = PlayerTab:CreateSlider({
    Name = "Jump Height",
    Range = {60, 500},
    Increment = 1,
    Suffix = "Height",
    CurrentValue = 60,
    Flag = "Slider3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
     game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end,
 })
