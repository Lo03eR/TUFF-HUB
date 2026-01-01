print("Visual.lua загружен")

local Visuals = {}
local RunService = game:GetService("RunService")

function Visuals.CreateESP(Player)
    local Box = Drawing.new("Square")
    local Tracer = Drawing.new("Line")
    
    RunService.RenderStepped:Connect(function()
        if getgenv().TuffConfig.ESPEnabled and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            local RootPart = Player.Character.HumanoidRootPart
            local Pos, OnScreen = workspace.CurrentCamera:WorldToViewportPoint(RootPart.Position)

            if OnScreen then
                local Size = 1000 / Pos.Z
                Box.Size = Vector2.new(Size, Size * 1.5)
                Box.Position = Vector2.new(Pos.X - Box.Size.X / 2, Pos.Y - Box.Size.Y / 2)
                Box.Visible = true
                -- Линия
                Tracer.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y)
                Tracer.To = Vector2.new(Pos.X, Pos.Y)
                Tracer.Visible = true
            else
                Box.Visible = false
                Tracer.Visible = false
            end
        else
            Box.Visible = false; Tracer.Visible = false
        end
    end)
end

getgenv().TuffVisuals = Visuals
print("[-] TuffHub: Визуалы загружены")