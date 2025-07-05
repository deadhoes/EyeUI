-- Eye UI Library
-- Modern UI Library for Roblox
-- Version: 1.2 (Enhanced)

local EyeUI = {}
EyeUI.__index = EyeUI

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- Variables
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Lucide Icons (Yeni eklenen ikonlar)
local LucideIcons = {
    Home = "rbxassetid://14370478201",
    Settings = "rbxassetid://14370484732",
    User = "rbxassetid://14370491001",
    Bell = "rbxassetid://14370497542",
    Sliders = "rbxassetid://14370503892",
    ChevronDown = "rbxassetid://14370510201",
    X = "rbxassetid://14370516542",
    Minimize = "rbxassetid://14370522892"
}

-- Utility Functions
local function CreateInstance(className, properties)
    local instance = Instance.new(className)
    for property, value in pairs(properties or {}) do
        if property == "Parent" then
            value = value.Parent or value
        end
        instance[property] = value
    end
    return instance
end

local function Tween(object, properties, duration, easingStyle, easingDirection)
    local tweenInfo = TweenInfo.new(
        duration or 0.3,
        easingStyle or Enum.EasingStyle.Quad,
        easingDirection or Enum.EasingDirection.Out
    )
    local tween = TweenService:Create(object, tweenInfo, properties)
    tween:Play()
    return tween
end

-- Main Library
function EyeUI:CreateWindow(options)
    local window = {}
    options = options or {}
    
    -- Default options
    local title = options.Title or "Eye UI"
    local description = options.Description or "UI Library"
    local icon = options.Icon or LucideIcons.Home
    local size = options.Size or UDim2.new(0, 580, 0, 390)
    local position = options.Position or UDim2.new(0.5, -290, 0.5, -195)
    
    -- Create main GUI
    local screenGui = CreateInstance("ScreenGui", {
        Name = "EyeUI_" .. title,
        Parent = PlayerGui,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        ResetOnSpawn = false
    })
    
    -- Main menu frame
    local menu = CreateInstance("Frame", {
        Name = "Menu",
        Parent = screenGui,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(20, 20, 20),
        BorderSizePixel = 0,
        Position = position,
        Size = size,
        ClipsDescendants = true
    })
    
    local menuCorner = CreateInstance("UICorner", {
        CornerRadius = UDim.new(0.05, 0),
        Parent = menu
    })
    
    -- Topbar
    local topbar = CreateInstance("Frame", {
        Name = "Topbar",
        Parent = menu,
        BackgroundColor3 = Color3.fromRGB(20, 20, 20),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 50)
    })
    
    local topbarCorner = CreateInstance("UICorner", {
        CornerRadius = UDim.new(0.05, 0),
        Parent = topbar
    })
    
    -- Icon
    local iconLabel = CreateInstance("ImageLabel", {
        Name = "Icon",
        Parent = topbar,
        BackgroundTransparency = 1,
        Position = UDim2.new(0.031, 0, 0.19, 0),
        Size = UDim2.new(0, 25, 0, 26),
        Image = icon
    })
    
    -- Title
    local titleLabel = CreateInstance("TextLabel", {
        Name = "Title",
        Parent = topbar,
        BackgroundTransparency = 1,
        Position = UDim2.new(0.091, 0, 0, 0),
        Size = UDim2.new(0, 266, 0, 38),
        Font = Enum.Font.GothamBold,
        Text = title,
        TextColor3 = Color3.fromRGB(230, 230, 230),
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    -- Description
    local descriptionLabel = CreateInstance("TextLabel", {
        Name = "Description",
        Parent = topbar,
        BackgroundTransparency = 1,
        Position = UDim2.new(0.089, 0, 0.27, 0),
        Size = UDim2.new(0, 266, 0, 38),
        Font = Enum.Font.GothamBold,
        Text = description,
        TextColor3 = Color3.fromRGB(176, 176, 176),
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    -- Close button
    local closeButton = CreateInstance("TextButton", {
        Name = "Close",
        Parent = topbar,
        BackgroundTransparency = 1,
        Position = UDim2.new(0.938, 0, 0, 0),
        Size = UDim2.new(0, 35, 0, 37),
        Text = ""
    })
    
    local closeIcon = CreateInstance("ImageLabel", {
        Parent = closeButton,
        BackgroundTransparency = 1,
        Position = UDim2.new(0.2, 0, 0.276, 0), -- Düzenlenmiş pozisyon
        Size = UDim2.new(0, 22, 0, 22),
        Image = LucideIcons.X
    })
    
    -- Minimize button
    local minimizeButton = CreateInstance("TextButton", {
        Name = "Minimize",
        Parent = topbar,
        BackgroundTransparency = 1,
        Position = UDim2.new(0.88, 0, 0, 0), -- Düzenlenmiş pozisyon
        Size = UDim2.new(0, 29, 0, 37),
        Text = ""
    })
    
    local minimizeIcon = CreateInstance("ImageLabel", {
        Parent = minimizeButton,
        BackgroundTransparency = 1,
        Position = UDim2.new(0.2, 0, 0.249, 0), -- Düzenlenmiş pozisyon
        Size = UDim2.new(0, 22, 0, 22),
        Image = LucideIcons.Minimize
    })
    
    -- Tabs container
    local tabsContainer = CreateInstance("Frame", {
        Name = "TabsContainer",
        Parent = menu,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0.128, 0),
        Size = UDim2.new(0, 127, 0, 339)
    })
    
    local tabsLayout = CreateInstance("UIListLayout", {
        Parent = tabsContainer,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5)
    })
    
    -- Content frame
    local contentFrame = CreateInstance("ScrollingFrame", {
        Name = "ContentFrame",
        Parent = menu,
        Active = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0.232, 0, 0.131, 0),
        Size = UDim2.new(0, 444, 0, 338),
        ScrollBarThickness = 7,
        ScrollBarImageColor3 = Color3.fromRGB(70, 70, 70),
        CanvasSize = UDim2.new(0, 0, 0, 0)
    })
    
    local contentPadding = CreateInstance("UIPadding", {
        Parent = contentFrame,
        PaddingBottom = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 15),
        PaddingRight = UDim.new(0, 15),
        PaddingTop = UDim.new(0, 10)
    })
    
    local contentLayout = CreateInstance("UIListLayout", {
        Parent = contentFrame,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 7)
    })
    
    -- Auto-resize content frame
    contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        contentFrame.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 20)
    end)
    
    -- Drag functionality
    local dragBar = CreateInstance("Frame", {
        Name = "DragBar",
        Parent = menu,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(1, 0, 0, 50)
    })
    
    -- Variables for window
    window.GUI = screenGui
    window.Menu = menu
    window.TabsContainer = tabsContainer
    window.ContentFrame = contentFrame
    window.CurrentTab = nil
    window.Tabs = {}
    window.IsMinimized = false
    
    -- Drag functionality
    local dragging = false
    local dragInput, dragStart, startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        menu.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    dragBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = menu.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    dragBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
    
    -- Close button functionality
    closeButton.MouseButton1Click:Connect(function()
        Tween(menu, {Size = UDim2.new(0, 0, 0, 0)}, 0.3)
        wait(0.3)
        screenGui:Destroy()
    end)
    
    -- Minimize button functionality
    minimizeButton.MouseButton1Click:Connect(function()
        if not window.IsMinimized then
            Tween(menu, {Size = UDim2.new(0, 580, 0, 50)}, 0.3)
            contentFrame.Visible = false
            tabsContainer.Visible = false
            window.IsMinimized = true
        else
            Tween(menu, {Size = size}, 0.3)
            contentFrame.Visible = true
            tabsContainer.Visible = true
            window.IsMinimized = false
        end
    end)
    
    -- Create Tab function
    function window:CreateTab(options)
        local tab = {}
        options = options or {}
        
        local tabName = options.Name or "Tab"
        local tabIcon = options.Icon or LucideIcons.Settings
        local isActive = options.Active or false
        
        -- Tab button
        local tabButton = CreateInstance("Frame", {
            Name = tabName,
            Parent = self.TabsContainer,
            BackgroundTransparency = 1,
            Size = UDim2.new(0, 127, 0, 48)
        })
        
        local tabIconLabel = CreateInstance("ImageLabel", {
            Name = "Icon",
            Parent = tabButton,
            BackgroundTransparency = 1,
            Position = UDim2.new(0.144, 0, 0.222, 0),
            Size = UDim2.new(0, 25, 0, 25),
            Image = tabIcon,
            ImageColor3 = isActive and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(150, 150, 150)
        })
        
        local tabLabel = CreateInstance("TextLabel", {
            Parent = tabButton,
            BackgroundTransparency = 1,
            Position = UDim2.new(0.413, 0, 0.042, 0),
            Size = UDim2.new(0, 82, 0, 44),
            Font = Enum.Font.GothamBold,
            Text = tabName,
            TextColor3 = isActive and Color3.fromRGB(230, 230, 230) or Color3.fromRGB(150, 150, 150),
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left
        })
        
        -- Tab button click
        local tabClickButton = CreateInstance("TextButton", {
            Parent = tabButton,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0),
            Text = ""
        })
        
        -- Tab content container
        local tabContent = CreateInstance("Frame", {
            Name = tabName .. "_Content",
            Parent = self.ContentFrame,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 0),
            Visible = isActive
        })
        
        local tabContentLayout = CreateInstance("UIListLayout", {
            Parent = tabContent,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 7)
        })
        
        -- Auto-resize tab content
        tabContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            tabContent.Size = UDim2.new(1, 0, 0, tabContentLayout.AbsoluteContentSize.Y)
        end)
        
        -- Tab object
        tab.Button = tabButton
        tab.Content = tabContent
        tab.Icon = tabIconLabel
        tab.Label = tabLabel
        tab.IsActive = isActive
        tab.Elements = {}
        
        -- Add to tabs
        self.Tabs[tabName] = tab
        
        if isActive then
            self.CurrentTab = tab
        end
        
        -- Tab click functionality with animation
        tabClickButton.MouseButton1Click:Connect(function()
            if self.CurrentTab ~= tab then
                -- Animate current tab out
                if self.CurrentTab then
                    Tween(self.CurrentTab.Content, {Position = UDim2.new(1, 0, 0, 0)}, 0.2)
                    wait(0.2)
                    self.CurrentTab.Content.Visible = false
                    self.CurrentTab.Content.Position = UDim2.new(0, 0, 0, 0)
                    self.CurrentTab.Icon.ImageColor3 = Color3.fromRGB(150, 150, 150)
                    self.CurrentTab.Label.TextColor3 = Color3.fromRGB(150, 150, 150)
                end
                
                -- Animate new tab in
                tab.Content.Visible = true
                tab.Content.Position = UDim2.new(-1, 0, 0, 0)
                Tween(tab.Content, {Position = UDim2.new(0, 0, 0, 0)}, 0.2)
                tab.Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
                tab.Label.TextColor3 = Color3.fromRGB(230, 230, 230)
                
                self.CurrentTab = tab
            end
        end)
        
        -- Tab functions
        function tab:CreateSection(text)
            local section = CreateInstance("Frame", {
                Name = "Section",
                Parent = self.Content,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 25)
            })
            
            local sectionLabel = CreateInstance("TextLabel", {
                Parent = section,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Font = Enum.Font.GothamBold,
                Text = text or "Section",
                TextColor3 = Color3.fromRGB(230, 230, 230),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            return section
        end
        
        function tab:CreateToggle(options)
            options = options or {}
            local toggleName = options.Name or "Toggle"
            local toggleDesc = options.Description or "Toggle description"
            local defaultValue = options.Default or false
            local callback = options.Callback or function() end
            
            local toggle = CreateInstance("Frame", {
                Name = "Toggle",
                Parent = self.Content,
                BackgroundColor3 = Color3.fromRGB(26, 26, 26),
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 53)
            })
            
            CreateInstance("UICorner", {
                CornerRadius = UDim.new(0.2, 0),
                Parent = toggle
            })
            
            local toggleTitle = CreateInstance("TextLabel", {
                Name = "Title",
                Parent = toggle,
                BackgroundTransparency = 1,
                Position = UDim2.new(0.049, 0, 0.057, 0),
                Size = UDim2.new(0, 200, 0, 30),
                Font = Enum.Font.GothamBold,
                Text = toggleName,
                TextColor3 = Color3.fromRGB(230, 230, 230),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local toggleDesc = CreateInstance("TextLabel", {
                Name = "Description",
                Parent = toggle,
                BackgroundTransparency = 1,
                Position = UDim2.new(0.046, 0, 0.302, 0),
                Size = UDim2.new(0, 200, 0, 30),
                Font = Enum.Font.GothamBold,
                Text = toggleDesc,
                TextColor3 = Color3.fromRGB(153, 153, 153),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local toggleSwitch = CreateInstance("Frame", {
                Name = "ToggleSwitch",
                Parent = toggle,
                BackgroundColor3 = Color3.fromRGB(40, 40, 40),
                BorderSizePixel = 0,
                Position = UDim2.new(0.869, 0, 0.356, 0),
                Size = UDim2.new(0, 35, 0, 15)
            })
            
            CreateInstance("UICorner", {
                CornerRadius = UDim.new(0.4, 0),
                Parent = toggleSwitch
            })
            
            local toggleButton = CreateInstance("Frame", {
                Name = "ToggleButton",
                Parent = toggleSwitch,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                Position = UDim2.new(-0.008, 0, -0.067, 0),
                Size = UDim2.new(0, 18, 0, 18)
            })
            
            CreateInstance("UICorner", {
                CornerRadius = UDim.new(1, 0),
                Parent = toggleButton
            })
            
            -- Yeni: Toggle butonu (sadece buraya tıklanınca değişsin)
            local toggleClickButton = CreateInstance("TextButton", {
                Parent = toggleSwitch,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Text = ""
            })
            
            -- Toggle state
            local isToggled = defaultValue
            
            local function updateToggle()
                if isToggled then
                    Tween(toggleButton, {Position = UDim2.new(0.486, 0, -0.067, 0)}, 0.2)
                    Tween(toggleSwitch, {BackgroundColor3 = Color3.fromRGB(70, 130, 180)}, 0.2)
                else
                    Tween(toggleButton, {Position = UDim2.new(-0.008, 0, -0.067, 0)}, 0.2)
                    Tween(toggleSwitch, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}, 0.2)
                end
                callback(isToggled)
            end
            
            updateToggle()
            
            toggleClickButton.MouseButton1Click:Connect(function()
                isToggled = not isToggled
                updateToggle()
            end)
            
            return {
                SetValue = function(value)
                    isToggled = value
                    updateToggle()
                end,
                GetValue = function()
                    return isToggled
                end
            }
        end
        
        function tab:CreateButton(options)
            options = options or {}
            local buttonName = options.Name or "Button"
            local buttonDesc = options.Description or "Button description"
            local callback = options.Callback or function() end
            local buttonIcon = options.Icon or LucideIcons.Bell
            
            local button = CreateInstance("Frame", {
                Name = "Button",
                Parent = self.Content,
                BackgroundColor3 = Color3.fromRGB(26, 26, 26),
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 53)
            })
            
            CreateInstance("UICorner", {
                CornerRadius = UDim.new(0.2, 0),
                Parent = button
            })
            
            local buttonTitle = CreateInstance("TextLabel", {
                Name = "Title",
                Parent = button,
                BackgroundTransparency = 1,
                Position = UDim2.new(0.049, 0, 0.057, 0),
                Size = UDim2.new(0, 200, 0, 30),
                Font = Enum.Font.GothamBold,
                Text = buttonName,
                TextColor3 = Color3.fromRGB(230, 230, 230),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local buttonDesc = CreateInstance("TextLabel", {
                Name = "Description",
                Parent = button,
                BackgroundTransparency = 1,
                Position = UDim2.new(0.049, 0, 0.321, 0),
                Size = UDim2.new(0, 200, 0, 30),
                Font = Enum.Font.GothamBold,
                Text = buttonDesc,
                TextColor3 = Color3.fromRGB(153, 153, 153),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local buttonIcon = CreateInstance("ImageLabel", {
                Parent = button,
                BackgroundTransparency = 1,
                Position = UDim2.new(0.922, 0, 0.309, 0),
                Size = UDim2.new(0, 20, 0, 20),
                Image = buttonIcon
            })
            
            local buttonClick = CreateInstance("TextButton", {
                Name = "Interact",
                Parent = button,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Text = ""
            })
            
            buttonClick.MouseButton1Click:Connect(function()
                Tween(button, {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}, 0.1)
                wait(0.1)
                Tween(button, {BackgroundColor3 = Color3.fromRGB(26, 26, 26)}, 0.1)
                callback()
            end)
            
            return button
        end
        
        function tab:CreateTextbox(options)
            options = options or {}
            local textboxName = options.Name or "Textbox"
            local textboxDesc = options.Description or "Textbox description"
            local placeholder = options.Placeholder or "Enter text"
            local callback = options.Callback or function() end
            
            local textboxFrame = CreateInstance("Frame", {
                Name = "Textbox",
                Parent = self.Content,
                BackgroundColor3 = Color3.fromRGB(26, 26, 26),
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 53)
            })
            
            CreateInstance("UICorner", {
                CornerRadius = UDim.new(0.2, 0),
                Parent = textboxFrame
            })
            
            local textboxTitle = CreateInstance("TextLabel", {
                Name = "Title",
                Parent = textboxFrame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0.049, 0, 0.057, 0),
                Size = UDim2.new(0, 200, 0, 30),
                Font = Enum.Font.GothamBold,
                Text = textboxName,
                TextColor3 = Color3.fromRGB(230, 230, 230),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local textboxDesc = CreateInstance("TextLabel", {
                Name = "Description",
                Parent = textboxFrame,
                BackgroundTransparency = 1,
                Position = UDim2.new(0.049, 0, 0.321, 0),
                Size = UDim2.new(0, 200, 0, 30),
                Font = Enum.Font.GothamBold,
                Text = textboxDesc,
                TextColor3 = Color3.fromRGB(153, 153, 153),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local textbox = CreateInstance("TextBox", {
                Parent = textboxFrame,
                BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                BorderSizePixel = 0,
                Position = UDim2.new(0.673, 0, 0.17, 0),
                Size = UDim2.new(0, 122, 0, 34),
                Font = Enum.Font.GothamBold,
                PlaceholderText = placeholder,
                Text = "",
                TextColor3 = Color3.fromRGB(230, 230, 230),
                TextSize = 14
            })
            
            CreateInstance("UICorner", {
                CornerRadius = UDim.new(0.2, 0),
                Parent = textbox
            })
            
            textbox.FocusLost:Connect(function()
                callback(textbox.Text)
            end)
            
            return {
                SetText = function(text)
                    textbox.Text = text
                end,
                GetText = function()
                    return textbox.Text
                end
            }
        end
        
        function tab:CreateSlider(options)
            options = options or {}
            local sliderName = options.Name or "Slider"
            local sliderDesc = options.Description or "Slider description"
            local minValue = options.Min or 0
            local maxValue = options.Max or 100
            local defaultValue = options.Default or 50
            local callback = options.Callback or function() end
            local precise = options.Precise or false
            
            local slider = CreateInstance("Frame", {
                Name = "Slider",
                Parent = self.Content,
                BackgroundColor3 = Color3.fromRGB(26, 26, 26),
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 53)
            })
            
            CreateInstance("UICorner", {
                CornerRadius = UDim.new(0.2, 0),
                Parent = slider
            })
            
            local sliderTitle = CreateInstance("TextLabel", {
                Name = "Title",
                Parent = slider,
                BackgroundTransparency = 1,
                Position = UDim2.new(0.049, 0, 0.057, 0),
                Size = UDim2.new(0, 200, 0, 30),
                Font = Enum.Font.GothamBold,
                Text = sliderName,
                TextColor3 = Color3.fromRGB(230, 230, 230),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local sliderDesc = CreateInstance("TextLabel", {
                Name = "Description",
                Parent = slider,
                BackgroundTransparency = 1,
                Position = UDim2.new(0.049, 0, 0.321, 0),
                Size = UDim2.new(0, 200, 0, 30),
                Font = Enum.Font.GothamBold,
                Text = sliderDesc,
                TextColor3 = Color3.fromRGB(153, 153, 153),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local sliderValue = CreateInstance("TextLabel", {
                Name = "Value",
                Parent = slider,
                BackgroundTransparency = 1,
                Position = UDim2.new(0.85, 0, 0.3, 0),
                Size = UDim2.new(0, 50, 0, 20),
                Font = Enum.Font.GothamBold,
                Text = tostring(defaultValue),
                TextColor3 = Color3.fromRGB(230, 230, 230),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Right
            })
            
            local sliderTrack = CreateInstance("Frame", {
                Name = "Track",
                Parent = slider,
                BackgroundColor3 = Color3.fromRGB(40, 40, 40),
                BorderSizePixel = 0,
                Position = UDim2.new(0.4, 0, 0.7, 0),
                Size = UDim2.new(0.45, 0, 0, 5)
            })
            
            CreateInstance("UICorner", {
                CornerRadius = UDim.new(1, 0),
                Parent = sliderTrack
            })
            
            local sliderFill = CreateInstance("Frame", {
                Name = "Fill",
                Parent = sliderTrack,
                BackgroundColor3 = Color3.fromRGB(70, 130, 180),
                BorderSizePixel = 0,
                Size = UDim2.new((defaultValue - minValue) / (maxValue - minValue), 0, 1, 0)
            })
            
            CreateInstance("UICorner", {
                CornerRadius = UDim.new(1, 0),
                Parent = sliderFill
            })
            
            local sliderButton = CreateInstance("TextButton", {
                Name = "Button",
                Parent = sliderTrack,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 3, 0),
                Position = UDim2.new(0, 0, -1, 0),
                Text = ""
            })
            
            local sliderThumb = CreateInstance("Frame", {
                Name = "Thumb",
                Parent = sliderTrack,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                Position = UDim2.new((defaultValue - minValue) / (maxValue - minValue), -5, 0.5, -5),
                Size = UDim2.new(0, 10, 0, 10),
                AnchorPoint = Vector2.new(0.5, 0.5)
            })
            
            CreateInstance("UICorner", {
                CornerRadius = UDim.new(1, 0),
                Parent = sliderThumb
            })
            
            local dragging = false
            local currentValue = defaultValue
            
            local function updateSlider(value)
                value = math.clamp(value, minValue, maxValue)
                currentValue = precise and value or math.floor(value)
                sliderValue.Text = tostring(currentValue)
                local ratio = (currentValue - minValue) / (maxValue - minValue)
                sliderFill.Size = UDim2.new(ratio, 0, 1, 0)
                sliderThumb.Position = UDim2.new(ratio, -5, 0.5, -5)
                callback(currentValue)
            end
            
            sliderButton.MouseButton1Down:Connect(function()
                dragging = true
            end)
            
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
            
            sliderButton.MouseMoved:Connect(function()
                if dragging then
                    local mousePos = UserInputService:GetMouseLocation().X
                    local absolutePos = sliderTrack.AbsolutePosition.X
                    local absoluteSize = sliderTrack.AbsoluteSize.X
                    local relativePos = math.clamp(mousePos - absolutePos, 0, absoluteSize)
                    local ratio = relativePos / absoluteSize
                    local value = minValue + (maxValue - minValue) * ratio
                    updateSlider(value)
                end
            end)
            
            -- Initialize
            updateSlider(defaultValue)
            
            return {
                SetValue = function(value)
                    updateSlider(value)
                end,
                GetValue = function()
                    return currentValue
                end
            }
        end
        
        function tab:CreateDropdown(options)
            options = options or {}
            local dropdownName = options.Name or "Dropdown"
            local dropdownDesc = options.Description or "Select an option"
            local items = options.Items or {"Option 1", "Option 2", "Option 3"}
            local defaultItem = options.Default or items[1]
            local callback = options.Callback or function() end
            
            local dropdown = CreateInstance("Frame", {
                Name = "Dropdown",
                Parent = self.Content,
                BackgroundColor3 = Color3.fromRGB(26, 26, 26),
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 53),
                ClipsDescendants = true
            })
            
            CreateInstance("UICorner", {
                CornerRadius = UDim.new(0.2, 0),
                Parent = dropdown
            })
            
            local dropdownTitle = CreateInstance("TextLabel", {
                Name = "Title",
                Parent = dropdown,
                BackgroundTransparency = 1,
                Position = UDim2.new(0.049, 0, 0.057, 0),
                Size = UDim2.new(0, 200, 0, 30),
                Font = Enum.Font.GothamBold,
                Text = dropdownName,
                TextColor3 = Color3.fromRGB(230, 230, 230),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local dropdownDesc = CreateInstance("TextLabel", {
                Name = "Description",
                Parent = dropdown,
                BackgroundTransparency = 1,
                Position = UDim2.new(0.049, 0, 0.321, 0),
                Size = UDim2.new(0, 200, 0, 30),
                Font = Enum.Font.GothamBold,
                Text = dropdownDesc,
                TextColor3 = Color3.fromRGB(153, 153, 153),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local dropdownButton = CreateInstance("TextButton", {
                Name = "Button",
                Parent = dropdown,
                BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                BorderSizePixel = 0,
                Position = UDim2.new(0.673, 0, 0.17, 0),
                Size = UDim2.new(0, 122, 0, 34),
                Text = defaultItem,
                Font = Enum.Font.GothamBold,
                TextColor3 = Color3.fromRGB(230, 230, 230),
                TextSize = 14
            })
            
            CreateInstance("UICorner", {
                CornerRadius = UDim.new(0.2, 0),
                Parent = dropdownButton
            })
            
            local dropdownIcon = CreateInstance("ImageLabel", {
                Parent = dropdownButton,
                BackgroundTransparency = 1,
                Position = UDim2.new(0.8, 0, 0.2, 0),
                Size = UDim2.new(0, 20, 0, 20),
                Image = LucideIcons.ChevronDown,
                ImageColor3 = Color3.fromRGB(200, 200, 200)
            })
            
            local dropdownList = CreateInstance("Frame", {
                Name = "List",
                Parent = dropdown,
                BackgroundColor3 = Color3.fromRGB(26, 26, 26),
                BorderSizePixel = 0,
                Position = UDim2.new(0, 0, 1, 5),
                Size = UDim2.new(1, 0, 0, 0),
                Visible = false,
                ClipsDescendants = true
            })
            
            CreateInstance("UICorner", {
                CornerRadius = UDim.new(0.2, 0),
                Parent = dropdownList
            })
            
            local dropdownListLayout = CreateInstance("UIListLayout", {
                Parent = dropdownList,
                SortOrder = Enum.SortOrder.LayoutOrder
            })
            
            local dropdownListPadding = CreateInstance("UIPadding", {
                Parent = dropdownList,
                PaddingTop = UDim.new(0, 5)
            })
            
            local function updateDropdownSize()
                dropdownList.Size = UDim2.new(1, 0, 0, #items * 30 + 10)
            end
            
            local function createDropdownItems()
                -- Clear existing items
                for _, child in ipairs(dropdownList:GetChildren()) do
                    if child:IsA("TextButton") then
                        child:Destroy()
                    end
                end
                
                -- Create new items
                for i, item in ipairs(items) do
                    local itemButton = CreateInstance("TextButton", {
                        Name = item,
                        Parent = dropdownList,
                        BackgroundColor3 = Color3.fromRGB(35, 35, 35),
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, -10, 0, 30),
                        Position = UDim2.new(0, 5, 0, (i-1)*30 + 5),
                        Text = item,
                        Font = Enum.Font.GothamBold,
                        TextColor3 = Color3.fromRGB(230, 230, 230),
                        TextSize = 14
                    })
                    
                    CreateInstance("UICorner", {
                        CornerRadius = UDim.new(0.1, 0),
                        Parent = itemButton
                    })
                    
                    itemButton.MouseButton1Click:Connect(function()
                        dropdownButton.Text = item
                        callback(item)
                        dropdownList.Visible = false
                        Tween(dropdown, {Size = UDim2.new(1, 0, 0, 53)}, 0.2)
                    end)
                end
                
                updateDropdownSize()
            end
            
            local isOpen = false
            dropdownButton.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                dropdownList.Visible = isOpen
                
                if isOpen then
                    createDropdownItems()
                    Tween(dropdown, {Size = UDim2.new(1, 0, 0, 53 + dropdownList.Size.Y.Offset + 5)}, 0.2)
                else
                    Tween(dropdown, {Size = UDim2.new(1, 0, 0, 53)}, 0.2)
                end
            end)
            
            -- Initialize
            createDropdownItems()
            
            return {
                SetItems = function(newItems)
                    items = newItems
                    createDropdownItems()
                end,
                GetSelected = function()
                    return dropdownButton.Text
                end,
                SetSelected = function(item)
                    if table.find(items, item) then
                        dropdownButton.Text = item
                        callback(item)
                    end
                end
            }
        end
        
        return tab
    end
    
    -- Switch tab function
    function window:SwitchTab(tabName)
        local tab = self.Tabs[tabName]
        if not tab then return end
        
        -- Hide current tab
        if self.CurrentTab then
            self.CurrentTab.Content.Visible = false
            self.CurrentTab.Icon.ImageColor3 = Color3.fromRGB(150, 150, 150)
            self.CurrentTab.Label.TextColor3 = Color3.fromRGB(150, 150, 150)
        end
        
        -- Show new tab
        tab.Content.Visible = true
        tab.Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
        tab.Label.TextColor3 = Color3.fromRGB(230, 230, 230)
        
        self.CurrentTab = tab
    end
    
    -- Destroy function
    function window:Destroy()
        screenGui:Destroy()
    end
    
    return window
end

return EyeUI
