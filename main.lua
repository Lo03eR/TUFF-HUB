loadstring(game:HttpGet("https://raw.githubusercontent.com/Lo03eR/TUFF-HUB/refs/heads/main/config.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Lo03eR/TUFF-HUB/refs/heads/main/functions.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Lo03eR/TUFF-HUB/refs/heads/main/Aimbot.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Lo03eR/TUFF-HUB/refs/heads/main/Visual.lua"))()

-- 5. Запускаем всё!
getgenv().TuffAimbot.Init() -- Запускаем цикл аимбота

-- 6. Подключаем меню Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({ Name = "TuffHub Modular", LoadingTitle = "Запуск..." })

local MainTab = Window:CreateTab("Combat")
MainTab:CreateToggle({
    Name = "Aimbot Master Switch",
    CurrentValue = false,
    Callback = function(v) getgenv().TuffConfig.AimbotEnabled = v end
})

MainTab:CreateSlider({
    Name = "Smoothness",
    Range = {0.01, 1}, Increment = 0.01, CurrentValue = 0.1,
    Callback = function(v) getgenv().TuffConfig.Smoothness = v end
})