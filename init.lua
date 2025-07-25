local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local EyeUI = {}
EyeUI.__index = EyeUI

function EyeUI.new()
    local self = setmetatable({}, EyeUI)
    self.windows = {}
    self.theme = {
        Background = Color3.fromRGB(25, 25, 25),
        Secondary = Color3.fromRGB(20, 20, 20),
        Text = Color3.fromRGB(230, 230, 230),
        Accent = Color3.fromRGB(100, 150, 255),
        LightText = Color3.fromRGB(180, 180, 180)
    }
    return self
end

function EyeUI:CreateWindow(title, size, position)
    local window = {}
    window.gui = Instance.new("ScreenGui")
    window.main = Instance.new("Frame")
    window.elements = Instance.new("Frame")
    window.tabs = Instance.new("Frame")
    window.title = Instance.new("TextLabel")
    window.minimize = Instance.new("ImageButton")
    window.close = Instance.new("ImageButton")

    window.gui.Name = "EyeUI"
    window.gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    window.gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    window.main.Name = "Main"
    window.main.Parent = window.gui
    window.main.BackgroundColor3 = self.theme.Background
    window.main.BorderSizePixel = 0
    window.main.Position = position or UDim2.new(0.5, -size.X.Offset/2, 0.5, -size.Y.Offset/2)
    window.main.Size = size
    window.main.ClipsDescendants = true

    window.title.Name = "Title"
    window.title.Parent = window.main
    window.title.BackgroundTransparency = 1
    window.title.Position = UDim2.new(0.02, 0, 0, 0)
    window.title.Size = UDim2.new(0.9, 0, 0, 30)
    window.title.Font = Enum.Font.Code
    window.title.Text = title
    window.title.TextColor3 = self.theme.Text
    window.title.TextSize = 14
    window.title.TextXAlignment = Enum.TextXAlignment.Left

    window.minimize.Name = "Minimize"
    window.minimize.Parent = window.main
    window.minimize.BackgroundTransparency = 1
    window.minimize.Position = UDim2.new(0.9, 0, 0.02, 0)
    window.minimize.Size = UDim2.new(0, 15, 0, 15)
    window.minimize.Image = "rbxassetid://11293980042"
    window.minimize.ImageColor3 = self.theme.Text

    window.close.Name = "Close"
    window.close.Parent = window.main
    window.close.BackgroundTransparency = 1
    window.close.Position = UDim2.new(0.95, 0, 0.02, 0)
    window.close.Size = UDim2.new(0, 15, 0, 15)
    window.close.Image = "rbxassetid://11293981586"
    window.close.ImageColor3 = self.theme.Text

    window.elements.Name = "Elements"
    window.elements.Parent = window.main
    window.elements.BackgroundColor3 = self.theme.Secondary
    window.elements.BackgroundTransparency = 0.5
    window.elements.BorderSizePixel = 0
    window.elements.Position = UDim2.new(0.01, 0, 0.08, 0)
    window.elements.Size = UDim2.new(0.98, 0, 0.89, 0)
    window.elements.ZIndex = 2

    window.tabs.Name = "Tabs"
    window.tabs.Parent = window.main
    window.tabs.BackgroundColor3 = self.theme.Secondary
    window.tabs.BackgroundTransparency = 0.5
    window.tabs.BorderSizePixel = 0
    window.tabs.Position = UDim2.new(0.01, 0, 0.08, 0)
    window.tabs.Size = UDim2.new(0.2, 0, 0.89, 0)
    window.tabs.ZIndex = 2

    local dragToggle = nil
    local dragInput = nil
    local dragStart = nil
    local startPos = nil

    local function updateInput(input)
        local delta = input.Position - dragStart
        window.main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    window.title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragToggle = true
            dragStart = input.Position
            startPos = window.main.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)

    window.title.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then
            updateInput(input)
        end
    end)

    window.minimize.MouseButton1Click:Connect(function()
        local tween = TweenService:Create(
            window.main,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = UDim2.new(window.main.Size.X.Scale, window.main.Size.X.Offset, 0, 30)}
        )
        tween:Play()
    end)

    window.close.MouseButton1Click:Connect(function()
        window.gui:Destroy()
    end)

    table.insert(self.windows, window)
    return window
end

function EyeUI:CreateButton(parent, text, callback)
    local button = {}
    button.frame = Instance.new("Frame")
    button.label = Instance.new("TextLabel")
    button.interact = Instance.new("TextButton")

    button.frame.Name = "Button"
    button.frame.Parent = parent
    button.frame.BackgroundColor3 = self.theme.Background
    button.frame.BorderSizePixel = 0
    button.frame.Size = UDim2.new(0.95, 0, 0, 30)

    button.label.Name = "Label"
    button.label.Parent = button.frame
    button.label.BackgroundTransparency = 1
    button.label.Position = UDim2.new(0.04, 0, 0, 0)
    button.label.Size = UDim2.new(0.6, 0, 1, 0)
    button.label.Font = Enum.Font.Code
    button.label.Text = text
    button.label.TextColor3 = self.theme.Text
    button.label.TextSize = 14
    button.label.TextXAlignment = Enum.TextXAlignment.Left

    button.interact.Name = "Interact"
    button.interact.Parent = button.frame
    button.interact.BackgroundTransparency = 1
    button.interact.Size = UDim2.new(1, 0, 1, 0)
    button.interact.Font = Enum.Font.SourceSans
    button.interact.Text = ""
    button.interact.TextColor3 = Color3.new(0, 0, 0)
    button.interact.TextSize = 14

    button.interact.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
        local tween = TweenService:Create(
            button.frame,
            TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = self.theme.Accent}
        )
        tween:Play()
        tween.Completed:Connect(function()
            local tween2 = TweenService:Create(
                button.frame,
                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 = self.theme.Background}
            )
            tween2:Play()
        end)
    end)

    return button
end

function EyeUI:CreateToggle(parent, text, default, callback)
    local toggle = {}
    toggle.frame = Instance.new("Frame")
    toggle.label = Instance.new("TextLabel")
    toggle.switch = Instance.new("Frame")
    toggle.button = Instance.new("Frame")
    toggle.interact = Instance.new("TextButton")

    toggle.value = default or false

    toggle.frame.Name = "Toggle"
    toggle.frame.Parent = parent
    toggle.frame.BackgroundColor3 = self.theme.Background
    toggle.frame.BorderSizePixel = 0
    toggle.frame.Size = UDim2.new(0.95, 0, 0, 30)

    toggle.label.Name = "Label"
    toggle.label.Parent = toggle.frame
    toggle.label.BackgroundTransparency = 1
    toggle.label.Position = UDim2.new(0.04, 0, 0, 0)
    toggle.label.Size = UDim2.new(0.6, 0, 1, 0)
    toggle.label.Font = Enum.Font.Code
    toggle.label.Text = text
    toggle.label.TextColor3 = self.theme.Text
    toggle.label.TextSize = 14
    toggle.label.TextXAlignment = Enum.TextXAlignment.Left

    toggle.switch.Name = "Switch"
    toggle.switch.Parent = toggle.frame
    toggle.switch.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    toggle.switch.BorderSizePixel = 0
    toggle.switch.Position = UDim2.new(0.85, 0, 0.3, 0)
    toggle.switch.Size = UDim2.new(0.1, 0, 0.4, 0)

    toggle.button.Name = "Button"
    toggle.button.Parent = toggle.switch
    toggle.button.BackgroundColor3 = toggle.value and self.theme.Accent or Color3.fromRGB(40, 40, 40)
    toggle.button.BorderSizePixel = 0
    toggle.button.Position = UDim2.new(0.02, 0, 0.1, 0)
    toggle.button.Size = UDim2.new(0.4, 0, 0.8, 0)

    toggle.interact.Name = "Interact"
    toggle.interact.Parent = toggle.switch
    toggle.interact.BackgroundTransparency = 1
    toggle.interact.Size = UDim2.new(1, 0, 1, 0)
    toggle.interact.Font = Enum.Font.SourceSans
    toggle.interact.Text = ""
    toggle.interact.TextColor3 = Color3.new(0, 0, 0)
    toggle.interact.TextSize = 14

    local function updateToggle()
        toggle.value = not toggle.value
        TweenService:Create(
            toggle.button,
            TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {
                BackgroundColor3 = toggle.value and self.theme.Accent or Color3.fromRGB(40, 40, 40),
                Position = toggle.value and UDim2.new(0.58, 0, 0.1, 0) or UDim2.new(0.02, 0, 0.1, 0)
            }
        ):Play()
        if callback then
            callback(toggle.value)
        end
    end

    toggle.interact.MouseButton1Click:Connect(updateToggle)

    return toggle
end

function EyeUI:CreateSlider(parent, text, minValue, maxValue, defaultValue, callback)
    local slider = {}
    slider.frame = Instance.new("Frame")
    slider.label = Instance.new("TextLabel")
    slider.track = Instance.new("Frame")
    slider.fill = Instance.new("Frame")
    slider.handle = Instance.new("TextButton")
    slider.valueText = Instance.new("TextLabel")

    slider.value = defaultValue or minValue
    slider.min = minValue or 0
    slider.max = maxValue or 100

    slider.frame.Name = "Slider"
    slider.frame.Parent = parent
    slider.frame.BackgroundColor3 = self.theme.Background
    slider.frame.BorderSizePixel = 0
    slider.frame.Size = UDim2.new(0.95, 0, 0, 50)

    slider.label.Name = "Label"
    slider.label.Parent = slider.frame
    slider.label.BackgroundTransparency = 1
    slider.label.Position = UDim2.new(0.04, 0, 0.1, 0)
    slider.label.Size = UDim2.new(0.6, 0, 0.3, 0)
    slider.label.Font = Enum.Font.Code
    slider.label.Text = text
    slider.label.TextColor3 = self.theme.Text
    slider.label.TextSize = 14
    slider.label.TextXAlignment = Enum.TextXAlignment.Left

    slider.track.Name = "Track"
    slider.track.Parent = slider.frame
    slider.track.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    slider.track.BorderSizePixel = 0
    slider.track.Position = UDim2.new(0.04, 0, 0.6, 0)
    slider.track.Size = UDim2.new(0.9, 0, 0.1, 0)

    slider.fill.Name = "Fill"
    slider.fill.Parent = slider.track
    slider.fill.BackgroundColor3 = self.theme.Accent
    slider.fill.BorderSizePixel = 0
    slider.fill.Size = UDim2.new((slider.value - slider.min) / (slider.max - slider.min), 0, 1, 0)

    slider.handle.Name = "Handle"
    slider.handle.Parent = slider.track
    slider.handle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    slider.handle.BorderSizePixel = 0
    slider.handle.Size = UDim2.new(0.05, 0, 2, 0)
    slider.handle.Position = UDim2.new(slider.fill.Size.X.Scale, 0, -0.5, 0)
    slider.handle.Text = ""

    slider.valueText.Name = "ValueText"
    slider.valueText.Parent = slider.frame
    slider.valueText.BackgroundTransparency = 1
    slider.valueText.Position = UDim2.new(0.8, 0, 0.1, 0)
    slider.valueText.Size = UDim2.new(0.15, 0, 0.3, 0)
    slider.valueText.Font = Enum.Font.Code
    slider.valueText.Text = tostring(slider.value)
    slider.valueText.TextColor3 = self.theme.Text
    slider.valueText.TextSize = 14
    slider.valueText.TextXAlignment = Enum.TextXAlignment.Right

    local function updateSlider(value)
        value = math.clamp(value, slider.min, slider.max)
        slider.value = value
        slider.fill.Size = UDim2.new((value - slider.min) / (slider.max - slider.min), 0, 1, 0)
        slider.handle.Position = UDim2.new(slider.fill.Size.X.Scale, 0, -0.5, 0)
        slider.valueText.Text = tostring(math.floor(value * 100) / 100)
        if callback then
            callback(value)
        end
    end

    local dragging = false
    local function slide(input)
        local pos = UDim2.new(
            (input.Position.X - slider.track.AbsolutePosition.X) / slider.track.AbsoluteSize.X,
            0, -0.5, 0
        )
        local value = slider.min + (pos.X.Scale * (slider.max - slider.min))
        updateSlider(value)
    end

    slider.handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)

    slider.handle.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    slider.track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            slide(input)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            slide(input)
        end
    end)

    updateSlider(defaultValue or minValue)

    return slider
end

return EyeUI
