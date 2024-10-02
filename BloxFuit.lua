if game.PlaceId == 2753915549 then
   local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

   local Window = Rayfield:CreateWindow({
      Name = "Solaria - Blox Fruits",
      LoadingTitle = "Solaria - Blox Fruits",
      LoadingSubtitle = "by Solaria",
      ConfigurationSaving = {
         Enabled = false,
         FolderName = nil,
         FileName = "BloxFruitHub"
      },
      Discord = {
         Enabled = true,
         Invite = "KnND58kgrd",
         RememberJoins = true
      },
      KeySystem = true,
      KeySettings = {
         Title = "Clé",
         Subtitle = "",
         Note = "La Clé Est Sur Le Serv Discord",
         FileName = "Key",
         SaveKey = true,
         GrabKeyFromSite = false,
         Key = {"SolariaBypassBloxFruits"}
      }
   })

   local PlayerTab = Window:CreateTab("Player", 106444352314041)

   PlayerTab:CreateSlider({
      Name = "WalkSpeed",
      Range = {1, 100},
      Increment = 1,
      Suffix = "Speed",
      CurrentValue = 1,
      Flag = "Slider1",
      Callback = function(Value)
         game.Players.LocalPlayer.Character:SetAttribute("SpeedMultiplier", Value)
      end,
   })

   PlayerTab:CreateSlider({
      Name = "Dash length",
      Range = {10, 1000},
      Increment = 1,
      Suffix = "Length",
      CurrentValue = 10,
      Flag = "Slider2",
      Callback = function(Value)
         game.Players.LocalPlayer.Character:SetAttribute("DashLength", Value)
      end,
   })

   PlayerTab:CreateSlider({
      Name = "Jump Height",
      Range = {60, 500},
      Increment = 1,
      Suffix = "Height",
      CurrentValue = 60,
      Flag = "Slider3",
      Callback = function(Value)
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
      end,
   })
else
   Rayfield:Notify({
      Title = "Mauvais Jeu!",
      Content = "Le Jeu N'est Pas Blox Fruits! Ou Alors Il Y A Un Probleme (Merci De Nous Contacter Sur Discord)",
      Duration = 5,
   })
end
