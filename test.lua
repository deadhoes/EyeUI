-- EyeUI Library
-- A modern UI library for Roblox

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
    ["default"] = "rbxassetid://10709770005", -- Default placeholder icon
    ["close"] = "rbxassetid://10747384394",
    ["minimize"] = "rbxassetid://10734896206",
    ["info"] = "rbxassetid://10709770005", -- Placeholder for info icon
    ["alert-triangle"] = "rbxassetid://10709770005", -- Placeholder for warning icon
    ["check-circle"] = "rbxassetid://10709770005", -- Placeholder for success icon
    ["x-circle"] = "rbxassetid://10709770005", -- Placeholder for error icon
    ["grip-horizontal"] = "rbxassetid://10734896206", -- Placeholder for a grip icon for the drag bar
    ["search"] = "rbxassetid://10723407389", -- Placeholder for search/magnifying glass icon
    ["palette"] = "rbxassetid://10723407389", -- Placeholder for palette icon

    -- Tab Icons (examples, replace with actual Lucide equivalents)
    ["settings"] = "rbxassetid://10723407389", -- Placeholder for settings/gear icon
    ["home"] = "rbxassetid://10723407389", -- Placeholder for home icon
    ["tool"] = "rbxassetid://10723407389", -- Placeholder for tool icon
    ["sliders"] = "rbxassetid://10723407389", -- Placeholder for sliders icon
    ["message-square"] = "rbxassetid://10723407389", -- Placeholder for message/chat icon
    ["shield"] = "rbxassetid://10723407389", -- Placeholder for shield icon
    ["user"] = "rbxassetid://10723407389", -- Placeholder for user icon
    -- Add more Lucide icons as you upload them:
    -- ["icon-name"] = "rbxassetid://YOUR_ASSET_ID",
}

-- Helper function to get Lucide icon asset ID
local function getLucideIcon(iconName)
    return LucideIcons[iconName] or LucideIcons["default"]
end

-- Theme Definitions
local Themes = {
    Dark = {
        MainBackground = Color3.fromRGB(20, 20, 20),
        TopbarBackground = Color3.fromRGB(20, 20, 20),
        TabBackground = Color3.fromRGB(30, 30, 30),
        ElementBackground = Color3.fromRGB(30, 30, 30),
        InputBackground = Color3.fromRGB(40, 40, 40),
        AccentColor = Color3.fromRGB(0, 162, 255),
        TextColor = Color3.fromRGB(230, 230, 230),
        SubTextColor = Color3.fromRGB(190, 190, 190),
        PlaceholderColor = Color3.fromRGB(150, 150, 150),
        ButtonHover = Color3.fromRGB(40, 40, 40),
        SliderThumb = Color3.fromRGB(255, 255, 255),
        NotificationBackground = Color3.fromRGB(25, 25, 25),
        NotificationText = Color3.fromRGB(255, 255, 255),
        NotificationSubText = Color3.fromRGB(200, 200, 200),
        IconColor = Color3.fromRGB(150, 150, 150),
    },
    Light = {
        MainBackground = Color3.fromRGB(240, 240, 240),
        TopbarBackground = Color3.fromRGB(240, 240, 240),
        TabBackground = Color3.fromRGB(230, 230, 230),
        ElementBackground = Color3.fromRGB(230, 230, 230),
        InputBackground = Color3.fromRGB(220, 220, 220),
        AccentColor = Color3.fromRGB(0, 120, 215),
        TextColor = Color3.fromRGB(30, 30, 30),
        SubTextColor = Color3.fromRGB(70, 70, 70),
        PlaceholderColor = Color3.fromRGB(100, 100, 100),
        ButtonHover = Color3.fromRGB(220, 220, 220),
        SliderThumb = Color3.fromRGB(50, 50, 50),
        NotificationBackground = Color3.fromRGB(235, 235, 235),
        NotificationText = Color3.fromRGB(20, 20, 20),
        NotificationSubText = Color3.fromRGB(70, 70, 70),
        IconColor = Color3.fromRGB(100, 100, 100),
    },
    Blue = {
        MainBackground = Color3.fromRGB(25, 35, 45),
        TopbarBackground = Color3.fromRGB(25, 35, 45),
        TabBackground = Color3.fromRGB(35, 50, 65),
        ElementBackground = Color3.fromRGB(35, 50, 65),
        InputBackground = Color3.fromRGB(45, 65, 85),
        AccentColor = Color3.fromRGB(0, 180, 255),
        TextColor = Color3.fromRGB(230, 240, 250),
        SubTextColor = Color3.fromRGB(180, 190, 200),
        PlaceholderColor = Color3.fromRGB(120, 140, 160),
        ButtonHover = Color3.fromRGB(45, 65, 85),
        SliderThumb = Color3.fromRGB(255, 255, 255),
        NotificationBackground = Color3.fromRGB(30, 40, 50),
        NotificationText = Color3.fromRGB(255, 255, 255),
        NotificationSubText = Color3.fromRGB(200, 210, 220),
        IconColor = Color3.fromRGB(150, 170, 190),
    }
}

local CurrentThemeName = "Dark"
local CurrentTheme = Themes[CurrentThemeName]

local function applyTheme(guiElement, theme)
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
    elseif guiElement:IsA("TextButton") and guiElement.BackgroundTransparency == 0 then -- For regular buttons
        guiElement.BackgroundColor3 = theme.ElementBackground
        guiElement.TextColor3 = theme.TextColor
    elseif guiElement:IsA("TextBox") then
        guiElement.BackgroundColor3 = theme.InputBackground
        guiElement.TextColor3 = theme.TextColor
        guiElement.PlaceholderColor3 = theme.PlaceholderColor
    elseif guiElement.Name == "Toggle" or guiElement.Name == "InputFrame" or guiElement.Name == "DropdownFrame" or guiElement.Name == "SliderFrame" or guiElement.Name == "ColorPickerFrame" then
        guiElement.BackgroundColor3 = theme.ElementBackground
    elseif guiElement.Name == "ToggleButton" then
        guiElement.BackgroundColor3 = theme.InputBackground
    elseif guiElement.Name == "ToggleIndicator" then
        guiElement.BackgroundColor3 = theme.SliderThumb -- Uses slider thumb color for toggle active state
    elseif guiElement.Name == "DropdownButton" then
        guiElement.BackgroundColor3 = theme.InputBackground
        guiElement.TextColor3 = theme.TextColor
    elseif guiElement.Name == "OptionsFrame" then
        guiElement.BackgroundColor3 = theme.InputBackground
    elseif guiElement.Name == "OptionButton" then
        guiElement.BackgroundColor3 = theme.ElementBackground -- Or a slightly darker shade if desired
        guiElement.TextColor3 = theme.TextColor
    elseif guiElement.Name == "SliderBackground" then
        guiElement.BackgroundColor3 = theme.InputBackground
    elseif guiElement.Name == "SliderFill" then
        guiElement.BackgroundColor3 = theme.AccentColor
    elseif guiElement.Name == "SliderThumb" then
        guiElement.BackgroundColor3 = theme.SliderThumb
    elseif guiElement.Name == "CurrentColorPreview" then
        -- This one is handled by the color picker logic itself
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
    config.Size = config.Size or UDim2.new(0, 580, 0, 389)
    config.Position = config.Position or UDim2.new(0.5, -290, 0.5, -194)

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
    Main.Draggable = false -- IMPORTANT: Set Draggable to false here

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = Main

    -- Topbar
    local Topbar = Instance.new("Frame")
    Topbar.Name = "Topbar"
    Topbar.Parent = Main
    Topbar.BorderSizePixel = 0
    Topbar.Size = UDim2.new(1, 0, 0, 51)
    Topbar.Active = true -- Make Topbar active to receive input for dragging

    local TopbarCorner = Instance.new("UICorner")
    TopbarCorner.CornerRadius = UDim.new(0, 12)
    TopbarCorner.Parent = Topbar

    -- Icon
    local Icon = Instance.new("ImageLabel")
    Icon.Name = "Icon"
    Icon.Parent = Topbar
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0, 14, 0.5, -12)
    Icon.Size = UDim2.new(0, 24, 0, 24)
    Icon.Image = getLucideIcon(config.Icon)

    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = Topbar
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 53, 0, 8)
    Title.Size = UDim2.new(0, 200, 0, 20)
    Title.Font = Enum.Font.GothamBold
    Title.Text = config.Title
    Title.TextSize = 14
    Title.TextXAlignment = Enum.TextXAlignment.Left

    -- Description
    local Description = Instance.new("TextLabel")
    Description.Name = "Description"
    Description.Parent = Topbar
    Description.BackgroundTransparency = 1
    Description.Position = UDim2.new(0, 53, 0, 23)
    Description.Size = UDim2.new(0, 200, 0, 20)
    Description.Font = Enum.Font.GothamBold
    Description.Text = config.Description
    Description.TextSize = 12
    Description.TextXAlignment = Enum.TextXAlignment.Left

    -- Close Button
    local Close = Instance.new("TextButton")
    Close.Name = "Close"
    Close.Parent = Topbar
    Close.BackgroundTransparency = 1
    Close.Position = UDim2.new(1, -45, 0, 7)
    Close.Size = UDim2.new(0, 35, 0, 37)
    Close.Font = Enum.Font.SourceSans
    Close.Text = ""
    Close.TextSize = 14

    local CloseIcon = Instance.new("ImageLabel")
    CloseIcon.Name = "CloseIcon"
    CloseIcon.Parent = Close
    CloseIcon.BackgroundTransparency = 1
    CloseIcon.Position = UDim2.new(0.5, -11, 0.5, -11)
    CloseIcon.Size = UDim2.new(0, 22, 0, 22)
    CloseIcon.Image = getLucideIcon("close") -- Using Lucide icon

    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 8)
    CloseCorner.Parent = Close

    -- Minimize Button
    local Minimize = Instance.new("TextButton")
    Minimize.Name = "Minimize"
    Minimize.Parent = Topbar
    Minimize.BackgroundTransparency = 1
    Minimize.Position = UDim2.new(1, -80, 0, 7)
    Minimize.Size = UDim2.new(0, 29, 0, 37)
    Minimize.Font = Enum.Font.SourceSans
    Minimize.Text = ""
    Minimize.TextSize = 14

    local MinimizeIcon = Instance.new("ImageLabel")
    MinimizeIcon.Name = "MinimizeIcon"
    MinimizeIcon.Parent = Minimize
    MinimizeIcon.BackgroundTransparency = 1
    MinimizeIcon.Position = UDim2.new(0.5, -11, 0.5, -11)
    MinimizeIcon.Size = UDim2.new(0, 22, 0, 22)
    MinimizeIcon.Image = getLucideIcon("minimize") -- Using Lucide icon

    local MinimizeCorner = Instance.new("UICorner")
    MinimizeCorner.CornerRadius = UDim.new(0, 8)
    MinimizeCorner.Parent = Minimize

    -- Tabs Container
    local TabsContainer = Instance.new("Frame")
    TabsContainer.Name = "TabsContainer"
    TabsContainer.Parent = Main
    TabsContainer.BackgroundTransparency = 1
    TabsContainer.Position = UDim2.new(0, 0, 0, 51)
    TabsContainer.Size = UDim2.new(0, 145, 1, -51)

    -- Tab Search Bar
    local TabSearchFrame = Instance.new("Frame")
    TabSearchFrame.Name = "TabSearchFrame"
    TabSearchFrame.Parent = TabsContainer
    TabSearchFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
    TabSearchFrame.BorderSizePixel = 0
    TabSearchFrame.Size = UDim2.new(1, -10, 0, 30)
    TabSearchFrame.Position = UDim2.new(0, 5, 0, 5)

    local TabSearchCorner = Instance.new("UICorner")
    TabSearchCorner.CornerRadius = UDim.new(0, 8)
    TabSearchCorner.Parent = TabSearchFrame

    local TabSearchIcon = Instance.new("ImageLabel")
    TabSearchIcon.Name = "SearchIcon"
    TabSearchIcon.Parent = TabSearchFrame
    TabSearchIcon.BackgroundTransparency = 1
    TabSearchIcon.Image = getLucideIcon("search")
    TabSearchIcon.Size = UDim2.new(0, 18, 0, 18)
    TabSearchIcon.Position = UDim2.new(0, 5, 0.5, -9)

    local TabSearchBox = Instance.new("TextBox")
    TabSearchBox.Name = "TabSearchBox"
    TabSearchBox.Parent = TabSearchFrame
    TabSearchBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
    TabSearchBox.BackgroundTransparency = 1
    TabSearchBox.BorderSizePixel = 0
    TabSearchBox.Size = UDim2.new(1, -30, 1, 0)
    TabSearchBox.Position = UDim2.new(0, 28, 0, 0)
    TabSearchBox.PlaceholderText = "Search tabs..."
    TabSearchBox.Font = Enum.Font.Gotham
    TabSearchBox.TextSize = 14
    TabSearchBox.TextXAlignment = Enum.TextXAlignment.Left
    TabSearchBox.ClearTextOnFocus = false

    local TabsScrolling = Instance.new("ScrollingFrame")
    TabsScrolling.Parent = TabsContainer
    TabsScrolling.Active = true
    TabsScrolling.BackgroundTransparency = 1
    TabsScrolling.BorderSizePixel = 0
    TabsScrolling.Position = UDim2.new(0, 5, 0, 40) -- Adjusted position for search bar
    TabsScrolling.Size = UDim2.new(0, 140, 1, -40) -- Adjusted size
    TabsScrolling.ScrollBarThickness = 0
    TabsScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)

    local TabsLayout = Instance.new("UIListLayout")
    TabsLayout.Parent = TabsScrolling
    TabsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabsLayout.Padding = UDim.new(0, 2)

    -- Content Container
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Parent = Main
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.Position = UDim2.new(0, 155, 0, 58)
    ContentContainer.Size = UDim2.new(1, -165, 1, -68)

    -- Bottom Drag Bar (New Element)
    local BottomDragBar = Instance.new("Frame")
    BottomDragBar.Name = "BottomDragBar"
    BottomDragBar.Parent = Main
    BottomDragBar.BackgroundTransparency = 0.5 -- Slightly transparent
    BottomDragBar.BorderSizePixel = 0
    BottomDragBar.Position = UDim2.new(0.5, -100, 1, -20) -- Centered at bottom, 20px from bottom edge
    BottomDragBar.Size = UDim2.new(0, 200, 0, 15) -- Width 200, Height 15
    BottomDragBar.Active = true -- Make it active to receive input

    local BottomDragBarCorner = Instance.new("UICorner")
    BottomDragBarCorner.CornerRadius = UDim.new(1, 0) -- Fully rounded corners
    BottomDragBarCorner.Parent = BottomDragBar

    local DragHandle = Instance.new("ImageLabel") -- Using ImageLabel for a grip icon
    DragHandle.Name = "DragHandle"
    DragHandle.Parent = BottomDragBar
    DragHandle.BackgroundTransparency = 1
    DragHandle.Image = getLucideIcon("grip-horizontal") -- Lucide grip icon
    DragHandle.Size = UDim2.new(0, 24, 0, 24) -- Icon size
    DragHandle.AnchorPoint = Vector2.new(0.5, 0.5)
    DragHandle.Position = UDim2.new(0.5, 0, 0.5, 0) -- Centered within the bar
    DragHandle.ZIndex = 2 -- Ensure it's visible

    -- Show Prompt (for minimized state)
    local ShowPrompt = Instance.new("Frame")
    ShowPrompt.Name = "ShowPrompt"
    ShowPrompt.Parent = ScreenGui
    ShowPrompt.BorderSizePixel = 0
    ShowPrompt.Position = UDim2.new(0.5, -60, 0, 20)
    ShowPrompt.Size = UDim2.new(0, 120, 0, 30)
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
    PromptTitle.TextSize = 14
    PromptTitle.TextTransparency = 0.3

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
    NotificationsContainer.Position = UDim2.new(1, -320, 1, -20)
    NotificationsContainer.Size = UDim2.new(0, 300, 0, 800)

    local NotificationsLayout = Instance.new("UIListLayout")
    NotificationsLayout.Parent = NotificationsContainer
    NotificationsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    NotificationsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    NotificationsLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    NotificationsLayout.Padding = UDim.new(0, 8)

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
                UserInputService.MouseIconEnabled = false -- Hide mouse icon during drag
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
                UserInputService.MouseIconEnabled = true -- Restore default mouse icon
                UserInputService.MouseIcon = "" -- Clear custom icon
            end
        end)
    end

    -- Apply draggable to Topbar
    makeDraggable(Topbar, Main)
    -- Apply draggable to BottomDragBar
    makeDraggable(BottomDragBar, Main)


    -- Window Functions
    function Window:CreateTab(config)
        local Tab = {}
        Tab.__index = Tab

        config = config or {}
        config.Title = config.Title or "Tab"
        config.Icon = config.Icon or "default" -- Use Lucide icon name

        -- Tab Button
        local TabButton = Instance.new("Frame")
        TabButton.Name = "TabButton"
        TabButton.Parent = self.TabsScrolling
        TabButton.BackgroundTransparency = 1
        TabButton.Size = UDim2.new(1, -10, 0, 37)

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
        TabIcon.Position = UDim2.new(0, 14, 0.5, -8)
        TabIcon.Size = UDim2.new(0, 17, 0, 17)
        TabIcon.Image = getLucideIcon(config.Icon)

        local TabTitle = Instance.new("TextLabel")
        TabTitle.Name = "TextLabel"
        TabTitle.Parent = TabButton
        TabTitle.BackgroundTransparency = 1
        TabTitle.Position = UDim2.new(0, 39, 0, 5)
        TabTitle.Size = UDim2.new(0, 96, 0, 27)
        TabTitle.Font = Enum.Font.GothamBold
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
        ContentLayout.Padding = UDim.new(0, 8)

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
        Tab.TabTitleLabel = TabTitle -- Store reference to the label for theme/search updates

        -- Tab Functions
        function Tab:Select()
            -- Hide all tabs and animate their selectors out
            for _, tab in pairs(self.Window.Tabs) do
                tab.TabContent.Visible = false
                if tab ~= self then
                    local tweenOut = TweenService:Create(tab.TabSelector, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                        Size = UDim2.new(0, 0, 0, 20),
                        Position = UDim2.new(0, 0, 0.5, -10)
                    })
                    tweenOut:Play()
                    tweenOut.Completed:Wait()
                    tab.TabSelector.Visible = false
                end
            end

            -- Show this tab
            self.TabContent.Visible = true
            self.TabSelector.Visible = true

            -- Animate selector in with slide effect
            local tweenSize = TweenService:Create(self.TabSelector, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0, 3, 0, 20)
            })

            local tweenPos = TweenService:Create(self.TabSelector, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Position = UDim2.new(0, 5, 0.5, -10)
            })

            tweenSize:Play()
            tweenPos:Play()

            self.Window.CurrentTab = self
        end

        -- Generic function to update canvas size of the current tab's content
        local function updateTabCanvasSize()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y)
        end

        function Tab:CreateButton(config)
            config = config or {}
            config.Title = config.Title or "Button"
            config.Callback = config.Callback or function() end

            local Button = Instance.new("TextButton")
            Button.Name = "Button"
            Button.Parent = self.TabContent
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(1, 0, 0, 40)
            Button.Font = Enum.Font.GothamBold
            Button.Text = config.Title
            Button.TextSize = 14

            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 8)
            ButtonCorner.Parent = Button

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
            Toggle.Size = UDim2.new(1, 0, 0, 40)

            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(0, 8)
            ToggleCorner.Parent = Toggle

            local ToggleTitle = Instance.new("TextLabel")
            ToggleTitle.Name = "TextLabel"
            ToggleTitle.Parent = Toggle
            ToggleTitle.BackgroundTransparency = 1
            ToggleTitle.Position = UDim2.new(0, 15, 0, 0)
            ToggleTitle.Size = UDim2.new(1, -60, 1, 0)
            ToggleTitle.Font = Enum.Font.GothamBold
            ToggleTitle.Text = config.Title
            ToggleTitle.TextSize = 14
            ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Name = "ToggleButton"
            ToggleButton.Parent = Toggle
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Position = UDim2.new(1, -45, 0.5, -10)
            ToggleButton.Size = UDim2.new(0, 35, 0, 20)
            ToggleButton.Text = ""

            local ToggleButtonCorner = Instance.new("UICorner")
            ToggleButtonCorner.CornerRadius = UDim.new(1, 0)
            ToggleButtonCorner.Parent = ToggleButton

            local ToggleIndicator = Instance.new("Frame")
            ToggleIndicator.Name = "ToggleIndicator"
            ToggleIndicator.Parent = ToggleButton
            ToggleIndicator.BorderSizePixel = 0
            ToggleIndicator.Position = UDim2.new(0, 2, 0, 2)
            ToggleIndicator.Size = UDim2.new(0, 16, 0, 16)

            local IndicatorCorner = Instance.new("UICorner")
            IndicatorCorner.CornerRadius = UDim.new(1, 0)
            IndicatorCorner.Parent = ToggleIndicator

            local isToggled = config.Default

            local function UpdateToggleState()
                if isToggled then
                    TweenService:Create(ToggleIndicator, TweenInfo.new(0.2), {Position = UDim2.new(0, 17, 0, 2)}):Play()
                    TweenService:Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = CurrentTheme.AccentColor}):Play()
                else
                    TweenService:Create(ToggleIndicator, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0, 2)}):Play()
                    TweenService:Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = CurrentTheme.InputBackground}):Play()
                end
            end

            ToggleButton.MouseButton1Click:Connect(function()
                isToggled = not isToggled
                UpdateToggleState()
                config.Callback(isToggled)
            end)

            UpdateToggleState() -- Set initial state

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
            InputFrame.Size = UDim2.new(1, 0, 0, 60)

            local InputCorner = Instance.new("UICorner")
            InputCorner.CornerRadius = UDim.new(0, 8)
            InputCorner.Parent = InputFrame

            local InputTitle = Instance.new("TextLabel")
            InputTitle.Name = "TextLabel"
            InputTitle.Parent = InputFrame
            InputTitle.BackgroundTransparency = 1
            InputTitle.Position = UDim2.new(0, 15, 0, 5)
            InputTitle.Size = UDim2.new(1, -30, 0, 20)
            InputTitle.Font = Enum.Font.GothamBold
            InputTitle.Text = config.Title
            InputTitle.TextSize = 14
            InputTitle.TextXAlignment = Enum.TextXAlignment.Left

            local TextBox = Instance.new("TextBox")
            TextBox.Name = "TextBox"
            TextBox.Parent = InputFrame
            TextBox.BorderSizePixel = 0
            TextBox.Position = UDim2.new(0, 15, 0, 28)
            TextBox.Size = UDim2.new(1, -30, 0, 25)
            TextBox.Font = Enum.Font.Gotham
            TextBox.Text = config.Default
            TextBox.PlaceholderText = config.Placeholder
            TextBox.TextSize = 14
            TextBox.TextXAlignment = Enum.TextXAlignment.Left
            TextBox.ClearTextOnFocus = false

            local TextBoxCorner = Instance.new("UICorner")
            TextBoxCorner.CornerRadius = UDim.new(0, 5)
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
            DropdownFrame.Size = UDim2.new(1, 0, 0, 60)

            local DropdownCorner = Instance.new("UICorner")
            DropdownCorner.CornerRadius = UDim.new(0, 8)
            DropdownCorner.Parent = DropdownFrame

            local DropdownTitle = Instance.new("TextLabel")
            DropdownTitle.Name = "TextLabel"
            DropdownTitle.Parent = DropdownFrame
            DropdownTitle.BackgroundTransparency = 1
            DropdownTitle.Position = UDim2.new(0, 15, 0, 5)
            DropdownTitle.Size = UDim2.new(1, -30, 0, 20)
            DropdownTitle.Font = Enum.Font.GothamBold
            DropdownTitle.Text = config.Title
            DropdownTitle.TextSize = 14
            DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left

            local DropdownButton = Instance.new("TextButton")
            DropdownButton.Name = "DropdownButton"
            DropdownButton.Parent = DropdownFrame
            DropdownButton.BorderSizePixel = 0
            DropdownButton.Position = UDim2.new(0, 15, 0, 28)
            DropdownButton.Size = UDim2.new(1, -30, 0, 25)
            DropdownButton.Font = Enum.Font.Gotham
            DropdownButton.Text = config.Default
            DropdownButton.TextSize = 14
            DropdownButton.TextXAlignment = Enum.TextXAlignment.Left

            local DropdownButtonCorner = Instance.new("UICorner")
            DropdownButtonCorner.CornerRadius = UDim.new(0, 5)
            DropdownButtonCorner.Parent = DropdownButton

            local ArrowIcon = Instance.new("ImageLabel")
            ArrowIcon.Name = "ArrowIcon"
            ArrowIcon.Parent = DropdownButton
            ArrowIcon.BackgroundTransparency = 1
            ArrowIcon.AnchorPoint = Vector2.new(1, 0.5)
            ArrowIcon.Position = UDim2.new(1, -10, 0.5, 0)
            ArrowIcon.Size = UDim2.new(0, 16, 0, 16)
            ArrowIcon.Image = getLucideIcon("minimize") -- Using minimize icon as a down arrow placeholder (consider "chevron-down")

            local OptionsFrame = Instance.new("Frame")
            OptionsFrame.Name = "OptionsFrame"
            OptionsFrame.Parent = DropdownFrame
            OptionsFrame.BorderSizePixel = 0
            OptionsFrame.Position = UDim2.new(0, 15, 0, 53)
            OptionsFrame.Size = UDim2.new(1, -30, 0, 0)
            OptionsFrame.Visible = false
            OptionsFrame.ZIndex = DropdownButton.ZIndex + 1
            OptionsFrame.ClipsDescendants = true -- Important for smooth expansion/collapse

            local OptionsLayout = Instance.new("UIListLayout")
            OptionsLayout.Parent = OptionsFrame
            OptionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
            OptionsLayout.Padding = UDim.new(0, 2)

            local isExpanded = false

            local function ToggleDropdown()
                isExpanded = not isExpanded
                if isExpanded then
                    local targetHeight = #config.Options * 27 -- 25 height + 2 padding
                    OptionsFrame.Visible = true
                    TweenService:Create(OptionsFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = UDim2.new(1, -30, 0, targetHeight)}):Play()
                    TweenService:Create(ArrowIcon, TweenInfo.new(0.2), {Rotation = 180}):Play()
                else
                    TweenService:Create(OptionsFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = UDim2.new(1, -30, 0, 0)}):Play()
                    TweenService:Create(ArrowIcon, TweenInfo.new(0.2), {Rotation = 0}):Play()
                    task.delay(0.2, function() OptionsFrame.Visible = false end)
                end
            end

            DropdownButton.MouseButton1Click:Connect(ToggleDropdown)

            for _, optionText in ipairs(config.Options) do
                local OptionButton = Instance.new("TextButton")
                OptionButton.Name = "OptionButton"
                OptionButton.Parent = OptionsFrame
                OptionButton.BorderSizePixel = 0
                OptionButton.Size = UDim2.new(1, 0, 0, 25)
                OptionButton.Font = Enum.Font.Gotham
                OptionButton.Text = optionText
                OptionButton.TextSize = 13
                OptionButton.TextXAlignment = Enum.TextXAlignment.Left
                OptionButton.TextScaled = false
                OptionButton.TextWrapped = false
                OptionButton.ClipsDescendants = true

                local OptionPadding = Instance.new("UIPadding")
                OptionPadding.Parent = OptionButton
                OptionPadding.PaddingLeft = UDim.new(0, 5)

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
            SliderFrame.Size = UDim2.new(1, 0, 0, 60)

            local SliderCorner = Instance.new("UICorner")
            SliderCorner.CornerRadius = UDim.new(0, 8)
            SliderCorner.Parent = SliderFrame

            local SliderTitle = Instance.new("TextLabel")
            SliderTitle.Name = "TextLabel"
            SliderTitle.Parent = SliderFrame
            SliderTitle.BackgroundTransparency = 1
            SliderTitle.Position = UDim2.new(0, 15, 0, 5)
            SliderTitle.Size = UDim2.new(1, -30, 0, 20)
            SliderTitle.Font = Enum.Font.GothamBold
            SliderTitle.Text = config.Title
            SliderTitle.TextSize = 14
            SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

            local ValueLabel = Instance.new("TextLabel")
            ValueLabel.Name = "TextLabel"
            ValueLabel.Parent = SliderFrame
            ValueLabel.BackgroundTransparency = 1
            ValueLabel.Position = UDim2.new(1, -70, 0, 5)
            ValueLabel.Size = UDim2.new(0, 55, 0, 20)
            ValueLabel.Font = Enum.Font.Gotham
            ValueLabel.TextSize = 14
            ValueLabel.TextXAlignment = Enum.TextXAlignment.Right

            local SliderBackground = Instance.new("Frame")
            SliderBackground.Name = "SliderBackground"
            SliderBackground.Parent = SliderFrame
            SliderBackground.BorderSizePixel = 0
            SliderBackground.Position = UDim2.new(0, 15, 0, 38)
            SliderBackground.Size = UDim2.new(1, -30, 0, 5)

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
            SliderThumb.Size = UDim2.new(0, 16, 0, 16)
            SliderThumb.AnchorPoint = Vector2.new(0.5, 0.5)
            SliderThumb.Position = UDim2.new(0, 0, 0.5, 0)
            SliderThumb.ZIndex = SliderBackground.ZIndex + 1

            local ThumbCorner = Instance.new("UICorner")
            ThumbCorner.CornerRadius = UDim.new(1, 0)
            ThumbCorner.Parent = SliderThumb

            local CurrentValue = config.Default
            local isDraggingSlider = false -- Renamed to avoid conflict with window dragging

            local function UpdateSlider(inputPos)
                local relativeX = math.clamp(inputPos.X - SliderBackground.AbsolutePosition.X, 0, SliderBackground.AbsoluteSize.X)
                local percentage = relativeX / SliderBackground.AbsoluteSize.X
                local newValue = config.Min + (percentage * (config.Max - config.Min))
                CurrentValue = math.round(newValue / config.Step) * config.Step
                CurrentValue = math.clamp(CurrentValue, config.Min, config.Max)

                local thumbPosition = (CurrentValue - config.Min) / (config.Max - config.Min)
                SliderThumb.Position = UDim2.new(thumbPosition, 0, 0.5, 0)
                SliderFill.Size = UDim2.new(thumbPosition, 0, 1, 0)
                ValueLabel.Text = string.format("%.0f", CurrentValue) -- Format as integer if step is integer, or adjust as needed
                config.Callback(CurrentValue)
            end

            ValueLabel.Text = string.format("%.0f", CurrentValue) -- Initial value
            local initialThumbPosition = (config.Default - config.Min) / (config.Max - config.Min)
            SliderThumb.Position = UDim2.new(initialThumbPosition, 0, 0.5, 0)
            SliderFill.Size = UDim2.new(initialThumbPosition, 0, 1, 0)

            SliderThumb.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    isDraggingSlider = true
                    UpdateSlider(input.Position) -- Update immediately on click
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

            SliderBackground.InputBegan:Connect(function(input) -- Allow clicking on the bar to set value
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
            ColorPickerFrame.Size = UDim2.new(1, 0, 0, 180)

            local ColorPickerCorner = Instance.new("UICorner")
            ColorPickerCorner.CornerRadius = UDim.new(0, 8)
            ColorPickerCorner.Parent = ColorPickerFrame

            local ColorPickerTitle = Instance.new("TextLabel")
            ColorPickerTitle.Name = "TextLabel"
            ColorPickerTitle.Parent = ColorPickerFrame
            ColorPickerTitle.BackgroundTransparency = 1
            ColorPickerTitle.Position = UDim2.new(0, 15, 0, 5)
            ColorPickerTitle.Size = UDim2.new(1, -30, 0, 20)
            ColorPickerTitle.Font = Enum.Font.GothamBold
            ColorPickerTitle.Text = config.Title
            ColorPickerTitle.TextSize = 14
            ColorPickerTitle.TextXAlignment = Enum.TextXAlignment.Left

            local CurrentColorPreview = Instance.new("Frame")
            CurrentColorPreview.Name = "CurrentColorPreview"
            CurrentColorPreview.Parent = ColorPickerFrame
            CurrentColorPreview.BackgroundColor3 = config.Default
            CurrentColorPreview.BorderSizePixel = 0
            CurrentColorPreview.Position = UDim2.new(0, 15, 0, 28)
            CurrentColorPreview.Size = UDim2.new(0, 30, 0, 30)

            local PreviewCorner = Instance.new("UICorner")
            PreviewCorner.CornerRadius = UDim.new(0, 5)
            PreviewCorner.Parent = CurrentColorPreview

            local ColorWheel = Instance.new("ImageLabel")
            ColorWheel.Name = "ColorWheel"
            ColorWheel.Parent = ColorPickerFrame
            ColorWheel.BackgroundTransparency = 1
            ColorWheel.Position = UDim2.new(0, 15, 0, 65)
            ColorWheel.Size = UDim2.new(1, -30, 0, 100)
            ColorWheel.Image = "rbxassetid://6022240974" -- Placeholder for a generic color wheel image. You'll likely need to create or find a better one.
            ColorWheel.Active = true -- Make color wheel active for input

            local ColorPickerThumb = Instance.new("Frame")
            ColorPickerThumb.Name = "ColorPickerThumb"
            ColorPickerThumb.Parent = ColorWheel
            ColorPickerThumb.BackgroundColor3 = Color3.fromRGB(255,255,255)
            ColorPickerThumb.BorderSizePixel = 1
            ColorPickerThumb.BorderColor3 = Color3.fromRGB(0,0,0)
            ColorPickerThumb.Size = UDim2.new(0, 10, 0, 10)
            ColorPickerThumb.AnchorPoint = Vector2.new(0.5, 0.5)
            ColorPickerThumb.ZIndex = 2

            local ThumbCircle = Instance.new("UICorner")
            ThumbCircle.CornerRadius = UDim.new(1, 0)
            ThumbCircle.Parent = ColorPickerThumb

            local isDraggingColor = false
            local lastColor = config.Default

            -- HSV to RGB conversion functions (simplified, for basic color wheel)
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
                return Color3.new(0,0,0) -- Should not happen
            end

            local function UpdateColor(inputPos)
                local x = inputPos.X - ColorWheel.AbsolutePosition.X
                local y = inputPos.Y - ColorWheel.AbsolutePosition.Y

                local normX = math.clamp(x / ColorWheel.AbsoluteSize.X, 0, 1)
                local normY = math.clamp(y / ColorWheel.AbsoluteSize.Y, 0, 1)

                ColorPickerThumb.Position = UDim2.new(normX, 0, normY, 0)

                -- Calculate color based on position (simplified HSV model)
                local hue = normX
                local saturation = 1 - normY -- Invert Y for saturation (top is full, bottom is desaturated)
                local value = 1 -- Assuming full brightness for simplicity

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

            -- Set initial color preview and thumb position based on default
            local h, s, v = config.Default:ToHSV()
            ColorPickerThumb.Position = UDim2.new(h, 0, 1 - s, 0) -- Position thumb based on initial HSV
            CurrentColorPreview.BackgroundColor3 = config.Default
            config.Callback(config.Default)

            updateTabCanvasSize()

            return ColorPickerFrame
        end

        -- Tab click event
        TabInteract.MouseButton1Click:Connect(function()
            Tab:Select()
        end)

        -- Add to tabs list
        table.insert(self.Tabs, Tab)

        -- Update scrolling frame
        self.TabsScrolling.CanvasSize = UDim2.new(0, 0, 0, self.TabsLayout.AbsoluteContentSize.Y)

        -- Select first tab if this is the first one created
        if #self.Tabs == 1 then
            Tab:Select()
        end

        return Tab
    end

    function Window:Minimize()
        self.IsMinimized = true
        self.Main.Visible = false
        self.ShowPrompt.Visible = true

        -- Animate prompt
        local tween = TweenService:Create(self.ShowPrompt, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Position = UDim2.new(0.5, -60, 0, 20)})
        tween:Play()
    end

    function Window:Restore()
        self.IsMinimized = false
        self.Main.Visible = true
        self.ShowPrompt.Visible = false
    end

    function Window:Destroy()
        self.ScreenGui:Destroy()
    end

    function Window:Notification(config)
        config = config or {}
        config.Title = config.Title or "Notification"
        config.Description = config.Description or "No description provided"
        config.Icon = config.Icon -- Can be explicitly set, otherwise defaults based on type
        config.Duration = config.Duration or 5
        config.Type = config.Type or "info" -- "info", "success", "warning", "error"

        spawn(function() -- Use spawn or coroutine for non-blocking delay
            local Notification = Instance.new("Frame")
            Notification.Name = "Notification"
            Notification.Parent = self.NotificationsContainer
            Notification.BorderSizePixel = 0
            Notification.Size = UDim2.new(1, 0, 0, 80)

            local NotifCorner = Instance.new("UICorner")
            NotifCorner.CornerRadius = UDim.new(0, 12)
            NotifCorner.Parent = Notification

            local NotifIcon = Instance.new("ImageLabel")
            NotifIcon.Name = "NotifIcon"
            NotifIcon.Parent = Notification
            NotifIcon.BackgroundTransparency = 1
            NotifIcon.Position = UDim2.new(0, 15, 0.5, -12)
            NotifIcon.Size = UDim2.new(0, 24, 0, 24)

            -- Set icon based on type if not explicitly provided
            if not config.Icon then
                if config.Type == "success" then NotifIcon.Image = getLucideIcon("check-circle")
                elseif config.Type == "warning" then NotifIcon.Image = getLucideIcon("alert-triangle")
                elseif config.Type == "error" then NotifIcon.Image = getLucideIcon("x-circle")
                else NotifIcon.Image = getLucideIcon("info") end
            else
                NotifIcon.Image = getLucideIcon(config.Icon) -- Use provided icon if specified
            end

            local NotifTitle = Instance.new("TextLabel")
            NotifTitle.Name = "NotifTitle"
            NotifTitle.Parent = Notification
            NotifTitle.BackgroundTransparency = 1
            NotifTitle.Position = UDim2.new(0, 50, 0, 10)
            NotifTitle.Size = UDim2.new(1, -60, 0, 20)
            NotifTitle.Font = Enum.Font.GothamBold
            NotifTitle.Text = config.Title
            NotifTitle.TextSize = 16
            NotifTitle.TextXAlignment = Enum.TextXAlignment.Left

            local NotifDesc = Instance.new("TextLabel")
            NotifDesc.Name = "NotifDesc"
            NotifDesc.Parent = Notification
            NotifDesc.BackgroundTransparency = 1
            NotifDesc.Position = UDim2.new(0, 50, 0, 30)
            NotifDesc.Size = UDim2.new(1, -60, 0, 40)
            NotifDesc.Font = Enum.Font.Gotham
            NotifDesc.Text = config.Description
            NotifDesc.TextSize = 14
            NotifDesc.TextWrapped = true
            NotifDesc.TextXAlignment = Enum.TextXAlignment.Left
            NotifDesc.TextYAlignment = Enum.TextYAlignment.Top

            -- Apply current theme colors to notification elements
            applyTheme(Notification, CurrentTheme)

            -- Animate in
            Notification.Position = UDim2.new(1, 0, 0, 0)
            local tweenIn = TweenService:Create(Notification, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0)})
            tweenIn:Play()

            -- Auto dismiss
            task.wait(config.Duration) -- Use task.wait for modern Roblox Lua
            local tweenOut = TweenService:Create(Notification, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(1, 0, 0, 0)})
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
            -- Re-apply theme to all existing tabs' static elements
            for _, tab in pairs(self.Tabs) do
                applyTheme(tab.TabButton, CurrentTheme)
                -- Also ensure the current tab's selector color is updated
                if tab == self.CurrentTab then
                    tab.TabSelector.BackgroundColor3 = CurrentTheme.AccentColor
                end
            end
        else
            warn("Theme '" .. themeName .. "' not found. Available themes: " .. table.concat(table.keys(Themes), ", "))
        end
    end

    -- Tab Search Logic
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
            -- Update CanvasSize after changing visibility
            Window.TabsScrolling.CanvasSize = UDim2.new(0, 0, 0, Window.TabsLayout.AbsoluteContentSize.Y)
        end
    end)


    -- Button Events
    Close.MouseButton1Click:Connect(function()
        Window:Destroy()
    end)

    Minimize.MouseButton1Click:Connect(function()
        Window:Minimize()
    end)

    PromptButton.MouseButton1Click:Connect(function()
        Window:Restore()
    end)

    -- Apply initial theme
    applyTheme(Main, CurrentTheme)
    applyTheme(ShowPrompt, CurrentTheme)

    -- Return window object
    return Window
end

-- Return library
return EyeUI
