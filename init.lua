-- Roblox UI Library
-- Version: 2.0

local UI = {}
UI.__index = UI

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Global Notification System
local NotificationQueue = {}
local NotificationActive = false

function UI:Notify(options)
    local title = options.Title or "Notification"
    local content = options.Content or ""
    local duration = options.Duration or 3 -- seconds

    table.insert(NotificationQueue, {Title = title, Content = content, Duration = duration})

    if not NotificationActive then
        UI:ProcessNotificationQueue()
    end
end

function UI:ProcessNotificationQueue()
    if #NotificationQueue == 0 then
        NotificationActive = false
        return
    end

    NotificationActive = true
    local currentNotification = table.remove(NotificationQueue, 1)

    local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

    local NotificationFrame = Instance.new("Frame")
    NotificationFrame.Name = "UI_Notification"
    NotificationFrame.Size = UDim2.new(0, 300, 0, 80)
    NotificationFrame.Position = UDim2.new(0.5, -150, 1, 20) -- Start off-screen bottom
    NotificationFrame.AnchorPoint = Vector2.new(0.5, 0)
    NotificationFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    NotificationFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotificationFrame.BorderSizePixel = 0
    NotificationFrame.Parent = playerGui
    NotificationFrame.ZIndex = 10 -- Ensure it's on top

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = NotificationFrame

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "Title"
    TitleLabel.Size = UDim2.new(1, 0, 0.4, 0)
    TitleLabel.Position = UDim2.new(0, 0, 0.1, 0)
    TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = currentNotification.Title
    TitleLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
    TitleLabel.TextSize = 16
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
    TitleLabel.Parent = NotificationFrame

    local ContentLabel = Instance.new("TextLabel")
    ContentLabel.Name = "Content"
    ContentLabel.Size = UDim2.new(1, 0, 0.4, 0)
    ContentLabel.Position = UDim2.new(0, 0, 0.5, 0)
    ContentLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ContentLabel.BackgroundTransparency = 1
    ContentLabel.Font = Enum.Font.Gotham
    ContentLabel.Text = currentNotification.Content
    ContentLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    ContentLabel.TextSize = 14
    ContentLabel.TextXAlignment = Enum.TextXAlignment.Center
    ContentLabel.Parent = NotificationFrame

    local tweenInfoIn = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tweenInfoOut = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

    -- Move up
    local goalIn = {Position = UDim2.new(0.5, -150, 1, -100)} -- Adjust -100 to control how high it pops up
    local tweenIn = TweenService:Create(NotificationFrame, tweenInfoIn, goalIn)

    -- Move down and destroy
    local goalOut = {Position = UDim2.new(0.5, -150, 1, 20)}
    local tweenOut = TweenService:Create(NotificationFrame, tweenInfoOut, goalOut)

    tweenIn:Play()
    tweenIn.Completed:Wait()

    task.wait(currentNotification.Duration)

    tweenOut:Play()
    tweenOut.Completed:Wait()

    NotificationFrame:Destroy()
    UI:ProcessNotificationQueue() -- Process next notification
end


-- Window Class
local Window = {}
Window.__index = Window

function UI:CreateWindow(options)
    local self = setmetatable({}, Window)

    local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

    self.ScreenGui = Instance.new("ScreenGui")
    self.ScreenGui.Name = options.Name or "ModernUI"
    self.ScreenGui.Parent = playerGui
    self.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    self.Menu = Instance.new("Frame")
    self.Menu.Name = "Menu"
    self.Menu.Parent = self.ScreenGui
    self.Menu.AnchorPoint = Vector2.new(0.5, 0.5)
    self.Menu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    self.Menu.BorderColor3 = Color3.fromRGB(0, 0, 0)
    self.Menu.BorderSizePixel = 0
    self.Menu.Position = UDim2.new(0.5, 0, 0.5, 0)
    self.Menu.Size = UDim2.new(0, 580, 0, 390)

    local UICorner_Menu = Instance.new("UICorner")
    UICorner_Menu.CornerRadius = UDim.new(0.05, 0)
    UICorner_Menu.Parent = self.Menu

    -- Topbar (Drag, Close, Minimize)
    self.Topbar = Instance.new("Frame")
    self.Topbar.Name = "Topbar"
    self.Topbar.Parent = self.Menu
    self.Topbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    self.Topbar.BackgroundTransparency = 1.000
    self.Topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    self.Topbar.BorderSizePixel = 0
    self.Topbar.Position = UDim2.new(0, 0, 0, 0)
    self.Topbar.Size = UDim2.new(1, 0, 0, 50) -- Full width of menu, fixed height

    local Title_7 = Instance.new("TextLabel")
    Title_7.Name = "Title"
    Title_7.Parent = self.Topbar
    Title_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_7.BackgroundTransparency = 1.000
    Title_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title_7.BorderSizePixel = 0
    Title_7.Position = UDim2.new(0.0913793072, 0, 0, 0)
    Title_7.Size = UDim2.new(0, 266, 0, 38)
    Title_7.Font = Enum.Font.GothamBold
    Title_7.Text = options.Name or "Eye UI"
    Title_7.TextColor3 = Color3.fromRGB(230, 230, 230)
    Title_7.TextSize = 12.000
    Title_7.TextXAlignment = Enum.TextXAlignment.Left

    local Image = Instance.new("ImageLabel")
    Image.Name = "Icon"
    Image.Parent = self.Topbar
    Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Image.BackgroundTransparency = 1.000
    Image.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Image.BorderSizePixel = 0
    Image.Position = UDim2.new(0.0310315024, 0, 0.190769196, 0)
    Image.Size = UDim2.new(0, 25, 0, 26)
    Image.Image = "rbxassetid://" .. (options.Icon or "6523858394") -- Default icon
    
    local Description_5 = Instance.new("TextLabel")
    Description_5.Name = "Description"
    Description_5.Parent = self.Topbar
    Description_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Description_5.BackgroundTransparency = 1.000
    Description_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Description_5.BorderSizePixel = 0
    Description_5.Position = UDim2.new(0.0896522105, 0, 0.270769209, 0)
    Description_5.Size = UDim2.new(0, 266, 0, 38)
    Description_5.Font = Enum.Font.GothamBold
    Description_5.Text = options.Description or "worst ui ever"
    Description_5.TextColor3 = Color3.fromRGB(176, 176, 176)
    Description_5.TextSize = 12.000
    Description_5.TextXAlignment = Enum.TextXAlignment.Left

    -- Close Button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "Close"
    CloseButton.Parent = self.Topbar
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.BackgroundTransparency = 1.000
    CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CloseButton.BorderSizePixel = 0
    CloseButton.Position = UDim2.new(0.937879443, 0, 0, 0)
    CloseButton.Size = UDim2.new(0, 35, 0, 37)
    CloseButton.Font = Enum.Font.SourceSans
    CloseButton.Text = ""
    CloseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    CloseButton.TextSize = 14.000

    local ImageLabel_4 = Instance.new("ImageLabel")
    ImageLabel_4.Parent = CloseButton
    ImageLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_4.BackgroundTransparency = 1.000
    ImageLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageLabel_4.BorderSizePixel = 0
    ImageLabel_4.Position = UDim2.new(0.0619053431, 0, 0.275676012, 0)
    ImageLabel_4.Size = UDim2.new(0, 22, 0, 22)
    ImageLabel_4.Image = "rbxassetid://10747384394"

    local UICorner_Close = Instance.new("UICorner")
    UICorner_Close.CornerRadius = UDim.new(0.02, 8)
    UICorner_Close.Parent = CloseButton

    CloseButton.MouseButton1Click:Connect(function()
        self.ScreenGui:Destroy()
    end)

    -- Minimize Button
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "Minimize"
    MinimizeButton.Parent = CloseButton -- Parented to CloseButton for relative positioning
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.BackgroundTransparency = 1.000
    MinimizeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MinimizeButton.BorderSizePixel = 0
    MinimizeButton.Position = UDim2.new(-1.04247344, 0, 0, 0) -- Adjusted relative to CloseButton
    MinimizeButton.Size = UDim2.new(0, 29, 0, 37)
    MinimizeButton.Font = Enum.Font.SourceSans
    MinimizeButton.Text = ""
    MinimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    MinimizeButton.TextSize = 14.000

    local ImageLabel_5 = Instance.new("ImageLabel")
    ImageLabel_5.Parent = MinimizeButton
    ImageLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_5.BackgroundTransparency = 1.000
    ImageLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageLabel_5.BorderSizePixel = 0
    ImageLabel_5.Position = UDim2.new(0.29313615, 0, 0.248648971, 0)
    ImageLabel_5.Size = UDim2.new(0, 22, 0, 22)
    ImageLabel_5.Image = "rbxassetid://10734896206"

    local UICorner_Minimize = Instance.new("UICorner")
    UICorner_Minimize.CornerRadius = UDim.new(0.02, 8)
    UICorner_Minimize.Parent = MinimizeButton

    local isMinimized = false
    local originalMenuSize = self.Menu.Size
    MinimizeButton.MouseButton1Click:Connect(function()
        if isMinimized then
            -- Restore
            self.ContentScrollingFrame.Visible = true
            self.Menu.Size = originalMenuSize
        else
            -- Minimize
            self.ContentScrollingFrame.Visible = false
            self.Menu.Size = UDim2.new(originalMenuSize.X.Scale, originalMenuSize.X.Offset, 0, self.Topbar.Size.Y.Offset)
        end
        isMinimized = not isMinimized
    end)

    -- Drag Functionality
    local DragBar = Instance.new("Frame")
    DragBar.Name = "Drag"
    DragBar.Parent = self.Menu
    DragBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DragBar.BackgroundTransparency = 0.750
    DragBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    DragBar.BorderSizePixel = 0
    DragBar.Position = UDim2.new(0.377262533, 0, 1.02564108, 0)
    DragBar.Size = UDim2.new(0, 192, 0, 5)

    local UICorner_Drag = Instance.new("UICorner")
    UICorner_Drag.Parent = DragBar

    local dragging = false
    local dragStart, startPos

    DragBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = self.Menu.Position
        end
    end)

    DragBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            local delta = input.Position - dragStart
            self.Menu.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    -- Tabs Container
    self.TabsFrame = Instance.new("Frame")
    self.TabsFrame.Name = "Tabs"
    self.TabsFrame.Parent = self.Menu
    self.TabsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    self.TabsFrame.BackgroundTransparency = 1.000
    self.TabsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    self.TabsFrame.BorderSizePixel = 0
    self.TabsFrame.Position = UDim2.new(0, 0, 0.128204897, 0)
    self.TabsFrame.Size = UDim2.new(0, 127, 0, 339)

    local UIListLayout_Tabs = Instance.new("UIListLayout")
    UIListLayout_Tabs.Parent = self.TabsFrame
    UIListLayout_Tabs.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_Tabs.Padding = UDim.new(0, 5) -- Padding between tabs

    -- Content Scrolling Frame
    self.ContentScrollingFrame = Instance.new("ScrollingFrame")
    self.ContentScrollingFrame.Name = "ContentScrollingFrame"
    self.ContentScrollingFrame.Parent = self.Menu
    self.ContentScrollingFrame.Active = true
    self.ContentScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    self.ContentScrollingFrame.BackgroundTransparency = 1.000
    self.ContentScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    self.ContentScrollingFrame.BorderSizePixel = 0
    self.ContentScrollingFrame.Position = UDim2.new(0.231930301, 0, 0.130866259, 0)
    self.ContentScrollingFrame.Size = UDim2.new(0, 444, 0, 338)
    self.ContentScrollingFrame.ScrollBarThickness = 7
    self.ContentScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0) -- Will be updated by UIListLayout

    local UIPadding_Content = Instance.new("UIPadding")
    UIPadding_Content.Parent = self.ContentScrollingFrame
    UIPadding_Content.PaddingBottom = UDim.new(0, 10)
    UIPadding_Content.PaddingLeft = UDim.new(0, 15)
    UIPadding_Content.PaddingRight = UDim.new(0, 15)
    UIPadding_Content.PaddingTop = UDim.new(0, 10)

    local UIListLayout_Content = Instance.new("UIListLayout")
    UIListLayout_Content.Parent = self.ContentScrollingFrame
    UIListLayout_Content.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_Content.Padding = UDim.new(0, 7)
    UIListLayout_Content.FillDirection = Enum.FillDirection.Vertical
    UIListLayout_Content.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout_Content.VerticalAlignment = Enum.VerticalAlignment.Top

    -- Adjust CanvasSize automatically
    UIListLayout_Content.Changed:Connect(function(property)
        if property == "AbsoluteContentSize" then
            self.ContentScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_Content.AbsoluteContentSize.Y)
        end
    end)


    self.tabs = {}
    self.activeTab = nil

    return self
end

-- Tab Class
local Tab = {}
Tab.__index = Tab

function Window:CreateTab(name, iconAssetId)
    local self = setmetatable({}, Tab)
    self.Window = self -- Reference back to the parent window
    self.Name = name

    -- Tab Button
    local TabButton = Instance.new("Frame")
    TabButton.Name = name:gsub(" ", "") -- Remove spaces for instance name
    TabButton.Parent = self.Window.TabsFrame
    TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.BackgroundTransparency = 1.000
    TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabButton.BorderSizePixel = 0
    TabButton.Size = UDim2.new(0, 127, 0, 48)

    local TabImage = Instance.new("ImageLabel")
    TabImage.Parent = TabButton
    TabImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabImage.BackgroundTransparency = 1.000
    TabImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabImage.BorderSizePixel = 0
    TabImage.Position = UDim2.new(0.144427419, 0, 0.221702576, 0)
    TabImage.Size = UDim2.new(0, 25, 0, 25)
    TabImage.Image = "rbxassetid://" .. (iconAssetId or "10734966248") -- Default icon
    TabImage.ImageColor3 = Color3.fromRGB(150, 150, 150) -- Default inactive color

    local TabText = Instance.new("TextLabel")
    TabText.Parent = TabButton
    TabText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabText.BackgroundTransparency = 1.000
    TabText.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabText.BorderSizePixel = 0
    TabText.Position = UDim2.new(0.413412273, 0, 0.0416666679, 0)
    TabText.Size = UDim2.new(0, 82, 0, 44)
    TabText.Font = Enum.Font.GothamBold
    TabText.Text = name
    TabText.TextColor3 = Color3.fromRGB(150, 150, 150) -- Default inactive color
    TabText.TextSize = 14.000
    TabText.TextXAlignment = Enum.TextXAlignment.Left

    local ActiveIndicator = Instance.new("Frame")
    ActiveIndicator.Parent = TabButton
    ActiveIndicator.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ActiveIndicator.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ActiveIndicator.BorderSizePixel = 0
    ActiveIndicator.Position = UDim2.new(0.0629921257, 0, 0.0206489675, 0)
    ActiveIndicator.Size = UDim2.new(0, 3, 0, 33)
    ActiveIndicator.Visible = false -- Initially hidden

    -- Content Frame for this specific tab
    self.ContentFrame = Instance.new("Frame")
    self.ContentFrame.Name = name .. "Content"
    self.ContentFrame.Parent = self.Window.ContentScrollingFrame
    self.ContentFrame.Size = UDim2.new(1, 0, 0, 0) -- Will be sized by its children via UIListLayout
    self.ContentFrame.BackgroundTransparency = 1
    self.ContentFrame.Visible = false -- Initially hidden

    local UIListLayout_TabContent = Instance.new("UIListLayout")
    UIListLayout_TabContent.Parent = self.ContentFrame
    UIListLayout_TabContent.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_TabContent.Padding = UDim.new(0, 7)
    UIListLayout_TabContent.FillDirection = Enum.FillDirection.Vertical
    UIListLayout_TabContent.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout_TabContent.VerticalAlignment = Enum.VerticalAlignment.Top

    -- Adjust ContentFrame size based on its children
    UIListLayout_TabContent.Changed:Connect(function(property)
        if property == "AbsoluteContentSize" then
            self.ContentFrame.Size = UDim2.new(1, 0, 0, UIListLayout_TabContent.AbsoluteContentSize.Y)
        end
    end)

    self.Window.tabs[name] = {
        Button = TabButton,
        Text = TabText,
        Image = TabImage,
        Indicator = ActiveIndicator,
        Content = self.ContentFrame
    }

    TabButton.MouseButton1Click:Connect(function()
        self.Window:SetActiveTab(name)
    end)

    if not self.Window.activeTab then
        self.Window:SetActiveTab(name) -- Set the first created tab as active
    end

    return self
end

function Window:SetActiveTab(tabName)
    if self.activeTab == tabName then return end

    -- Deactivate current tab
    if self.activeTab and self.tabs[self.activeTab] then
        local currentTab = self.tabs[self.activeTab]
        currentTab.Text.TextColor3 = Color3.fromRGB(150, 150, 150)
        currentTab.Image.ImageColor3 = Color3.fromRGB(150, 150, 150)
        currentTab.Indicator.Visible = false
        currentTab.Content.Visible = false
    end

    -- Activate new tab
    local newTab = self.tabs[tabName]
    if newTab then
        newTab.Text.TextColor3 = Color3.fromRGB(230, 230, 230)
        newTab.Image.ImageColor3 = Color3.fromRGB(230, 230, 230)
        newTab.Indicator.Visible = true
        newTab.Content.Visible = true
        self.activeTab = tabName
    end
end

-- Tab Content Elements

function Tab:CreateSection(titleText)
    local Title = Instance.new("TextLabel")
    Title.Name = "SectionTitle"
    Title.Parent = self.ContentFrame
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title.BorderSizePixel = 0
    Title.Size = UDim2.new(1, 0, 0, 25) -- Full width, fixed height
    Title.Font = Enum.Font.GothamBold
    Title.Text = titleText
    Title.TextColor3 = Color3.fromRGB(230, 230, 230)
    Title.TextSize = 14.000
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.TextScaled = false
    Title.AutomaticSize = Enum.AutomaticSize.Y

    return Title
end

function Tab:CreateButton(options)
    local Name = options.Name or "Button"
    local DescriptionText = options.Description or "Click to perform an action"
    local Callback = options.Callback or function() end
    local IconAssetId = options.Icon or "10734898355"

    local ButtonFrame = Instance.new("Frame")
    ButtonFrame.Name = Name:gsub(" ", "")
    ButtonFrame.Parent = self.ContentFrame
    ButtonFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
    ButtonFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ButtonFrame.BorderSizePixel = 0
    ButtonFrame.Size = UDim2.new(1, 0, 0, 53) -- Full width of content frame, fixed height

    local UICorner_Button = Instance.new("UICorner")
    UICorner_Button.CornerRadius = UDim.new(0.2, 0)
    UICorner_Button.Parent = ButtonFrame

    local Title_Button = Instance.new("TextLabel")
    Title_Button.Name = "Title"
    Title_Button.Parent = ButtonFrame
    Title_Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_Button.BackgroundTransparency = 1.000
    Title_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title_Button.BorderSizePixel = 0
    Title_Button.Position = UDim2.new(0.048780486, 0, 0.0566037744, 0)
    Title_Button.Size = UDim2.new(0, 200, 0, 30)
    Title_Button.Font = Enum.Font.GothamBold
    Title_Button.Text = Name
    Title_Button.TextColor3 = Color3.fromRGB(230, 230, 230)
    Title_Button.TextSize = 14.000
    Title_Button.TextXAlignment = Enum.TextXAlignment.Left

    local Description_Button = Instance.new("TextLabel")
    Description_Button.Name = "Description"
    Description_Button.Parent = ButtonFrame
    Description_Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Description_Button.BackgroundTransparency = 1.000
    Description_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Description_Button.BorderSizePixel = 0
    Description_Button.Position = UDim2.new(0.048780486, 0, 0.320754707, 0)
    Description_Button.Size = UDim2.new(0, 200, 0, 30)
    Description_Button.Font = Enum.Font.GothamBold
    Description_Button.Text = DescriptionText
    Description_Button.TextColor3 = Color3.fromRGB(153, 153, 153)
    Description_Button.TextSize = 14.000
    Description_Button.TextXAlignment = Enum.TextXAlignment.Left

    local ImageLabel_Button = Instance.new("ImageLabel")
    ImageLabel_Button.Parent = ButtonFrame
    ImageLabel_Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_Button.BackgroundTransparency = 1.000
    ImageLabel_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageLabel_Button.BorderSizePixel = 0
    ImageLabel_Button.Position = UDim2.new(0.922207296, 0, 0.308760732, 0)
    ImageLabel_Button.Size = UDim2.new(0, 20, 0, 20)
    ImageLabel_Button.Image = "rbxassetid://" .. IconAssetId

    local InteractButton = Instance.new("TextButton")
    InteractButton.Name = "Interact"
    InteractButton.Parent = ButtonFrame
    InteractButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    InteractButton.BackgroundTransparency = 1.000
    InteractButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    InteractButton.BorderSizePixel = 0
    InteractButton.Position = UDim2.new(0, 0, 0, 0)
    InteractButton.Size = UDim2.new(1, 0, 1, 0) -- Fill parent
    InteractButton.Font = Enum.Font.SourceSans
    InteractButton.Text = ""
    InteractButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    InteractButton.TextSize = 14.000

    InteractButton.MouseButton1Click:Connect(Callback)

    return ButtonFrame
end

function Tab:CreateToggle(options)
    local Name = options.Name or "Toggle Feature"
    local DescriptionText = options.Description or "Toggle to enable or disable the feature"
    local DefaultValue = options.Default or false
    local Callback = options.Callback or function(value) end

    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Name = Name:gsub(" ", "")
    ToggleFrame.Parent = self.ContentFrame
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
    ToggleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ToggleFrame.BorderSizePixel = 0
    ToggleFrame.Size = UDim2.new(1, 0, 0, 53)

    local UICorner_Toggle = Instance.new("UICorner")
    UICorner_Toggle.CornerRadius = UDim.new(0.2, 0)
    UICorner_Toggle.Parent = ToggleFrame

    local Title_Toggle = Instance.new("TextLabel")
    Title_Toggle.Name = "Title"
    Title_Toggle.Parent = ToggleFrame
    Title_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_Toggle.BackgroundTransparency = 1.000
    Title_Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title_Toggle.BorderSizePixel = 0
    Title_Toggle.Position = UDim2.new(0.0487804599, 0, 0.0570333228, 0)
    Title_Toggle.Size = UDim2.new(0, 200, 0, 30)
    Title_Toggle.Font = Enum.Font.GothamBold
    Title_Toggle.Text = Name
    Title_Toggle.TextColor3 = Color3.fromRGB(230, 230, 230)
    Title_Toggle.TextSize = 14.000
    Title_Toggle.TextXAlignment = Enum.TextXAlignment.Left

    local Description_Toggle = Instance.new("TextLabel")
    Description_Toggle.Name = "Description"
    Description_Toggle.Parent = ToggleFrame
    Description_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Description_Toggle.BackgroundTransparency = 1.000
    Description_Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Description_Toggle.BorderSizePixel = 0
    Description_Toggle.Position = UDim2.new(0.0463995077, 0, 0.301886797, 0)
    Description_Toggle.Size = UDim2.new(0, 200, 0, 30)
    Description_Toggle.Font = Enum.Font.GothamBold
    Description_Toggle.Text = DescriptionText
    Description_Toggle.TextColor3 = Color3.fromRGB(153, 153, 153)
    Description_Toggle.TextSize = 14.000
    Description_Toggle.TextXAlignment = Enum.TextXAlignment.Left

    local ToggleSwitch = Instance.new("Frame")
    ToggleSwitch.Name = "ToggleSwitch"
    ToggleSwitch.Parent = ToggleFrame
    ToggleSwitch.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ToggleSwitch.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ToggleSwitch.BorderSizePixel = 0
    ToggleSwitch.Position = UDim2.new(0.86853379, 0, 0.355917603, 0)
    ToggleSwitch.Size = UDim2.new(0, 35, 0, 15)

    local UICorner_ToggleSwitch = Instance.new("UICorner")
    UICorner_ToggleSwitch.CornerRadius = UDim.new(0.4, 0)
    UICorner_ToggleSwitch.Parent = ToggleSwitch

    local ToggleButton = Instance.new("Frame")
    ToggleButton.Name = "ToggleButton"
    ToggleButton.Parent = ToggleSwitch
    ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ToggleButton.BorderSizePixel = 0
    ToggleButton.Size = UDim2.new(0, 18, 0, 18)

    local UICorner_ToggleButton = Instance.new("UICorner")
    UICorner_ToggleButton.CornerRadius = UDim.new(1, 0)
    UICorner_ToggleButton.Parent = ToggleButton

    local isOn = DefaultValue
    local function updateToggleState()
        local targetPosition = isOn and UDim2.new(1, -ToggleButton.Size.X.Offset, -0.0666666701, 0) or UDim2.new(0, 0, -0.0666666701, 0)
        local targetColor = isOn and Color3.fromRGB(70, 130, 180) or Color3.fromRGB(40, 40, 40)

        TweenService:Create(ToggleButton, TweenInfo.new(0.2), {Position = targetPosition}):Play()
        TweenService:Create(ToggleSwitch, TweenInfo.new(0.2), {BackgroundColor3 = targetColor}):Play()
    end

    ToggleSwitch.MouseButton1Click:Connect(function()
        isOn = not isOn
        updateToggleState()
        Callback(isOn)
    end)

    updateToggleState() -- Initial state setup

    return ToggleFrame
end

function Tab:CreateSlider(options)
    local Name = options.Name or "Set Value"
    local Min = options.Min or 0
    local Max = options.Max or 100
    local DefaultValue = options.Default or Min
    local Step = options.Step or 1
    local Callback = options.Callback or function(value) end

    local SliderFrame = Instance.new("Frame")
    SliderFrame.Name = Name:gsub(" ", "")
    SliderFrame.Parent = self.ContentFrame
    SliderFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
    SliderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SliderFrame.BorderSizePixel = 0
    SliderFrame.Size = UDim2.new(1, 0, 0, 44)

    local UICorner_Slider = Instance.new("UICorner")
    UICorner_Slider.CornerRadius = UDim.new(0.2, 0)
    UICorner_Slider.Parent = SliderFrame

    local Title_Slider = Instance.new("TextLabel")
    Title_Slider.Name = "Title"
    Title_Slider.Parent = SliderFrame
    Title_Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_Slider.BackgroundTransparency = 1.000
    Title_Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title_Slider.BorderSizePixel = 0
    Title_Slider.Position = UDim2.new(0.0487804599, 0, 0.170240223, 0)
    Title_Slider.Size = UDim2.new(0, 200, 0, 30)
    Title_Slider.Font = Enum.Font.GothamBold
    Title_Slider.Text = Name
    Title_Slider.TextColor3 = Color3.fromRGB(230, 230, 230)
    Title_Slider.TextSize = 14.000
    Title_Slider.TextXAlignment = Enum.TextXAlignment.Left

    local SliderBar = Instance.new("Frame")
    SliderBar.Name = "SliderBar"
    SliderBar.Parent = SliderFrame
    SliderBar.AnchorPoint = Vector2.new(0.5, 0.5)
    SliderBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    SliderBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SliderBar.BorderSizePixel = 0
    SliderBar.Position = UDim2.new(0.584289372, 0, 0.5, 0)
    SliderBar.Size = UDim2.new(0, 177, 0, 15)

    local UICorner_SliderBar = Instance.new("UICorner")
    UICorner_SliderBar.CornerRadius = UDim.new(0.4, 0)
    UICorner_SliderBar.Parent = SliderBar

    local SliderFill = Instance.new("Frame")
    SliderFill.Name = "SliderFill"
    SliderFill.Parent = SliderBar
    SliderFill.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    SliderFill.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SliderFill.BorderSizePixel = 0
    SliderFill.Position = UDim2.new(0, 0, 0, 0)
    SliderFill.Size = UDim2.new(0, 0, 1, 0) -- Width will be dynamic

    local UICorner_SliderFill = Instance.new("UICorner")
    UICorner_SliderFill.CornerRadius = UDim.new(0.4, 0)
    UICorner_SliderFill.Parent = SliderFill

    local SliderHandle = Instance.new("Frame")
    SliderHandle.Name = "SliderHandle"
    SliderHandle.Parent = SliderBar
    SliderHandle.AnchorPoint = Vector2.new(0.5, 0.5) -- Center the handle on the mouse
    SliderHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderHandle.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SliderHandle.BorderSizePixel = 0
    SliderHandle.Size = UDim2.new(0, 18, 0, 18)

    local UICorner_SliderHandle = Instance.new("UICorner")
    UICorner_SliderHandle.CornerRadius = UDim.new(1, 0)
    UICorner_SliderHandle.Parent = SliderHandle

    local ValueTextBox = Instance.new("TextBox")
    ValueTextBox.Name = "TextBox"
    ValueTextBox.Parent = SliderFrame
    ValueTextBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    ValueTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ValueTextBox.BorderSizePixel = 0
    ValueTextBox.Position = UDim2.new(0.852177501, 0, 0.120497271, 0)
    ValueTextBox.Size = UDim2.new(0, 49, 0, 34)
    ValueTextBox.Font = Enum.Font.GothamBold
    ValueTextBox.PlaceholderText = tostring(DefaultValue)
    ValueTextBox.Text = tostring(DefaultValue)
    ValueTextBox.TextColor3 = Color3.fromRGB(230, 230, 230)
    ValueTextBox.TextSize = 14.000
    ValueTextBox.TextXAlignment = Enum.TextXAlignment.Center

    local UICorner_ValueTextBox = Instance.new("UICorner")
    UICorner_ValueTextBox.CornerRadius = UDim.new(0.2, 0)
    UICorner_ValueTextBox.Parent = ValueTextBox

    local currentValue = DefaultValue
    local draggingSlider = false

    local function updateSlider(pixelX)
        local barWidth = SliderBar.AbsoluteSize.X
        local handleWidth = SliderHandle.AbsoluteSize.X
        local minX = handleWidth / 2
        local maxX = barWidth - (handleWidth / 2)

        local clampedX = math.clamp(pixelX, minX, maxX)
        local normalizedValue = (clampedX - minX) / (maxX - minX)
        local rawValue = Min + (Max - Min) * normalizedValue
        currentValue = math.round(rawValue / Step) * Step
        currentValue = math.clamp(currentValue, Min, Max)

        local fillWidthScale = (currentValue - Min) / (Max - Min)
        SliderFill.Size = UDim2.new(fillWidthScale, 0, 1, 0)

        local handleX = minX + (maxX - minX) * fillWidthScale
        SliderHandle.Position = UDim2.new(0, handleX, 0.5, 0)
        ValueTextBox.Text = tostring(currentValue)
        Callback(currentValue)
    end

    SliderHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingSlider = true
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    draggingSlider = false
                end
            end)
        end
    end)

    SliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingSlider = true
            local relativeX = input.Position.X - SliderBar.AbsolutePosition.X
            updateSlider(relativeX)
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    draggingSlider = false
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and draggingSlider then
            local relativeX = input.Position.X - SliderBar.AbsolutePosition.X
            updateSlider(relativeX)
        end
    end)

    ValueTextBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local newValue = tonumber(ValueTextBox.Text)
            if newValue then
                newValue = math.round(newValue / Step) * Step
                newValue = math.clamp(newValue, Min, Max)
                currentValue = newValue
                updateSlider(SliderBar.AbsoluteSize.X * ((currentValue - Min) / (Max - Min)) + SliderHandle.AbsoluteSize.X / 2) -- Update handle position
                Callback(currentValue)
            else
                ValueTextBox.Text = tostring(currentValue) -- Revert if invalid input
            end
        end
    end)

    -- Initial update
    updateSlider(SliderBar.AbsoluteSize.X * ((DefaultValue - Min) / (Max - Min)) + SliderHandle.AbsoluteSize.X / 2)

    return SliderFrame
end

function Tab:CreateInput(options)
    local Name = options.Name or "Input Text"
    local DescriptionText = options.Description or "Type something here"
    local Placeholder = options.Placeholder or "Enter value"
    local DefaultValue = options.Default or ""
    local Callback = options.Callback or function(text) end

    local InputFrame = Instance.new("Frame")
    InputFrame.Name = Name:gsub(" ", "")
    InputFrame.Parent = self.ContentFrame
    InputFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
    InputFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    InputFrame.BorderSizePixel = 0
    InputFrame.Size = UDim2.new(1, 0, 0, 53)

    local UICorner_Input = Instance.new("UICorner")
    UICorner_Input.CornerRadius = UDim.new(0.2, 0)
    UICorner_Input.Parent = InputFrame

    local Title_Input = Instance.new("TextLabel")
    Title_Input.Name = "Title"
    Title_Input.Parent = InputFrame
    Title_Input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_Input.BackgroundTransparency = 1.000
    Title_Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title_Input.BorderSizePixel = 0
    Title_Input.Position = UDim2.new(0.048780486, 0, 0.0566037744, 0)
    Title_Input.Size = UDim2.new(0, 200, 0, 30)
    Title_Input.Font = Enum.Font.GothamBold
    Title_Input.Text = Name
    Title_Input.TextColor3 = Color3.fromRGB(230, 230, 230)
    Title_Input.TextSize = 14.000
    Title_Input.TextXAlignment = Enum.TextXAlignment.Left

    local Description_Input = Instance.new("TextLabel")
    Description_Input.Name = "Description"
    Description_Input.Parent = InputFrame
    Description_Input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Description_Input.BackgroundTransparency = 1.000
    Description_Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Description_Input.BorderSizePixel = 0
    Description_Input.Position = UDim2.new(0.048780486, 0, 0.320754707, 0)
    Description_Input.Size = UDim2.new(0, 200, 0, 30)
    Description_Input.Font = Enum.Font.GothamBold
    Description_Input.Text = DescriptionText
    Description_Input.TextColor3 = Color3.fromRGB(153, 153, 153)
    Description_Input.TextSize = 14.000
    Description_Input.TextXAlignment = Enum.TextXAlignment.Left

    local InputTextBox = Instance.new("TextBox")
    InputTextBox.Name = "TextBox"
    InputTextBox.Parent = InputFrame
    InputTextBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    InputTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
    InputTextBox.BorderSizePixel = 0
    InputTextBox.Position = UDim2.new(0.673159838, 0, 0.169811323, 0)
    InputTextBox.Size = UDim2.new(0, 122, 0, 34)
    InputTextBox.Font = Enum.Font.GothamBold
    InputTextBox.PlaceholderText = Placeholder
    InputTextBox.Text = DefaultValue
    InputTextBox.TextColor3 = Color3.fromRGB(230, 230, 230)
    InputTextBox.TextSize = 14.000
    InputTextBox.TextXAlignment = Enum.TextXAlignment.Left

    local UICorner_InputTextBox = Instance.new("UICorner")
    UICorner_InputTextBox.CornerRadius = UDim.new(0.2, 0)
    UICorner_InputTextBox.Parent = InputTextBox

    InputTextBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            Callback(InputTextBox.Text)
        end
    end)

    return InputFrame
end

function Tab:CreateCheckbox(options)
    local Name = options.Name or "Checkbox"
    local DescriptionText = options.Description or "Toggle to enable or disable the feature"
    local DefaultValue = options.Default or false
    local Callback = options.Callback or function(value) end

    local CheckboxFrame = Instance.new("Frame")
    CheckboxFrame.Name = Name:gsub(" ", "")
    CheckboxFrame.Parent = self.ContentFrame
    CheckboxFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
    CheckboxFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CheckboxFrame.BorderSizePixel = 0
    CheckboxFrame.Size = UDim2.new(1, 0, 0, 53)

    local UICorner_Checkbox = Instance.new("UICorner")
    UICorner_Checkbox.CornerRadius = UDim.new(0.2, 0)
    UICorner_Checkbox.Parent = CheckboxFrame

    local Title_Checkbox = Instance.new("TextLabel")
    Title_Checkbox.Name = "Title"
    Title_Checkbox.Parent = CheckboxFrame
    Title_Checkbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_Checkbox.BackgroundTransparency = 1.000
    Title_Checkbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title_Checkbox.BorderSizePixel = 0
    Title_Checkbox.Position = UDim2.new(0.0487804599, 0, 0.0570333228, 0)
    Title_Checkbox.Size = UDim2.new(0, 200, 0, 30)
    Title_Checkbox.Font = Enum.Font.GothamBold
    Title_Checkbox.Text = Name
    Title_Checkbox.TextColor3 = Color3.fromRGB(230, 230, 230)
    Title_Checkbox.TextSize = 14.000
    Title_Checkbox.TextXAlignment = Enum.TextXAlignment.Left

    local Description_Checkbox = Instance.new("TextLabel")
    Description_Checkbox.Name = "Description"
    Description_Checkbox.Parent = CheckboxFrame
    Description_Checkbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Description_Checkbox.BackgroundTransparency = 1.000
    Description_Checkbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Description_Checkbox.BorderSizePixel = 0
    Description_Checkbox.Position = UDim2.new(0.0463995077, 0, 0.301886797, 0)
    Description_Checkbox.Size = UDim2.new(0, 200, 0, 30)
    Description_Checkbox.Font = Enum.Font.GothamBold
    Description_Checkbox.Text = DescriptionText
    Description_Checkbox.TextColor3 = Color3.fromRGB(153, 153, 153)
    Description_Checkbox.TextSize = 14.000
    Description_Checkbox.TextXAlignment = Enum.TextXAlignment.Left

    local CheckboxButton = Instance.new("ImageButton")
    CheckboxButton.Name = "CheckboxButton"
    CheckboxButton.Parent = CheckboxFrame
    CheckboxButton.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
    CheckboxButton.BackgroundTransparency = 1.000
    CheckboxButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
    CheckboxButton.BorderSizePixel = 0
    CheckboxButton.Position = UDim2.new(0.920841753, 0, 0.245280713, 0)
    CheckboxButton.Size = UDim2.new(0.0599071495, 0, 0.49056679, 0)
    CheckboxButton.Image = "rbxassetid://4458801905" -- Unchecked
    CheckboxButton.ImageColor3 = Color3.fromRGB(230, 230, 230)
    CheckboxButton.SliceScale = 0.000

    local isChecked = DefaultValue
    local states = {
        Unchecked = "rbxassetid://4458801905",
        Checked = "rbxassetid://4458804262"
    }

    local function updateCheckboxState()
        CheckboxButton.Image = isChecked and states.Checked or states.Unchecked
    end

    CheckboxButton.MouseButton1Click:Connect(function()
        isChecked = not isChecked
        updateCheckboxState()
        Callback(isChecked)
    end)

    updateCheckboxState() -- Initial state setup

    return CheckboxFrame
end

return UI
