local EyeUI = {}
local TweenService = game:GetService("TweenService")

-- Animation settings
local ANIM_SPEED = 0.25
local EASE_STYLE = Enum.EasingStyle.Quint
local EASE_DIR = Enum.EasingDirection.Out

function EyeUI:CreateWindow(title, description, image)
    local EyeUI = {}
    
    -- Main UI Container
    local gui = Instance.new("ScreenGui")
    gui.Name = "EyeUI"
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    
    -- Main Frame
    local main = Instance.new("Frame")
    main.Name = "Main"
    main.BorderSizePixel = 0
    main.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    main.Size = UDim2.new(0, 580, 0, 389)
    main.Position = UDim2.new(0.29066, 0, 0.32948, 0)
    main.Parent = gui
    
    local mainCorner = Instance.new("UICorner", main)
    mainCorner.CornerRadius = UDim.new(0.03, 0)
    
    -- Topbar
    local topbar = Instance.new("Frame")
    topbar.Name = "Topbar"
    topbar.BorderSizePixel = 0
    topbar.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    topbar.Size = UDim2.new(0, 580, 0, 51)
    topbar.Parent = main
    
    local topbarCorner = Instance.new("UICorner", topbar)
    topbarCorner.CornerRadius = UDim.new(0.2, 0)
    
    -- Logo
    local logo = Instance.new("ImageLabel")
    logo.Name = "Logo"
    logo.BorderSizePixel = 0
    logo.BackgroundTransparency = 1
    logo.Image = image
    logo.Size = UDim2.new(0, 25, 0, 25)
    logo.Position = UDim2.new(0.02414, 0, 0.21704, 0)
    logo.Parent = topbar
    
    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Text = title or "EyeUI"
    titleLabel.Font = Enum.Font.GothamSSm
    titleLabel.TextSize = 14
    titleLabel.TextColor3 = Color3.fromRGB(231, 231, 231)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.BackgroundTransparency = 1
    titleLabel.Size = UDim2.new(0, 200, 0, 20)
    titleLabel.Position = UDim2.new(0.09138, 0, 0.16531, 0)
    titleLabel.Parent = topbar
    
    -- Description
    local descLabel = Instance.new("TextLabel")
    descLabel.Name = "Description"
    descLabel.Text = description or "worst ui ever."
    descLabel.Font = Enum.Font.GothamSSm
    descLabel.TextSize = 12
    descLabel.TextColor3 = Color3.fromRGB(191, 191, 191)
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.BackgroundTransparency = 1
    descLabel.Size = UDim2.new(0, 200, 0, 20)
    descLabel.Position = UDim2.new(0.09138, 0, 0.42394, 0)
    descLabel.Parent = topbar
    
    -- Close Button
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "Close"
    closeButton.Text = ""
    closeButton.BackgroundTransparency = 1
    closeButton.Size = UDim2.new(0, 35, 0, 37)
    closeButton.Position = UDim2.new(0.9396, 0, -0.0142, 0)
    closeButton.Parent = topbar
    
    local closeIcon = Instance.new("ImageLabel")
    closeIcon.Name = "CloseIcon"
    closeIcon.Image = "rbxassetid://10747384394"
    closeIcon.Size = UDim2.new(0, 22, 0, 22)
    closeIcon.Position = UDim2.new(0.06191, 0, 0.27568, 0)
    closeIcon.BackgroundTransparency = 1
    closeIcon.Parent = closeButton
    
    -- Minimize Button
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Name = "Minimize"
    minimizeButton.Text = ""
    minimizeButton.BackgroundTransparency = 1
    minimizeButton.Size = UDim2.new(0, 29, 0, 37)
    minimizeButton.Position = UDim2.new(-1.04247, 0, 0, 0)
    minimizeButton.Parent = closeButton
    
    local minimizeIcon = Instance.new("ImageLabel")
    minimizeIcon.Name = "MinimizeIcon"
    minimizeIcon.Image = "rbxassetid://10734896206"
    minimizeIcon.Size = UDim2.new(0, 22, 0, 22)
    minimizeIcon.Position = UDim2.new(0.29314, 0, 0.24865, 0)
    minimizeIcon.BackgroundTransparency = 1
    minimizeIcon.Parent = minimizeButton
    
    -- Tabs Container
    local tabs = Instance.new("Frame")
    tabs.Name = "Tabs"
    tabs.BackgroundTransparency = 1
    tabs.Size = UDim2.new(0, 145, 0, 338)
    tabs.Position = UDim2.new(0, 0, 0.13111, 0)
    tabs.Parent = main
    
    local tabsScrolling = Instance.new("ScrollingFrame")
    tabsScrolling.Name = "TabsScrolling"
    tabsScrolling.BackgroundTransparency = 1
    tabsScrolling.ScrollBarImageTransparency = 1
    tabsScrolling.Size = UDim2.new(0, 156, 0, 331)
    tabsScrolling.Position = UDim2.new(-0.03125, 0, 0, 0)
    tabsScrolling.Parent = tabs
    
    local tabsList = Instance.new("UIListLayout")
    tabsList.SortOrder = Enum.SortOrder.LayoutOrder
    tabsList.Parent = tabsScrolling
    
    local tabsPadding = Instance.new("UIPadding")
    tabsPadding.PaddingLeft = UDim.new(0, 5)
    tabsPadding.Parent = tabsScrolling
    
    -- Content Container
    local content = Instance.new("Frame")
    content.Name = "Content"
    content.BackgroundTransparency = 1
    content.Size = UDim2.new(0, 435, 0, 338)
    content.Position = UDim2.new(0.25, 0, 0.13111, 0)
    content.Parent = main
    
    -- Drag Handle
    local drag = Instance.new("Frame")
    drag.Name = "Drag"
    drag.BackgroundTransparency = 1
    drag.Size = UDim2.new(0, 225, 0, 20)
    drag.Position = UDim2.new(0.50541, 0, 0.5, 255)
    drag.Parent = gui
    
    local dragBar = Instance.new("Frame")
    dragBar.Name = "DragBar"
    dragBar.BackgroundTransparency = 0.7
    dragBar.Size = UDim2.new(0, 182, 0, 3)
    dragBar.Position = UDim2.new(0.46444, 0, 0.275, 0)
    dragBar.Parent = drag
    
    local dragCorner = Instance.new("UICorner", dragBar)
    dragCorner.CornerRadius = UDim.new(0, 20)
    
    local dragButton = Instance.new("TextButton")
    dragButton.Name = "Interact"
    dragButton.Text = ""
    dragButton.BackgroundTransparency = 1
    dragButton.Size = UDim2.new(1, 0, 1, 0)
    dragButton.Parent = drag
    
    -- Notifications
    local notifications = Instance.new("Frame")
    notifications.Name = "Notifications"
    notifications.BackgroundTransparency = 1
    notifications.Size = UDim2.new(0, 300, 0, 800)
    notifications.Position = UDim2.new(1, -20, 1, -20)
    notifications.Parent = gui
    
    local notificationsList = Instance.new("UIListLayout")
    notificationsList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    notificationsList.Padding = UDim.new(0, 8)
    notificationsList.VerticalAlignment = Enum.VerticalAlignment.Bottom
    notificationsList.SortOrder = Enum.SortOrder.LayoutOrder
    notificationsList.Parent = notifications
    
    -- Prompt (for showing/hiding UI)
    local prompt = Instance.new("Frame")
    prompt.Name = "Prompt"
    prompt.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
    prompt.Size = UDim2.new(0, 120, 0, 30)
    prompt.Position = UDim2.new(0.5, 0, 0, 20)
    prompt.Parent = gui
    
    local promptCorner = Instance.new("UICorner", prompt)
    promptCorner.CornerRadius = UDim.new(1, 0)
    
    local promptTitle = Instance.new("TextLabel")
    promptTitle.Name = "Title"
    promptTitle.Text = "Show EyeUI"
    promptTitle.Font = Enum.Font.GothamSSm
    promptTitle.TextSize = 14
    promptTitle.TextTransparency = 0.3
    promptTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    promptTitle.BackgroundTransparency = 1
    promptTitle.Size = UDim2.new(1, 0, 1, 0)
    promptTitle.Position = UDim2.new(0.5, 0, 0.5, 0)
    promptTitle.Parent = prompt
    
    local promptButton = Instance.new("TextButton")
    promptButton.Name = "Interact"
    promptButton.Text = ""
    promptButton.BackgroundTransparency = 1
    promptButton.Size = UDim2.new(1, 0, 1, 0)
    promptButton.Position = UDim2.new(0.5, 0, 0.5, 0)
    promptButton.Parent = prompt
    
    -- Animation states
    local isMinimized = false
    local isHidden = false
    local currentTab = nil
    local tabsContent = {}
    
    -- Drag functionality
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function updateInput(input)
        local delta = input.Position - dragStart
        local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        local tween = TweenService:Create(main, TweenInfo.new(0.15), {Position = newPos})
        tween:Play()
    end
    
    dragButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = main.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    dragButton.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            updateInput(input)
        end
    end)
    
    -- Close button functionality
    closeButton.MouseButton1Click:Connect(function()
        local tween = TweenService:Create(main, TweenInfo.new(ANIM_SPEED, EASE_STYLE, EASE_DIR), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(main.Position.X.Scale, main.Position.X.Offset + main.AbsoluteSize.X/2, 
                                main.Position.Y.Scale, main.Position.Y.Offset + main.AbsoluteSize.Y/2)
        })
        tween:Play()
        tween.Completed:Wait()
        gui:Destroy()
    end)
    
    -- Minimize button functionality
    minimizeButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if isMinimized then
            -- Minimize animation
            local tween = TweenService:Create(main, TweenInfo.new(ANIM_SPEED, EASE_STYLE, EASE_DIR), {
                Size = UDim2.new(0, 580, 0, 51)
            })
            tween:Play()
            tabs.Visible = false
            content.Visible = false
            minimizeIcon.Image = "rbxassetid://10734896206" -- Restore icon
        else
            -- Restore animation
            local tween = TweenService:Create(main, TweenInfo.new(ANIM_SPEED, EASE_STYLE, EASE_DIR), {
                Size = UDim2.new(0, 580, 0, 389)
            })
            tween:Play()
            tabs.Visible = true
            content.Visible = true
            minimizeIcon.Image = "rbxassetid://10734896206" -- Minimize icon
        end
    end)
    
    -- Show/Hide functionality
    promptButton.MouseButton1Click:Connect(function()
        isHidden = not isHidden
        if isHidden then
            -- Hide animation
            local tween = TweenService:Create(main, TweenInfo.new(ANIM_SPEED, EASE_STYLE, EASE_DIR), {
                Position = UDim2.new(main.Position.X.Scale, main.Position.X.Offset, 1.5, 0)
            })
            tween:Play()
            promptTitle.Text = "Show EyeUI"
        else
            -- Show animation
            local tween = TweenService:Create(main, TweenInfo.new(ANIM_SPEED, EASE_STYLE, EASE_DIR), {
                Position = UDim2.new(0.29066, 0, 0.32948, 0)
            })
            tween:Play()
            promptTitle.Text = "Hide EyeUI"
        end
    end)
    
    -- Tab creation function
    function EyeUI:CreateTab(name, icon)
        local tabButton = Instance.new("TextButton")
        tabButton.Name = name
        tabButton.Text = ""
        tabButton.BackgroundTransparency = 1
        tabButton.Size = UDim2.new(0, 144, 0, 37)
        tabButton.Parent = tabsScrolling
        
        local tabIcon = Instance.new("ImageLabel")
        tabIcon.Name = "Icon"
        tabIcon.Image = icon or "rbxassetid://10723407389"
        tabIcon.Size = UDim2.new(0, 17, 0, 17)
        tabIcon.Position = UDim2.new(0.09701, 0, 0.27027, 0)
        tabIcon.BackgroundTransparency = 1
        tabIcon.Parent = tabButton
        
        local tabLabel = Instance.new("TextLabel")
        tabLabel.Name = "Label"
        tabLabel.Text = name
        tabLabel.Font = Enum.Font.GothamSSm
        tabLabel.TextSize = 14
        tabLabel.TextColor3 = Color3.fromRGB(101, 101, 101)
        tabLabel.TextXAlignment = Enum.TextXAlignment.Left
        tabLabel.BackgroundTransparency = 1
        tabLabel.Size = UDim2.new(0, 96, 0, 27)
        tabLabel.Position = UDim2.new(0.27083, 0, 0.13514, 0)
        tabLabel.Parent = tabButton
        
        -- Tab content frame
        local tabContent = Instance.new("Frame")
        tabContent.Name = name
        tabContent.BackgroundTransparency = 1
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.Visible = false
        tabContent.Parent = content
        
        tabsContent[name] = tabContent
        
        -- Tab selection logic
        tabButton.MouseButton1Click:Connect(function()
            if currentTab then
                -- Fade out current tab
                local fadeOut = TweenService:Create(tabsContent[currentTab], TweenInfo.new(ANIM_SPEED/2), {
                    BackgroundTransparency = 1
                })
                fadeOut:Play()
                fadeOut.Completed:Wait()
                tabsContent[currentTab].Visible = false
                
                -- Reset previous tab button appearance
                for _, btn in pairs(tabsScrolling:GetChildren()) do
                    if btn:IsA("TextButton") and btn.Name == currentTab then
                        btn:FindFirstChild("Icon").ImageColor3 = Color3.fromRGB(101, 101, 101)
                        btn:FindFirstChild("Label").TextColor3 = Color3.fromRGB(101, 101, 101)
                    end
                end
            end
            
            currentTab = name
            tabContent.Visible = true
            
            -- Fade in new tab
            local fadeIn = TweenService:Create(tabContent, TweenInfo.new(ANIM_SPEED/2), {
                BackgroundTransparency = 0.95
            })
            fadeIn:Play()
            
            -- Highlight selected tab button
            tabIcon.ImageColor3 = Color3.fromRGB(231, 231, 231)
            tabLabel.TextColor3 = Color3.fromRGB(231, 231, 231)
            
            -- If this is the first tab, make it active by default
            if #tabsScrolling:GetChildren() == 3 then -- Account for UIListLayout and UIPadding
                tabButton:FindFirstChild("Icon").ImageColor3 = Color3.fromRGB(231, 231, 231)
                tabButton:FindFirstChild("Label").TextColor3 = Color3.fromRGB(231, 231, 231)
                tabContent.Visible = true
                currentTab = name
            end
        end)
        
        return tabContent
    end
    
    -- Notification function
    function EyeUI:Notify(title, message, icon, duration)
        duration = duration or 5
        
        local notification = Instance.new("Frame")
        notification.Name = "Notification"
        notification.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
        notification.Size = UDim2.new(1, 0, 0, 170)
        notification.Position = UDim2.new(0, 0, 0.81375, 0)
        notification.Parent = notifications
        
        local notificationCorner = Instance.new("UICorner", notification)
        notificationCorner.CornerRadius = UDim.new(0, 20)
        
        local notificationIcon = Instance.new("ImageLabel")
        notificationIcon.Name = "Icon"
        notificationIcon.Image = icon or "rbxassetid://77891951053543"
        notificationIcon.Size = UDim2.new(0, 24, 0, 24)
        notificationIcon.Position = UDim2.new(0, 25, 0.5, 0)
        notificationIcon.BackgroundTransparency = 1
        notificationIcon.Parent = notification
        
        local notificationTitle = Instance.new("TextLabel")
        notificationTitle.Name = "Title"
        notificationTitle.Text = title
        notificationTitle.Font = Enum.Font.GothamSSm
        notificationTitle.TextSize = 16
        notificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        notificationTitle.TextXAlignment = Enum.TextXAlignment.Left
        notificationTitle.BackgroundTransparency = 1
        notificationTitle.Size = UDim2.new(1, -80, 0, 16)
        notificationTitle.Position = UDim2.new(0, 70, 0, 15)
        notificationTitle.Parent = notification
        
        local notificationDesc = Instance.new("TextLabel")
        notificationDesc.Name = "Description"
        notificationDesc.Text = message
        notificationDesc.Font = Enum.Font.GothamSSm
        notificationDesc.TextSize = 15
        notificationDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
        notificationDesc.TextTransparency = 0.35
        notificationDesc.TextXAlignment = Enum.TextXAlignment.Left
        notificationDesc.TextYAlignment = Enum.TextYAlignment.Top
        notificationDesc.TextWrapped = true
        notificationDesc.BackgroundTransparency = 1
        notificationDesc.Size = UDim2.new(1, -80, 1, -40)
        notificationDesc.Position = UDim2.new(0, 70, 0, 32)
        notificationDesc.Parent = notification
        
        local notificationStroke = Instance.new("UIStroke", notification)
        notificationStroke.Transparency = 0.95
        notificationStroke.Color = Color3.fromRGB(255, 255, 255)
        
        -- Entrance animation
        notification.Position = UDim2.new(1.5, 0, notification.Position.Y.Scale, notification.Position.Y.Offset)
        local slideIn = TweenService:Create(notification, TweenInfo.new(ANIM_SPEED, EASE_STYLE, EASE_DIR), {
            Position = UDim2.new(0, 0, notification.Position.Y.Scale, notification.Position.Y.Offset)
        })
        slideIn:Play()
        
        -- Auto-remove after duration
        task.delay(duration, function()
            local fadeOut = TweenService:Create(notification, TweenInfo.new(ANIM_SPEED), {
                BackgroundTransparency = 1,
                Position = UDim2.new(1.5, 0, notification.Position.Y.Scale, notification.Position.Y.Offset)
            })
            fadeOut:Play()
            fadeOut.Completed:Wait()
            notification:Destroy()
        end)
    end
    
    -- Initial notification
    task.spawn(function()
        EyeUI:Notify("EyeUI Loaded", "Welcome to EyeUI - the worst UI ever!", "rbxassetid://10709770005", 3)
    end)
    
    return EyeUI
end

return EyeUI
