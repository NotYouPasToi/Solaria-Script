local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart

local autoClickerEnabled = false

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Solaria - Speedrun Simulator",
   LoadingTitle = "Speedrun Simulator",
   LoadingSubtitle = "by Solaria",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Crée un dossier personnalisé pour ton hub/jeu
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "SCWK6xw2vN", -- Le code d'invitation Discord
      RememberJoins = true -- Mettre à false pour qu'ils rejoignent à chaque fois
   },
   KeySystem = true, -- Utilisation du système de clé
   KeySettings = {
      Title = "Clé",
      Subtitle = "Key System",
      Note = "Trouve La Clé Sur Notre Serveur Discord!",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"SpeedrunSimulatorBySolaria"} -- Liste des clés acceptées
   }
})

local FarmTab = Window:CreateTab("Farm", nil) -- Titre, Image

local isAutoFarming = false -- Variable pour contrôler la boucle

local FarmToggle = FarmTab:CreateToggle({
   Name = "Auto Farm",
   CurrentValue = false,
   Flag = "Toggle1", 
   Callback = function(Value)
      isAutoFarming = Value -- Met à jour la variable en fonction du toggle
      if isAutoFarming then
         while isAutoFarming do
            local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart

            local function Tp()
               rootPart.CFrame = game:GetService("Workspace").GameAssets.GlobalAssets.OrbSpawns.Orb.CFrame
               wait(0.1) -- Attendre 0.1 seconde avant la prochaine téléportation
            end

            Tp() -- Appelle la fonction de téléportation en boucle

            wait(0.1) -- Petite pause pour éviter de surcharger
         end
      end
   end,
})

-- Variable pour stocker l'état du toggle et le thread de l'autoclicker


-- Variable pour stocker l'état du toggle

local Toggle = FarmTab:CreateToggle({
    Name = "Auto Clicker",
    CurrentValue = false,
    Flag = "AutoClickerToggle",
    Callback = function(Value)
        autoClickerEnabled = Value

        if autoClickerEnabled then
            -- Démarrer l'autoclicker
            while autoClickerEnabled do
                -- Effectue un clic
                mouse1click() -- Simule un clic gauche (adapte cette fonction selon ton API)
                
                -- Attends un moment entre les clics (ajuster la vitesse ici)
                wait(0.1)

                -- Si le toggle est désactivé, sort de la boucle
                if not autoClickerEnabled then
                    break
                end
            end
        end
    end,
})
