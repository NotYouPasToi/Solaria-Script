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

    local PlayerTab = Window:CreateTab("Player", nil)

    local FarmTab = Window:CreateTab("Farm", nil)

    local TpTab = Window:CreateTab("Teleport", nil)
   
    local FruitsTab = Window:CreateTab("Fruits", nil)

    local FunTab = Window:CreateTab("Fun", nil)

    local Button = FarmTab:CreateButton({
   Name = "Button Example",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/NotYouPasToi/Solaria-Script/refs/heads/main/TpCoffre.lua"))()
   end,
})
    
    -- Slider Player (WalkSpeed, Dash, Jump)
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

    -- Ajouter les boutons de téléportation dans l'onglet TpTab
    local teleportLocations = {
        {"Starter Island", CFrame.new(973, 16, 1414)},
        {"Pirate Village", CFrame.new(-1123, 4, 3855)},
        {"Desert Island", CFrame.new(1094, 6, 4196)},
        {"Jungle Island", CFrame.new(-1214, 11, 123)},
        {"Skylands", CFrame.new(-4939, 717, -2625)},
        {"Marine Fortress", CFrame.new(-4913, 65, 4287)},
        {"Ice Island", CFrame.new(5750, 28, -6481)},
        {"Colosseum", CFrame.new(-1429, 7, -2772)},
        {"Magma Village", CFrame.new(-5232, 8, 8469)}
    }

    -- Fonction pour simuler une téléportation via TweenService
    local TweenService = game:GetService("TweenService")

    local function teleportTo(location)
        local player = game.Players.LocalPlayer
        local character = player.Character
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

        if humanoidRootPart then
            -- Créer un tween vers la destination
            local tween = TweenService:Create(humanoidRootPart, TweenInfo.new(10, Enum.EasingStyle.Linear), {CFrame = location}) -- Temps de 10 secondes pour un mouvement encore plus lent
            tween:Play()
            tween.Completed:Wait() -- Attendre que le tween soit terminé
            humanoidRootPart.CFrame = location -- Assurer que le joueur est positionné à la destination finale
        end
    end

    for _, loc in pairs(teleportLocations) do
        TpTab:CreateButton({
            Name = loc[1],
            Callback = function()
                teleportTo(loc[2])
            end,
        })
    end

else
Rayfield:Destroy()
end
