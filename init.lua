-- Eye UI Library
-- Modern UI Library for Roblox
-- Version: 1.1 (Fixed)

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

-- Utility Functions
local function CreateInstance(className, properties)
    local instance = Instance.new(className)
    for property, value in pairs(properties or {}) do
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
    local icon = options.Icon or "rbxassetid://6523858394"
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
        Size = size
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
        Position = UDim2.new(0.062, 0, 0.276, 0),
        Size = UDim2.new(0, 22, 0, 22),
        Image = "rbxassetid://10747384394"
    })
    
    CreateInstance("UICorner", {
        CornerRadius = UDim.new(0.02, 8),
        Parent = closeButton
    })
    
    -- Minimize button
    local minimizeButton = CreateInstance("TextButton", {
        Name = "Minimize",
        Parent = topbar,
        BackgroundTransparency = 1,
        Position = UDim2.new(0.901, 0, 0, 0),
        Size = UDim2.new(0, 29, 0, 37),
        Text = ""
    })
    
    local minimizeIcon = CreateInstance("ImageLabel", {
        Parent = minimizeButton,
        BackgroundTransparency = 1,
        Position = UDim2.new(0.293, 0, 0.249, 0),
        Size = UDim2.new(0, 22, 0, 22),
        Image = "rbxassetid://10734896206"
    })
    
    CreateInstance("UICorner", {
        CornerRadius = UDim.new(0.02, 8),
        Parent = minimizeButton
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
        SortOrder = Enum.SortOrder.LayoutOrder
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
        local tabIcon = options.Icon or "rbxassetid://10734966248"
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
        
        -- Tab click functionality
        tabClickButton.MouseButton1Click:Connect(function()
            self:SwitchTab(tabName)
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
            
            local toggleClickButton = CreateInstance("TextButton", {
                Parent = toggle,
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
                Image = "rbxassetid://10734898355"
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
