local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Solaria - Blade Ball",
   LoadingTitle = "Blade Ball",
   LoadingSubtitle = "by Solaria",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "SCWK6xw2vN",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "Clé",
      Subtitle = "System De Clé",
      Note = "La Clé Est Sur Le Ser Discord!",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"SolariaAbzBladeBall"}
   }
})

local Tab = Window:CreateTab("Tab Example", nil)

local sphere -- Déclaration de la sphère pour l'utiliser globalement
local debounce = false -- Utilisation d'un debounce pour éviter plusieurs clics simultanés

-- Valeur initiale du slider
local sphereSize = 10

-- Fonction pour simuler un clic de souris
local function simulateClick()
   local VirtualUser = game:GetService("VirtualUser")
   VirtualUser:CaptureController()
   VirtualUser:Button1Down(Vector2.new(0, 0)) -- La position peut être ajustée
   VirtualUser:Button1Up(Vector2.new(0, 0)) -- Simule le relâchement du bouton
end

-- Fonction pour vérifier si la balle touche la sphère
local function onTouch(hit)
   if hit:IsA("Part") and hit.Name == "BladeBall" then -- Vérifie si l'objet touché est la balle de Blade Ball
      if not debounce then
         debounce = true
         simulateClick() -- Simule un clic lorsqu'une balle touche la sphère
         wait(1) -- Temps d'attente pour éviter plusieurs clics à la suite
         debounce = false
      end
   end
end

-- Fonction pour créer la sphère
local function createSphere(character)
   sphere = Instance.new("Part")
   sphere.Shape = Enum.PartType.Ball
   sphere.Size = Vector3.new(sphereSize, sphereSize, sphereSize) -- Utilise la valeur du slider pour la taille initiale
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

   -- Connexion de la fonction de détection de la collision avec la balle
   sphere.Touched:Connect(onTouch)

   -- Mise à jour de la position pour que la sphère suive le joueur
   local function updatePosition()
      if character and character:FindFirstChild("HumanoidRootPart") then
         sphere.Position = character.HumanoidRootPart.Position
      end
   end

   -- Connecter à Heartbeat pour mettre à jour la position en temps réel
   game:GetService("RunService").Heartbeat:Connect(updatePosition)
end

-- Crée le toggle pour activer ou désactiver la sphère
local Toggle = Tab:CreateToggle({
   Name = "Activer la sphère",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()

      if Value then
         createSphere(character)
      else
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
   CurrentValue = sphereSize, -- Initialisation avec la valeur de départ
   Flag = "Slider1", -- Identifier pour le slider
   Callback = function(Value)
      sphereSize = Value -- Met à jour la taille de la sphère
      if sphere then
         sphere.Size = Vector3.new(Value, Value, Value)
      end
   end,
})
