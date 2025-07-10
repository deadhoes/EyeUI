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

-- Library Functions
function EyeUI:CreateWindow(config)
    local Window = {}
    Window.__index = Window
    
    -- Default config
    config = config or {}
    config.Title = config.Title or "EyeUI"
    config.Description = config.Description or "A modern UI library"
    config.Icon = config.Icon or "rbxassetid://10709770005"
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
    Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Main.BorderSizePixel = 0
    Main.Position = config.Position
    Main.Size = config.Size
    Main.Active = true
    Main.Draggable = true
    
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = Main
    
    -- Topbar
    local Topbar = Instance.new("Frame")
    Topbar.Name = "Topbar"
    Topbar.Parent = Main
    Topbar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Topbar.BorderSizePixel = 0
    Topbar.Size = UDim2.new(1, 0, 0, 51)
    
    local TopbarCorner = Instance.new("UICorner")
    TopbarCorner.CornerRadius = UDim.new(0, 12)
    TopbarCorner.Parent = Topbar
    
    -- Icon
    local Icon = Instance.new("ImageLabel")
    Icon.Parent = Topbar
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0, 14, 0.5, -12)
    Icon.Size = UDim2.new(0, 24, 0, 24)
    Icon.Image = config.Icon
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Parent = Topbar
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 53, 0, 8)
    Title.Size = UDim2.new(0, 200, 0, 20)
    Title.Font = Enum.Font.GothamBold
    Title.Text = config.Title
    Title.TextColor3 = Color3.fromRGB(230, 230, 230)
    Title.TextSize = 14
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Description
    local Description = Instance.new("TextLabel")
    Description.Parent = Topbar
    Description.BackgroundTransparency = 1
    Description.Position = UDim2.new(0, 53, 0, 23)
    Description.Size = UDim2.new(0, 200, 0, 20)
    Description.Font = Enum.Font.GothamBold
    Description.Text = config.Description
    Description.TextColor3 = Color3.fromRGB(190, 190, 190)
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
    Close.TextColor3 = Color3.fromRGB(0, 0, 0)
    Close.TextSize = 14
    
    local CloseIcon = Instance.new("ImageLabel")
    CloseIcon.Parent = Close
    CloseIcon.BackgroundTransparency = 1
    CloseIcon.Position = UDim2.new(0.5, -11, 0.5, -11)
    CloseIcon.Size = UDim2.new(0, 22, 0, 22)
    CloseIcon.Image = "rbxassetid://10747384394"
    
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
    Minimize.TextColor3 = Color3.fromRGB(0, 0, 0)
    Minimize.TextSize = 14
    
    local MinimizeIcon = Instance.new("ImageLabel")
    MinimizeIcon.Parent = Minimize
    MinimizeIcon.BackgroundTransparency = 1
    MinimizeIcon.Position = UDim2.new(0.5, -11, 0.5, -11)
    MinimizeIcon.Size = UDim2.new(0, 22, 0, 22)
    MinimizeIcon.Image = "rbxassetid://10734896206"
    
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
    
    local TabsScrolling = Instance.new("ScrollingFrame")
    TabsScrolling.Parent = TabsContainer
    TabsScrolling.Active = true
    TabsScrolling.BackgroundTransparency = 1
    TabsScrolling.BorderSizePixel = 0
    TabsScrolling.Position = UDim2.new(0, 5, 0, 0)
    TabsScrolling.Size = UDim2.new(0, 140, 1, 0)
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
    
    -- Show Prompt
    local ShowPrompt = Instance.new("Frame")
    ShowPrompt.Name = "ShowPrompt"
    ShowPrompt.Parent = ScreenGui
    ShowPrompt.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    ShowPrompt.BorderSizePixel = 0
    ShowPrompt.Position = UDim2.new(0.5, -60, 0, 20)
    ShowPrompt.Size = UDim2.new(0, 120, 0, 30)
    ShowPrompt.Visible = false
    
    local PromptCorner = Instance.new("UICorner")
    PromptCorner.CornerRadius = UDim.new(1, 0)
    PromptCorner.Parent = ShowPrompt
    
    local PromptTitle = Instance.new("TextLabel")
    PromptTitle.Parent = ShowPrompt
    PromptTitle.BackgroundTransparency = 1
    PromptTitle.Position = UDim2.new(0, 0, 0, 0)
    PromptTitle.Size = UDim2.new(1, 0, 1, 0)
    PromptTitle.Font = Enum.Font.GothamBold
    PromptTitle.Text = "Show " .. config.Title
    PromptTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    PromptTitle.TextSize = 14
    PromptTitle.TextTransparency = 0.3
    
    local PromptButton = Instance.new("TextButton")
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
    
    -- Window Functions
    function Window:CreateTab(config)
        local Tab = {}
        Tab.__index = Tab
        
        config = config or {}
        config.Title = config.Title or "Tab"
        config.Icon = config.Icon or "rbxassetid://10723407389"
        
        -- Tab Button
        local TabButton = Instance.new("Frame")
        TabButton.Name = "TabButton"
        TabButton.Parent = self.TabsScrolling
        TabButton.BackgroundTransparency = 1
        TabButton.Size = UDim2.new(1, -10, 0, 37)
        
        -- Tab Selector (Fixed: moved before it's used)
        local TabSelector = Instance.new("Frame")
        TabSelector.Name = "Selector"
        TabSelector.Parent = TabButton
        TabSelector.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        TabSelector.BorderSizePixel = 0
        TabSelector.Position = UDim2.new(0, 0, 0.5, -10)
        TabSelector.Size = UDim2.new(0, 0, 0, 20)
        TabSelector.Visible = false
        
        local SelectorCorner = Instance.new("UICorner")
        SelectorCorner.CornerRadius = UDim.new(1, 0)
        SelectorCorner.Parent = TabSelector
        
        local TabIcon = Instance.new("ImageLabel")
        TabIcon.Parent = TabButton
        TabIcon.BackgroundTransparency = 1
        TabIcon.Position = UDim2.new(0, 14, 0.5, -8)
        TabIcon.Size = UDim2.new(0, 17, 0, 17)
        TabIcon.Image = config.Icon
        
        local TabTitle = Instance.new("TextLabel")
        TabTitle.Parent = TabButton
        TabTitle.BackgroundTransparency = 1
        TabTitle.Position = UDim2.new(0, 39, 0, 5)
        TabTitle.Size = UDim2.new(0, 96, 0, 27)
        TabTitle.Font = Enum.Font.GothamBold
        TabTitle.Text = config.Title
        TabTitle.TextColor3 = Color3.fromRGB(230, 230, 230)
        TabTitle.TextSize = 14
        TabTitle.TextXAlignment = Enum.TextXAlignment.Left
        
        local TabInteract = Instance.new("TextButton")
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
        
        -- Tab Functions
        function Tab:Select()
            -- Hide all tabs
            for _, tab in pairs(self.Window.Tabs) do
                tab.TabContent.Visible = false
                if tab ~= self then
                    -- Animate selector out for other tabs
                    local tweenOut = TweenService:Create(tab.TabSelector, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                        Size = UDim2.new(0, 0, 0, 20),
                        Position = UDim2.new(0, 0, 0.5, -10)
                    })
                    tweenOut:Play()
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
        
        function Tab:CreateButton(config)
            config = config or {}
            config.Title = config.Title or "Button"
            config.Callback = config.Callback or function() end
            
            local Button = Instance.new("TextButton")
            Button.Parent = self.TabContent
            Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(1, 0, 0, 40)
            Button.Font = Enum.Font.GothamBold
            Button.Text = config.Title
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 14
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 8)
            ButtonCorner.Parent = Button
            
            Button.MouseButton1Click:Connect(config.Callback)
            
            -- Update canvas size
            self.TabContent.CanvasSize = UDim2.new(0, 0, 0, self.ContentLayout.AbsoluteContentSize.Y)
            
            return Button
        end
        
        function Tab:CreateToggle(config)
            config = config or {}
            config.Title = config.Title or "Toggle"
            config.Default = config.Default or false
            config.Callback = config.Callback or function() end
            
            local Toggle = Instance.new("Frame")
            Toggle.Parent = self.TabContent
            Toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Toggle.BorderSizePixel = 0
            Toggle.Size = UDim2.new(1, 0, 0, 40)
            
            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(0, 8)
            ToggleCorner.Parent = Toggle
            
            local ToggleTitle = Instance.new("TextLabel")
            ToggleTitle.Parent = Toggle
            ToggleTitle.BackgroundTransparency = 1
            ToggleTitle.Position = UDim2.new(0, 15, 0, 0)
            ToggleTitle.Size = UDim2.new(1, -60, 1, 0)
            ToggleTitle.Font = Enum.Font.GothamBold
            ToggleTitle.Text = config.Title
            ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleTitle.TextSize = 14
            ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Parent = Toggle
            ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Position = UDim2.new(1, -45, 0.5, -10)
            ToggleButton.Size = UDim2.new(0, 35, 0, 20)
            ToggleButton.Text = ""
            
            local ToggleButtonCorner = Instance.new("UICorner")
            ToggleButtonCorner.CornerRadius = UDim.new(1, 0)
            ToggleButtonCorner.Parent = ToggleButton
            
            local ToggleIndicator = Instance.new("Frame")
            ToggleIndicator.Parent = ToggleButton
            ToggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleIndicator.BorderSizePixel = 0
            ToggleIndicator.Position = UDim2.new(0, 2, 0, 2)
            ToggleIndicator.Size = UDim2.new(0, 16, 0, 16)
            
            local IndicatorCorner = Instance.new("UICorner")
            IndicatorCorner.CornerRadius = UDim.new(1, 0)
            IndicatorCorner.Parent = ToggleIndicator
            
            local isToggled = config.Default
            
            local function UpdateToggle()
                if isToggled then
                    TweenService:Create(ToggleIndicator, TweenInfo.new(0.2), {Position = UDim2.new(0, 17, 0, 2)}):Play()
                    TweenService:Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 162, 255)}):Play()
                else
                    TweenService:Create(ToggleIndicator, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0, 2)}):Play()
                    TweenService:Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
                end
            end
            
            ToggleButton.MouseButton1Click:Connect(function()
                isToggled = not isToggled
                UpdateToggle()
                config.Callback(isToggled)
            end)
            
            UpdateToggle()
            
            -- Update canvas size
            self.TabContent.CanvasSize = UDim2.new(0, 0, 0, self.ContentLayout.AbsoluteContentSize.Y)
            
            return Toggle
        end
        
        -- Tab click event
        TabInteract.MouseButton1Click:Connect(function()
            Tab:Select()
        end)
        
        -- Add to tabs list
        table.insert(self.Tabs, Tab)
        
        -- Update scrolling frame
        self.TabsScrolling.CanvasSize = UDim2.new(0, 0, 0, self.TabsLayout.AbsoluteContentSize.Y)
        
        -- Select first tab
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
        config.Icon = config.Icon or "rbxassetid://10709770005"
        config.Duration = config.Duration or 5
        
        -- Use spawn or coroutine for non-blocking delay
        spawn(function()
            local Notification = Instance.new("Frame")
            Notification.Parent = self.NotificationsContainer
            Notification.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            Notification.BorderSizePixel = 0
            Notification.Size = UDim2.new(1, 0, 0, 80)
            
            local NotifCorner = Instance.new("UICorner")
            NotifCorner.CornerRadius = UDim.new(0, 12)
            NotifCorner.Parent = Notification
            
            local NotifIcon = Instance.new("ImageLabel")
            NotifIcon.Parent = Notification
            NotifIcon.BackgroundTransparency = 1
            NotifIcon.Position = UDim2.new(0, 15, 0.5, -12)
            NotifIcon.Size = UDim2.new(0, 24, 0, 24)
            NotifIcon.Image = config.Icon
            
            local NotifTitle = Instance.new("TextLabel")
            NotifTitle.Parent = Notification
            NotifTitle.BackgroundTransparency = 1
            NotifTitle.Position = UDim2.new(0, 50, 0, 10)
            NotifTitle.Size = UDim2.new(1, -60, 0, 20)
            NotifTitle.Font = Enum.Font.GothamBold
            NotifTitle.Text = config.Title
            NotifTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            NotifTitle.TextSize = 16
            NotifTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            local NotifDesc = Instance.new("TextLabel")
            NotifDesc.Parent = Notification
            NotifDesc.BackgroundTransparency = 1
            NotifDesc.Position = UDim2.new(0, 50, 0, 30)
            NotifDesc.Size = UDim2.new(1, -60, 0, 40)
            NotifDesc.Font = Enum.Font.Gotham
            NotifDesc.Text = config.Description
            NotifDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
            NotifDesc.TextSize = 14
            NotifDesc.TextWrapped = true
            NotifDesc.TextXAlignment = Enum.TextXAlignment.Left
            NotifDesc.TextYAlignment = Enum.TextYAlignment.Top
            
            -- Animate in
            Notification.Position = UDim2.new(1, 0, 0, 0)
            local tweenIn = TweenService:Create(Notification, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Position = UDim2.new(0, 0, 0, 0)})
            tweenIn:Play()
            
            -- Auto dismiss
            wait(config.Duration)
            local tweenOut = TweenService:Create(Notification, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Position = UDim2.new(1, 0, 0, 0)})
            tweenOut:Play()
            
            tweenOut.Completed:Connect(function()
                Notification:Destroy()
            end)
        end)
    end
    
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
    
    -- Return window object
    return Window
end

-- Return library
return EyeUI
