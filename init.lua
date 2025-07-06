local EyeUI = {}

function EyeUI:CreateWindow(title, subtitle)
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Topbar = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local TitleLabel = Instance.new("TextLabel")
    local SubtitleLabel = Instance.new("TextLabel")
    local Icon = Instance.new("ImageLabel")
    local CloseButton = Instance.new("TextButton")
    local CloseIcon = Instance.new("ImageLabel")
    local TabsHolder = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    
    -- Main GUI Setup
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Name = "EyeUI_"..tostring(math.random(1, 1000))
    
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.3, 0, 0.3, 0) -- Default centered position
    Frame.Size = UDim2.new(0, 511, 0, 337)
    Frame.Name = "MainWindow"
    
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
    
    Icon.Parent = Topbar
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0.022, 0, 0.22, 0)
    Icon.Size = UDim2.new(0, 25, 0, 25)
    Icon.Image = "rbxassetid://10747364761"
    Icon.Name = "WindowIcon"
    
    -- Close Button (without hover effects)
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = Topbar
    CloseButton.BackgroundTransparency = 1
    CloseButton.Position = UDim2.new(0.929, 0, 0, 0)
    CloseButton.Size = UDim2.new(0, 36, 0, 50)
    CloseButton.Font = Enum.Font.SourceSans
    CloseButton.Text = ""
    CloseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    CloseButton.TextSize = 14
    
    CloseIcon.Name = "CloseIcon"
    CloseIcon.Parent = CloseButton
    CloseIcon.BackgroundTransparency = 1
    CloseIcon.Position = UDim2.new(0.135, 0, 0.263, 0)
    CloseIcon.Size = UDim2.new(0, 23, 0, 23)
    CloseIcon.Image = "rbxassetid://10747384394"
    CloseIcon.ImageColor3 = Color3.fromRGB(255, 255, 255) -- Fixed color
    
    -- Tabs Holder
    TabsHolder.Name = "TabsHolder"
    TabsHolder.Parent = Frame
    TabsHolder.BackgroundTransparency = 1
    TabsHolder.Position = UDim2.new(0, 0, 0.135, 0)
    TabsHolder.Size = UDim2.new(0, 139, 0, 358)
    
    UIListLayout.Parent = TabsHolder
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)
    
    -- Close button functionality
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Enhanced Dragging Functionality
    local UserInputService = game:GetService("UserInputService")
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
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
        
        Frame.Position = newPos
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
            update(input)
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
        Tab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Tab.BackgroundTransparency = 1
        Tab.BorderSizePixel = 0
        Tab.Size = UDim2.new(0, 139, 0, 29)
        
        TabButton.Name = "TabButton"
        TabButton.Parent = Tab
        TabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        TabButton.BackgroundTransparency = 1
        TabButton.BorderSizePixel = 0
        TabButton.Size = UDim2.new(1, 0, 1, 0)
        TabButton.Font = Enum.Font.SourceSans
        TabButton.Text = ""
        TabButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        TabButton.TextSize = 14
        
        TabIcon.Name = "TabIcon"
        TabIcon.Parent = TabButton
        TabIcon.BackgroundTransparency = 1
        TabIcon.Position = UDim2.new(0.1, 0, 0.2, 0)
        TabIcon.Size = UDim2.new(0, 20, 0, 20)
        TabIcon.Image = icon or "rbxassetid://10734895856"
        TabIcon.ImageColor3 = Color3.fromRGB(255, 255, 255) -- Fixed color
        
        TabLabel.Name = "TabLabel"
        TabLabel.Parent = TabButton
        TabLabel.BackgroundTransparency = 1
        TabLabel.Position = UDim2.new(0.35, 0, 0.15, 0)
        TabLabel.Size = UDim2.new(0, 80, 0, 20)
        TabLabel.Font = Enum.Font.GothamBold
        TabLabel.Text = name or "Tab"
        TabLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
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
            if currentTab then
                currentTab.ContentFrame.Visible = false
            end
            ContentFrame.Visible = true
            currentTab = tab
        end
        
        TabButton.MouseButton1Click:Connect(function()
            tab:Show()
        end)
        
        -- Make first tab active by default
        if #TabsHolder:GetChildren() == 1 then -- First tab
            tab:Show()
        end
        
        return tab
    end
    
    return window
end

return EyeUI
