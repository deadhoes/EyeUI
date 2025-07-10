-- EyeUI Library
-- A modern UI library for Roblox with refined aesthetics

local EyeUI = {}
EyeUI.__index = EyeUI

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Lucide Icon Asset IDs (IMPORTANT: REPLACE WITH YOUR ACTUAL ASSET IDs)
-- You need to upload Lucide SVG icons to Roblox and get their rbxassetid.
-- Example: "home" icon might have an ID like "rbxassetid://1234567890"
local LucideIcons = {
    -- General Icons
    ["default"] = "rbxassetid://10709770005", -- Default placeholder icon (Consider a neutral icon like "circle")
    ["close"] = "rbxassetid://10747384394", -- x
    ["minimize"] = "rbxassetid://10734896206", -- minus
    ["info"] = "rbxassetid://10709770005", -- info icon
    ["alert-triangle"] = "rbxassetid://10723407389", -- alert-triangle
    ["check-circle"] = "rbxassetid://10723407389", -- check-circle
    ["x-circle"] = "rbxassetid://10723407389", -- x-circle
    ["grip-horizontal"] = "rbxassetid://10734896206", -- grip-horizontal
    ["search"] = "rbxassetid://10723407389", -- search
    ["palette"] = "rbxassetid://10723407389", -- palette
    ["chevron-down"] = "rbxassetid://10723407389", -- chevron-down (for dropdowns)

    -- Tab Icons (examples, replace with actual Lucide equivalents)
    ["settings"] = "rbxassetid://10723407389", -- settings/gear icon
    ["home"] = "rbxassetid://10723407389", -- home icon
    ["tool"] = "rbxassetid://10723407389", -- tool icon
    ["sliders"] = "rbxassetid://10723407389", -- sliders icon
    ["message-square"] = "rbxassetid://10723407389", -- message/chat icon
    ["shield"] = "rbxassetid://10723407389", -- shield icon
    ["user"] = "rbxassetid://10723407389", -- user icon
}

-- Helper function to get Lucide icon asset ID
local function getLucideIcon(iconName)
    return LucideIcons[iconName] or LucideIcons["default"]
end

-- Theme Definitions (Revised for a softer, modern look)
local Themes = {
    Dark = {
        MainBackground = Color3.fromRGB(24, 24, 27),   -- Dark Slate Grey
        TopbarBackground = Color3.fromRGB(24, 24, 27),
        TabBackground = Color3.fromRGB(39, 39, 42),    -- Darker Slate Grey
        ElementBackground = Color3.fromRGB(39, 39, 42),
        InputBackground = Color3.fromRGB(50, 50, 55),  -- Even darker for inputs
        AccentColor = Color3.fromRGB(0, 150, 255),    -- Vibrant Blue
        TextColor = Color3.fromRGB(220, 220, 220),     -- Soft White
        SubTextColor = Color3.fromRGB(160, 160, 160),  -- Grey
        PlaceholderColor = Color3.fromRGB(100, 100, 100), -- Darker Grey
        ButtonHover = Color3.fromRGB(50, 50, 55),      -- Darker hover
        SliderThumb = Color3.fromRGB(255, 255, 255),   -- White thumb
        NotificationBackground = Color3.fromRGB(35, 35, 38), -- Slightly lighter than main for notifs
        NotificationText = Color3.fromRGB(230, 230, 230),
        NotificationSubText = Color3.fromRGB(180, 180, 180),
        IconColor = Color3.fromRGB(170, 170, 170),     -- Soft grey for icons
    },
    Light = {
        MainBackground = Color3.fromRGB(248, 248, 250), -- Off-white
        TopbarBackground = Color3.fromRGB(248, 248, 250),
        TabBackground = Color3.fromRGB(235, 235, 238),  -- Light Grey
        ElementBackground = Color3.fromRGB(235, 235, 238),
        InputBackground = Color3.fromRGB(220, 220, 225),-- Even lighter for inputs
        AccentColor = Color3.fromRGB(0, 120, 215),     -- Standard Blue
        TextColor = Color3.fromRGB(40, 40, 40),        -- Dark Grey
        SubTextColor = Color3.fromRGB(90, 90, 90),     -- Medium Grey
        PlaceholderColor = Color3.fromRGB(140, 140, 140),-- Lighter Grey
        ButtonHover = Color3.fromRGB(220, 220, 225),   -- Lighter hover
        SliderThumb = Color3.fromRGB(50, 50, 50),      -- Dark thumb
        NotificationBackground = Color3.fromRGB(240, 240, 242),
        NotificationText = Color3.fromRGB(30, 30, 30),
        NotificationSubText = Color3.fromRGB(80, 80, 80),
        IconColor = Color3.fromRGB(100, 100, 100),
    },
    Vibrant = {
        MainBackground = Color3.fromRGB(28, 28, 32),    -- Dark base
        TopbarBackground = Color3.fromRGB(28, 28, 32),
        TabBackground = Color3.fromRGB(45, 45, 50),
        ElementBackground = Color3.fromRGB(45, 45, 50),
        InputBackground = Color3.fromRGB(60, 60, 65),
        AccentColor = Color3.fromRGB(255, 69, 0),      -- Orange Red (Vibrant)
        TextColor = Color3.fromRGB(240, 240, 245),
        SubTextColor = Color3.fromRGB(190, 190, 195),
        PlaceholderColor = Color3.fromRGB(130, 130, 135),
        ButtonHover = Color3.fromRGB(60, 60, 65),
        SliderThumb = Color3.fromRGB(255, 255, 255),
        NotificationBackground = Color3.fromRGB(40, 40, 45),
        NotificationText = Color3.fromRGB(250, 250, 255),
        NotificationSubText = Color3.fromRGB(200, 200, 205),
        IconColor = Color3.fromRGB(180, 180, 185),
    }
}

local CurrentThemeName = "Dark"
local CurrentTheme = Themes[CurrentThemeName]

local function applyTheme(guiElement, theme)
    -- This function applies the theme colors to UI elements recursively.
    -- I've kept it as is, as the colors are defined in the Themes table.
    if guiElement.Name == "Main" or guiElement.Name == "Topbar" or guiElement.Name == "ShowPrompt" then
        guiElement.BackgroundColor3 = theme.MainBackground
    elseif guiElement.Name == "TabButton" or guiElement.Name == "BottomDragBar" then
        guiElement.BackgroundColor3 = theme.TabBackground
    elseif guiElement.Name == "Selector" then
        guiElement.BackgroundColor3 = theme.AccentColor
    elseif guiElement.Name == "Title" or guiElement.Name == "TextLabel" then
        guiElement.TextColor3 = theme.TextColor
    elseif guiElement.Name == "Description" then
        guiElement.TextColor3 = theme.SubTextColor
    elseif guiElement:IsA("TextButton") and guiElement.BackgroundTransparency == 0 then
        guiElement.BackgroundColor3 = theme.ElementBackground
        guiElement.TextColor3 = theme.TextColor
    elseif guiElement:IsA("TextBox") then
        guiElement.BackgroundColor3 = theme.InputBackground
        guiElement.TextColor3 = theme.TextColor
        guiElement.PlaceholderColor3 = theme.PlaceholderColor
    elseif guiElement.Name == "Toggle" or guiElement.Name == "InputFrame" or guiElement.Name == "DropdownFrame" or guiElement.Name == "SliderFrame" or guiElement.Name == "ColorPickerFrame" or guiElement.Name == "TabSearchFrame" then
        guiElement.BackgroundColor3 = theme.ElementBackground
    elseif guiElement.Name == "ToggleButton" then
        guiElement.BackgroundColor3 = theme.InputBackground
    elseif guiElement.Name == "ToggleIndicator" then
        guiElement.BackgroundColor3 = theme.AccentColor -- Toggle indicator uses accent
    elseif guiElement.Name == "DropdownButton" then
        guiElement.BackgroundColor3 = theme.InputBackground
        guiElement.TextColor3 = theme.TextColor
    elseif guiElement.Name == "OptionsFrame" then
        guiElement.BackgroundColor3 = theme.InputBackground
    elseif guiElement.Name == "OptionButton" then
        guiElement.BackgroundColor3 = theme.ElementBackground
        guiElement.TextColor3 = theme.TextColor
    elseif guiElement.Name == "SliderBackground" then
        guiElement.BackgroundColor3 = theme.InputBackground
    elseif guiElement.Name == "SliderFill" then
        guiElement.BackgroundColor3 = theme.AccentColor
    elseif guiElement.Name == "SliderThumb" then
        guiElement.BackgroundColor3 = theme.SliderThumb
    elseif guiElement.Name == "Notification" then
        guiElement.BackgroundColor3 = theme.NotificationBackground
    elseif guiElement.Name == "NotifTitle" then
        guiElement.TextColor3 = theme.NotificationText
    elseif guiElement.Name == "NotifDesc" then
        guiElement.TextColor3 = theme.NotificationSubText
    elseif guiElement.Name == "Icon" or guiElement.Name == "CloseIcon" or guiElement.Name == "MinimizeIcon" or guiElement.Name == "DragHandle" or guiElement.Name == "ArrowIcon" or guiElement.Name == "TabIcon" or guiElement.Name == "SearchIcon" or guiElement.Name == "NotifIcon" then
        guiElement.ImageColor3 = theme.IconColor
    end

    for _, child in ipairs(guiElement:GetChildren()) do
        if child:IsA("GuiObject") then
            applyTheme(child, theme)
        end
    end
end

-- Library Functions
function EyeUI:CreateWindow(config)
    local Window = {}
    Window.__index = Window

    -- Default config
    config = config or {}
    config.Title = config.Title or "EyeUI"
    config.Description = config.Description or "A modern UI library"
    config.Icon = config.Icon or "default" -- Use Lucide icon name
    config.Size = config.Size or UDim2.new(0, 600, 0, 420) -- Slightly larger default size
    config.Position = config.Position or UDim2.new(0.5, -300, 0.5, -210)

    -- Create main ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "EyeUI"
    ScreenGui.Parent = PlayerGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false

    -- Main Frame
    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.BorderSizePixel = 0
    Main.Position = config.Position
    Main.Size = config.Size
    Main.Active = true
    Main.Draggable = false

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12) -- Consistent corner radius
    MainCorner.Parent = Main

    -- Topbar
    local Topbar = Instance.new("Frame")
    Topbar.Name = "Topbar"
    Topbar.Parent = Main
    Topbar.BorderSizePixel = 0
    Topbar.Size = UDim2.new(1, 0, 0, 55) -- Slightly taller Topbar
    Topbar.Active = true

    local TopbarCorner = Instance.new("UICorner")
    TopbarCorner.CornerRadius = UDim.new(0, 12)
    TopbarCorner.Parent = Topbar

    -- Icon
    local Icon = Instance.new("ImageLabel")
    Icon.Name = "Icon"
    Icon.Parent = Topbar
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0, 18, 0.5, -12) -- Adjusted position
    Icon.Size = UDim2.new(0, 24, 0, 24)
    Icon.Image = getLucideIcon(config.Icon)

    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = Topbar
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 58, 0, 10) -- Adjusted position
    Title.Size = UDim2.new(0, 250, 0, 20)
    Title.Font = Enum.Font.GothamBold
    Title.Text = config.Title
    Title.TextSize = 15 -- Slightly larger text
    Title.TextXAlignment = Enum.TextXAlignment.Left

    -- Description
    local Description = Instance.new("TextLabel")
    Description.Name = "Description"
    Description.Parent = Topbar
    Description.BackgroundTransparency = 1
    Description.Position = UDim2.new(0, 58, 0, 28) -- Adjusted position
    Description.Size = UDim2.new(0, 250, 0, 20)
    Description.Font = Enum.Font.GothamMedium -- Slightly less bold
    Description.Text = config.Description
    Description.TextSize = 13 -- Slightly larger text
    Description.TextXAlignment = Enum.TextXAlignment.Left

    -- Close Button
    local Close = Instance.new("TextButton")
    Close.Name = "Close"
    Close.Parent = Topbar
    Close.BackgroundTransparency = 1
    Close.Position = UDim2.new(1, -48, 0, 10) -- Adjusted position
    Close.Size = UDim2.new(0, 38, 0, 38) -- Slightly larger buttons
    Close.Font = Enum.Font.SourceSans
    Close.Text = ""
    Close.TextSize = 14

    local CloseIcon = Instance.new("ImageLabel")
    CloseIcon.Name = "CloseIcon"
    CloseIcon.Parent = Close
    CloseIcon.BackgroundTransparency = 1
    CloseIcon.Position = UDim2.new(0.5, -10, 0.5, -10) -- Centered icon
    CloseIcon.Size = UDim2.new(0, 20, 0, 20) -- Icon size
    CloseIcon.Image = getLucideIcon("close")

    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 8)
    CloseCorner.Parent = Close

    -- Minimize Button
    local Minimize = Instance.new("TextButton")
    Minimize.Name = "Minimize"
    Minimize.Parent = Topbar
    Minimize.BackgroundTransparency = 1
    Minimize.Position = UDim2.new(1, -90, 0, 10) -- Adjusted position
    Minimize.Size = UDim2.new(0, 38, 0, 38)
    Minimize.Font = Enum.Font.SourceSans
    Minimize.Text = ""
    Minimize.TextSize = 14

    local MinimizeIcon = Instance.new("ImageLabel")
    MinimizeIcon.Name = "MinimizeIcon"
    MinimizeIcon.Parent = Minimize
    MinimizeIcon.BackgroundTransparency = 1
    MinimizeIcon.Position = UDim2.new(0.5, -10, 0.5, -10)
    MinimizeIcon.Size = UDim2.new(0, 20, 0, 20)
    MinimizeIcon.Image = getLucideIcon("minimize")

    local MinimizeCorner = Instance.new("UICorner")
    MinimizeCorner.CornerRadius = UDim.new(0, 8)
    MinimizeCorner.Parent = Minimize

    -- Tab Container
    local TabsContainer = Instance.new("Frame")
    TabsContainer.Name = "TabsContainer"
    TabsContainer.Parent = Main
    TabsContainer.BackgroundTransparency = 1
    TabsContainer.Position = UDim2.new(0, 0, 0, 55)
    TabsContainer.Size = UDim2.new(0, 160, 1, -55) -- Wider tab container

    -- Tab Search Bar
    local TabSearchFrame = Instance.new("Frame")
    TabSearchFrame.Name = "TabSearchFrame"
    TabSearchFrame.Parent = TabsContainer
    TabSearchFrame.BorderSizePixel = 0
    TabSearchFrame.Size = UDim2.new(1, -20, 0, 35) -- Slightly taller search bar
    TabSearchFrame.Position = UDim2.new(0, 10, 0, 10) -- More padding

    local TabSearchCorner = Instance.new("UICorner")
    TabSearchCorner.CornerRadius = UDim.new(0, 10) -- Rounded corners for search
    TabSearchCorner.Parent = TabSearchFrame

    local TabSearchIcon = Instance.new("ImageLabel")
    TabSearchIcon.Name = "SearchIcon"
    TabSearchIcon.Parent = TabSearchFrame
    TabSearchIcon.BackgroundTransparency = 1
    TabSearchIcon.Image = getLucideIcon("search")
    TabSearchIcon.Size = UDim2.new(0, 20, 0, 20) -- Larger icon
    TabSearchIcon.Position = UDim2.new(0, 8, 0.5, -10) -- Adjusted icon position

    local TabSearchBox = Instance.new("TextBox")
    TabSearchBox.Name = "TabSearchBox"
    TabSearchBox.Parent = TabSearchFrame
    TabSearchBox.BackgroundTransparency = 1
    TabSearchBox.BorderSizePixel = 0
    TabSearchBox.Size = UDim2.new(1, -40, 1, 0) -- Adjusted size for text
    TabSearchBox.Position = UDim2.new(0, 35, 0, 0)
    TabSearchBox.PlaceholderText = "Search tabs..."
    TabSearchBox.Font = Enum.Font.Gotham
    TabSearchBox.TextSize = 14
    TabSearchBox.TextXAlignment = Enum.TextXAlignment.Left
    TabSearchBox.ClearTextOnFocus = false
    TabSearchBox.TextWrapped = true

    local TabsScrolling = Instance.new("ScrollingFrame")
    TabsScrolling.Parent = TabsContainer
    TabsScrolling.Active = true
    TabsScrolling.BackgroundTransparency = 1
    TabsScrolling.BorderSizePixel = 0
    TabsScrolling.Position = UDim2.new(0, 10, 0, 55) -- Adjusted position for search bar
    TabsScrolling.Size = UDim2.new(0, 140, 1, -65) -- Adjusted size with more vertical padding
    TabsScrolling.ScrollBarThickness = 0
    TabsScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)

    local TabsLayout = Instance.new("UIListLayout")
    TabsLayout.Parent = TabsScrolling
    TabsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabsLayout.Padding = UDim.new(0, 5) -- Increased padding between tabs

    -- Content Container
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Parent = Main
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.Position = UDim2.new(0, 170, 0, 65) -- Adjusted position
    ContentContainer.Size = UDim2.new(1, -185, 1, -80) -- Adjusted size with more padding

    -- Bottom Drag Bar
    local BottomDragBar = Instance.new("Frame")
    BottomDragBar.Name = "BottomDragBar"
    BottomDragBar.Parent = Main
    BottomDragBar.BackgroundTransparency = 0.8 -- More opaque
    BottomDragBar.BorderSizePixel = 0
    BottomDragBar.Position = UDim2.new(0.5, -80, 1, -25) -- Slightly higher and smaller
    BottomDragBar.Size = UDim2.new(0, 160, 0, 10) -- Thinner bar
    BottomDragBar.Active = true

    local BottomDragBarCorner = Instance.new("UICorner")
    BottomDragBarCorner.CornerRadius = UDim.new(1, 0)
    BottomDragBarCorner.Parent = BottomDragBar

    local DragHandle = Instance.new("ImageLabel")
    DragHandle.Name = "DragHandle"
    DragHandle.Parent = BottomDragBar
    DragHandle.BackgroundTransparency = 1
    DragHandle.Image = getLucideIcon("grip-horizontal")
    DragHandle.Size = UDim2.new(0, 20, 0, 20) -- Smaller icon
    DragHandle.AnchorPoint = Vector2.new(0.5, 0.5)
    DragHandle.Position = UDim2.new(0.5, 0, 0.5, 0)
    DragHandle.ZIndex = 2

    -- Show Prompt (for minimized state)
    local ShowPrompt = Instance.new("Frame")
    ShowPrompt.Name = "ShowPrompt"
    ShowPrompt.Parent = ScreenGui
    ShowPrompt.BorderSizePixel = 0
    ShowPrompt.Position = UDim2.new(0.5, -75, 0, 20) -- Larger prompt
    ShowPrompt.Size = UDim2.new(0, 150, 0, 40)
    ShowPrompt.Visible = false

    local PromptCorner = Instance.new("UICorner")
    PromptCorner.CornerRadius = UDim.new(1, 0)
    PromptCorner.Parent = ShowPrompt

    local PromptTitle = Instance.new("TextLabel")
    PromptTitle.Name = "TextLabel"
    PromptTitle.Parent = ShowPrompt
    PromptTitle.BackgroundTransparency = 1
    PromptTitle.Position = UDim2.new(0, 0, 0, 0)
    PromptTitle.Size = UDim2.new(1, 0, 1, 0)
    PromptTitle.Font = Enum.Font.GothamBold
    PromptTitle.Text = "Show " .. config.Title
    PromptTitle.TextSize = 15 -- Consistent text size
    PromptTitle.TextTransparency = 0.2 -- Slightly less transparent

    local PromptButton = Instance.new("TextButton")
    PromptButton.Name = "PromptButton"
    PromptButton.Parent = ShowPrompt
    PromptButton.BackgroundTransparency = 1
    PromptButton.Size = UDim2.new(1, 0, 1, 0)
    PromptButton.Text = ""
    PromptButton.ZIndex = 5

    -- Notifications Container
    local NotificationsContainer = Instance.new("Frame")
    NotificationsContainer.Name = "Notifications"
    NotificationsContainer.Parent = ScreenGui
    NotificationsContainer.BackgroundTransparency = 1
    NotificationsContainer.Position = UDim2.new(1, -330, 1, -20) -- Adjusted position
    NotificationsContainer.Size = UDim2.new(0, 300, 0, 800) -- Fixed width for notifications

    local NotificationsLayout = Instance.new("UIListLayout")
    NotificationsLayout.Parent = NotificationsContainer
    NotificationsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    NotificationsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    NotificationsLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    NotificationsLayout.Padding = UDim.new(0, 10) -- More padding between notifications

    -- Window Variables
    Window.ScreenGui = ScreenGui
    Window.Main = Main
    Window.TabsScrolling = TabsScrolling
    Window.ContentContainer = ContentContainer
    Window.ShowPrompt = ShowPrompt
    Window.NotificationsContainer = NotificationsContainer
    Window.TabsLayout = TabsLayout
    Window.Tabs = {}
    Window.CurrentTab = nil
    Window.IsMinimized = false

    -- Universal Draggable Function
    local isDragging = false
    local dragStart = nil
    local startPos = nil

    local function makeDraggable(draggableElement, targetFrame)
        draggableElement.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                isDragging = true
                dragStart = UserInputService:GetMouseLocation()
                startPos = targetFrame.Position
                UserInputService.MouseIconEnabled = false
                UserInputService.MouseIcon = "rbxassetid://6057088191" -- Custom drag icon (hand icon)
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - dragStart
                targetFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                isDragging = false
                UserInputService.MouseIconEnabled = true
                UserInputService.MouseIcon = ""
            end
        end)
    end

    -- Apply draggable to Topbar and BottomDragBar
    makeDraggable(Topbar, Main)
    makeDraggable(BottomDragBar, Main)

    -- Window Functions
    function Window:CreateTab(config)
        local Tab = {}
        Tab.__index = Tab

        config = config or {}
        config.Title = config.Title or "Tab"
        config.Icon = config.Icon or "default"

        -- Tab Button
        local TabButton = Instance.new("Frame")
        TabButton.Name = "TabButton"
        TabButton.Parent = self.TabsScrolling
        TabButton.BackgroundTransparency = 1
        TabButton.Size = UDim2.new(1, -10, 0, 40) -- Slightly taller tab buttons

        -- Tab Selector
        local TabSelector = Instance.new("Frame")
        TabSelector.Name = "Selector"
        TabSelector.Parent = TabButton
        TabSelector.BorderSizePixel = 0
        TabSelector.Position = UDim2.new(0, 0, 0.5, -10)
        TabSelector.Size = UDim2.new(0, 0, 0, 20)
        TabSelector.Visible = false

        local SelectorCorner = Instance.new("UICorner")
        SelectorCorner.CornerRadius = UDim.new(1, 0)
        SelectorCorner.Parent = TabSelector

        local TabIcon = Instance.new("ImageLabel")
        TabIcon.Name = "TabIcon"
        TabIcon.Parent = TabButton
        TabIcon.BackgroundTransparency = 1
        TabIcon.Position = UDim2.new(0, 18, 0.5, -10) -- Adjusted icon position
        TabIcon.Size = UDim2.new(0, 20, 0, 20) -- Slightly larger icon
        TabIcon.Image = getLucideIcon(config.Icon)

        local TabTitle = Instance.new("TextLabel")
        TabTitle.Name = "TextLabel"
        TabTitle.Parent = TabButton
        TabTitle.BackgroundTransparency = 1
        TabTitle.Position = UDim2.new(0, 48, 0, 5) -- Adjusted text position
        TabTitle.Size = UDim2.new(0, 100, 0, 30)
        TabTitle.Font = Enum.Font.GothamMedium -- Less bold, more readable
        TabTitle.Text = config.Title
        TabTitle.TextSize = 14
        TabTitle.TextXAlignment = Enum.TextXAlignment.Left

        local TabInteract = Instance.new("TextButton")
        TabInteract.Name = "TabInteract"
        TabInteract.Parent = TabButton
        TabInteract.BackgroundTransparency = 1
        TabInteract.Size = UDim2.new(1, 0, 1, 0)
        TabInteract.Text = ""
        TabInteract.Font = Enum.Font.SourceSans
        TabInteract.TextSize = 14

        -- Tab Content
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Name = "TabContent"
        TabContent.Parent = self.ContentContainer
        TabContent.Active = true
        TabContent.BackgroundTransparency = 1
        TabContent.BorderSizePixel = 0
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.ScrollBarThickness = 0
        TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        TabContent.Visible = false

        local ContentLayout = Instance.new("UIListLayout")
        ContentLayout.Parent = TabContent
        ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ContentLayout.Padding = UDim.new(0, 10) -- Increased padding for content elements

        local ContentPadding = Instance.new("UIPadding")
        ContentPadding.Parent = TabContent
        ContentPadding.PaddingLeft = UDim.new(0, 10)
        ContentPadding.PaddingRight = UDim.new(0, 10)
        ContentPadding.PaddingTop = UDim.new(0, 10)
        ContentPadding.PaddingBottom = UDim.new(0, 10)

        -- Tab Object
        Tab.TabButton = TabButton
        Tab.TabContent = TabContent
        Tab.TabSelector = TabSelector
        Tab.ContentLayout = ContentLayout
        Tab.Window = self
        Tab.Title = config.Title
        Tab.Icon = config.Icon
        Tab.TabTitleLabel = TabTitle

        -- Tab Functions
        function Tab:Select()
            for _, tab in pairs(self.Window.Tabs) do
                tab.TabContent.Visible = false
                if tab ~= self then
                    -- Animate selector out (slightly faster, Quad ease)
                    local tweenOut = TweenService:Create(tab.TabSelector, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                        Size = UDim2.new(0, 0, 0, 20),
                        Position = UDim2.new(0, 0, 0.5, -10)
                    })
                    tweenOut:Play()
                    tweenOut.Completed:Wait()
                    tab.TabSelector.Visible = false
                end
            end

            self.TabContent.Visible = true
            self.TabSelector.Visible = true

            -- Animate selector in with slight overshoot (Back ease)
            local tweenSize = TweenService:Create(self.TabSelector, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 5, 0, 20) -- Slightly thicker selector
            })

            local tweenPos = TweenService:Create(self.TabSelector, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Position = UDim2.new(0, 5, 0.5, -10)
            })

            tweenSize:Play()
            tweenPos:Play()

            self.Window.CurrentTab = self
        end

        local function updateTabCanvasSize()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + ContentLayout.Padding.Offset) -- Account for padding
        end

        function Tab:CreateButton(config)
            config = config or {}
            config.Title = config.Title or "Button"
            config.Callback = config.Callback or function() end

            local Button = Instance.new("TextButton")
            Button.Name = "Button"
            Button.Parent = self.TabContent
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(1, 0, 0, 45) -- Taller buttons
            Button.Font = Enum.Font.GothamBold
            Button.Text = config.Title
            Button.TextSize = 15 -- Consistent text size

            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 10) -- More rounded
            ButtonCorner.Parent = Button

            -- Hover effect
            Button.MouseEnter:Connect(function()
                TweenService:Create(Button, TweenInfo.new(0.15), {BackgroundColor3 = CurrentTheme.ButtonHover}):Play()
            end)
            Button.MouseLeave:Connect(function()
                TweenService:Create(Button, TweenInfo.new(0.15), {BackgroundColor3 = CurrentTheme.ElementBackground}):Play()
            end)

            Button.MouseButton1Click:Connect(config.Callback)

            updateTabCanvasSize()

            return Button
        end

        function Tab:CreateToggle(config)
            config = config or {}
            config.Title = config.Title or "Toggle"
            config.Default = config.Default or false
            config.Callback = config.Callback or function() end

            local Toggle = Instance.new("Frame")
            Toggle.Name = "Toggle"
            Toggle.Parent = self.TabContent
            Toggle.BorderSizePixel = 0
            Toggle.Size = UDim2.new(1, 0, 0, 45) -- Taller toggle

            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(0, 10)
            ToggleCorner.Parent = Toggle

            local ToggleTitle = Instance.new("TextLabel")
            ToggleTitle.Name = "TextLabel"
            ToggleTitle.Parent = Toggle
            ToggleTitle.BackgroundTransparency = 1
            ToggleTitle.Position = UDim2.new(0, 15, 0, 0)
            ToggleTitle.Size = UDim2.new(1, -70, 1, 0) -- More room for toggle button
            ToggleTitle.Font = Enum.Font.GothamMedium
            ToggleTitle.Text = config.Title
            ToggleTitle.TextSize = 14
            ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Name = "ToggleButton"
            ToggleButton.Parent = Toggle
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Position = UDim2.new(1, -55, 0.5, -12) -- Adjusted position
            ToggleButton.Size = UDim2.new(0, 40, 0, 24) -- Wider toggle button
            ToggleButton.Text = ""

            local ToggleButtonCorner = Instance.new("UICorner")
            ToggleButtonCorner.CornerRadius = UDim.new(1, 0)
            ToggleButtonCorner.Parent = ToggleButton

            local ToggleIndicator = Instance.new("Frame")
            ToggleIndicator.Name = "ToggleIndicator"
            ToggleIndicator.Parent = ToggleButton
            ToggleIndicator.BorderSizePixel = 0
            ToggleIndicator.Position = UDim2.new(0, 3, 0, 3) -- Adjusted padding
            ToggleIndicator.Size = UDim2.new(0, 18, 0, 18) -- Larger indicator

            local IndicatorCorner = Instance.new("UICorner")
            IndicatorCorner.CornerRadius = UDim.new(1, 0)
            IndicatorCorner.Parent = ToggleIndicator

            local isToggled = config.Default

            local function UpdateToggleState()
                if isToggled then
                    TweenService:Create(ToggleIndicator, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Position = UDim2.new(0, 19, 0, 3)}):Play()
                    TweenService:Create(ToggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = CurrentTheme.AccentColor}):Play()
                else
                    TweenService:Create(ToggleIndicator, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Position = UDim2.new(0, 3, 0, 3)}):Play()
                    TweenService:Create(ToggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = CurrentTheme.InputBackground}):Play()
                end
            end

            ToggleButton.MouseButton1Click:Connect(function()
                isToggled = not isToggled
                UpdateToggleState()
                config.Callback(isToggled)
            end)

            UpdateToggleState()

            updateTabCanvasSize()

            return Toggle
        end

        function Tab:CreateInput(config)
            config = config or {}
            config.Title = config.Title or "Input"
            config.Placeholder = config.Placeholder or "Enter text here..."
            config.Default = config.Default or ""
            config.Callback = config.Callback or function(text) end

            local InputFrame = Instance.new("Frame")
            InputFrame.Name = "InputFrame"
            InputFrame.Parent = self.TabContent
            InputFrame.BorderSizePixel = 0
            InputFrame.Size = UDim2.new(1, 0, 0, 70) -- Taller input frame

            local InputCorner = Instance.new("UICorner")
            InputCorner.CornerRadius = UDim.new(0, 10)
            InputCorner.Parent = InputFrame

            local InputTitle = Instance.new("TextLabel")
            InputTitle.Name = "TextLabel"
            InputTitle.Parent = InputFrame
            InputTitle.BackgroundTransparency = 1
            InputTitle.Position = UDim2.new(0, 15, 0, 8) -- Adjusted title position
            InputTitle.Size = UDim2.new(1, -30, 0, 20)
            InputTitle.Font = Enum.Font.GothamMedium
            InputTitle.Text = config.Title
            InputTitle.TextSize = 14
            InputTitle.TextXAlignment = Enum.TextXAlignment.Left

            local TextBox = Instance.new("TextBox")
            TextBox.Name = "TextBox"
            TextBox.Parent = InputFrame
            TextBox.BorderSizePixel = 0
            TextBox.Position = UDim2.new(0, 15, 0, 35) -- Adjusted text box position
            TextBox.Size = UDim2.new(1, -30, 0, 30) -- Taller text box
            TextBox.Font = Enum.Font.Gotham
            TextBox.Text = config.Default
            TextBox.PlaceholderText = config.Placeholder
            TextBox.TextSize = 14
            TextBox.TextXAlignment = Enum.TextXAlignment.Left
            TextBox.ClearTextOnFocus = false
            TextBox.TextWrapped = true

            local TextBoxCorner = Instance.new("UICorner")
            TextBoxCorner.CornerRadius = UDim.new(0, 8) -- Slightly less rounded than frame
            TextBoxCorner.Parent = TextBox

            TextBox.FocusLost:Connect(function(enterPressed)
                if enterPressed then
                    config.Callback(TextBox.Text)
                end
            end)

            updateTabCanvasSize()

            return TextBox
        end

        function Tab:CreateDropdown(config)
            config = config or {}
            config.Title = config.Title or "Dropdown"
            config.Options = config.Options or {"Option 1", "Option 2", "Option 3"}
            config.Default = config.Default or config.Options[1]
            config.Callback = config.Callback or function(value) end

            local DropdownFrame = Instance.new("Frame")
            DropdownFrame.Name = "DropdownFrame"
            DropdownFrame.Parent = self.TabContent
            DropdownFrame.BorderSizePixel = 0
            DropdownFrame.Size = UDim2.new(1, 0, 0, 70) -- Taller dropdown frame

            local DropdownCorner = Instance.new("UICorner")
            DropdownCorner.CornerRadius = UDim.new(0, 10)
            DropdownCorner.Parent = DropdownFrame

            local DropdownTitle = Instance.new("TextLabel")
            DropdownTitle.Name = "TextLabel"
            DropdownTitle.Parent = DropdownFrame
            DropdownTitle.BackgroundTransparency = 1
            DropdownTitle.Position = UDim2.new(0, 15, 0, 8)
            DropdownTitle.Size = UDim2.new(1, -30, 0, 20)
            DropdownTitle.Font = Enum.Font.GothamMedium
            DropdownTitle.Text = config.Title
            DropdownTitle.TextSize = 14
            DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left

            local DropdownButton = Instance.new("TextButton")
            DropdownButton.Name = "DropdownButton"
            DropdownButton.Parent = DropdownFrame
            DropdownButton.BorderSizePixel = 0
            DropdownButton.Position = UDim2.new(0, 15, 0, 35)
            DropdownButton.Size = UDim2.new(1, -30, 0, 30)
            DropdownButton.Font = Enum.Font.Gotham
            DropdownButton.Text = config.Default
            DropdownButton.TextSize = 14
            DropdownButton.TextXAlignment = Enum.TextXAlignment.Left
            DropdownButton.TextWrapped = true

            local DropdownButtonCorner = Instance.new("UICorner")
            DropdownButtonCorner.CornerRadius = UDim.new(0, 8)
            DropdownButtonCorner.Parent = DropdownButton

            local ArrowIcon = Instance.new("ImageLabel")
            ArrowIcon.Name = "ArrowIcon"
            ArrowIcon.Parent = DropdownButton
            ArrowIcon.BackgroundTransparency = 1
            ArrowIcon.AnchorPoint = Vector2.new(1, 0.5)
            ArrowIcon.Position = UDim2.new(1, -12, 0.5, 0)
            ArrowIcon.Size = UDim2.new(0, 18, 0, 18) -- Larger arrow icon
            ArrowIcon.Image = getLucideIcon("chevron-down") -- Specific chevron icon

            local OptionsFrame = Instance.new("Frame")
            OptionsFrame.Name = "OptionsFrame"
            OptionsFrame.Parent = DropdownFrame
            OptionsFrame.BorderSizePixel = 0
            OptionsFrame.Position = UDim2.new(0, 15, 0, 65) -- Position below button
            OptionsFrame.Size = UDim2.new(1, -30, 0, 0)
            OptionsFrame.Visible = false
            OptionsFrame.ZIndex = DropdownButton.ZIndex + 1
            OptionsFrame.ClipsDescendants = true

            local OptionsCorner = Instance.new("UICorner") -- Added corner for options frame
            OptionsCorner.CornerRadius = UDim.new(0, 8)
            OptionsCorner.Parent = OptionsFrame

            local OptionsLayout = Instance.new("UIListLayout")
            OptionsLayout.Parent = OptionsFrame
            OptionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
            OptionsLayout.Padding = UDim.new(0, 3) -- Slightly more padding

            local isExpanded = false

            local function ToggleDropdown()
                isExpanded = not isExpanded
                if isExpanded then
                    local targetHeight = #config.Options * 30 -- 27 height + 3 padding
                    OptionsFrame.Visible = true
                    TweenService:Create(OptionsFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {Size = UDim2.new(1, -30, 0, targetHeight)}):Play()
                    TweenService:Create(ArrowIcon, TweenInfo.new(0.25), {Rotation = 180}):Play()
                else
                    TweenService:Create(OptionsFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {Size = UDim2.new(1, -30, 0, 0)}):Play()
                    TweenService:Create(ArrowIcon, TweenInfo.new(0.25), {Rotation = 0}):Play()
                    task.delay(0.25, function() OptionsFrame.Visible = false end)
                end
            end

            DropdownButton.MouseButton1Click:Connect(ToggleDropdown)

            for _, optionText in ipairs(config.Options) do
                local OptionButton = Instance.new("TextButton")
                OptionButton.Name = "OptionButton"
                OptionButton.Parent = OptionsFrame
                OptionButton.BorderSizePixel = 0
                OptionButton.Size = UDim2.new(1, 0, 0, 27) -- Taller option buttons
                OptionButton.Font = Enum.Font.Gotham
                OptionButton.Text = optionText
                OptionButton.TextSize = 13
                OptionButton.TextXAlignment = Enum.TextXAlignment.Left
                OptionButton.TextScaled = false
                OptionButton.TextWrapped = false
                OptionButton.ClipsDescendants = true

                local OptionPadding = Instance.new("UIPadding")
                OptionPadding.Parent = OptionButton
                OptionPadding.PaddingLeft = UDim.new(0, 8) -- More padding

                OptionButton.MouseEnter:Connect(function()
                    TweenService:Create(OptionButton, TweenInfo.new(0.1), {BackgroundColor3 = CurrentTheme.ButtonHover}):Play()
                end)
                OptionButton.MouseLeave:Connect(function()
                    TweenService:Create(OptionButton, TweenInfo.new(0.1), {BackgroundColor3 = CurrentTheme.ElementBackground}):Play()
                end)

                OptionButton.MouseButton1Click:Connect(function()
                    DropdownButton.Text = optionText
                    config.Callback(optionText)
                    ToggleDropdown()
                end)
            end

            updateTabCanvasSize()

            return DropdownFrame
        end

        function Tab:CreateSlider(config)
            config = config or {}
            config.Title = config.Title or "Slider"
            config.Min = config.Min or 0
            config.Max = config.Max or 100
            config.Default = config.Default or ((config.Min + config.Max) / 2)
            config.Step = config.Step or 1
            config.Callback = config.Callback or function(value) end

            local SliderFrame = Instance.new("Frame")
            SliderFrame.Name = "SliderFrame"
            SliderFrame.Parent = self.TabContent
            SliderFrame.BorderSizePixel = 0
            SliderFrame.Size = UDim2.new(1, 0, 0, 70) -- Taller slider frame

            local SliderCorner = Instance.new("UICorner")
            SliderCorner.CornerRadius = UDim.new(0, 10)
            SliderCorner.Parent = SliderFrame

            local SliderTitle = Instance.new("TextLabel")
            SliderTitle.Name = "TextLabel"
            SliderTitle.Parent = SliderFrame
            SliderTitle.BackgroundTransparency = 1
            SliderTitle.Position = UDim2.new(0, 15, 0, 8)
            SliderTitle.Size = UDim2.new(1, -80, 0, 20) -- More space for value label
            SliderTitle.Font = Enum.Font.GothamMedium
            SliderTitle.Text = config.Title
            SliderTitle.TextSize = 14
            SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

            local ValueLabel = Instance.new("TextLabel")
            ValueLabel.Name = "TextLabel"
            ValueLabel.Parent = SliderFrame
            ValueLabel.BackgroundTransparency = 1
            ValueLabel.Position = UDim2.new(1, -75, 0, 8) -- Adjusted position
            ValueLabel.Size = UDim2.new(0, 60, 0, 20)
            ValueLabel.Font = Enum.Font.Gotham
            ValueLabel.TextSize = 14
            ValueLabel.TextXAlignment = Enum.TextXAlignment.Right

            local SliderBackground = Instance.new("Frame")
            SliderBackground.Name = "SliderBackground"
            SliderBackground.Parent = SliderFrame
            SliderBackground.BorderSizePixel = 0
            SliderBackground.Position = UDim2.new(0, 15, 0, 42) -- Adjusted position
            SliderBackground.Size = UDim2.new(1, -30, 0, 6) -- Slightly thicker track

            local SliderBackgroundCorner = Instance.new("UICorner")
            SliderBackgroundCorner.CornerRadius = UDim.new(1, 0)
            SliderBackgroundCorner.Parent = SliderBackground

            local SliderFill = Instance.new("Frame")
            SliderFill.Name = "SliderFill"
            SliderFill.Parent = SliderBackground
            SliderFill.BorderSizePixel = 0
            SliderFill.Size = UDim2.new(0, 0, 1, 0)

            local SliderFillCorner = Instance.new("UICorner")
            SliderFillCorner.CornerRadius = UDim.new(1, 0)
            SliderFillCorner.Parent = SliderFill

            local SliderThumb = Instance.new("Frame")
            SliderThumb.Name = "SliderThumb"
            SliderThumb.Parent = SliderBackground
            SliderThumb.BorderSizePixel = 0
            SliderThumb.Size = UDim2.new(0, 18, 0, 18) -- Larger thumb
            SliderThumb.AnchorPoint = Vector2.new(0.5, 0.5)
            SliderThumb.Position = UDim2.new(0, 0, 0.5, 0)
            SliderThumb.ZIndex = SliderBackground.ZIndex + 1

            local ThumbCorner = Instance.new("UICorner")
            ThumbCorner.CornerRadius = UDim.new(1, 0)
            ThumbCorner.Parent = SliderThumb

            local CurrentValue = config.Default
            local isDraggingSlider = false

            local function UpdateSlider(inputPos)
                local relativeX = math.clamp(inputPos.X - SliderBackground.AbsolutePosition.X, 0, SliderBackground.AbsoluteSize.X)
                local percentage = relativeX / SliderBackground.AbsoluteSize.X
                local newValue = config.Min + (percentage * (config.Max - config.Min))
                CurrentValue = math.round(newValue / config.Step) * config.Step
                CurrentValue = math.clamp(CurrentValue, config.Min, config.Max)

                local thumbPosition = (CurrentValue - config.Min) / (config.Max - config.Min)
                TweenService:Create(SliderThumb, TweenInfo.new(0.05), {Position = UDim2.new(thumbPosition, 0, 0.5, 0)}):Play()
                TweenService:Create(SliderFill, TweenInfo.new(0.05), {Size = UDim2.new(thumbPosition, 0, 1, 0)}):Play()

                ValueLabel.Text = string.format("%.0f", CurrentValue)
                config.Callback(CurrentValue)
            end

            ValueLabel.Text = string.format("%.0f", CurrentValue)
            local initialThumbPosition = (config.Default - config.Min) / (config.Max - config.Min)
            SliderThumb.Position = UDim2.new(initialThumbPosition, 0, 0.5, 0)
            SliderFill.Size = UDim2.new(initialThumbPosition, 0, 1, 0)

            SliderThumb.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    isDraggingSlider = true
                    UpdateSlider(input.Position)
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if isDraggingSlider and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    UpdateSlider(input.Position)
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                    isDraggingSlider = false
                end
            end)

            SliderBackground.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    isDraggingSlider = true
                    UpdateSlider(input.Position)
                end
            end)

            updateTabCanvasSize()

            return SliderFrame
        end

        function Tab:CreateColorPicker(config)
            config = config or {}
            config.Title = config.Title or "Color Picker"
            config.Default = config.Default or Color3.fromRGB(255, 0, 0)
            config.Callback = config.Callback or function(color) end

            local ColorPickerFrame = Instance.new("Frame")
            ColorPickerFrame.Name = "ColorPickerFrame"
            ColorPickerFrame.Parent = self.TabContent
            ColorPickerFrame.BorderSizePixel = 0
            ColorPickerFrame.Size = UDim2.new(1, 0, 0, 190) -- Taller frame

            local ColorPickerCorner = Instance.new("UICorner")
            ColorPickerCorner.CornerRadius = UDim.new(0, 10)
            ColorPickerCorner.Parent = ColorPickerFrame

            local ColorPickerTitle = Instance.new("TextLabel")
            ColorPickerTitle.Name = "TextLabel"
            ColorPickerTitle.Parent = ColorPickerFrame
            ColorPickerTitle.BackgroundTransparency = 1
            ColorPickerTitle.Position = UDim2.new(0, 15, 0, 8)
            ColorPickerTitle.Size = UDim2.new(1, -30, 0, 20)
            ColorPickerTitle.Font = Enum.Font.GothamMedium
            ColorPickerTitle.Text = config.Title
            ColorPickerTitle.TextSize = 14
            ColorPickerTitle.TextXAlignment = Enum.TextXAlignment.Left

            local CurrentColorPreview = Instance.new("Frame")
            CurrentColorPreview.Name = "CurrentColorPreview"
            CurrentColorPreview.Parent = ColorPickerFrame
            CurrentColorPreview.BackgroundColor3 = config.Default
            CurrentColorPreview.BorderSizePixel = 0
            CurrentColorPreview.Position = UDim2.new(0, 15, 0, 35) -- Adjusted position
            CurrentColorPreview.Size = UDim2.new(0, 35, 0, 35) -- Larger preview

            local PreviewCorner = Instance.new("UICorner")
            PreviewCorner.CornerRadius = UDim.new(0, 8)
            PreviewCorner.Parent = CurrentColorPreview

            local ColorWheel = Instance.new("ImageLabel")
            ColorWheel.Name = "ColorWheel"
            ColorWheel.Parent = ColorPickerFrame
            ColorWheel.BackgroundTransparency = 1
            ColorWheel.Position = UDim2.new(0, 15, 0, 75) -- Adjusted position
            ColorWheel.Size = UDim2.new(1, -30, 0, 100)
            ColorWheel.Image = "rbxassetid://6022240974" -- Placeholder for a generic color wheel image.
            ColorWheel.Active = true

            local ColorPickerThumb = Instance.new("Frame")
            ColorPickerThumb.Name = "ColorPickerThumb"
            ColorPickerThumb.Parent = ColorWheel
            ColorPickerThumb.BackgroundColor3 = Color3.fromRGB(255,255,255)
            ColorPickerThumb.BorderSizePixel = 1
            ColorPickerThumb.BorderColor3 = Color3.fromRGB(0,0,0)
            ColorPickerThumb.Size = UDim2.new(0, 12, 0, 12) -- Slightly larger thumb
            ColorPickerThumb.AnchorPoint = Vector2.new(0.5, 0.5)
            ColorPickerThumb.ZIndex = 2

            local ThumbCircle = Instance.new("UICorner")
            ThumbCircle.CornerRadius = UDim.new(1, 0)
            ThumbCircle.Parent = ColorPickerThumb

            local isDraggingColor = false
            local lastColor = config.Default

            local function HSVtoRGB(h, s, v)
                local i = math.floor(h * 6)
                local f = h * 6 - i
                local p = v * (1 - s)
                local q = v * (1 - f * s)
                local t = v * (1 - (1 - f) * s)

                if i == 0 then
                    return Color3.new(v, t, p)
                elseif i == 1 then
                    return Color3.new(q, v, p)
                elseif i == 2 then
                    return Color3.new(p, v, t)
                elseif i == 3 then
                    return Color3.new(p, q, v)
                elseif i == 4 then
                    return Color3.new(t, p, v)
                elseif i == 5 then
                    return Color3.new(v, p, q)
                end
                return Color3.new(0,0,0)
            end

            local function UpdateColor(inputPos)
                local x = inputPos.X - ColorWheel.AbsolutePosition.X
                local y = inputPos.Y - ColorWheel.AbsolutePosition.Y

                local normX = math.clamp(x / ColorWheel.AbsoluteSize.X, 0, 1)
                local normY = math.clamp(y / ColorWheel.AbsoluteSize.Y, 0, 1)

                ColorPickerThumb.Position = UDim2.new(normX, 0, normY, 0)

                local hue = normX
                local saturation = 1 - normY
                local value = 1

                local pickedColor = HSVtoRGB(hue, saturation, value)
                CurrentColorPreview.BackgroundColor3 = pickedColor
                config.Callback(pickedColor)
                lastColor = pickedColor
            end

            ColorWheel.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    isDraggingColor = true
                    UpdateColor(input.Position)
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if isDraggingColor and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    UpdateColor(input.Position)
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                    isDraggingColor = false
                end
            end)

            local h, s, v = config.Default:ToHSV()
            ColorPickerThumb.Position = UDim2.new(h, 0, 1 - s, 0)
            CurrentColorPreview.BackgroundColor3 = config.Default
            config.Callback(config.Default)

            updateTabCanvasSize()

            return ColorPickerFrame
        end

        TabInteract.MouseButton1Click:Connect(function()
            Tab:Select()
        end)

        table.insert(self.Tabs, Tab)

        self.TabsScrolling.CanvasSize = UDim2.new(0, 0, 0, self.TabsLayout.AbsoluteContentSize.Y + self.TabsLayout.Padding.Offset * #self.Tabs)

        if #self.Tabs == 1 then
            Tab:Select()
        end

        return Tab
    end

    function Window:Minimize()
        self.IsMinimized = true
        local tweenOut = TweenService:Create(self.Main, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = self.Main.Position + UDim2.new(0,0,1,0)}) -- Slide down
        tweenOut:Play()
        tweenOut.Completed:Connect(function()
            self.Main.Visible = false
            self.ShowPrompt.Visible = true
            TweenService:Create(self.ShowPrompt, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -75, 0, 20)}):Play()
        end)
    end

    function Window:Restore()
        self.IsMinimized = false
        TweenService:Create(self.ShowPrompt, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = self.ShowPrompt.Position - UDim2.new(0,0,1,0)}):Play() -- Slide prompt out
        self.ShowPrompt.Visible = false
        self.Main.Visible = true
        TweenService:Create(self.Main, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = config.Position}):Play() -- Slide main window back
    end

    function Window:Destroy()
        self.ScreenGui:Destroy()
    end

    function Window:Notification(config)
        config = config or {}
        config.Title = config.Title or "Notification"
        config.Description = config.Description or "No description provided"
        config.Icon = config.Icon
        config.Duration = config.Duration or 4 -- Slightly shorter default duration
        config.Type = config.Type or "info" -- "info", "success", "warning", "error"

        spawn(function()
            local Notification = Instance.new("Frame")
            Notification.Name = "Notification"
            Notification.Parent = self.NotificationsContainer
            Notification.BorderSizePixel = 0
            Notification.Size = UDim2.new(1, 0, 0, 85) -- Slightly taller notifications

            local NotifCorner = Instance.new("UICorner")
            NotifCorner.CornerRadius = UDim.new(0, 12)
            NotifCorner.Parent = Notification

            local NotifIcon = Instance.new("ImageLabel")
            NotifIcon.Name = "NotifIcon"
            NotifIcon.Parent = Notification
            NotifIcon.BackgroundTransparency = 1
            NotifIcon.Position = UDim2.new(0, 18, 0.5, -12) -- Adjusted icon position
            NotifIcon.Size = UDim2.new(0, 24, 0, 24)

            if not config.Icon then
                if config.Type == "success" then NotifIcon.Image = getLucideIcon("check-circle")
                elseif config.Type == "warning" then NotifIcon.Image = getLucideIcon("alert-triangle")
                elseif config.Type == "error" then NotifIcon.Image = getLucideIcon("x-circle")
                else NotifIcon.Image = getLucideIcon("info") end
            else
                NotifIcon.Image = getLucideIcon(config.Icon)
            end

            local NotifTitle = Instance.new("TextLabel")
            NotifTitle.Name = "NotifTitle"
            NotifTitle.Parent = Notification
            NotifTitle.BackgroundTransparency = 1
            NotifTitle.Position = UDim2.new(0, 55, 0, 12) -- Adjusted text position
            NotifTitle.Size = UDim2.new(1, -70, 0, 20)
            NotifTitle.Font = Enum.Font.GothamBold
            NotifTitle.Text = config.Title
            NotifTitle.TextSize = 16
            NotifTitle.TextXAlignment = Enum.TextXAlignment.Left

            local NotifDesc = Instance.new("TextLabel")
            NotifDesc.Name = "NotifDesc"
            NotifDesc.Parent = Notification
            NotifDesc.BackgroundTransparency = 1
            NotifDesc.Position = UDim2.new(0, 55, 0, 35)
            NotifDesc.Size = UDim2.new(1, -70, 0, 40)
            NotifDesc.Font = Enum.Font.Gotham
            NotifDesc.Text = config.Description
            NotifDesc.TextSize = 14
            NotifDesc.TextWrapped = true
            NotifDesc.TextXAlignment = Enum.TextXAlignment.Left
            NotifDesc.TextYAlignment = Enum.TextYAlignment.Top

            applyTheme(Notification, CurrentTheme)

            Notification.Position = UDim2.new(1, 0, 0, 0) -- Start off-screen
            local tweenIn = TweenService:Create(Notification, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0)})
            tweenIn:Play()

            task.wait(config.Duration)
            local tweenOut = TweenService:Create(Notification, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(1, 0, 0, 0)})
            tweenOut:Play()

            tweenOut.Completed:Connect(function()
                Notification:Destroy()
            end)
        end)
    end

    function Window:SetTheme(themeName)
        local newTheme = Themes[themeName]
        if newTheme then
            CurrentTheme = newTheme
            CurrentThemeName = themeName
            applyTheme(self.Main, CurrentTheme)
            applyTheme(self.ShowPrompt, CurrentTheme)
            for _, tab in pairs(self.Tabs) do
                applyTheme(tab.TabButton, CurrentTheme)
                if tab == self.CurrentTab then
                    tab.TabSelector.BackgroundColor3 = CurrentTheme.AccentColor
                end
            end
        else
            warn("Theme '" .. themeName .. "' not found. Available themes: " .. table.concat(table.keys(Themes), ", "))
        end
    end

    TabSearchBox.Changed:Connect(function(property)
        if property == "Text" then
            local searchText = TabSearchBox.Text:lower()
            for _, tab in ipairs(Window.Tabs) do
                local tabTitle = tab.Title:lower()
                if tabTitle:find(searchText) then
                    tab.TabButton.Visible = true
                else
                    tab.TabButton.Visible = false
                end
            end
            Window.TabsScrolling.CanvasSize = UDim2.new(0, 0, 0, Window.TabsLayout.AbsoluteContentSize.Y + Window.TabsLayout.Padding.Offset * #Window.Tabs)
        end
    end)

    Close.MouseButton1Click:Connect(function()
        Window:Destroy()
    end)

    Minimize.MouseButton1Click:Connect(function()
        Window:Minimize()
    end)

    PromptButton.MouseButton1Click:Connect(function()
        Window:Restore()
    end)

    applyTheme(Main, CurrentTheme)
    applyTheme(ShowPrompt, CurrentTheme)

    return Window
end

return EyeUI
