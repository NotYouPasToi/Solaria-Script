local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Rayfield Example Window",
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Tab Example", nil) -- Title, Image

local sphere -- Déclaration de la sphère pour l'utiliser globalement

-- Crée le toggle pour activer ou désactiver la sphère
local Toggle = Tab:CreateToggle({
   Name = "Activer la sphère",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()

      -- Si le toggle est activé, crée la sphère
      if Value then
         sphere = Instance.new("Part")
         sphere.Shape = Enum.PartType.Ball
         sphere.Size = Vector3.new(Slider.CurrentValue, Slider.CurrentValue, Slider.CurrentValue) -- Utilise la valeur du slider pour la taille initiale
         sphere.Transparency = 0.5
         sphere.Anchored = true
         sphere.CanCollide = false
         sphere.Color = Color3.fromRGB(255, 255, 255) -- Couleur blanche
         sphere.Material = Enum.Material.SmoothPlastic
         sphere.Parent = character

         -- Ajouter un Highlight pour le contour noir
         local highlight = Instance.new("Highlight")
         highlight.Adornee = sphere
         highlight.FillTransparency = 1
         highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
         highlight.OutlineTransparency = 0
         highlight.Parent = sphere

         -- Mise à jour de la position pour que la sphère suive le joueur
         local function updatePosition()
            if character and character:FindFirstChild("HumanoidRootPart") then
               sphere.Position = character.HumanoidRootPart.Position
            end
         end
         
         -- Connecter à Heartbeat pour mettre à jour la position en temps réel
         game:GetService("RunService").Heartbeat:Connect(updatePosition)

      else
         -- Si le toggle est désactivé, on enlève la sphère
         if sphere then
            sphere:Destroy()
            sphere = nil
         end
      end
   end,
})

-- Crée le slider qui ajuste la taille de la sphère
local Slider = Tab:CreateSlider({
   Name = "Taille de la sphère",
   Range = {1, 50}, -- La taille de la sphère variera de 1 à 50
   Increment = 1,
   Suffix = "Taille",
   CurrentValue = 10,
   Flag = "Slider1", -- Identifier pour le slider
   Callback = function(Value)
      -- Ajuster la taille de la sphère si elle existe déjà
      if sphere then
         sphere.Size = Vector3.new(Value, Value, Value)
      end
   end,
})
