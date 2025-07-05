-- Eye UI Library v2.0
-- Enhanced with Search, Themes, and Notifications

local EyeUI = {}
EyeUI.__index = EyeUI

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- Default Theme
EyeUI.Themes = {
    Dark = {
        Main = Color3.fromRGB(20, 20, 20),
        Tab = Color3.fromRGB(30, 30, 30),
        Element = Color3.fromRGB(26, 26, 26),
        Text = Color3.fromRGB(230, 230, 230),
        SecondaryText = Color3.fromRGB(176, 176, 176),
        Accent = Color3.fromRGB(70, 130, 180),
        ScrollBar = Color3.fromRGB(70, 70, 70)
    },
    Light = {
        Main = Color3.fromRGB(240, 240, 240),
        Tab = Color3.fromRGB(220, 220, 220),
        Element = Color3.fromRGB(255, 255, 255),
        Text = Color3.fromRGB(50, 50, 50),
        SecondaryText = Color3.fromRGB(100, 100, 100),
        Accent = Color3.fromRGB(0, 120, 215),
        ScrollBar = Color3.fromRGB(180, 180, 180)
    },
    Midnight = {
        Main = Color3.fromRGB(15, 15, 20),
        Tab = Color3.fromRGB(25, 25, 35),
        Element = Color3.fromRGB(35, 35, 45),
        Text = Color3.fromRGB(220, 220, 220),
        SecondaryText = Color3.fromRGB(150, 150, 150),
        Accent = Color3.fromRGB(120, 80, 200),
        ScrollBar = Color3.fromRGB(80, 80, 80)
    }
}

-- Notification System
EyeUI.Notifications = {
    ActiveNotifications = {},
    Show = function(self, options)
        options = options or {}
        local title = options.Title or "Notification"
        local content = options.Content or "Message"
        local duration = options.Duration or 5
        local callback = options.Callback
        
        -- Create notification frame
        local notification = Instance.new("Frame")
        notification.Name = "Notification_"..tick()
        notification.BackgroundColor3 = EyeUI.CurrentTheme.Element
        notification.BorderSizePixel = 0
        notification.Size = UDim2.new(0.3, 0, 0, 60)
        notification.Position = UDim2.new(0.7, 0, 0.05 + (#self.ActiveNotifications * 0.07), 0)
        notification.AnchorPoint = Vector2.new(0.5, 0)
        notification.Parent = EyeUI.NotificationParent
        notification.ZIndex = 100
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0.1, 0)
        corner.Parent = notification
        
        -- Title
        local titleLabel = Instance.new("TextLabel")
        titleLabel.Text = title
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextColor3 = EyeUI.CurrentTheme.Text
        titleLabel.TextSize = 14
        titleLabel.BackgroundTransparency = 1
        titleLabel.Size = UDim2.new(0.9, 0, 0.4, 0)
        titleLabel.Position = UDim2.new(0.05, 0, 0.1, 0)
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.Parent = notification
        
        -- Content
        local contentLabel = Instance.new("TextLabel")
        contentLabel.Text = content
        contentLabel.Font = Enum.Font.Gotham
        contentLabel.TextColor3 = EyeUI.CurrentTheme.SecondaryText
        contentLabel.TextSize = 12
        contentLabel.BackgroundTransparency = 1
        contentLabel.Size = UDim2.new(0.9, 0, 0.4, 0)
        contentLabel.Position = UDim2.new(0.05, 0, 0.5, 0)
        contentLabel.TextXAlignment = Enum.TextXAlignment.Left
        contentLabel.Parent = notification
        
        -- Close button
        local closeButton = Instance.new("TextButton")
        closeButton.Text = "X"
        closeButton.Font = Enum.Font.GothamBold
        closeButton.TextColor3 = EyeUI.CurrentTheme.Text
        closeButton.TextSize = 14
        closeButton.BackgroundTransparency = 1
        closeButton.Size = UDim2.new(0.1, 0, 0.3, 0)
        closeButton.Position = UDim2.new(0.9, 0, 0.1, 0)
        closeButton.Parent = notification
        
        table.insert(self.ActiveNotifications, notification)
        
        -- Auto-remove after duration
        local removeConnection
        removeConnection = game:GetService("RunService").Heartbeat:Connect(function(dt)
            duration = duration - dt
            if duration <= 0 then
                removeConnection:Disconnect()
                notification:Destroy()
                table.remove(self.ActiveNotifications, table.find(self.ActiveNotifications, notification))
                self:UpdateNotificationPositions()
            end
        end)
        
        closeButton.MouseButton1Click:Connect(function()
            removeConnection:Disconnect()
            notification:Destroy()
            table.remove(self.ActiveNotifications, table.find(self.ActiveNotifications, notification))
            self:UpdateNotificationPositions()
            if callback then callback() end
        end)
    end,
    
    UpdateNotificationPositions = function(self)
        for i, notif in ipairs(self.ActiveNotifications) do
            TweenService:Create(notif, TweenInfo.new(0.2), {
                Position = UDim2.new(0.7, 0, 0.05 + ((i-1) * 0.07), 0)
            }):Play()
        end
    end
}

-- Main Library
function EyeUI:CreateWindow(options)
    local window = {}
    options = options or {}
    
    -- Set theme
    EyeUI.CurrentTheme = EyeUI.Themes[options.Theme or "Dark"]
    
    -- Create notification parent if not exists
    if not EyeUI.NotificationParent then
        local notificationScreen = Instance.new("ScreenGui")
        notificationScreen.Name = "EyeUINotifications"
        notificationScreen.Parent = game:GetService("CoreGui")
        notificationScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        EyeUI.NotificationParent = notificationScreen
    end
    
    -- Window setup
    local title = options.Title or "Eye UI"
    local size = options.Size or UDim2.new(0, 580, 0, 390)
    local position = options.Position or UDim2.new(0.5, -290, 0.5, -195)
    
    -- Create main GUI
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "EyeUI_"..tick()
    screenGui.Parent = PlayerGui
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.ResetOnSpawn = false
    
    -- Main menu frame
    local menu = Instance.new("Frame")
    menu.Name = "Menu"
    menu.Parent = screenGui
    menu.AnchorPoint = Vector2.new(0.5, 0.5)
    menu.BackgroundColor3 = EyeUI.CurrentTheme.Main
    menu.BorderSizePixel = 0
    menu.Position = position
    menu.Size = size
    menu.ClipsDescendants = true
    
    Instance.new("UICorner", {Parent = menu, CornerRadius = UDim.new(0.05, 0)})
    
    -- Topbar with search
    local topbar = Instance.new("Frame")
    topbar.Name = "Topbar"
    topbar.Parent = menu
    topbar.BackgroundColor3 = EyeUI.CurrentTheme.Main
    topbar.BorderSizePixel = 0
    topbar.Size = UDim2.new(1, 0, 0, 50)
    Instance.new("UICorner", {Parent = topbar, CornerRadius = UDim.new(0.05, 0)})
    
    -- Search box
    local searchBox = Instance.new("TextBox")
    searchBox.Name = "SearchBox"
    searchBox.Parent = topbar
    searchBox.BackgroundColor3 = EyeUI.CurrentTheme.Element
    searchBox.BorderSizePixel = 0
    searchBox.Position = UDim2.new(0.6, 0, 0.2, 0)
    searchBox.Size = UDim2.new(0.3, 0, 0.6, 0)
    searchBox.Font = Enum.Font.Gotham
    searchBox.TextColor3 = EyeUI.CurrentTheme.Text
    searchBox.PlaceholderText = "Search tabs..."
    searchBox.PlaceholderColor3 = EyeUI.CurrentTheme.SecondaryText
    searchBox.TextSize = 12
    searchBox.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", {Parent = searchBox, CornerRadius = UDim.new(0.2, 0)})
    
    -- Search icon
    local searchIcon = Instance.new("ImageLabel")
    searchIcon.Name = "SearchIcon"
    searchIcon.Parent = searchBox
    searchIcon.BackgroundTransparency = 1
    searchIcon.Image = "rbxassetid://14370503892" -- Lucide search icon
    searchIcon.Size = UDim2.new(0, 20, 0, 20)
    searchIcon.Position = UDim2.new(0.95, -25, 0.5, -10)
    searchIcon.ImageColor3 = EyeUI.CurrentTheme.SecondaryText
    
    -- Tabs container
    local tabsContainer = Instance.new("Frame")
    tabsContainer.Name = "TabsContainer"
    tabsContainer.Parent = menu
    tabsContainer.BackgroundTransparency = 1
    tabsContainer.Position = UDim2.new(0, 0, 0.128, 0)
    tabsContainer.Size = UDim2.new(0, 127, 0, 339)
    Instance.new("UIListLayout", {Parent = tabsContainer, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 5)})
    
    -- Content frame
    local contentFrame = Instance.new("ScrollingFrame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Parent = menu
    contentFrame.Active = true
    contentFrame.BackgroundTransparency = 1
    contentFrame.BorderSizePixel = 0
    contentFrame.Position = UDim2.new(0.232, 0, 0.131, 0)
    contentFrame.Size = UDim2.new(0, 444, 0, 338)
    contentFrame.ScrollBarThickness = 7
    contentFrame.ScrollBarImageColor3 = EyeUI.CurrentTheme.ScrollBar
    contentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    
    Instance.new("UIPadding", {Parent = contentFrame, 
        PaddingBottom = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 15),
        PaddingRight = UDim.new(0, 15),
        PaddingTop = UDim.new(0, 10)
    })
    
    local contentLayout = Instance.new("UIListLayout", {Parent = contentFrame, 
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 7)
    })
    
    -- Search functionality
    searchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local searchText = string.lower(searchBox.Text)
        
        for tabName, tab in pairs(window.Tabs) do
            local match = string.find(string.lower(tabName), searchText, 1, true)
            tab.Button.Visible = searchText == "" or match ~= nil
        end
    end)
    
    -- Theme changing function
    function window:SetTheme(themeName)
        EyeUI.CurrentTheme = EyeUI.Themes[themeName] or EyeUI.Themes.Dark
        -- Update all UI elements with new theme colors
        -- (Implementation depends on your specific UI structure)
    end
    
    -- Notification shortcut
    function window:Notify(options)
        EyeUI.Notifications:Show(options)
    end
    
    -- Rest of your window implementation...
    
    return window
end

return EyeUI
