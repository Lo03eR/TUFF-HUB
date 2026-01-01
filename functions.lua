print("Functions.lua загружен")

local Functions = {}
local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera

-- Проверка стен
function Functions.IsVisible(TargetPart, Character)
    local RaycastParams = RaycastParams.new()
    RaycastParams.FilterDescendantsInstances = {game.Players.LocalPlayer.Character}
    RaycastParams.FilterType = Enum.RaycastFilterType.Exclude
    local RaycastResult = workspace:Raycast(Camera.CFrame.Position, TargetPart.Position - Camera.CFrame.Position, RaycastParams)
    return RaycastResult and RaycastResult.Instance:IsDescendantOf(Character)
end

-- Поиск цели
function Functions.GetClosestToMouse()
    local Target, ClosestDist = nil, getgenv().TuffConfig.FOV
    for _, Player in pairs(Players:GetPlayers()) do
        if Player ~= game.Players.LocalPlayer and Player.Character and Player.Character:FindFirstChild("Head") then
            local ScreenPos, OnScreen = Camera:WorldToViewportPoint(Player.Character.Head.Position)
            if OnScreen and Functions.IsVisible(Player.Character.Head, Player.Character) then
                local Dist = (Vector2.new(ScreenPos.X, ScreenPos.Y) - game:GetService("UserInputService"):GetMouseLocation()).Magnitude
                if Dist < ClosestDist then
                    ClosestDist = Dist
                    Target = Player
                end
            end
        end
    end
    return Target
end

getgenv().TuffFunctions = Functions
print("[-] TuffHub: Функции загружены")