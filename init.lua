local EyeUI = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Animation settings
local ANIM_SPEED = 0.25
local EASE_STYLE = Enum.EasingStyle.Quint
local EASE_DIR = Enum.EasingDirection.Out

function EyeUI:CreateWindow(title, description)
    local WindowAPI = {}
    
    -- Main UI Container
    local gui = Instance.new("ScreenGui")
    gui.Name = "EyeUI"
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.ResetOnSpawn = false
    gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    
    -- Main Frame
    local main = Instance.new("Frame")
    main.Name = "Main"
    main.BorderSizePixel = 0
    main.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    main.Size = UDim2.new(0, 580, 0, 389)
    main.Position = UDim2.new(0.5, -290, 0.5, -194)
    main.Parent = gui
    
    local mainCorner = Instance.new("UICorner", main)
    mainCorner.CornerRadius = UDim.new(0, 12)
    
    -- Topbar
    local topbar = Instance.new("Frame")
    topbar.Name = "Topbar"
    topbar.BorderSizePixel = 0
    topbar.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    topbar.Size = UDim2.new(1, 0, 0, 51)
    topbar.Parent = main
    
    local topbarCorner = Instance.new("UICorner", topbar)
    topbarCorner.CornerRadius = UDim.new(0, 12)
    
    -- Logo
    local logo = Instance.new("ImageLabel")
    logo.Name = "Logo"
    logo.BorderSizePixel = 0
    logo.BackgroundTransparency = 1
    logo.Image = "rbxassetid://10709770005"
    logo.Size = UDim2.new(0, 25, 0, 25)
    logo.Position = UDim2.new(0, 14, 0.5, -12)
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
    titleLabel.Position = UDim2.new(0, 53, 0, 8)
    titleLabel.Parent = topbar
    
    -- Description
    local descLabel = Instance.new("TextLabel")
    descLabel.Name = "Description"
    descLabel.Text = description or "Enhanced UI Library"
    descLabel.Font = Enum.Font.GothamSSm
    descLabel.TextSize = 12
    descLabel.TextColor3 = Color3.fromRGB(191, 191, 191)
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.BackgroundTransparency = 1
    descLabel.Size = UDim2.new(0, 200, 0, 20)
    descLabel.Position = UDim2.new(0, 53, 0, 22)
    descLabel.Parent = topbar
    
    -- Close Button
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "Close"
    closeButton.Text = "×"
    closeButton.Font = Enum.Font.GothamSSm
    closeButton.TextSize = 20
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.BackgroundTransparency = 1
    closeButton.Size = UDim2.new(0, 35, 0, 35)
    closeButton.Position = UDim2.new(1, -45, 0, 8)
    closeButton.Parent = topbar
    
    -- Minimize Button
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Name = "Minimize"
    minimizeButton.Text = "−"
    minimizeButton.Font = Enum.Font.GothamSSm
    minimizeButton.TextSize = 20
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.BackgroundTransparency = 1
    minimizeButton.Size = UDim2.new(0, 35, 0, 35)
    minimizeButton.Position = UDim2.new(1, -80, 0, 8)
    minimizeButton.Parent = topbar
    
    -- Tabs Container
    local tabs = Instance.new("Frame")
    tabs.Name = "Tabs"
    tabs.BackgroundTransparency = 1
    tabs.Size = UDim2.new(0, 145, 1, -51)
    tabs.Position = UDim2.new(0, 0, 0, 51)
    tabs.Parent = main
    
    local tabsScrolling = Instance.new("ScrollingFrame")
    tabsScrolling.Name = "TabsScrolling"
    tabsScrolling.BackgroundTransparency = 1
    tabsScrolling.ScrollBarThickness = 2
    tabsScrolling.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
    tabsScrolling.Size = UDim2.new(1, 0, 1, 0)
    tabsScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabsScrolling.Parent = tabs
    
    local tabsList = Instance.new("UIListLayout")
    tabsList.SortOrder = Enum.SortOrder.LayoutOrder
    tabsList.Padding = UDim.new(0, 5)
    tabsList.Parent = tabsScrolling
    
    local tabsPadding = Instance.new("UIPadding")
    tabsPadding.PaddingTop = UDim.new(0, 10)
    tabsPadding.PaddingLeft = UDim.new(0, 10)
    tabsPadding.PaddingRight = UDim.new(0, 10)
    tabsPadding.Parent = tabsScrolling
    
    -- Content Container
    local content = Instance.new("Frame")
    content.Name = "Content"
    content.BackgroundTransparency = 1
    content.Size = UDim2.new(0, 435, 1, -51)
    content.Position = UDim2.new(0, 145, 0, 51)
    content.Parent = main
    
    -- Notifications Container
    local notifications = Instance.new("Frame")
    notifications.Name = "Notifications"
    notifications.BackgroundTransparency = 1
    notifications.Size = UDim2.new(0, 300, 0, 600)
    notifications.Position = UDim2.new(1, -320, 0, 20)
    notifications.Parent = gui
    
    local notificationsList = Instance.new("UIListLayout")
    notificationsList.HorizontalAlignment = Enum.HorizontalAlignment.Right
    notificationsList.Padding = UDim.new(0, 8)
    notificationsList.VerticalAlignment = Enum.VerticalAlignment.Top
    notificationsList.SortOrder = Enum.SortOrder.LayoutOrder
    notificationsList.Parent = notifications
    
    -- Variables
    local isMinimized = false
    local currentTab = nil
    local tabsContent = {}
    local tabButtons = {}
    
    -- Update tabs canvas size
    local function updateTabsCanvas()
        local contentSize = tabsList.AbsoluteContentSize
        tabsScrolling.CanvasSize = UDim2.new(0, 0, 0, contentSize.Y + 20)
    end
    
    tabsList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateTabsCanvas)
    
    -- Drag functionality
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    local function updateDrag(input)
        local delta = input.Position - dragStart
        local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        main.Position = newPos
    end
    
    topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
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
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateDrag(input)
        end
    end)
    
    -- Close button functionality
    closeButton.MouseButton1Click:Connect(function()
        local tween = TweenService:Create(main, TweenInfo.new(ANIM_SPEED, EASE_STYLE, EASE_DIR), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        tween:Play()
        tween.Completed:Wait()
        gui:Destroy()
    end)
    
    -- Minimize button functionality
    minimizeButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if isMinimized then
            local tween = TweenService:Create(main, TweenInfo.new(ANIM_SPEED, EASE_STYLE, EASE_DIR), {
                Size = UDim2.new(0, 580, 0, 51)
            })
            tween:Play()
            minimizeButton.Text = "+"
        else
            local tween = TweenService:Create(main, TweenInfo.new(ANIM_SPEED, EASE_STYLE, EASE_DIR), {
                Size = UDim2.new(0, 580, 0, 389)
            })
            tween:Play()
            minimizeButton.Text = "−"
        end
    end)
    
    -- Tab creation function
    function WindowAPI:CreateTab(name, icon)
        local TabAPI = {}
        
        local tabButton = Instance.new("TextButton")
        tabButton.Name = name
        tabButton.Text = ""
        tabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        tabButton.BackgroundTransparency = 1
        tabButton.Size = UDim2.new(1, -10, 0, 37)
        tabButton.Parent = tabsScrolling
        
        local tabCorner = Instance.new("UICorner", tabButton)
        tabCorner.CornerRadius = UDim.new(0, 8)
        
        local tabIcon = Instance.new("ImageLabel")
        tabIcon.Name = "Icon"
        tabIcon.Image = icon or "rbxassetid://10723407389"
        tabIcon.Size = UDim2.new(0, 17, 0, 17)
        tabIcon.Position = UDim2.new(0, 14, 0.5, -8)
        tabIcon.BackgroundTransparency = 1
        tabIcon.ImageColor3 = Color3.fromRGB(101, 101, 101)
        tabIcon.Parent = tabButton
        
        local tabLabel = Instance.new("TextLabel")
        tabLabel.Name = "Label"
        tabLabel.Text = name
        tabLabel.Font = Enum.Font.GothamSSm
        tabLabel.TextSize = 14
        tabLabel.TextColor3 = Color3.fromRGB(101, 101, 101)
        tabLabel.TextXAlignment = Enum.TextXAlignment.Left
        tabLabel.BackgroundTransparency = 1
        tabLabel.Size = UDim2.new(1, -45, 1, 0)
        tabLabel.Position = UDim2.new(0, 39, 0, 0)
        tabLabel.Parent = tabButton
        
        -- Tab content frame
        local tabContent = Instance.new("ScrollingFrame")
        tabContent.Name = name
        tabContent.BackgroundTransparency = 1
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.Visible = false
        tabContent.ScrollBarThickness = 2
        tabContent.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
        tabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        tabContent.Parent = content
        
        local contentList = Instance.new("UIListLayout")
        contentList.SortOrder = Enum.SortOrder.LayoutOrder
        contentList.Padding = UDim.new(0, 8)
        contentList.Parent = tabContent
        
        local contentPadding = Instance.new("UIPadding")
        contentPadding.PaddingTop = UDim.new(0, 15)
        contentPadding.PaddingLeft = UDim.new(0, 15)
        contentPadding.PaddingRight = UDim.new(0, 15)
        contentPadding.PaddingBottom = UDim.new(0, 15)
        contentPadding.Parent = tabContent
        
        -- Update canvas size
        local function updateContentCanvas()
            local contentSize = contentList.AbsoluteContentSize
            tabContent.CanvasSize = UDim2.new(0, 0, 0, contentSize.Y + 30)
        end
        
        contentList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateContentCanvas)
        
        tabsContent[name] = tabContent
        tabButtons[name] = {button = tabButton, icon = tabIcon, label = tabLabel}
        
        -- Tab selection logic
        tabButton.MouseButton1Click:Connect(function()
            if currentTab and currentTab ~= name then
                -- Deselect previous tab
                tabsContent[currentTab].Visible = false
                local prevTab = tabButtons[currentTab]
                prevTab.button.BackgroundTransparency = 1
                prevTab.icon.ImageColor3 = Color3.fromRGB(101, 101, 101)
                prevTab.label.TextColor3 = Color3.fromRGB(101, 101, 101)
            end
            
            -- Select current tab
            currentTab = name
            tabContent.Visible = true
            tabButton.BackgroundTransparency = 0.95
            tabIcon.ImageColor3 = Color3.fromRGB(231, 231, 231)
            tabLabel.TextColor3 = Color3.fromRGB(231, 231, 231)
        end)
        
        -- If first tab, select it
        if not currentTab then
            tabButton.MouseButton1Click:Connect(function() end)()
        end
        
        -- Button creation
        function TabAPI:CreateButton(name, callback)
            local button = Instance.new("TextButton")
            button.Name = name
            button.Text = name
            button.Font = Enum.Font.GothamSSm
            button.TextSize = 14
            button.TextColor3 = Color3.fromRGB(231, 231, 231)
            button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            button.Size = UDim2.new(1, -10, 0, 40)
            button.Parent = tabContent
            
            local buttonCorner = Instance.new("UICorner", button)
            buttonCorner.CornerRadius = UDim.new(0, 8)
            
            button.MouseButton1Click:Connect(function()
                if callback then callback() end
            end)
            
            -- Hover effect
            button.MouseEnter:Connect(function()
                TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
            end)
            
            button.MouseLeave:Connect(function()
                TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}):Play()
            end)
            
            return button
        end
        
        -- Toggle creation
        function TabAPI:CreateToggle(name, default, callback)
            local toggleFrame = Instance.new("Frame")
            toggleFrame.Name = name
            toggleFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            toggleFrame.Size = UDim2.new(1, -10, 0, 40)
            toggleFrame.Parent = tabContent
            
            local toggleCorner = Instance.new("UICorner", toggleFrame)
            toggleCorner.CornerRadius = UDim.new(0, 8)
            
            local toggleLabel = Instance.new("TextLabel")
            toggleLabel.Name = "Label"
            toggleLabel.Text = name
            toggleLabel.Font = Enum.Font.GothamSSm
            toggleLabel.TextSize = 14
            toggleLabel.TextColor3 = Color3.fromRGB(231, 231, 231)
            toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            toggleLabel.BackgroundTransparency = 1
            toggleLabel.Size = UDim2.new(1, -60, 1, 0)
            toggleLabel.Position = UDim2.new(0, 15, 0, 0)
            toggleLabel.Parent = toggleFrame
            
            local toggleButton = Instance.new("TextButton")
            toggleButton.Name = "Toggle"
            toggleButton.Text = ""
            toggleButton.BackgroundColor3 = default and Color3.fromRGB(0, 162, 255) or Color3.fromRGB(60, 60, 60)
            toggleButton.Size = UDim2.new(0, 45, 0, 20)
            toggleButton.Position = UDim2.new(1, -55, 0.5, -10)
            toggleButton.Parent = toggleFrame
            
            local toggleButtonCorner = Instance.new("UICorner", toggleButton)
            toggleButtonCorner.CornerRadius = UDim.new(1, 0)
            
            local toggleCircle = Instance.new("Frame")
            toggleCircle.Name = "Circle"
            toggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            toggleCircle.Size = UDim2.new(0, 16, 0, 16)
            toggleCircle.Position = default and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            toggleCircle.Parent = toggleButton
            
            local toggleCircleCorner = Instance.new("UICorner", toggleCircle)
            toggleCircleCorner.CornerRadius = UDim.new(1, 0)
            
            local toggled = default or false
            
            toggleButton.MouseButton1Click:Connect(function()
                toggled = not toggled
                
                local buttonColor = toggled and Color3.fromRGB(0, 162, 255) or Color3.fromRGB(60, 60, 60)
                local circlePos = toggled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
                
                TweenService:Create(toggleButton, TweenInfo.new(0.2), {BackgroundColor3 = buttonColor}):Play()
                TweenService:Create(toggleCircle, TweenInfo.new(0.2), {Position = circlePos}):Play()
                
                if callback then callback(toggled) end
            end)
            
            return toggleFrame
        end
        
        -- Slider creation
        function TabAPI:CreateSlider(name, min, max, default, callback)
            local sliderFrame = Instance.new("Frame")
            sliderFrame.Name = name
            sliderFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            sliderFrame.Size = UDim2.new(1, -10, 0, 60)
            sliderFrame.Parent = tabContent
            
            local sliderCorner = Instance.new("UICorner", sliderFrame)
            sliderCorner.CornerRadius = UDim.new(0, 8)
            
            local sliderLabel = Instance.new("TextLabel")
            sliderLabel.Name = "Label"
            sliderLabel.Text = name
            sliderLabel.Font = Enum.Font.GothamSSm
            sliderLabel.TextSize = 14
            sliderLabel.TextColor3 = Color3.fromRGB(231, 231, 231)
            sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
            sliderLabel.BackgroundTransparency = 1
            sliderLabel.Size = UDim2.new(1, -80, 0, 20)
            sliderLabel.Position = UDim2.new(0, 15, 0, 10)
            sliderLabel.Parent = sliderFrame
            
            local sliderValue = Instance.new("TextLabel")
            sliderValue.Name = "Value"
            sliderValue.Text = tostring(default or min)
            sliderValue.Font = Enum.Font.GothamSSm
            sliderValue.TextSize = 14
            sliderValue.TextColor3 = Color3.fromRGB(191, 191, 191)
            sliderValue.TextXAlignment = Enum.TextXAlignment.Right
            sliderValue.BackgroundTransparency = 1
            sliderValue.Size = UDim2.new(0, 60, 0, 20)
            sliderValue.Position = UDim2.new(1, -70, 0, 10)
            sliderValue.Parent = sliderFrame
            
            local sliderTrack = Instance.new("Frame")
            sliderTrack.Name = "Track"
            sliderTrack.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            sliderTrack.Size = UDim2.new(1, -30, 0, 6)
            sliderTrack.Position = UDim2.new(0, 15, 1, -16)
            sliderTrack.Parent = sliderFrame
            
            local sliderTrackCorner = Instance.new("UICorner", sliderTrack)
            sliderTrackCorner.CornerRadius = UDim.new(1, 0)
            
            local sliderFill = Instance.new("Frame")
            sliderFill.Name = "Fill"
            sliderFill.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
            sliderFill.Size = UDim2.new((default or min) / max, 0, 1, 0)
            sliderFill.Position = UDim2.new(0, 0, 0, 0)
            sliderFill.Parent = sliderTrack
            
            local sliderFillCorner = Instance.new("UICorner", sliderFill)
            sliderFillCorner.CornerRadius = UDim.new(1, 0)
            
            local sliderButton = Instance.new("TextButton")
            sliderButton.Name = "Button"
            sliderButton.Text = ""
            sliderButton.BackgroundTransparency = 1
            sliderButton.Size = UDim2.new(1, 0, 1, 0)
            sliderButton.Parent = sliderTrack
            
            local currentValue = default or min
            local dragging = false
            
            sliderButton.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                end
            end)
            
            sliderButton.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local relativePos = math.clamp((input.Position.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X, 0, 1)
                    currentValue = math.floor(min + (max - min) * relativePos)
                    
                    sliderValue.Text = tostring(currentValue)
                    TweenService:Create(sliderFill, TweenInfo.new(0.1), {Size = UDim2.new(relativePos, 0, 1, 0)}):Play()
                    
                    if callback then callback(currentValue) end
                end
            end)
            
            return sliderFrame
        end
        
        -- Label creation
        function TabAPI:CreateLabel(text)
            local label = Instance.new("TextLabel")
            label.Name = "Label"
            label.Text = text
            label.Font = Enum.Font.GothamSSm
            label.TextSize = 14
            label.TextColor3 = Color3.fromRGB(231, 231, 231)
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.BackgroundTransparency = 1
            label.Size = UDim2.new(1, -10, 0, 25)
            label.Parent = tabContent
            
            return label
        end
        
        return TabAPI
    end
    
    -- Notification function
    function WindowAPI:Notify(title, message, icon, duration)
        duration = duration or 5
        
        local notification = Instance.new("Frame")
        notification.Name = "Notification"
        notification.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
        notification.Size = UDim2.new(0, 280, 0, 80)
        notification.Parent = notifications
        
        local notificationCorner = Instance.new("UICorner", notification)
        notificationCorner.CornerRadius = UDim.new(0, 12)
        
        local notificationStroke = Instance.new("UIStroke", notification)
        notificationStroke.Transparency = 0.8
        notificationStroke.Color = Color3.fromRGB(255, 255, 255)
        
        local notificationIcon = Instance.new("ImageLabel")
        notificationIcon.Name = "Icon"
        notificationIcon.Image = icon or "rbxassetid://10709770005"
        notificationIcon.Size = UDim2.new(0, 24, 0, 24)
        notificationIcon.Position = UDim2.new(0, 15, 0, 15)
        notificationIcon.BackgroundTransparency = 1
        notificationIcon.Parent = notification
        
        local notificationTitle = Instance.new("TextLabel")
        notificationTitle.Name = "Title"
        notificationTitle.Text = title
        notificationTitle.Font = Enum.Font.GothamSSm
        notificationTitle.TextSize = 14
        notificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        notificationTitle.TextXAlignment = Enum.TextXAlignment.Left
        notificationTitle.BackgroundTransparency = 1
        notificationTitle.Size = UDim2.new(1, -55, 0, 16)
        notificationTitle.Position = UDim2.new(0, 50, 0, 15)
        notificationTitle.Parent = notification
        
        local notificationDesc = Instance.new("TextLabel")
        notificationDesc.Name = "Description"
        notificationDesc.Text = message
        notificationDesc.Font = Enum.Font.GothamSSm
        notificationDesc.TextSize = 12
        notificationDesc.TextColor3 = Color3.fromRGB(191, 191, 191)
        notificationDesc.TextXAlignment = Enum.TextXAlignment.Left
        notificationDesc.TextWrapped = true
        notificationDesc.BackgroundTransparency = 1
        notificationDesc.Size = UDim2.new(1, -55, 0, 40)
        notificationDesc.Position = UDim2.new(0, 50, 0, 32)
        notificationDesc.Parent = notification
        
        -- Entrance animation
        notification.Position = UDim2.new(1, 0, 0, 0)
        local slideIn = TweenService:Create(notification, TweenInfo.new(ANIM_SPEED, EASE_STYLE, EASE_DIR), {
            Position = UDim2.new(0, 0, 0, 0)
        })
        slideIn:Play()
        
        -- Auto-remove after duration
        task.delay(duration, function()
            local slideOut = TweenService:Create(notification, TweenInfo.new(ANIM_SPEED, EASE_STYLE, EASE_DIR), {
                Position = UDim2.new(1, 0, 0, 0)
            })
            slideOut:Play()
            slideOut.Completed:Wait()
            notification:Destroy()
        end)
    end
    
    -- Initial notification
    task.spawn(function()
        wait(0.5)
        WindowAPI:Notify("EyeUI Enhanced", "Welcome to the enhanced EyeUI library!", "rbxassetid://10709770005", 3)
    end)
    
    return WindowAPI
end

return EyeUI
