print("config.lua загружен")

getgenv().TuffConfig = {
    AimbotEnabled = false,
    Smoothness = 0.1,
    Prediction = 0.165,
    ESPEnabled = false,
    FOV = 150,
    TargetPart = "Head"
}
print("[-] TuffHub: Конфигурация загружена")