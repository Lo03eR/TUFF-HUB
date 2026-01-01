local function GetFile(File)
    -- Используем твой путь, но добавляем проверку кэша (?v=...)
    local Success, Content = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/Lo03eR/TUFF-HUB/refs/heads/main/" .. File .. "?v=" .. tick())
    end)
    if Success then return Content else return nil end
end

-- 1. Загружаем Конфиг (ОБЯЗАТЕЛЬНО ПЕРВЫМ)
local ConfigSrc = GetFile("Config.lua")
if ConfigSrc then loadstring(ConfigSrc)() end

-- Ждем чуть-чуть, чтобы таблица TuffConfig точно появилась в памяти
repeat task.wait() until getgenv().TuffConfig

-- 2. Загружаем остальные модули
local FuncsSrc = GetFile("Functions.lua")
if FuncsSrc then loadstring(FuncsSrc)() end

local AimSrc = GetFile("Aimbot.lua")
if AimSrc then loadstring(AimSrc)() end

local VisSrc = GetFile("Visuals.lua")
if VisSrc then loadstring(VisSrc)() end

-- 3. Запускаем GUI и логику
if getgenv().TuffAimbot then
    getgenv().TuffAimbot.Init()
end

-- Сюда вставляй свой код Rayfield...
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