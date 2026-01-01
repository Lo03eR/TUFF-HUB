print("Aimbot.lua загружен")

local Aimbot = {}
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

local Aiming = false

-- Слушаем нажатие правой кнопки мыши
UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        Aiming = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        Aiming = false
    end
end)

-- Главная функция обновления аимбота
function Aimbot.Init()
    RunService.RenderStepped:Connect(function()
        -- Проверяем: включен ли аим в меню И зажата ли кнопка
        if getgenv().TuffConfig.AimbotEnabled and Aiming then
            -- Вызываем поиск цели из соседнего модуля Functions
            local Target = getgenv().TuffFunctions.GetClosestToMouse()
            
            if Target and Target.Character and Target.Character:FindFirstChild("Head") then
                local Head = Target.Character.Head
                local Velocity = Target.Character.HumanoidRootPart.Velocity
                
                -- Расчет позиции с учетом предикта
                local PredictedPos = Head.Position + (Velocity * getgenv().TuffConfig.Prediction)
                
                -- Наведение с учетом плавности (Smoothness)
                local GoalCF = CFrame.lookAt(Camera.CFrame.Position, PredictedPos)
                Camera.CFrame = Camera.CFrame:Lerp(GoalCF, getgenv().TuffConfig.Smoothness)
            end
        end
    end)
end

getgenv().TuffAimbot = Aimbot
print("[-] TuffHub: Аимбот загружен")