-- EyeUI Library v4.0 - Smooth & Animated
-- Modern UI Library for Roblox

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local EyeUI = {}
EyeUI.__index = EyeUI

-- Animation presets
local Animations = {
    fadeIn = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    fadeOut = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
    slideIn = TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    slideOut = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
    bounce = TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out),
    smooth = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    hover = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    click = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
}

-- Utility functions
local function CreateCorner(parent, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius or 8)
    corner.Parent = parent
    return corner
end

local function CreateGradient(parent, colors, rotation)
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new(colors)
    gradient.Rotation = rotation or 0
    gradient.Parent = parent
    return gradient
end

local function CreateStroke(parent, thickness, color, transparency)
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = thickness or 1
    stroke.Color = color or Color3.fromRGB(60, 60, 60)
    stroke.Transparency = transparency or 0.5
    stroke.Parent = parent
    return stroke
end

local function CreateShadow(parent, size, transparency)
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.Parent = parent
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.BackgroundTransparency = 1
    shadow.Position = UDim2.new(0.5, 0, 0.5, 2)
    shadow.Size = UDim2.new(1, size or 20, 1, size or 20)
    shadow.ZIndex = parent.ZIndex - 1
    shadow.Image = "rbxassetid://3523728077"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = transparency or 0.8
    return shadow
end

local function AnimateHover(element, hoverColor, normalColor, scale)
    local normalSize = element.Size
    local hoverSize = UDim2.new(normalSize.X.Scale * (scale or 1.05), normalSize.X.Offset, 
                               normalSize.Y.Scale * (scale or 1.05), normalSize.Y.Offset)
    
    element.MouseEnter:Connect(function()
        TweenService:Create(element, Animations.hover, {
            BackgroundColor3 = hoverColor or Color3.fromRGB(35, 35, 35),
            Size = hoverSize
        }):Play()
    end)
    
    element.MouseLeave:Connect(function()
        TweenService:Create(element, Animations.hover, {
            BackgroundColor3 = normalColor or Color3.fromRGB(25, 25, 25),
            Size = normalSize
        }):Play()
    end)
end

local function AnimateClick(element, callback)
    element.MouseButton1Down:Connect(function()
        local originalSize = element.Size
        TweenService:Create(element, Animations.click, {
            Size = UDim2.new(originalSize.X.Scale * 0.95, originalSize.X.Offset, 
                           originalSize.Y.Scale * 0.95, originalSize.Y.Offset)
        }):Play()
    end)
    
    element.MouseButton1Up:Connect(function()
        local originalSize = element.Size
        TweenService:Create(element, Animations.click, {
            Size = UDim2.new(originalSize.X.Scale / 0.95, originalSize.X.Offset, 
                           originalSize.Y.Scale / 0.95, originalSize.Y.Offset)
        }):Play()
        
        if callback then
            callback()
        end
    end)
end

-- Main Library
function EyeUI:CreateWindow(config)
    local window = {}
    
    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "EyeUI"
    screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Main Frame
    local main = Instance.new("Frame")
    main.Name = "Main"
    main.Parent = screenGui
    main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    main.BorderSizePixel = 0
    main.Position = UDim2.new(0.5, -300, 0.5, -200)
    main.Size = UDim2.new(0, 600, 0, 400)
    main.ClipsDescendants = true
    
    CreateCorner(main, 12)
    CreateShadow(main, 30, 0.7)
    CreateStroke(main, 1, Color3.fromRGB(40, 40, 40), 0.3)
    
    -- Animated background gradient
    local bgGradient = CreateGradient(main, {
        Color3.fromRGB(20, 20, 20),
        Color3.fromRGB(10, 10, 10)
    }, 45)
    
    -- Topbar
    local topbar = Instance.new("Frame")
    topbar.Name = "Topbar"
    topbar.Parent = main
    topbar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    topbar.BorderSizePixel = 0
    topbar.Size = UDim2.new(1, 0, 0, 60)
    
    CreateCorner(topbar, 12)
    CreateGradient(topbar, {
        Color3.fromRGB(25, 25, 25),
        Color3.fromRGB(15, 15, 15)
    }, 90)
    
    -- Title and Icon
    local icon = Instance.new("ImageLabel")
    icon.Parent = topbar
    icon.BackgroundTransparency = 1
    icon.Position = UDim2.new(0, 20, 0.5, -12)
    icon.Size = UDim2.new(0, 24, 0, 24)
    icon.Image = "rbxassetid://10709770005"
    icon.ImageColor3 = Color3.fromRGB(100, 150, 255)
    
    local title = Instance.new("TextLabel")
    title.Parent = topbar
    title.BackgroundTransparency = 1
    title.Position = UDim2.new(0, 55, 0, 12)
    title.Size = UDim2.new(0, 300, 0, 20)
    title.Font = Enum.Font.GothamBold
    title.Text = config.Title or "EyeUI"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 16
    title.TextXAlignment = Enum.TextXAlignment.Left
    
    local subtitle = Instance.new("TextLabel")
    subtitle.Parent = topbar
    subtitle.BackgroundTransparency = 1
    subtitle.Position = UDim2.new(0, 55, 0, 32)
    subtitle.Size = UDim2.new(0, 300, 0, 16)
    subtitle.Font = Enum.Font.Gotham
    subtitle.Text = config.Subtitle or "Modern UI Library"
    subtitle.TextColor3 = Color3.fromRGB(150, 150, 150)
    subtitle.TextSize = 12
    subtitle.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Control buttons
    local closeBtn = Instance.new("TextButton")
    closeBtn.Parent = topbar
    closeBtn.BackgroundColor3 = Color3.fromRGB(255, 95, 95)
    closeBtn.BorderSizePixel = 0
    closeBtn.Position = UDim2.new(1, -45, 0.5, -10)
    closeBtn.Size = UDim2.new(0, 20, 0, 20)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Text = "×"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.TextSize = 14
    
    CreateCorner(closeBtn, 10)
    AnimateHover(closeBtn, Color3.fromRGB(255, 60, 60), Color3.fromRGB(255, 95, 95))
    
    local minimizeBtn = Instance.new("TextButton")
    minimizeBtn.Parent = topbar
    minimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 95)
    minimizeBtn.BorderSizePixel = 0
    minimizeBtn.Position = UDim2.new(1, -70, 0.5, -10)
    minimizeBtn.Size = UDim2.new(0, 20, 0, 20)
    minimizeBtn.Font = Enum.Font.GothamBold
    minimizeBtn.Text = "-"
    minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeBtn.TextSize = 14
    
    CreateCorner(minimizeBtn, 10)
    AnimateHover(minimizeBtn, Color3.fromRGB(255, 180, 60), Color3.fromRGB(255, 200, 95))
    
    -- Sidebar
    local sidebar = Instance.new("Frame")
    sidebar.Name = "Sidebar"
    sidebar.Parent = main
    sidebar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    sidebar.BorderSizePixel = 0
    sidebar.Position = UDim2.new(0, 0, 0, 60)
    sidebar.Size = UDim2.new(0, 180, 1, -60)
    
    CreateStroke(sidebar, 1, Color3.fromRGB(30, 30, 30), 0.5)
    
    local sidebarList = Instance.new("UIListLayout")
    sidebarList.Parent = sidebar
    sidebarList.Padding = UDim.new(0, 5)
    sidebarList.SortOrder = Enum.SortOrder.LayoutOrder
    
    local sidebarPadding = Instance.new("UIPadding")
    sidebarPadding.Parent = sidebar
    sidebarPadding.PaddingTop = UDim.new(0, 10)
    sidebarPadding.PaddingLeft = UDim.new(0, 10)
    sidebarPadding.PaddingRight = UDim.new(0, 10)
    
    -- Content area
    local content = Instance.new("Frame")
    content.Name = "Content"
    content.Parent = main
    content.BackgroundTransparency = 1
    content.Position = UDim2.new(0, 180, 0, 60)
    content.Size = UDim2.new(1, -180, 1, -60)
    
    -- Drag functionality
    local dragFrame = Instance.new("Frame")
    dragFrame.Parent = screenGui
    dragFrame.BackgroundTransparency = 1
    dragFrame.Position = UDim2.new(0.5, -75, 1, -40)
    dragFrame.Size = UDim2.new(0, 150, 0, 25)
    
    local dragVisual = Instance.new("Frame")
    dragVisual.Parent = dragFrame
    dragVisual.AnchorPoint = Vector2.new(0.5, 0.5)
    dragVisual.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    dragVisual.BackgroundTransparency = 0.8
    dragVisual.BorderSizePixel = 0
    dragVisual.Position = UDim2.new(0.5, 0, 0.5, 0)
    dragVisual.Size = UDim2.new(0, 100, 0, 4)
    
    CreateCorner(dragVisual, 2)
    
    -- Minimize/Show functionality
    local isMinimized = false
    local originalSize = main.Size
    local originalPosition = main.Position
    
    local function toggleMinimize()
        if isMinimized then
            -- Show
            TweenService:Create(main, Animations.slideIn, {
                Size = originalSize,
                Position = originalPosition
            }):Play()
            TweenService:Create(main, Animations.fadeIn, {
                BackgroundTransparency = 0
            }):Play()
            isMinimized = false
        else
            -- Minimize
            TweenService:Create(main, Animations.slideOut, {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 1, 0)
            }):Play()
            TweenService:Create(main, Animations.fadeOut, {
                BackgroundTransparency = 1
            }):Play()
            isMinimized = true
        end
    end
    
    -- Button connections
    AnimateClick(closeBtn, function()
        TweenService:Create(main, Animations.fadeOut, {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        wait(0.3)
        screenGui:Destroy()
    end)
    
    AnimateClick(minimizeBtn, toggleMinimize)
    AnimateClick(dragFrame, toggleMinimize)
    
    -- Drag functionality
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = main.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, 
                                     startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    -- Notification system
    local notifications = Instance.new("Frame")
    notifications.Name = "Notifications"
    notifications.Parent = screenGui
    notifications.AnchorPoint = Vector2.new(1, 1)
    notifications.BackgroundTransparency = 1
    notifications.Position = UDim2.new(1, -20, 1, -20)
    notifications.Size = UDim2.new(0, 350, 0, 600)
    
    local notifList = Instance.new("UIListLayout")
    notifList.Parent = notifications
    notifList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    notifList.SortOrder = Enum.SortOrder.LayoutOrder
    notifList.VerticalAlignment = Enum.VerticalAlignment.Bottom
    notifList.Padding = UDim.new(0, 10)
    
    -- Window methods
    window.screenGui = screenGui
    window.main = main
    window.sidebar = sidebar
    window.content = content
    window.currentTab = nil
    window.tabs = {}
    
    function window:CreateTab(config)
        local tab = {}
        
        -- Tab button
        local tabBtn = Instance.new("TextButton")
        tabBtn.Parent = sidebar
        tabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        tabBtn.BorderSizePixel = 0
        tabBtn.Size = UDim2.new(1, 0, 0, 40)
        tabBtn.Font = Enum.Font.Gotham
        tabBtn.Text = "  " .. (config.Title or "Tab")
        tabBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
        tabBtn.TextSize = 14
        tabBtn.TextXAlignment = Enum.TextXAlignment.Left
        
        CreateCorner(tabBtn, 8)
        
        -- Tab icon
        local tabIcon = Instance.new("ImageLabel")
        tabIcon.Parent = tabBtn
        tabIcon.BackgroundTransparency = 1
        tabIcon.Position = UDim2.new(0, 10, 0.5, -8)
        tabIcon.Size = UDim2.new(0, 16, 0, 16)
        tabIcon.Image = config.Icon or "rbxassetid://10723407389"
        tabIcon.ImageColor3 = Color3.fromRGB(100, 150, 255)
        
        -- Tab content
        local tabContent = Instance.new("ScrollingFrame")
        tabContent.Parent = content
        tabContent.BackgroundTransparency = 1
        tabContent.BorderSizePixel = 0
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.ScrollBarThickness = 6
        tabContent.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
        tabContent.Visible = false
        
        local tabList = Instance.new("UIListLayout")
        tabList.Parent = tabContent
        tabList.Padding = UDim.new(0, 15)
        tabList.SortOrder = Enum.SortOrder.LayoutOrder
        
        local tabPadding = Instance.new("UIPadding")
        tabPadding.Parent = tabContent
        tabPadding.PaddingTop = UDim.new(0, 20)
        tabPadding.PaddingLeft = UDim.new(0, 20)
        tabPadding.PaddingRight = UDim.new(0, 20)
        
        -- Tab selection
        local function selectTab()
            -- Deselect all tabs
            for _, t in pairs(window.tabs) do
                t.button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                t.button.TextColor3 = Color3.fromRGB(150, 150, 150)
                t.content.Visible = false
            end
            
            -- Select this tab
            TweenService:Create(tabBtn, Animations.smooth, {
                BackgroundColor3 = Color3.fromRGB(100, 150, 255),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
            
            tabContent.Visible = true
            window.currentTab = tab
        end
        
        AnimateHover(tabBtn, Color3.fromRGB(35, 35, 35), 
                    window.currentTab == tab and Color3.fromRGB(100, 150, 255) or Color3.fromRGB(25, 25, 25))
        AnimateClick(tabBtn, selectTab)
        
        -- Auto-select first tab
        if #window.tabs == 0 then
            selectTab()
        end
        
        tab.button = tabBtn
        tab.content = tabContent
        tab.elements = {}
        
        -- Tab methods
        function tab:CreateButton(config)
            local button = Instance.new("TextButton")
            button.Parent = tabContent
            button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            button.BorderSizePixel = 0
            button.Size = UDim2.new(1, 0, 0, 45)
            button.Font = Enum.Font.Gotham
            button.Text = config.Title or "Button"
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.TextSize = 14
            
            CreateCorner(button, 8)
            CreateShadow(button, 10, 0.9)
            CreateGradient(button, {
                Color3.fromRGB(40, 40, 40),
                Color3.fromRGB(25, 25, 25)
            }, 90)
            
            AnimateHover(button, Color3.fromRGB(45, 45, 45), Color3.fromRGB(30, 30, 30))
            AnimateClick(button, config.Callback)
            
            -- Update canvas size
            tabContent.CanvasSize = UDim2.new(0, 0, 0, tabList.AbsoluteContentSize.Y + 40)
            
            return button
        end
        
        function tab:CreateToggle(config)
            local toggleFrame = Instance.new("Frame")
            toggleFrame.Parent = tabContent
            toggleFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            toggleFrame.BorderSizePixel = 0
            toggleFrame.Size = UDim2.new(1, 0, 0, 45)
            
            CreateCorner(toggleFrame, 8)
            CreateStroke(toggleFrame, 1, Color3.fromRGB(40, 40, 40), 0.5)
            
            local toggleLabel = Instance.new("TextLabel")
            toggleLabel.Parent = toggleFrame
            toggleLabel.BackgroundTransparency = 1
            toggleLabel.Position = UDim2.new(0, 15, 0, 0)
            toggleLabel.Size = UDim2.new(1, -60, 1, 0)
            toggleLabel.Font = Enum.Font.Gotham
            toggleLabel.Text = config.Title or "Toggle"
            toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            toggleLabel.TextSize = 14
            toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local toggleSwitch = Instance.new("Frame")
            toggleSwitch.Parent = toggleFrame
            toggleSwitch.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            toggleSwitch.BorderSizePixel = 0
            toggleSwitch.Position = UDim2.new(1, -45, 0.5, -10)
            toggleSwitch.Size = UDim2.new(0, 40, 0, 20)
            
            CreateCorner(toggleSwitch, 10)
            
            local toggleKnob = Instance.new("Frame")
            toggleKnob.Parent = toggleSwitch
            toggleKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            toggleKnob.BorderSizePixel = 0
            toggleKnob.Position = UDim2.new(0, 2, 0.5, -8)
            toggleKnob.Size = UDim2.new(0, 16, 0, 16)
            
            CreateCorner(toggleKnob, 8)
            
            local enabled = config.Default or false
            
            local function updateToggle()
                if enabled then
                    TweenService:Create(toggleSwitch, Animations.smooth, {
                        BackgroundColor3 = Color3.fromRGB(100, 150, 255)
                    }):Play()
                    TweenService:Create(toggleKnob, Animations.smooth, {
                        Position = UDim2.new(1, -18, 0.5, -8)
                    }):Play()
                else
                    TweenService:Create(toggleSwitch, Animations.smooth, {
                        BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    }):Play()
                    TweenService:Create(toggleKnob, Animations.smooth, {
                        Position = UDim2.new(0, 2, 0.5, -8)
                    }):Play()
                end
                
                if config.Callback then
                    config.Callback(enabled)
                end
            end
            
            local toggleBtn = Instance.new("TextButton")
            toggleBtn.Parent = toggleFrame
            toggleBtn.BackgroundTransparency = 1
            toggleBtn.Size = UDim2.new(1, 0, 1, 0)
            toggleBtn.Text = ""
            
            AnimateClick(toggleBtn, function()
                enabled = not enabled
                updateToggle()
            end)
            
            updateToggle()
            
            -- Update canvas size
            tabContent.CanvasSize = UDim2.new(0, 0, 0, tabList.AbsoluteContentSize.Y + 40)
            
            return {
                SetValue = function(value)
                    enabled = value
                    updateToggle()
                end,
                GetValue = function()
                    return enabled
                end
            }
        end
        
        function tab:CreateSlider(config)
            local sliderFrame = Instance.new("Frame")
            sliderFrame.Parent = tabContent
            sliderFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            sliderFrame.BorderSizePixel = 0
            sliderFrame.Size = UDim2.new(1, 0, 0, 65)
            
            CreateCorner(sliderFrame, 8)
            CreateStroke(sliderFrame, 1, Color3.fromRGB(40, 40, 40), 0.5)
            
            local sliderLabel = Instance.new("TextLabel")
            sliderLabel.Parent = sliderFrame
            sliderLabel.BackgroundTransparency = 1
            sliderLabel.Position = UDim2.new(0, 15, 0, 5)
            sliderLabel.Size = UDim2.new(1, -30, 0, 20)
            sliderLabel.Font = Enum.Font.Gotham
            sliderLabel.Text = config.Title or "Slider"
            sliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            sliderLabel.TextSize = 14
            sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local valueLabel = Instance.new("TextLabel")
            valueLabel.Parent = sliderFrame
            valueLabel.BackgroundTransparency = 1
            valueLabel.Position = UDim2.new(1, -80, 0, 5)
            valueLabel.Size = UDim2.new(0, 65, 0, 20)
            valueLabel.Font = Enum.Font.GothamBold
            valueLabel.Text = tostring(config.Default or config.Min or 0)
            valueLabel.TextColor3 = Color3.fromRGB(100, 150, 255)
            valueLabel.TextSize = 12
            valueLabel.TextXAlignment = Enum.TextXAlignment.Right
            
            local sliderTrack = Instance.new("Frame")
            sliderTrack.Parent = sliderFrame
            sliderTrack.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            sliderTrack.BorderSizePixel = 0
            sliderTrack.Position = UDim2.new(0, 15, 0, 35)
            sliderTrack.Size = UDim2.new(1, -30, 0, 6)
            
            CreateCorner(sliderTrack, 3)
            
            local sliderFill = Instance.new("Frame")
            sliderFill.Parent = sliderTrack
            sliderFill.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
            sliderFill.BorderSizePixel = 0
            sliderFill.Size = UDim2.new(0, 0, 1, 0)
            
            CreateCorner(sliderFill, 3)
            
            local sliderKnob = Instance.new("Frame")
            sliderKnob.Parent = sliderTrack
            sliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sliderKnob.BorderSizePixel = 0
            sliderKnob.AnchorPoint = Vector2.new(0.5, 0.5)
            sliderKnob.Position = UDim2.new(0, 0, 0.5, 0)
            sliderKnob.Size = UDim2.new(0, 16, 0, 16)
            
            CreateCorner(sliderKnob, 8)
            CreateShadow(sliderKnob, 8, 0.8)
            
            local min = config.Min or 0
            local max = config.Max or 100
            local value = config.Default or min
            local dragging = false
            
            local function updateSlider()
                local percent = (value - min) / (max - min)
                sliderFill.Size = UDim2.new(percent, 0, 1, 0)
                sliderKnob.Position = UDim2.new(percent, 0, 0.5, 0)
                valueLabel.Text = tostring(math.floor(value))
                
                if config.Callback then
                    config.Callback(value)
                end
            end
            
            sliderTrack.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local relativePos = math.clamp((input.Position.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X, 0, 1)
                    value = min + (max - min) * relativePos
                    updateSlider()
                end
            end)
            
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
            
            -- Hover effects
            sliderTrack.MouseEnter:Connect(function()
                TweenService:Create(sliderKnob, Animations.hover, {
                    Size = UDim2.new(0, 20, 0, 20)
                }):Play()
            end)
            
            sliderTrack.MouseLeave:Connect(function()
                TweenService:Create(sliderKnob, Animations.hover, {
                    Size = UDim2.new(0, 16, 0, 16)
                }):Play()
            end)
            
            updateSlider()
            
            -- Update canvas size
            tabContent.CanvasSize = UDim2.new(0, 0, 0, tabList.AbsoluteContentSize.Y + 40)
            
            return {
                SetValue = function(newValue)
                    value = math.clamp(newValue, min, max)
                    updateSlider()
                end,
                GetValue = function()
                    return value
                end
            }
        end
        
        function tab:CreateDropdown(config)
            local dropdownFrame = Instance.new("Frame")
            dropdownFrame.Parent = tabContent
            dropdownFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            dropdownFrame.BorderSizePixel = 0
            dropdownFrame.Size = UDim2.new(1, 0, 0, 45)
            dropdownFrame.ClipsDescendants = true
            
            CreateCorner(dropdownFrame, 8)
            CreateStroke(dropdownFrame, 1, Color3.fromRGB(40, 40, 40), 0.5)
            
            local dropdownLabel = Instance.new("TextLabel")
            dropdownLabel.Parent = dropdownFrame
            dropdownLabel.BackgroundTransparency = 1
            dropdownLabel.Position = UDim2.new(0, 15, 0, 0)
            dropdownLabel.Size = UDim2.new(1, -60, 1, 0)
            dropdownLabel.Font = Enum.Font.Gotham
            dropdownLabel.Text = config.Title or "Dropdown"
            dropdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            dropdownLabel.TextSize = 14
            dropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local dropdownArrow = Instance.new("TextLabel")
            dropdownArrow.Parent = dropdownFrame
            dropdownArrow.BackgroundTransparency = 1
            dropdownArrow.Position = UDim2.new(1, -30, 0, 0)
            dropdownArrow.Size = UDim2.new(0, 30, 0, 45)
            dropdownArrow.Font = Enum.Font.GothamBold
            dropdownArrow.Text = "▼"
            dropdownArrow.TextColor3 = Color3.fromRGB(150, 150, 150)
            dropdownArrow.TextSize = 12
            
            local dropdownContent = Instance.new("Frame")
            dropdownContent.Parent = dropdownFrame
            dropdownContent.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            dropdownContent.BorderSizePixel = 0
            dropdownContent.Position = UDim2.new(0, 0, 1, 0)
            dropdownContent.Size = UDim2.new(1, 0, 0, 0)
            
            CreateCorner(dropdownContent, 8)
            
            local dropdownList = Instance.new("UIListLayout")
            dropdownList.Parent = dropdownContent
            dropdownList.SortOrder = Enum.SortOrder.LayoutOrder
            
            local isOpen = false
            local selectedValue = config.Default or (config.Options and config.Options[1]) or "None"
            
            local function updateSelection()
                dropdownLabel.Text = (config.Title or "Dropdown") .. ": " .. selectedValue
                if config.Callback then
                    config.Callback(selectedValue)
                end
            end
            
            local function toggleDropdown()
                isOpen = not isOpen
                
                if isOpen then
                    local contentHeight = #(config.Options or {}) * 35
                    TweenService:Create(dropdownFrame, Animations.smooth, {
                        Size = UDim2.new(1, 0, 0, 45 + contentHeight)
                    }):Play()
                    TweenService:Create(dropdownContent, Animations.smooth, {
                        Size = UDim2.new(1, 0, 0, contentHeight)
                    }):Play()
                    TweenService:Create(dropdownArrow, Animations.smooth, {
                        Rotation = 180
                    }):Play()
                else
                    TweenService:Create(dropdownFrame, Animations.smooth, {
                        Size = UDim2.new(1, 0, 0, 45)
                    }):Play()
                    TweenService:Create(dropdownContent, Animations.smooth, {
                        Size = UDim2.new(1, 0, 0, 0)
                    }):Play()
                    TweenService:Create(dropdownArrow, Animations.smooth, {
                        Rotation = 0
                    }):Play()
                end
                
                -- Update canvas size
                wait(0.3)
                tabContent.CanvasSize = UDim2.new(0, 0, 0, tabList.AbsoluteContentSize.Y + 40)
            end
            
            local dropdownBtn = Instance.new("TextButton")
            dropdownBtn.Parent = dropdownFrame
            dropdownBtn.BackgroundTransparency = 1
            dropdownBtn.Size = UDim2.new(1, 0, 0, 45)
            dropdownBtn.Text = ""
            
            AnimateClick(dropdownBtn, toggleDropdown)
            
            -- Create option buttons
            for i, option in ipairs(config.Options or {}) do
                local optionBtn = Instance.new("TextButton")
                optionBtn.Parent = dropdownContent
                optionBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                optionBtn.BorderSizePixel = 0
                optionBtn.Size = UDim2.new(1, 0, 0, 35)
                optionBtn.Font = Enum.Font.Gotham
                optionBtn.Text = option
                optionBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
                optionBtn.TextSize = 12
                
                AnimateHover(optionBtn, Color3.fromRGB(100, 150, 255), Color3.fromRGB(35, 35, 35))
                AnimateClick(optionBtn, function()
                    selectedValue = option
                    updateSelection()
                    toggleDropdown()
                end)
            end
            
            updateSelection()
            
            -- Update canvas size
            tabContent.CanvasSize = UDim2.new(0, 0, 0, tabList.AbsoluteContentSize.Y + 40)
            
            return {
                SetValue = function(value)
                    selectedValue = value
                    updateSelection()
                end,
                GetValue = function()
                    return selectedValue
                end
            }
        end
        
        function tab:CreateTextbox(config)
            local textboxFrame = Instance.new("Frame")
            textboxFrame.Parent = tabContent
            textboxFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            textboxFrame.BorderSizePixel = 0
            textboxFrame.Size = UDim2.new(1, 0, 0, 45)
            
            CreateCorner(textboxFrame, 8)
            CreateStroke(textboxFrame, 1, Color3.fromRGB(40, 40, 40), 0.5)
            
            local textboxLabel = Instance.new("TextLabel")
            textboxLabel.Parent = textboxFrame
            textboxLabel.BackgroundTransparency = 1
            textboxLabel.Position = UDim2.new(0, 15, 0, 0)
            textboxLabel.Size = UDim2.new(0, 100, 1, 0)
            textboxLabel.Font = Enum.Font.Gotham
            textboxLabel.Text = config.Title or "Textbox"
            textboxLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            textboxLabel.TextSize = 14
            textboxLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local textbox = Instance.new("TextBox")
            textbox.Parent = textboxFrame
            textbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            textbox.BorderSizePixel = 0
            textbox.Position = UDim2.new(0, 120, 0.5, -12)
            textbox.Size = UDim2.new(1, -135, 0, 24)
            textbox.Font = Enum.Font.Gotham
            textbox.PlaceholderText = config.PlaceholderText or "Enter text..."
            textbox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
            textbox.Text = config.Default or ""
            textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
            textbox.TextSize = 12
            textbox.TextXAlignment = Enum.TextXAlignment.Left
            
            CreateCorner(textbox, 6)
            
            -- Focus effects
            textbox.Focused:Connect(function()
                TweenService:Create(textboxFrame, Animations.hover, {
                    BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                }):Play()
                CreateStroke(textboxFrame, 1, Color3.fromRGB(100, 150, 255), 0.8)
            end)
            
            textbox.FocusLost:Connect(function()
                TweenService:Create(textboxFrame, Animations.hover, {
                    BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                }):Play()
                CreateStroke(textboxFrame, 1, Color3.fromRGB(40, 40, 40), 0.5)
                
                if config.Callback then
                    config.Callback(textbox.Text)
                end
            end)
            
            -- Update canvas size
            tabContent.CanvasSize = UDim2.new(0, 0, 0, tabList.AbsoluteContentSize.Y + 40)
            
            return {
                SetValue = function(value)
                    textbox.Text = value
                end,
                GetValue = function()
                    return textbox.Text
                end
            }
        end
        
        function tab:CreateLabel(config)
            local label = Instance.new("TextLabel")
            label.Parent = tabContent
            label.BackgroundTransparency = 1
            label.Size = UDim2.new(1, 0, 0, 25)
            label.Font = Enum.Font.Gotham
            label.Text = config.Text or "Label"
            label.TextColor3 = Color3.fromRGB(200, 200, 200)
            label.TextSize = config.Size or 14
            label.TextXAlignment = Enum.TextXAlignment.Left
            
            -- Update canvas size
            tabContent.CanvasSize = UDim2.new(0, 0, 0, tabList.AbsoluteContentSize.Y + 40)
            
            return {
                SetText = function(text)
                    label.Text = text
                end
            }
        end
        
        function tab:CreateSection(config)
            local sectionFrame = Instance.new("Frame")
            sectionFrame.Parent = tabContent
            sectionFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            sectionFrame.BorderSizePixel = 0
            sectionFrame.Size = UDim2.new(1, 0, 0, 40)
            
            CreateCorner(sectionFrame, 8)
            CreateGradient(sectionFrame, {
                Color3.fromRGB(25, 25, 25),
                Color3.fromRGB(15, 15, 15)
            }, 90)
            
            local sectionLabel = Instance.new("TextLabel")
            sectionLabel.Parent = sectionFrame
            sectionLabel.BackgroundTransparency = 1
            sectionLabel.Position = UDim2.new(0, 15, 0, 0)
            sectionLabel.Size = UDim2.new(1, -30, 1, 0)
            sectionLabel.Font = Enum.Font.GothamBold
            sectionLabel.Text = config.Title or "Section"
            sectionLabel.TextColor3 = Color3.fromRGB(100, 150, 255)
            sectionLabel.TextSize = 16
            sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            -- Update canvas size
            tabContent.CanvasSize = UDim2.new(0, 0, 0, tabList.AbsoluteContentSize.Y + 40)
            
            return sectionFrame
        end
        
        table.insert(window.tabs, tab)
        return tab
    end
    
    function window:CreateNotification(config)
        local notif = Instance.new("Frame")
        notif.Parent = notifications
        notif.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        notif.BorderSizePixel = 0
        notif.Size = UDim2.new(1, 0, 0, 80)
        notif.Position = UDim2.new(0, 350, 0, 0)
        
        CreateCorner(notif, 12)
        CreateShadow(notif, 15, 0.7)
        CreateStroke(notif, 1, Color3.fromRGB(40, 40, 40), 0.5)
        
        local notifIcon = Instance.new("ImageLabel")
        notifIcon.Parent = notif
        notifIcon.BackgroundTransparency = 1
        notifIcon.Position = UDim2.new(0, 15, 0.5, -12)
        notifIcon.Size = UDim2.new(0, 24, 0, 24)
        notifIcon.Image = config.Icon or "rbxassetid://10709770005"
        notifIcon.ImageColor3 = Color3.fromRGB(100, 150, 255)
        
        local notifTitle = Instance.new("TextLabel")
        notifTitle.Parent = notif
        notifTitle.BackgroundTransparency = 1
        notifTitle.Position = UDim2.new(0, 50, 0, 8)
        notifTitle.Size = UDim2.new(1, -60, 0, 20)
        notifTitle.Font = Enum.Font.GothamBold
        notifTitle.Text = config.Title or "Notification"
        notifTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        notifTitle.TextSize = 14
        notifTitle.TextXAlignment = Enum.TextXAlignment.Left
        
        local notifDesc = Instance.new("TextLabel")
        notifDesc.Parent = notif
        notifDesc.BackgroundTransparency = 1
        notifDesc.Position = UDim2.new(0, 50, 0, 28)
        notifDesc.Size = UDim2.new(1, -60, 0, 44)
        notifDesc.Font = Enum.Font.Gotham
        notifDesc.Text = config.Description or "Description"
        notifDesc.TextColor3 = Color3.fromRGB(180, 180, 180)
        notifDesc.TextSize = 12
        notifDesc.TextWrapped = true
        notifDesc.TextXAlignment = Enum.TextXAlignment.Left
        notifDesc.TextYAlignment = Enum.TextYAlignment.Top
        
        -- Slide in animation
        TweenService:Create(notif, Animations.slideIn, {
            Position = UDim2.new(0, 0, 0, 0)
        }):Play()
        
        -- Auto dismiss
        local duration = config.Duration or 5
        wait(duration)
        
        -- Slide out animation
        TweenService:Create(notif, Animations.slideOut, {
            Position = UDim2.new(0, 350, 0, 0)
        }):Play()
        
        wait(0.3)
        notif:Destroy()
    end
    
    -- Initial slide in animation
    main.Position = UDim2.new(0.5, -300, -1, 0)
    TweenService:Create(main, Animations.slideIn, {
        Position = UDim2.new(0.5, -300, 0.5, -200)
    }):Play()
    
    return window
end
