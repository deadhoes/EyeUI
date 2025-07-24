local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local EyeHub = {}
EyeHub.__index = EyeHub

local function tween(instance, properties, duration)
    local tween = TweenService:Create(
        instance,
        TweenInfo.new(duration or 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        properties
    )
    tween:Play()
    return tween
end

function EyeHub:CreateWindow(config)
    local window = {}
    config = config or {}
    
    local gui = Instance.new("ScreenGui")
    gui.Name = "EyeHub"
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "Main"
    mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    mainFrame.BorderSizePixel = 0
    mainFrame.Size = config.Size or UDim2.fromOffset(500, 600)
    mainFrame.Position = config.Position or UDim2.fromScale(0.5, 0.5)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.Parent = gui
    
    local topBar = Instance.new("Frame")
    topBar.Name = "TopBar"
    topBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    topBar.Size = UDim2.new(1, 0, 0, 40)
    topBar.Parent = mainFrame
    
    local title = Instance.new("TextLabel")
    title.Text = config.Title or "EyeHub"
    title.Font = Enum.Font.Code
    title.TextColor3 = Color3.fromRGB(230, 230, 230)
    title.TextSize = 14
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(0, 200, 1, 0)
    title.Position = UDim2.new(0, 15, 0, 0)
    title.Parent = topBar
    
    local closeButton = Instance.new("ImageButton")
    closeButton.Image = "rbxassetid://3926305904"
    closeButton.ImageRectOffset = Vector2.new(284, 4)
    closeButton.ImageRectSize = Vector2.new(24, 24)
    closeButton.BackgroundTransparency = 1
    closeButton.Size = UDim2.new(0, 20, 0, 20)
    closeButton.Position = UDim2.new(1, -30, 0.5, -10)
    closeButton.Parent = topBar
    
    closeButton.MouseButton1Click:Connect(function()
        tween(mainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.2)
        task.wait(0.2)
        gui:Destroy()
    end)
    
    local tabContainer = Instance.new("Frame")
    tabContainer.BackgroundTransparency = 1
    tabContainer.Size = UDim2.new(1, 0, 0, 40)
    tabContainer.Position = UDim2.new(0, 0, 0, 40)
    tabContainer.Parent = mainFrame
    
    local contentContainer = Instance.new("Frame")
    contentContainer.BackgroundTransparency = 1
    contentContainer.Size = UDim2.new(1, -20, 1, -80)
    contentContainer.Position = UDim2.new(0, 10, 0, 80)
    contentContainer.Parent = mainFrame
    
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.ScrollBarThickness = 5
    scrollFrame.Parent = contentContainer
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 10)
    layout.Parent = scrollFrame
    
    function window:CreateTab(name)
        local tab = Instance.new("TextButton")
        tab.Text = name
        tab.Font = Enum.Font.Code
        tab.TextSize = 13
        tab.TextColor3 = Color3.fromRGB(150, 150, 150)
        tab.BackgroundTransparency = 1
        tab.Size = UDim2.new(0, 100, 1, 0)
        tab.Parent = tabContainer
        
        local tabContent = Instance.new("Frame")
        tabContent.BackgroundTransparency = 1
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.Visible = false
        tabContent.Parent = scrollFrame
        
        tab.MouseButton1Click:Connect(function()
            for _, child in ipairs(scrollFrame:GetChildren()) do
                if child:IsA("Frame") then
                    child.Visible = false
                end
            end
            tabContent.Visible = true
            tween(tab, {TextColor3 = Color3.fromRGB(230, 230, 230)}, 0.2)
        end)
        
        local tabMethods = {}
        
        function tabMethods:CreateButton(config)
            local button = Instance.new("Frame")
            button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            button.Size = UDim2.new(1, 0, 0, 40)
            button.Parent = tabContent
            
            local buttonText = Instance.new("TextLabel")
            buttonText.Text = config.Text or "Button"
            buttonText.Font = Enum.Font.Code
            buttonText.TextSize = 14
            buttonText.TextColor3 = Color3.fromRGB(230, 230, 230)
            buttonText.BackgroundTransparency = 1
            buttonText.Size = UDim2.new(1, -20, 1, 0)
            buttonText.Position = UDim2.new(0, 10, 0, 0)
            buttonText.Parent = button
            
            local buttonClick = Instance.new("TextButton")
            buttonClick.BackgroundTransparency = 1
            buttonClick.Size = UDim2.new(1, 0, 1, 0)
            buttonClick.Text = ""
            buttonClick.Parent = button
            
            buttonClick.MouseEnter:Connect(function()
                tween(button, {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}, 0.2)
            end)
            
            buttonClick.MouseLeave:Connect(function()
                tween(button, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}, 0.2)
            end)
            
            buttonClick.MouseButton1Click:Connect(function()
                tween(button, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}, 0.1)
                task.wait(0.1)
                tween(button, {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}, 0.1)
                if config.Callback then
                    config.Callback()
                end
            end)
        end
        
        function tabMethods:CreateToggle(config)
            local toggle = Instance.new("Frame")
            toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            toggle.Size = UDim2.new(1, 0, 0, 40)
            toggle.Parent = tabContent
            
            local toggleText = Instance.new("TextLabel")
            toggleText.Text = config.Text or "Toggle"
            toggleText.Font = Enum.Font.Code
            toggleText.TextSize = 14
            toggleText.TextColor3 = Color3.fromRGB(230, 230, 230)
            toggleText.BackgroundTransparency = 1
            toggleText.Size = UDim2.new(1, -60, 1, 0)
            toggleText.Position = UDim2.new(0, 10, 0, 0)
            toggleText.Parent = toggle
            
            local toggleSwitch = Instance.new("Frame")
            toggleSwitch.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            toggleSwitch.Size = UDim2.new(0, 40, 0, 20)
            toggleSwitch.Position = UDim2.new(1, -50, 0.5, -10)
            toggleSwitch.Parent = toggle
            
            local toggleButton = Instance.new("Frame")
            toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            toggleButton.Size = UDim2.new(0, 18, 0, 18)
            toggleButton.Position = UDim2.new(0, 1, 0.5, -9)
            toggleButton.Parent = toggleSwitch
            
            local toggleClick = Instance.new("TextButton")
            toggleClick.BackgroundTransparency = 1
            toggleClick.Size = UDim2.new(1, 0, 1, 0)
            toggleClick.Text = ""
            toggleClick.Parent = toggle
            
            local state = config.Default or false
            
            local function updateToggle()
                if state then
                    tween(toggleButton, {
                        Position = UDim2.new(1, -19, 0.5, -9),
                        BackgroundColor3 = Color3.fromRGB(0, 170, 255)
                    }, 0.2)
                else
                    tween(toggleButton, {
                        Position = UDim2.new(0, 1, 0.5, -9),
                        BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                    }, 0.2)
                end
            end
            
            toggleClick.MouseButton1Click:Connect(function()
                state = not state
                updateToggle()
                if config.Callback then
                    config.Callback(state)
                end
            end)
            
            updateToggle()
        end
        
        return tabMethods
    end
    
    return window
end

return EyeHub
