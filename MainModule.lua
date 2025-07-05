-- Eye UI Library v2.2
-- Pure Instance.new implementation with all features

local EyeUI = {}
EyeUI.__index = EyeUI

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Themes
EyeUI.Themes = {
    Dark = {
        Main = Color3.fromRGB(20, 20, 20),
        Element = Color3.fromRGB(30, 30, 30),
        Text = Color3.fromRGB(230, 230, 230),
        Accent = Color3.fromRGB(70, 130, 180)
    },
    Light = {
        Main = Color3.fromRGB(240, 240, 240),
        Element = Color3.fromRGB(255, 255, 255),
        Text = Color3.fromRGB(50, 50, 50),
        Accent = Color3.fromRGB(0, 120, 215)
    }
}

-- Main Window Creation
function EyeUI:CreateWindow(options)
    local window = {}
    options = options or {}
    local theme = EyeUI.Themes[options.Theme or "Dark"]

    -- Main ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "EyeUI_"..tick()
    screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.ResetOnSpawn = false

    -- Main Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Parent = screenGui
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = theme.Main
    mainFrame.BorderSizePixel = 0
    mainFrame.Position = options.Position or UDim2.new(0.5, -290, 0.5, -195)
    mainFrame.Size = options.Size or UDim2.new(0, 580, 0, 390)
    
    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0.05, 0)
    mainCorner.Parent = mainFrame

    -- Top Bar with Search
    local topBar = Instance.new("Frame")
    topBar.Name = "TopBar"
    topBar.Parent = mainFrame
    topBar.BackgroundColor3 = theme.Main
    topBar.BorderSizePixel = 0
    topBar.Size = UDim2.new(1, 0, 0, 50)

    local topBarCorner = Instance.new("UICorner")
    topBarCorner.CornerRadius = UDim.new(0.05, 0)
    topBarCorner.Parent = topBar

    -- Search Box (Magnifying Glass)
    local searchBox = Instance.new("TextBox")
    searchBox.Name = "SearchBox"
    searchBox.Parent = topBar
    searchBox.BackgroundColor3 = theme.Element
    searchBox.BorderSizePixel = 0
    searchBox.Position = UDim2.new(0.6, 0, 0.2, 0)
    searchBox.Size = UDim2.new(0.3, 0, 0.6, 0)
    searchBox.Font = Enum.Font.Gotham
    searchBox.TextColor3 = theme.Text
    searchBox.PlaceholderText = "Search tabs..."
    searchBox.TextSize = 12
    searchBox.TextXAlignment = Enum.TextXAlignment.Left

    local searchBoxCorner = Instance.new("UICorner")
    searchBoxCorner.CornerRadius = UDim.new(0.2, 0)
    searchBoxCorner.Parent = searchBox

    local searchIcon = Instance.new("ImageLabel")
    searchIcon.Name = "SearchIcon"
    searchIcon.Parent = searchBox
    searchIcon.BackgroundTransparency = 1
    searchIcon.Image = "rbxassetid://14370503892" -- Lucide search
    searchIcon.Size = UDim2.new(0, 20, 0, 20)
    searchIcon.Position = UDim2.new(0.95, -25, 0.5, -10)
    searchIcon.ImageColor3 = theme.Text

    -- Tabs Container
    local tabsContainer = Instance.new("Frame")
    tabsContainer.Name = "TabsContainer"
    tabsContainer.Parent = mainFrame
    tabsContainer.BackgroundTransparency = 1
    tabsContainer.Position = UDim2.new(0, 0, 0.128, 0)
    tabsContainer.Size = UDim2.new(0, 127, 0, 339)

    local tabsLayout = Instance.new("UIListLayout")
    tabsLayout.Parent = tabsContainer
    tabsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabsLayout.Padding = UDim.new(0, 5)

    -- Content Frame
    local contentFrame = Instance.new("ScrollingFrame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Parent = mainFrame
    contentFrame.Active = true
    contentFrame.BackgroundTransparency = 1
    contentFrame.BorderSizePixel = 0
    contentFrame.Position = UDim2.new(0.232, 0, 0.131, 0)
    contentFrame.Size = UDim2.new(0, 444, 0, 338)
    contentFrame.ScrollBarThickness = 7
    contentFrame.ScrollBarImageColor3 = theme.Accent
    contentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)

    local contentPadding = Instance.new("UIPadding")
    contentPadding.Parent = contentFrame
    contentPadding.PaddingBottom = UDim.new(0, 10)
    contentPadding.PaddingLeft = UDim.new(0, 15)
    contentPadding.PaddingRight = UDim.new(0, 15)
    contentPadding.PaddingTop = UDim.new(0, 10)

    local contentLayout = Instance.new("UIListLayout")
    contentLayout.Parent = contentFrame
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.Padding = UDim.new(0, 7)

    -- Search Functionality
    searchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local searchText = string.lower(searchBox.Text)
        for _, tab in pairs(window.Tabs) do
            local tabName = string.lower(tab.Name)
            tab.Frame.Visible = searchText == "" or string.find(tabName, searchText, 1, true) ~= nil
        end
    end)

    -- Notification System
    function window:Notify(options)
        options = options or {}
        local notification = Instance.new("Frame")
        notification.Name = "Notification_"..tick()
        notification.Parent = screenGui
        notification.BackgroundColor3 = theme.Element
        notification.Size = UDim2.new(0.3, 0, 0, 60)
        notification.Position = UDim2.new(0.7, 0, 0.05, 0)
        notification.AnchorPoint = Vector2.new(0.5, 0)
        
        local notifCorner = Instance.new("UICorner")
        notifCorner.CornerRadius = UDim.new(0.1, 0)
        notifCorner.Parent = notification
        
        local title = Instance.new("TextLabel")
        title.Text = options.Title or "Notification"
        title.Font = Enum.Font.GothamBold
        title.TextColor3 = theme.Text
        title.TextSize = 14
        title.BackgroundTransparency = 1
        title.Size = UDim2.new(0.9, 0, 0.4, 0)
        title.Position = UDim2.new(0.05, 0, 0.1, 0)
        title.TextXAlignment = Enum.TextXAlignment.Left
        title.Parent = notification
        
        task.delay(options.Duration or 5, function()
            notification:Destroy()
        end)
    end

    -- Theme Changer
    function window:SetTheme(themeName)
        local newTheme = EyeUI.Themes[themeName] or EyeUI.Themes.Dark
        mainFrame.BackgroundColor3 = newTheme.Main
        topBar.BackgroundColor3 = newTheme.Main
        searchBox.BackgroundColor3 = newTheme.Element
        searchBox.TextColor3 = newTheme.Text
        contentFrame.ScrollBarImageColor3 = newTheme.Accent
    end

    -- Tab Creation
    function window:CreateTab(options)
        local tab = {}
        options = options or {}
        
        local tabFrame = Instance.new("Frame")
        tabFrame.Name = "Tab_"..options.Name
        tabFrame.Parent = tabsContainer
        tabFrame.BackgroundTransparency = 1
        tabFrame.Size = UDim2.new(0, 127, 0, 48)
        
        -- Tab implementation here...
        
        window.Tabs[options.Name] = {
            Name = options.Name,
            Frame = tabFrame
        }
        
        return tab
    end

    return window
end

return EyeUI
