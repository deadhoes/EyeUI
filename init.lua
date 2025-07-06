local EyeUI = {}

function EyeUI:CreateWindow(title, subtitle, image)
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
    
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.007, 0, 0.223, 0)
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
    Icon.Image = image
    
    -- Close Button
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
    
    -- Tabs Holder
    TabsHolder.Name = "Tabs"
    TabsHolder.Parent = Frame
    TabsHolder.BackgroundTransparency = 1
    TabsHolder.Position = UDim2.new(0, 0, 0.135, 0)
    TabsHolder.Size = UDim2.new(0, 139, 0, 358)
    
    UIListLayout.Parent = TabsHolder
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    -- Close button functionality
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Dragging functionality
    local UserInputService = game:GetService("UserInputService")
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    Topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
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
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
    
    -- Window methods
    local window = {}
    
    function window:AddTab(name, icon)
        local Tab = Instance.new("Frame")
        local TabLabel = Instance.new("TextLabel")
        local TabIcon = Instance.new("ImageLabel")
        
        Tab.Name = name or "Tab"
        Tab.Parent = TabsHolder
        Tab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Tab.BackgroundTransparency = 1
        Tab.BorderSizePixel = 0
        Tab.Size = UDim2.new(0, 139, 0, 29)
        
        TabLabel.Parent = Tab
        TabLabel.BackgroundTransparency = 1
        TabLabel.Position = UDim2.new(0.334, 0, 0.239, 0)
        TabLabel.Size = UDim2.new(0, 79, 0, 14)
        TabLabel.Font = Enum.Font.GothamBold
        TabLabel.Text = name or "Tab"
        TabLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
        TabLabel.TextSize = 12
        TabLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        TabIcon.Parent = Tab
        TabIcon.BackgroundTransparency = 1
        TabIcon.Position = UDim2.new(0.115, 0, 0.135, 0)
        TabIcon.Size = UDim2.new(0, 20, 0, 20)
        TabIcon.Image = icon or "rbxassetid://10734895856"
        
        -- Return tab object
        local tab = {}
        
        function tab:Show()
            -- You can add content display logic here
            print("Showing tab:", name)
        end
        
        -- Connect click event
        Tab.MouseButton1Click:Connect(function()
            tab:Show()
        end)
        
        return tab
    end
    
    return window
end

return EyeUI
