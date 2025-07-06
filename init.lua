local EyeUI = {}

function EyeUI:CreateWindow(title, subtitle)
    -- Main GUI Instances
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Topbar = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local TitleLabel = Instance.new("TextLabel")
    local SubtitleLabel = Instance.new("TextLabel")
    local WindowIcon = Instance.new("ImageLabel")
    local CloseButton = Instance.new("TextButton")
    local CloseIcon = Instance.new("ImageLabel")
    local MinimizeButton = Instance.new("TextButton")
    local MinimizeIcon = Instance.new("ImageLabel")
    local TabsHolder = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local NotificationHolder = Instance.new("Frame")
    
    -- ScreenGui Setup
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Name = "EyeUI_"..tostring(math.random(1, 1000))
    
    -- Main Window Frame
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
    Frame.Size = UDim2.new(0, 511, 0, 337)
    
    UICorner.CornerRadius = UDim.new(0.02, 8)
    UICorner.Parent = Frame
    
    -- Topbar
    Topbar.Name = "Topbar"
    Topbar.Parent = Frame
    Topbar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Topbar.BorderSizePixel = 0
    Topbar.Size = UDim2.new(0, 511, 0, 50)
    
    UICorner_2.CornerRadius = UDim.new(1, 0)
    UICorner_2.Parent = Topbar
    
    -- Title Labels
    TitleLabel.Parent = Topbar
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0.091, 0, -0.14, 0)
    TitleLabel.Size = UDim2.new(0, 416, 0, 50)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = title or "EyeUI"
    TitleLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
    TitleLabel.TextSize = 14
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    SubtitleLabel.Parent = Topbar
    SubtitleLabel.BackgroundTransparency = 1
    SubtitleLabel.Position = UDim2.new(0.091, 0, 0.12, 0)
    SubtitleLabel.Size = UDim2.new(0, 416, 0, 50)
    SubtitleLabel.Font = Enum.Font.GothamBold
    SubtitleLabel.Text = subtitle or "UI Library"
    SubtitleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    SubtitleLabel.TextSize = 12
    SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Window Icon
    WindowIcon.Parent = Topbar
    WindowIcon.BackgroundTransparency = 1
    WindowIcon.Position = UDim2.new(0.022, 0, 0.22, 0)
    WindowIcon.Size = UDim2.new(0, 25, 0, 25)
    WindowIcon.Image = "rbxassetid://10747364761"
    
    -- Close Button
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = Topbar
    CloseButton.BackgroundTransparency = 1
    CloseButton.Position = UDim2.new(0.929, 0, 0, 0)
    CloseButton.Size = UDim2.new(0, 36, 0, 50)
    CloseButton.Font = Enum.Font.SourceSans
    CloseButton.Text = ""
    
    CloseIcon.Parent = CloseButton
    CloseIcon.BackgroundTransparency = 1
    CloseIcon.Position = UDim2.new(0.135, 0, 0.263, 0)
    CloseIcon.Size = UDim2.new(0, 23, 0, 23)
    CloseIcon.Image = "rbxassetid://10747384394"
    
    -- Minimize Button
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Parent = Topbar
    MinimizeButton.BackgroundTransparency = 1
    MinimizeButton.Position = UDim2.new(0.853, 0, 0, 0)
    MinimizeButton.Size = UDim2.new(0, 36, 0, 50)
    MinimizeButton.Font = Enum.Font.SourceSans
    MinimizeButton.Text = ""
    
    MinimizeIcon.Parent = MinimizeButton
    MinimizeIcon.BackgroundTransparency = 1
    MinimizeIcon.Position = UDim2.new(0.302, 0, 0.263, 0)
    MinimizeIcon.Size = UDim2.new(0, 23, 0, 23)
    MinimizeIcon.Image = "rbxassetid://10734896206"
    
    -- Tabs Holder
    TabsHolder.Name = "TabsHolder"
    TabsHolder.Parent = Frame
    TabsHolder.BackgroundTransparency = 1
    TabsHolder.Position = UDim2.new(0, 0, 0.135, 0)
    TabsHolder.Size = UDim2.new(0, 139, 0, 358)
    
    UIListLayout.Parent = TabsHolder
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)
    
    -- Notification Holder
    NotificationHolder.Name = "NotificationHolder"
    NotificationHolder.Parent = ScreenGui
    NotificationHolder.BackgroundTransparency = 1
    NotificationHolder.Size = UDim2.new(1, 0, 1, 0)
    
    -- Close button functionality
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Minimize button functionality
    local minimized = false
    local originalSize = Frame.Size
    MinimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            Frame:TweenSize(UDim2.new(0, 511, 0, 50), "Out", "Quad", 0.2, true)
            TabsHolder.Visible = false
        else
            Frame:TweenSize(originalSize, "Out", "Quad", 0.2, true)
            TabsHolder.Visible = true
        end
    end)
    
    -- Smooth Dragging Functionality
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function Lerp(a, b, t)
        return a + (b - a) * t
    end
    
    local function SmoothUpdate(input)
        local delta = input.Position - dragStart
        local newPos = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X, 
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
        
        local viewportSize = workspace.CurrentCamera.ViewportSize
        local windowSize = Frame.AbsoluteSize
        
        newPos = UDim2.new(
            newPos.X.Scale,
            math.clamp(newPos.X.Offset, 0, viewportSize.X - windowSize.X),
            newPos.Y.Scale,
            math.clamp(newPos.Y.Offset, 0, viewportSize.Y - windowSize.Y)
        )
        
        local currentPos = Frame.Position
        local smoothX = Lerp(currentPos.X.Offset, newPos.X.Offset, 0.5)
        local smoothY = Lerp(currentPos.Y.Offset, newPos.Y.Offset, 0.5)
        
        Frame.Position = UDim2.new(newPos.X.Scale, smoothX, newPos.Y.Scale, smoothY)
    end
    
    Topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    Topbar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            SmoothUpdate(input)
        end
    end)
    
    -- Window API
    local window = {}
    local currentTab = nil
    
    function window:AddTab(name, icon)
        local Tab = Instance.new("Frame")
        local TabButton = Instance.new("TextButton")
        local TabIcon = Instance.new("ImageLabel")
        local TabLabel = Instance.new("TextLabel")
        
        Tab.Name = name or "Tab"
        Tab.Parent = TabsHolder
        Tab.BackgroundTransparency = 1
        Tab.Size = UDim2.new(0, 139, 0, 29)
        
        TabButton.Name = "TabButton"
        TabButton.Parent = Tab
        TabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        TabButton.BackgroundTransparency = 1
        TabButton.Size = UDim2.new(1, 0, 1, 0)
        TabButton.Font = Enum.Font.SourceSans
        TabButton.Text = ""
        TabButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        TabButton.TextSize = 14
        
        TabIcon.Name = "TabIcon"
        TabIcon.Parent = TabButton
        TabIcon.BackgroundTransparency = 1
        TabIcon.Position = UDim2.new(0.115, 0, 0.135, 0)
        TabIcon.Size = UDim2.new(0, 20, 0, 20)
        TabIcon.Image = icon or "rbxassetid://10734895856"
        TabIcon.ImageColor3 = Color3.fromRGB(137, 137, 137)
        
        TabLabel.Name = "TabLabel"
        TabLabel.Parent = TabButton
        TabLabel.BackgroundTransparency = 1
        TabLabel.Position = UDim2.new(0.334, 0, 0.239, 0)
        TabLabel.Size = UDim2.new(0, 79, 0, 14)
        TabLabel.Font = Enum.Font.GothamBold
        TabLabel.Text = name or "Tab"
        TabLabel.TextColor3 = Color3.fromRGB(137, 137, 137)
        TabLabel.TextSize = 12
        TabLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Tab content frame
        local ContentFrame = Instance.new("Frame")
        ContentFrame.Name = "ContentFrame"
        ContentFrame.Parent = Frame
        ContentFrame.BackgroundTransparency = 1
        ContentFrame.Position = UDim2.new(0.272, 0, 0.148, 0)
        ContentFrame.Size = UDim2.new(0, 372, 0, 287)
        ContentFrame.Visible = false
        
        -- Tab API
        local tab = {}
        
        function tab:Show()
            -- Hide current tab
            if currentTab then
                currentTab.ContentFrame.Visible = false
                if currentTab.TabButton:FindFirstChild("TabLabel") then
                    currentTab.TabButton.TabLabel.TextColor3 = Color3.fromRGB(137, 137, 137)
                end
                if currentTab.TabButton:FindFirstChild("TabIcon") then
                    currentTab.TabButton.TabIcon.ImageColor3 = Color3.fromRGB(137, 137, 137)
                end
            end
            
            -- Show new tab
            ContentFrame.Visible = true
            TabLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
            TabIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
            currentTab = tab
        end
        
        TabButton.MouseButton1Click:Connect(function()
            tab:Show()
        end)
        
        if #TabsHolder:GetChildren() == 1 then
            tab:Show()
        end
        
        function tab:AddButton(text, callback)
            local Button = Instance.new("TextButton")
            Button.Parent = ContentFrame
            Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Button.BorderSizePixel = 0
            Button.Position = UDim2.new(0.05, 0, 0.05, 0)
            Button.Size = UDim2.new(0.9, 0, 0, 30)
            Button.Font = Enum.Font.GothamBold
            Button.Text = text or "Button"
            Button.TextColor3 = Color3.fromRGB(230, 230, 230)
            Button.TextSize = 12
            
            Button.MouseButton1Click:Connect(function()
                if callback then callback() end
            end)
            
            return Button
        end
        
        return tab
    end
    
    function window:Notify(title, message, duration, notifType)
        duration = duration or 5
        notifType = notifType or "Info"
        
        -- Notification colors
        local colors = {
            Info = Color3.fromRGB(47, 128, 237),
            Success = Color3.fromRGB(39, 174, 96),
            Warning = Color3.fromRGB(241, 196, 15),
            Error = Color3.fromRGB(231, 76, 60)
        }
        
        local Notification = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local Title = Instance.new("TextLabel")
        local Message = Instance.new("TextLabel")
        local CloseButton = Instance.new("TextButton")
        local CloseIcon = Instance.new("ImageLabel")
        local NotifIcon = Instance.new("ImageLabel")
        local TimeoutBar = Instance.new("Frame")
        local UICorner_3 = Instance.new("UICorner")
        
        Notification.Name = "Notification"
        Notification.Parent = NotificationHolder
        Notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Notification.BorderSizePixel = 0
        Notification.Position = UDim2.new(1, 10, 1, -100)
        Notification.Size = UDim2.new(0, 300, 0, 80)
        Notification.ZIndex = 10
        
        UICorner.CornerRadius = UDim.new(0.1, 0)
        UICorner.Parent = Notification
        
        -- Left accent bar
        local AccentBar = Instance.new("Frame")
        AccentBar.Name = "AccentBar"
        AccentBar.Parent = Notification
        AccentBar.BackgroundColor3 = colors[notifType] or colors.Info
        AccentBar.BorderSizePixel = 0
        AccentBar.Position = UDim2.new(0, 0, 0, 0)
        AccentBar.Size = UDim2.new(0, 5, 1, 0)
        
        -- Notification icon
        NotifIcon.Name = "NotifIcon"
        NotifIcon.Parent = Notification
        NotifIcon.BackgroundTransparency = 1
        NotifIcon.Position = UDim2.new(0.05, 0, 0.2, 0)
        NotifIcon.Size = UDim2.new(0, 25, 0, 25)
        NotifIcon.Image = "rbxassetid://10747364761"
        NotifIcon.ImageColor3 = colors[notifType] or colors.Info
        
        Title.Name = "Title"
        Title.Parent = Notification
        Title.BackgroundTransparency = 1
        Title.Position = UDim2.new(0.2, 0, 0.1, 0)
        Title.Size = UDim2.new(0.7, 0, 0.3, 0)
        Title.Font = Enum.Font.GothamBold
        Title.Text = title or "Notification"
        Title.TextColor3 = Color3.fromRGB(230, 230, 230)
        Title.TextSize = 14
        Title.TextXAlignment = Enum.TextXAlignment.Left
        
        Message.Name = "Message"
        Message.Parent = Notification
        Message.BackgroundTransparency = 1
        Message.Position = UDim2.new(0.2, 0, 0.4, 0)
        Message.Size = UDim2.new(0.7, 0, 0.5, 0)
        Message.Font = Enum.Font.Gotham
        Message.Text = message or "Message content here"
        Message.TextColor3 = Color3.fromRGB(200, 200, 200)
        Message.TextSize = 12
        Message.TextWrapped = true
        Message.TextXAlignment = Enum.TextXAlignment.Left
        Message.TextYAlignment = Enum.TextYAlignment.Top
        
        -- Close button with icon
        CloseButton.Name = "CloseButton"
        CloseButton.Parent = Notification
        CloseButton.BackgroundTransparency = 1
        CloseButton.Position = UDim2.new(0.9, 0, 0.1, 0)
        CloseButton.Size = UDim2.new(0, 20, 0, 20)
        CloseButton.ZIndex = 11
        CloseButton.Text = ""
        
        CloseIcon.Name = "CloseIcon"
        CloseIcon.Parent = CloseButton
        CloseIcon.BackgroundTransparency = 1
        CloseIcon.Size = UDim2.new(1, 0, 1, 0)
        CloseIcon.Image = "rbxassetid://10747384394"
        CloseIcon.ImageColor3 = Color3.fromRGB(150, 150, 150)
        
        -- Timeout bar
        TimeoutBar.Name = "TimeoutBar"
        TimeoutBar.Parent = Notification
        TimeoutBar.BackgroundColor3 = colors[notifType] or colors.Info
        TimeoutBar.BorderSizePixel = 0
        TimeoutBar.Position = UDim2.new(0, 5, 1, -3)
        TimeoutBar.Size = UDim2.new(1, -5, 0, 3)
        
        UICorner_3.CornerRadius = UDim.new(0, 2)
        UICorner_3.Parent = TimeoutBar
        
        -- Animate in
        Notification:TweenPosition(UDim2.new(1, -310, 1, -100), "Out", "Quad", 0.3, true)
        
        -- Animate timeout bar
        TimeoutBar:TweenSize(UDim2.new(0, 0, 0, 3), "Out", "Linear", duration, true)
        
        CloseButton.MouseButton1Click:Connect(function()
            Notification:TweenPosition(UDim2.new(1, 10, 1, -100), "Out", "Quad", 0.3, true, function()
                Notification:Destroy()
            end)
        end)
        
        task.delay(duration, function()
            if Notification and Notification.Parent then
                Notification:TweenPosition(UDim2.new(1, 10, 1, -100), "Out", "Quad", 0.3, true, function()
                    Notification:Destroy()
                end)
            end
        end)
    end
    
    return window
end

return EyeUI
