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
    local SelectionIndicator = Instance.new("Frame")
    
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
    
    UICorner_2.CornerRadius = UDim.new(0, 0)
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
    
    -- Selection Indicator
    SelectionIndicator.Name = "SelectionIndicator"
    SelectionIndicator.Parent = TabsHolder
    SelectionIndicator.BackgroundColor3 = Color3.fromRGB(131, 131, 131)
    SelectionIndicator.BorderSizePixel = 0
    SelectionIndicator.Size = UDim2.new(0, 3, 0, 20)
    SelectionIndicator.Visible = false
    
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
        else
            Frame:TweenSize(originalSize, "Out", "Quad", 0.2, true)
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
        
        -- Screen boundary checking
        local viewportSize = workspace.CurrentCamera.ViewportSize
        local windowSize = Frame.AbsoluteSize
        
        newPos = UDim2.new(
            newPos.X.Scale,
            math.clamp(newPos.X.Offset, 0, viewportSize.X - windowSize.X),
            newPos.Y.Scale,
            math.clamp(newPos.Y.Offset, 0, viewportSize.Y - windowSize.Y)
        )
        
        -- Smooth movement
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
            -- Animate selection indicator
            if SelectionIndicator.Visible then
                local tween = TweenService:Create(
                    SelectionIndicator,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Position = UDim2.new(0, 0, 0, Tab.AbsolutePosition.Y - TabsHolder.AbsolutePosition.Y + 4)}
                )
                tween:Play()
            else
                SelectionIndicator.Visible = true
                SelectionIndicator.Position = UDim2.new(0, 0, 0, Tab.AbsolutePosition.Y - TabsHolder.AbsolutePosition.Y + 4)
            end
            
            -- Hide current tab
            if currentTab then
                currentTab.ContentFrame.Visible = false
                if currentTab.TabButton:FindFirstChild("TabLabel") then
                    local tween = TweenService:Create(
                        currentTab.TabButton.TabLabel,
                        TweenInfo.new(0.2),
                        {TextColor3 = Color3.fromRGB(137, 137, 137)}
                    )
                    tween:Play()
                end
                if currentTab.TabButton:FindFirstChild("TabIcon") then
                    local tween = TweenService:Create(
                        currentTab.TabButton.TabIcon,
                        TweenInfo.new(0.2),
                        {ImageColor3 = Color3.fromRGB(137, 137, 137)}
                    )
                    tween:Play()
                end
            end
            
            -- Show new tab
            ContentFrame.Visible = true
            local tween1 = TweenService:Create(
                TabLabel,
                TweenInfo.new(0.2),
                {TextColor3 = Color3.fromRGB(230, 230, 230)}
            )
            local tween2 = TweenService:Create(
                TabIcon,
                TweenInfo.new(0.2),
                {ImageColor3 = Color3.fromRGB(255, 255, 255)}
            )
            tween1:Play()
            tween2:Play()
            
            currentTab = tab
        end
        
        -- Connect click event
        TabButton.MouseButton1Click:Connect(function()
            tab:Show()
        end)
        
        -- Make first tab active by default
        if #TabsHolder:GetChildren() == 1 then -- First tab
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
    
    return window
end

return EyeUI
