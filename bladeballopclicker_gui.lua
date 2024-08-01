local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")


local isAutoClickerOn = false
local clickInterval = 1 / 1500
local guiVisible = true
local player = Players.LocalPlayer
local ScreenGui, Frame, CountdownLabel, InfoLabel1, InfoLabel2, InfoLabel3
local countdownFinished = false 


local function createGUI()

    if ScreenGui then
        ScreenGui:Destroy()
    end

    ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "AutoClickerGUI"
    ScreenGui.Parent = player:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Enabled = guiVisible

    Frame = Instance.new("Frame")
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
    Frame.Size = UDim2.new(0, 250, 0, 180)

 
    CountdownLabel = Instance.new("TextLabel")
    CountdownLabel.Name = "CountdownLabel"
    CountdownLabel.Parent = Frame
    CountdownLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    CountdownLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
    CountdownLabel.Size = UDim2.new(0, 200, 0, 30)
    CountdownLabel.Font = Enum.Font.SourceSansBold
    CountdownLabel.Text = "Saniye: 15"
    CountdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    CountdownLabel.TextSize = 20
    CountdownLabel.TextWrapped = true
    CountdownLabel.TextScaled = true

  
    InfoLabel1 = Instance.new("TextLabel")
    InfoLabel1.Name = "InfoLabel1"
    InfoLabel1.Parent = Frame
    InfoLabel1.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    InfoLabel1.Position = UDim2.new(0.1, 0, 0.3, 0)
    InfoLabel1.Size = UDim2.new(0, 200, 0, 30)
    InfoLabel1.Font = Enum.Font.SourceSans
    InfoLabel1.Text = "15 saniye içinde ekran kapanacaktır."
    InfoLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
    InfoLabel1.TextSize = 18
    InfoLabel1.TextWrapped = true
    InfoLabel1.TextScaled = true

    InfoLabel2 = Instance.new("TextLabel")
    InfoLabel2.Name = "InfoLabel2"
    InfoLabel2.Parent = Frame
    InfoLabel2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    InfoLabel2.Position = UDim2.new(0.1, 0, 0.5, 0)
    InfoLabel2.Size = UDim2.new(0, 200, 0, 30)
    InfoLabel2.Font = Enum.Font.SourceSans
    InfoLabel2.Text = "Auto clicker'ı açıp kapamak için 'X' basın."
    InfoLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
    InfoLabel2.TextSize = 18
    InfoLabel2.TextWrapped = true
    InfoLabel2.TextScaled = true

    InfoLabel3 = Instance.new("TextLabel")
    InfoLabel3.Name = "InfoLabel3"
    InfoLabel3.Parent = Frame
    InfoLabel3.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    InfoLabel3.Position = UDim2.new(0.1, 0, 0.7, 0)
    InfoLabel3.Size = UDim2.new(0, 200, 0, 30)
    InfoLabel3.Font = Enum.Font.SourceSans
    InfoLabel3.Text = "Karakter ölünce ekran gider fakat script çalışır."
    InfoLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
    InfoLabel3.TextSize = 18
    InfoLabel3.TextWrapped = true
    InfoLabel3.TextScaled = true
end


local function autoClicker()
    if isAutoClickerOn then
        

        print("Auto clicker activated!") 
    end
end


local function startCountdown()
    local countdown = 15
    while countdown > 0 do
        CountdownLabel.Text = "Saniye: " .. tostring(countdown)
        wait(1)
        countdown = countdown - 1
    end
    ScreenGui.Enabled = false
    countdownFinished = true
end


local function onCharacterAdded(character)
    if not countdownFinished then
        createGUI()
        startCountdown() 
    else
        
        RunService.RenderStepped:Connect(autoClicker)
    end
end


local function handleUserInput(input, gameProcessedEvent)
    if not gameProcessedEvent then
        if input.KeyCode == Enum.KeyCode.X then
            isAutoClickerOn = not isAutoClickerOn
        end
    end
end


player.CharacterAdded:Connect(onCharacterAdded)
UserInputService.InputBegan:Connect(handleUserInput)


createGUI()
startCountdown()




local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")


local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ToggleButton = Instance.new("TextButton")
local OwnerLabel = Instance.new("TextLabel") 

ScreenGui.Name = "AutoClickerGUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.Size = UDim2.new(0, 200, 0, 130)

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = Frame
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
ToggleButton.Position = UDim2.new(0.1, 0, 0.4, 0)
ToggleButton.Size = UDim2.new(0, 160, 0, 80)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.Text = "Auto Clicker: OFF"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 20


OwnerLabel.Name = "OwnerLabel"
OwnerLabel.Parent = Frame
OwnerLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
OwnerLabel.Position = UDim2.new(0.1, 0, 0.1, 0) 
OwnerLabel.Size = UDim2.new(0, 160, 0, 30)
OwnerLabel.Font = Enum.Font.SourceSansBold
OwnerLabel.Text = "My Owner: Thememis"
OwnerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
OwnerLabel.TextSize = 18
OwnerLabel.TextWrapped = true
OwnerLabel.TextScaled = true


local isAutoClickerOn = false
local clickInterval = 1/200 


local function pressKey(key)
    keypress(key)
    wait(0.01)
    keyrelease(key)
end


local function toggleAutoClicker()
    isAutoClickerOn = not isAutoClickerOn
    if isAutoClickerOn then
        ToggleButton.Text = "Auto Clicker: ON"
    else
        ToggleButton.Text = "Auto Clicker: OFF"
    end
end


ToggleButton.MouseButton1Click:Connect(function()
    toggleAutoClicker()
end)


UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.X then
        toggleAutoClicker()
    end
end)


RunService.RenderStepped:Connect(function()
    if isAutoClickerOn then
        pressKey(Enum.KeyCode.F)
        wait(clickInterval)
    end
end)
