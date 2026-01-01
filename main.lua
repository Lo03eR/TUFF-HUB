-- 1. Загружаем настройки
loadstring(game:HttpGet('ссылка_на_Config.lua'))()

-- 2. Загружаем функции (поиск цели, проверка стен)
loadstring(game:HttpGet('ссылка_на_Functions.lua'))()

-- 3. Загружаем Аимбот (теперь это отдельный модуль)
loadstring(game:HttpGet('ссылка_на_Aimbot.lua'))()

-- 4. Загружаем Визуалы
loadstring(game:HttpGet('ссылка_на_Visuals.lua'))()

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