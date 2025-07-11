-- Eye UI Library v2.0
-- By: [Your Name]

local EyeUI = {}
EyeUI.__index = EyeUI

-- Colors
EyeUI.Colors = {
    Primary = Color3.fromRGB(70, 130, 180),
    Background = Color3.fromRGB(20, 20, 20),
    Secondary = Color3.fromRGB(26, 26, 26),
    Text = Color3.fromRGB(230, 230, 230),
    SubText = Color3.fromRGB(150, 150, 150),
    ToggleOn = Color3.fromRGB(0, 115, 255),
    ToggleOff = Color3.fromRGB(113, 113, 113)
}

-- Create main window
function EyeUI.new(title, description)
    local self = setmetatable({}, EyeUI)
    
    -- Main UI
    self.ScreenGui = Instance.new("ScreenGui")
    self.ScreenGui.Name = "EyeUI"
    self.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    self.ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    
    -- Main Window
    self.MainFrame = Instance.new("Frame")
    self.MainFrame.Name = "Menu"
    self.MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    self.MainFrame.BackgroundColor3 = EyeUI.Colors.Background
    self.MainFrame.BorderSizePixel = 0
    self.MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    self.MainFrame.Size = UDim2.new(0, 580, 0, 390)
    self.MainFrame.Parent = self.ScreenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.05, 0)
    corner.Parent = self.MainFrame
    
    -- Top Bar
    self.TopBar = Instance.new("Frame")
    self.TopBar.Name = "Topbar"
    self.TopBar.BackgroundTransparency = 1
    self.TopBar.Size = UDim2.new(1, 0, 0, 50)
    self.TopBar.Parent = self.MainFrame
    
    -- Title
    self.TitleLabel = Instance.new("TextLabel")
    self.TitleLabel.Name = "Title"
    self.TitleLabel.Text = title or "Eye UI"
    self.TitleLabel.Font = Enum.Font.GothamBold
    self.TitleLabel.TextColor3 = EyeUI.Colors.Text
    self.TitleLabel.TextSize = 14
    self.TitleLabel.BackgroundTransparency = 1
    self.TitleLabel.Position = UDim2.new(0.09, 0, 0, 0)
    self.TitleLabel.Size = UDim2.new(0, 266, 0, 38)
    self.TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    self.TitleLabel.Parent = self.TopBar
    
    -- Description
    self.DescLabel = Instance.new("TextLabel")
    self.DescLabel.Name = "Description"
    self.DescLabel.Text = description or "UI Library"
    self.DescLabel.Font = Enum.Font.GothamBold
    self.DescLabel.TextColor3 = Color3.fromRGB(176, 176, 176)
    self.DescLabel.TextSize = 12
    self.DescLabel.BackgroundTransparency = 1
    self.DescLabel.Position = UDim2.new(0.09, 0, 0.27, 0)
    self.DescLabel.Size = UDim2.new(0, 266, 0, 38)
    self.DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    self.DescLabel.Parent = self.TopBar
    
    -- Icon
    self.Icon = Instance.new("ImageLabel")
    self.Icon.Name = "Image"
    self.Icon.Image = "rbxassetid://10709770005"
    self.Icon.BackgroundTransparency = 1
    self.Icon.Position = UDim2.new(0.03, 0, 0.19, 0)
    self.Icon.Size = UDim2.new(0, 25, 0, 26)
    self.Icon.Parent = self.TopBar
    
    -- Close Button
    self.CloseButton = Instance.new("TextButton")
    self.CloseButton.Name = "Close"
    self.CloseButton.BackgroundTransparency = 1
    self.CloseButton.Position = UDim2.new(0.94, 0, 0, 0)
    self.CloseButton.Size = UDim2.new(0, 35, 0, 37)
    self.CloseButton.Text = ""
    
    local closeIcon = Instance.new("ImageLabel")
    closeIcon.Image = "rbxassetid://10747384394"
    closeIcon.BackgroundTransparency = 1
    closeIcon.Position = UDim2.new(0.06, 0, 0.28, 0)
    closeIcon.Size = UDim2.new(0, 22, 0, 22)
    closeIcon.Parent = self.CloseButton
    
    self.CloseButton.Parent = self.TopBar
    
    -- Minimize Button
    self.MinimizeButton = Instance.new("TextButton")
    self.MinimizeButton.Name = "Minimize"
    self.MinimizeButton.BackgroundTransparency = 1
    self.MinimizeButton.Position = UDim2.new(0.88, 0, 0, 0)
    self.MinimizeButton.Size = UDim2.new(0, 35, 0, 37)
    self.MinimizeButton.Text = ""
    
    local minimizeIcon = Instance.new("ImageLabel")
    minimizeIcon.Image = "rbxassetid://10734896206"
    minimizeIcon.BackgroundTransparency = 1
    minimizeIcon.Position = UDim2.new(0.29, 0, 0.25, 0)
    minimizeIcon.Size = UDim2.new(0, 22, 0, 22)
    minimizeIcon.Parent = self.MinimizeButton
    
    self.MinimizeButton.Parent = self.TopBar
    
    -- Tabs Container
    self.TabsContainer = Instance.new("Frame")
    self.TabsContainer.Name = "Tabs"
    self.TabsContainer.BackgroundTransparency = 1
    self.TabsContainer.Position = UDim2.new(0, 0, 0.115, 0)
    self.TabsContainer.Size = UDim2.new(0, 127, 0, 344)
    self.TabsContainer.Parent = self.MainFrame
    
    local tabsLayout = Instance.new("UIListLayout")
    tabsLayout.Parent = self.TabsContainer
    
    -- Content Area
    self.ContentFrame = Instance.new("ScrollingFrame")
    self.ContentFrame.Name = "Content"
    self.ContentFrame.BackgroundTransparency = 1
    self.ContentFrame.Position = UDim2.new(0.232, 0, 0.131, 0)
    self.ContentFrame.Size = UDim2.new(0, 444, 0, 338)
    self.ContentFrame.ScrollBarThickness = 7
    self.ContentFrame.Parent = self.MainFrame
    
    local contentPadding = Instance.new("UIPadding")
    contentPadding.PaddingBottom = UDim.new(0, 10)
    contentPadding.PaddingLeft = UDim.new(0, 15)
    contentPadding.PaddingRight = UDim.new(0, 15)
    contentPadding.PaddingTop = UDim.new(0, 10)
    contentPadding.Parent = self.ContentFrame
    
    local contentLayout = Instance.new("UIListLayout")
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.Padding = UDim.new(0, 7)
    contentLayout.Parent = self.ContentFrame
    
    -- Notifications
    self.Notifications = Instance.new("Frame")
    self.Notifications.Name = "Notifications"
    self.Notifications.AnchorPoint = Vector2.new(1, 1)
    self.Notifications.BackgroundTransparency = 1
    self.Notifications.Position = UDim2.new(1, -20, 1, -20)
    self.Notifications.Size = UDim2.new(0, 300, 0, 800)
    self.Notifications.Parent = self.ScreenGui
    
    local notifLayout = Instance.new("UIListLayout")
    notifLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    notifLayout.SortOrder = Enum.SortOrder.LayoutOrder
    notifLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    notifLayout.Padding = UDim.new(0, 8)
    notifLayout.Parent = self.Notifications
    
    -- Dragging functionality
    local dragFrame = Instance.new("Frame")
    dragFrame.Name = "Drag"
    dragFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    dragFrame.BackgroundTransparency = 1
    dragFrame.Size = UDim2.new(0, 150, 0, 20)
    dragFrame.Parent = self.ScreenGui
    
    local dragButton = Instance.new("TextButton")
    dragButton.Name = "Interact"
    dragButton.BackgroundTransparency = 1
    dragButton.Size = UDim2.new(1.23, 0, 1, 0)
    dragButton.Text = ""
    dragButton.TextTransparency = 1
    dragButton.Parent = dragFrame
    
    -- Connect events
    self.CloseButton.MouseButton1Click:Connect(function()
        self:Destroy()
    end)
    
    self.MinimizeButton.MouseButton1Click:Connect(function()
        self:toggleMinimize()
    end)
    
    -- Dragging
    local UserInputService = game:GetService("UserInputService")
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        self.MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    dragButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = self.MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    dragButton.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
    
    return self
end

-- Toggle minimize state
function EyeUI:toggleMinimize()
    if self.minimized then
        -- Restore
        self.ContentFrame.Visible = true
        self.TabsContainer.Visible = true
        self.MainFrame.Size = UDim2.new(0, 580, 0, 390)
        self.minimized = false
    else
        -- Minimize
        self.ContentFrame.Visible = false
        self.TabsContainer.Visible = false
        self.MainFrame.Size = UDim2.new(0, 580, 0, 50)
        self.minimized = true
    end
end

-- Add a new tab
function EyeUI:AddTab(name, icon)
    local tab = Instance.new("Frame")
    tab.Name = name
    tab.BackgroundTransparency = 1
    tab.Size = UDim2.new(0, 127, 0, 48)
    
    local iconLabel = Instance.new("ImageLabel")
    iconLabel.Name = "Icon"
    iconLabel.Image = icon or "rbxassetid://10734966248"
    iconLabel.BackgroundTransparency = 1
    iconLabel.Position = UDim2.new(0.144, 0, 0.222, 0)
    iconLabel.Size = UDim2.new(0, 25, 0, 25)
    iconLabel.Parent = tab
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "Label"
    textLabel.Text = name
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextColor3 = EyeUI.Colors.SubText
    textLabel.TextSize = 14
    textLabel.BackgroundTransparency = 1
    textLabel.Position = UDim2.new(0.413, 0, 0.042, 0)
    textLabel.Size = UDim2.new(0, 82, 0, 44)
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.Parent = tab
    
    local tabButton = Instance.new("TextButton")
    tabButton.Name = "Interact"
    tabButton.BackgroundTransparency = 1
    tabButton.Size = UDim2.new(1, 0, 1, 0)
    tabButton.Text = ""
    tabButton.Parent = tab
    
    -- Create corresponding content frame
    local content = Instance.new("Frame")
    content.Name = name
    content.BackgroundTransparency = 1
    content.Size = UDim2.new(1, 0, 1, 0)
    content.Visible = false
    content.Parent = self.ContentFrame
    
    local contentLayout = Instance.new("UIListLayout")
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.Padding = UDim.new(0, 7)
    contentLayout.Parent = content
    
    -- Make first tab active by default
    if not self.currentTab then
        self.currentTab = name
        textLabel.TextColor3 = EyeUI.Colors.Text
        iconLabel.ImageColor3 = EyeUI.Colors.Text
        content.Visible = true
    end
    
    -- Tab switching
    tabButton.MouseButton1Click:Connect(function()
        if self.currentTab == name then return end
        
        -- Update previous tab appearance
        local prevTab = self.TabsContainer:FindFirstChild(self.currentTab)
        if prevTab then
            prevTab.Label.TextColor3 = EyeUI.Colors.SubText
            prevTab.Icon.ImageColor3 = EyeUI.Colors.SubText
        end
        
        -- Hide previous content
        local prevContent = self.ContentFrame:FindFirstChild(self.currentTab)
        if prevContent then
            prevContent.Visible = false
        end
        
        -- Update current tab
        self.currentTab = name
        textLabel.TextColor3 = EyeUI.Colors.Text
        iconLabel.ImageColor3 = EyeUI.Colors.Text
        content.Visible = true
    end)
    
    tab.Parent = self.TabsContainer
    
    return {
        Frame = content,
        TabButton = tab
    }
end

-- Add a section to a tab
function EyeUI:AddSection(tab, title)
    local section = Instance.new("TextLabel")
    section.Name = "Section"
    section.Text = title
    section.Font = Enum.Font.GothamBold
    section.TextColor3 = EyeUI.Colors.Text
    section.TextSize = 14
    section.BackgroundTransparency = 1
    section.Size = UDim2.new(1, 0, 0, 25)
    section.TextXAlignment = Enum.TextXAlignment.Left
    section.Parent = tab
    
    return section
end

-- Add a toggle button
function EyeUI:AddToggle(tab, title, description, default)
    local toggle = Instance.new("Frame")
    toggle.Name = "Toggle"
    toggle.BackgroundColor3 = EyeUI.Colors.Secondary
    toggle.Size = UDim2.new(1, 0, 0, 53)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.2, 0)
    corner.Parent = toggle
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Text = title
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextColor3 = EyeUI.Colors.Text
    titleLabel.TextSize = 14
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0.049, 0, 0.057, 0)
    titleLabel.Size = UDim2.new(0, 200, 0, 30)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = toggle
    
    local descLabel = Instance.new("TextLabel")
    descLabel.Name = "Description"
    descLabel.Text = description or ""
    descLabel.Font = Enum.Font.GothamBold
    descLabel.TextColor3 = EyeUI.Colors.SubText
    descLabel.TextSize = 14
    descLabel.BackgroundTransparency = 1
    descLabel.Position = UDim2.new(0.046, 0, 0.302, 0)
    descLabel.Size = UDim2.new(0, 200, 0, 30)
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.Parent = toggle
    
    local toggleButton = Instance.new("ImageButton")
    toggleButton.Name = "ButtonBG"
    toggleButton.BackgroundColor3 = EyeUI.Colors.ToggleOff
    toggleButton.Position = UDim2.new(1.052, -79, 0.893, -33)
    toggleButton.Size = UDim2.new(0, 43, 0, 26)
    toggleButton.AutoButtonColor = false
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1, 0)
    toggleCorner.Parent = toggleButton
    
    local toggleCircle = Instance.new("Frame")
    toggleCircle.Name = "Circle"
    toggleCircle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    toggleCircle.Position = UDim2.new(0.044, 0, 0.06, 0)
    toggleCircle.Size = UDim2.new(0, 18, 0, 18)
    
    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(1, 0)
    circleCorner.Parent = toggleCircle
    
    toggleCircle.Parent = toggleButton
    toggleButton.Parent = toggle
    
    local interactButton = Instance.new("TextButton")
    interactButton.Name = "Interact"
    interactButton.BackgroundTransparency = 1
    interactButton.Size = UDim2.new(1, 0, 1, 0)
    interactButton.Text = ""
    interactButton.Parent = toggle
    
    -- State management
    local state = Instance.new("BoolValue")
    state.Name = "State"
    state.Value = default or false
    state.Parent = toggle
    
    -- Animation config
    local config = {
        DisabledPos = UDim2.new(0.044, 0, 0.06, 0),
        EnabledPos = UDim2.new(0.585, 0, 0.104, 0),
        EnabledBGCol = EyeUI.Colors.ToggleOn,
        DisabledBGCol = EyeUI.Colors.ToggleOff
    }
    
    local function updateState(value)
        state.Value = value
        if value then
            game:GetService("TweenService"):Create(toggleCircle, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = config.EnabledPos}):Play()
            game:GetService("TweenService"):Create(toggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = config.EnabledBGCol}):Play()
        else
            game:GetService("TweenService"):Create(toggleCircle, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = config.DisabledPos}):Play()
            game:GetService("TweenService"):Create(toggleButton, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = config.DisabledBGCol}):Play()
        end
    end
    
    -- Initialize state
    updateState(state.Value)
    
    -- Connect events
    toggleButton.MouseButton1Click:Connect(function()
        updateState(not state.Value)
    end)
    
    interactButton.MouseButton1Click:Connect(function()
        updateState(not state.Value)
    end)
    
    toggle.Parent = tab
    
    return {
        Frame = toggle,
        State = state
    }
end

-- Add a button
function EyeUI:AddButton(tab, title, description, callback)
    local button = Instance.new("Frame")
    button.Name = "Button"
    button.BackgroundColor3 = EyeUI.Colors.Secondary
    button.Size = UDim2.new(1, 0, 0, 53)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.2, 0)
    corner.Parent = button
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Text = title
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextColor3 = EyeUI.Colors.Text
    titleLabel.TextSize = 14
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0.049, 0, 0.057, 0)
    titleLabel.Size = UDim2.new(0, 200, 0, 30)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = button
    
    local descLabel = Instance.new("TextLabel")
    descLabel.Name = "Description"
    descLabel.Text = description or ""
    descLabel.Font = Enum.Font.GothamBold
    descLabel.TextColor3 = EyeUI.Colors.SubText
    descLabel.TextSize = 14
    descLabel.BackgroundTransparency = 1
    descLabel.Position = UDim2.new(0.046, 0, 0.302, 0)
    descLabel.Size = UDim2.new(0, 200, 0, 30)
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.Parent = button
    
    local icon = Instance.new("ImageLabel")
    icon.Name = "Icon"
    icon.Image = "rbxassetid://10734898355"
    icon.BackgroundTransparency = 1
    icon.Position = UDim2.new(0.922, 0, 0.309, 0)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Parent = button
    
    local interactButton = Instance.new("TextButton")
    interactButton.Name = "Interact"
    interactButton.BackgroundTransparency = 1
    interactButton.Size = UDim2.new(1, 0, 1, 0)
    interactButton.Text = ""
    interactButton.Parent = button
    
    -- Connect callback
    if callback then
        interactButton.MouseButton1Click:Connect(callback)
    end
    
    button.Parent = tab
    
    return {
        Frame = button,
        Button = interactButton
    }
end

-- Add a slider
function EyeUI:AddSlider(tab, title, min, max, default, callback)
    local slider = Instance.new("Frame")
    slider.Name = "Slider"
    slider.BackgroundColor3 = EyeUI.Colors.Secondary
    slider.Size = UDim2.new(1, 0, 0, 44)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.2, 0)
    corner.Parent = slider
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Text = title
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextColor3 = EyeUI.Colors.Text
    titleLabel.TextSize = 14
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0.049, 0, 0.17, 0)
    titleLabel.Size = UDim2.new(0, 200, 0, 30)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = slider
    
    local sliderBar = Instance.new("Frame")
    sliderBar.Name = "SliderBar"
    sliderBar.AnchorPoint = Vector2.new(0.5, 0.5)
    sliderBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    sliderBar.Position = UDim2.new(0.758, 0, 0.497, 0)
    sliderBar.Size = UDim2.new(0, 177, 0, 11)
    
    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(0.4, 0)
    barCorner.Parent = sliderBar
    
    local sliderFill = Instance.new("Frame")
    sliderFill.Name = "SliderFill"
    sliderFill.BackgroundColor3 = EyeUI.Colors.Primary
    sliderFill.Size = UDim2.new(0, 87, 0, 11)
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0.4, 0)
    fillCorner.Parent = sliderFill
    
    sliderFill.Parent = sliderBar
    sliderBar.Parent = slider
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Name = "Value"
    valueLabel.Text = tostring(default or min)
    valueLabel.Font = Enum.Font.GothamBold
    valueLabel.TextColor3 = EyeUI.Colors.Text
    valueLabel.TextSize = 14
    valueLabel.BackgroundTransparency = 1
    valueLabel.Position = UDim2.new(0.758, 0, 0.17, 0)
    valueLabel.Size = UDim2.new(0, 50, 0, 30)
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.Parent = slider
    
    -- State management
    local dragging = false
    local currentValue = default or min
    
    local function updateValue(value)
        currentValue = math.clamp(value, min, max)
        local ratio = (currentValue - min) / (max - min)
        sliderFill.Size = UDim2.new(ratio, 0, 0, 11)
        valueLabel.Text = tostring(math.floor(currentValue))
        
        if callback then
            callback(currentValue)
        end
    end
    
    -- Initialize
    updateValue(currentValue)
    
    -- Connect events
    sliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            local xOffset = input.Position.X - sliderBar.AbsolutePosition.X
            local ratio = xOffset / sliderBar.AbsoluteSize.X
            updateValue(min + (max - min) * ratio)
        end
    end)
    
    sliderBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local xOffset = input.Position.X - sliderBar.AbsolutePosition.X
            local ratio = math.clamp(xOffset / sliderBar.AbsoluteSize.X, 0, 1)
            updateValue(min + (max - min) * ratio)
        end
    end)
    
    slider.Parent = tab
    
    return {
        Frame = slider,
        GetValue = function() return currentValue end,
        SetValue = updateValue
    }
end

-- Add a text input
function EyeUI:AddInput(tab, title, description, placeholder, callback)
    local input = Instance.new("Frame")
    input.Name = "Input"
    input.BackgroundColor3 = EyeUI.Colors.Secondary
    input.Size = UDim2.new(1, 0, 0, 53)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.2, 0)
    corner.Parent = input
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Text = title
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextColor3 = EyeUI.Colors.Text
    titleLabel.TextSize = 14
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0.049, 0, 0.057, 0)
    titleLabel.Size = UDim2.new(0, 200, 0, 30)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = input
    
    local descLabel = Instance.new("TextLabel")
    descLabel.Name = "Description"
    descLabel.Text = description or ""
    descLabel.Font = Enum.Font.GothamBold
    descLabel.TextColor3 = EyeUI.Colors.SubText
    descLabel.TextSize = 14
    descLabel.BackgroundTransparency = 1
    descLabel.Position = UDim2.new(0.046, 0, 0.302, 0)
    descLabel.Size = UDim2.new(0, 200, 0, 30)
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.Parent = input
    
    local textBox = Instance.new("TextBox")
    textBox.Name = "TextBox"
    textBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    textBox.Position = UDim2.new(0.673, 0, 0.17, 0)
    textBox.Size = UDim2.new(0, 122, 0, 34)
    textBox.Font = Enum.Font.GothamBold
    textBox.PlaceholderText = placeholder or "Enter value"
    textBox.Text = ""
    textBox.TextColor3 = EyeUI.Colors.Text
    textBox.TextSize = 14
    
    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0.2, 0)
    boxCorner.Parent = textBox
    
    textBox.Parent = input
    
    -- Connect callback
    if callback then
        textBox.FocusLost:Connect(function()
            callback(textBox.Text)
        end)
    end
    
    input.Parent = tab
    
    return {
        Frame = input,
        TextBox = textBox,
        GetText = function() return textBox.Text end,
        SetText = function(text) textBox.Text = text end
    }
end

-- Add a checkbox
function EyeUI:AddCheckbox(tab, title, description, default)
    local checkbox = Instance.new("Frame")
    checkbox.Name = "Checkbox"
    checkbox.BackgroundColor3 = EyeUI.Colors.Secondary
    checkbox.Size = UDim2.new(1, 0, 0, 53)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.2, 0)
    corner.Parent = checkbox
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Text = title
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextColor3 = EyeUI.Colors.Text
    titleLabel.TextSize = 14
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0.049, 0, 0.057, 0)
    titleLabel.Size = UDim2.new(0, 200, 0, 30)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = checkbox
    
    local descLabel = Instance.new("TextLabel")
    descLabel.Name = "Description"
    descLabel.Text = description or ""
    descLabel.Font = Enum.Font.GothamBold
    descLabel.TextColor3 = EyeUI.Colors.SubText
    descLabel.TextSize = 14
    descLabel.BackgroundTransparency = 1
    descLabel.Position = UDim2.new(0.046, 0, 0.302, 0)
    descLabel.Size = UDim2.new(0, 200, 0, 30)
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.Parent = checkbox
    
    local checkButton = Instance.new("ImageButton")
    checkButton.Name = "Checkbox"
    checkButton.BackgroundTransparency = 1
    checkButton.Position = UDim2.new(0.909, 0, 0.207, 0)
    checkButton.Size = UDim2.new(0.073, 0, 0.585, 0)
    checkButton.Image = "rbxassetid://4458801905"
    checkButton.ImageColor3 = EyeUI.Colors.Text
    checkButton.SliceScale = 0
    checkButton.Parent = checkbox
    
    local interactButton = Instance.new("TextButton")
    interactButton.Name = "Interact"
    interactButton.BackgroundTransparency = 1
    interactButton.Size = UDim2.new(1, 0, 1, 0)
    interactButton.Text = ""
    interactButton.Parent = checkbox
    
    -- State management
    local state = Instance.new("BoolValue")
    state.Name = "State"
    state.Value = default or false
    state.Parent = checkbox
    
    local states = {
        Unchecked = "rbxassetid://4458801905",
        Checked = "rbxassetid://4458804262"
    }
    
    local function updateState(value)
        state.Value = value
        if value then
            checkButton.Image = states.Checked
        else
            checkButton.Image = states.Unchecked
        end
    end
    
    -- Initialize state
    updateState(state.Value)
    
    -- Connect events
    checkButton.MouseButton1Click:Connect(function()
        updateState(not state.Value)
    end)
    
    interactButton.MouseButton1Click:Connect(function()
        updateState(not state.Value)
    end)
    
    checkbox.Parent = tab
    
    return {
        Frame = checkbox,
        State = state
    }
end

-- Show a notification
function EyeUI:Notify(title, message, duration, icon)
    duration = duration or 5
    icon = icon or "rbxassetid://77891951053543"
    
    local notification = Instance.new("Frame")
    notification.Name = "Notification"
    notification.BackgroundColor3 = EyeUI.Colors.Background
    notification.Size = UDim2.new(1, 0, 0, 80)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 20)
    corner.Parent = notification
    
    local notifIcon = Instance.new("ImageLabel")
    notifIcon.Name = "Icon"
    notifIcon.AnchorPoint = Vector2.new(0, 0.5)
    notifIcon.BackgroundTransparency = 1
    notifIcon.Position = UDim2.new(0, 25, 0.5, 0)
    notifIcon.Size = UDim2.new(0, 24, 0, 24)
    notifIcon.Image = icon
    notifIcon.Parent = notification
    
    local interactButton = Instance.new("TextButton")
    interactButton.Name = "Interact"
    interactButton.AnchorPoint = Vector2.new(0.5, 0.5)
    interactButton.BackgroundTransparency = 1
    interactButton.Size = UDim2.new(1, 0, 1, 0)
    interactButton.Text = ""
    interactButton.Parent = notification
    
    local descLabel = Instance.new("TextLabel")
    descLabel.Name = "Description"
    descLabel.Text = message
    descLabel.Font = Enum.Font.Gotham
    descLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    descLabel.TextSize = 15
    descLabel.TextTransparency = 0.35
    descLabel.BackgroundTransparency = 1
    descLabel.Position = UDim2.new(0, 70, 0, 32)
    descLabel.Size = UDim2.new(1, -80, 1, -40)
    descLabel.TextWrapped = true
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.TextYAlignment = Enum.TextYAlignment.Top
    descLabel.Parent = notification
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Text = title
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 16
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0, 70, 0, 15)
    titleLabel.Size = UDim2.new(1, -80, 0, 16)
    titleLabel.TextWrapped = true
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = notification
    
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.BackgroundTransparency = 1
    shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    shadow.Size = UDim2.new(1.11, 0, 1.922, 0)
    shadow.Image = "rbxassetid://3523728077"
    shadow.ImageColor3 = Color3.fromRGB(33, 33, 33)
    shadow.ImageTransparency = 0.82
    shadow.ZIndex = 0
    shadow.Parent = notification
    
    notification.Parent = self.Notifications
    
    -- Auto-remove after duration
    task.delay(duration, function()
        notification:Destroy()
    end)
    
    -- Click to dismiss
    interactButton.MouseButton1Click:Connect(function()
        notification:Destroy()
    end)
    
    return notification
end

-- Destroy the UI
function EyeUI:Destroy()
    self.ScreenGui:Destroy()
end

return EyeUI
