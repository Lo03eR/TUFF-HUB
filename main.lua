-- [[ ЗАГРУЗЧИК ]]
local function Load(file)
    local url = "https://raw.githubusercontent.com/Lo03eR/TUFF-HUB/refs/heads/main/" .. file
    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    if not success then warn("Ошибка в файле " .. file .. ": " .. err) end
end

-- СТРОГИЙ ПОРЯДОК:
Load("Config.lua")    -- Сначала настройки
task.wait(0.2)
Load("Functions.lua") -- Потом инструменты
task.wait(0.2)
Load("Aimbot.lua")    -- Потом логика
task.wait(0.2)
Load("Visuals.lua")   -- Потом визуалы

-- Проверяем, всё ли загрузилось, прежде чем запускать меню
if getgenv().TuffAimbot and getgenv().TuffAimbot.Init then
    getgenv().TuffAimbot.Init()
else
    warn("Критическая ошибка: Модуль Aimbot не найден в памяти!")
end

-- Дальше идет твой Rayfield...

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