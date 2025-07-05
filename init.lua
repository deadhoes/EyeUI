local EyeUI = {}

function EyeUI:CreateWindow(config)
    -- Default configuration
    local defaultConfig = {
        title = "EyeUI",
        subtitle = "subtitle",
        icon = "rbxassetid://10747364761",
        size = UDim2.new(0, 626, 0, 414),
        position = UDim2.new(0.3, 0, 0.3, 0),
        closeIcon = "rbxassetid://10747384394",
        showIcon = true,
        tabSize = UDim2.new(0, 150, 0, 358) -- Added tab size configuration
    }
    
    -- Merge user config with defaults
    config = setmetatable(config or {}, {__index = defaultConfig})

    -- Create main GUI elements
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Topbar = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local TitleLabel = Instance.new("TextLabel")
    local SubtitleLabel = Instance.new("TextLabel")
    local IconImage = Instance.new("ImageLabel")
    local CloseButton = Instance.new("TextButton")
    local CloseIcon = Instance.new("ImageLabel")
    
    -- Tab system elements
    local TabsContainer = Instance.new("Frame")
    local TabContentContainer = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")

    -- Properties
    ScreenGui.Name = "EyeUI"
    ScreenGui.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Position = config.position
    Frame.Size = config.size
    Frame.Active = true
    Frame.Draggable = true

    UICorner.CornerRadius = UDim.new(0.02, 8)
    UICorner.Parent = Frame

    -- Topbar
    Topbar.Name = "Topbar"
    Topbar.Parent = Frame
    Topbar.BackgroundColor3 = Color3.fromRGB(25, 25, 25) -- Darker for contrast
    Topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Topbar.BorderSizePixel = 0
    Topbar.Size = UDim2.new(1, 0, 0, 50)

    UICorner_2.CornerRadius = UDim.new(0, 0)
    UICorner_2.Parent = Topbar

    -- Title and subtitle (same as before)
    local titleXPosition = config.showIcon and 0.08 or 0.022
    TitleLabel.Parent = Topbar
    TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.BackgroundTransparency = 1.000
    TitleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TitleLabel.BorderSizePixel = 0
    TitleLabel.Position = UDim2.new(titleXPosition, 0, -0.14, 0)
    TitleLabel.Size = UDim2.new(0, 416, 0, 50)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = config.title
    TitleLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
    TitleLabel.TextSize = 14.000
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    SubtitleLabel.Parent = Topbar
    SubtitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SubtitleLabel.BackgroundTransparency = 1.000
    SubtitleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SubtitleLabel.BorderSizePixel = 0
    SubtitleLabel.Position = UDim2.new(titleXPosition, 0, 0.12, 0)
    SubtitleLabel.Size = UDim2.new(0, 416, 0, 50)
    SubtitleLabel.Font = Enum.Font.GothamBold
    SubtitleLabel.Text = config.subtitle
    SubtitleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    SubtitleLabel.TextSize = 12.000
    SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- Icon (same as before)
    IconImage.Parent = Topbar
    IconImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    IconImage.BackgroundTransparency = 1.000
    IconImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
    IconImage.BorderSizePixel = 0
    IconImage.Position = UDim2.new(0.022, 0, 0.22, 0)
    IconImage.Size = UDim2.new(0, 25, 0, 25)
    IconImage.Image = config.icon
    IconImage.Visible = config.showIcon
    IconImage.Name = "WindowIcon"

    -- Close button (same as before)
    CloseButton.Parent = Topbar
    CloseButton.BackgroundColor3 = Color3.fromRGB(84, 75, 75)
    CloseButton.BackgroundTransparency = 1.000
    CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CloseButton.BorderSizePixel = 0
    CloseButton.Position = UDim2.new(0.929, 0, 0, 0)
    CloseButton.Size = UDim2.new(0, 32, 0, 50)
    CloseButton.Font = Enum.Font.SourceSans
    CloseButton.Text = ""
    CloseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    CloseButton.TextSize = 14.000

    CloseIcon.Parent = CloseButton
    CloseIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseIcon.BackgroundTransparency = 1.000
    CloseIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CloseIcon.BorderSizePixel = 0
    CloseIcon.Position = UDim2.new(0.246, 0, 0.203, 0)
    CloseIcon.Size = UDim2.new(0, 23, 0, 23)
    CloseIcon.Image = config.closeIcon

    -- Fixed Tab system implementation
    TabsContainer.Name = "Tabs"
    TabsContainer.Parent = Frame
    TabsContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 25) -- Visible background
    TabsContainer.BackgroundTransparency = 0.5 -- Semi-transparent
    TabsContainer.BorderColor3 = Color3.fromRGB(50, 50, 50)
    TabsContainer.BorderSizePixel = 1
    TabsContainer.Position = UDim2.new(0, 5, 0.135, 5) -- Adjusted position with padding
    TabsContainer.Size = config.tabSize
    TabsContainer.ClipsDescendants = true

    UIListLayout.Parent = TabsContainer
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)

    TabContentContainer.Name = "TabContent"
    TabContentContainer.Parent = Frame
    TabContentContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TabContentContainer.BackgroundTransparency = 0.3
    TabContentContainer.BorderColor3 = Color3.fromRGB(50, 50, 50)
    TabContentContainer.BorderSizePixel = 1
    TabContentContainer.Position = UDim2.new(0, config.tabSize.X.Offset + 10, 0.135, 5)
    TabContentContainer.Size = UDim2.new(1, -config.tabSize.X.Offset - 15, 0, 358)
    TabContentContainer.ClipsDescendants = true

    -- Close button functionality
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Improved Tab creation function
    local function CreateTab(tabName, tabIcon)
        local tabButton = Instance.new("Frame")
        local tabText = Instance.new("TextLabel")
        local tabIconImage = Instance.new("ImageLabel")
        local tabContent = Instance.new("ScrollingFrame") -- Changed to ScrollingFrame
        local contentLayout = Instance.new("UIListLayout")
        
        -- Tab Button
        tabButton.Name = tabName
        tabButton.Parent = TabsContainer
        tabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        tabButton.BorderColor3 = Color3.fromRGB(50, 50, 50)
        tabButton.BorderSizePixel = 1
        tabButton.Size = UDim2.new(1, -10, 0, 50)
        
        -- Tab Icon
        tabIconImage.Parent = tabButton
        tabIconImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        tabIconImage.BackgroundTransparency = 1.000
        tabIconImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
        tabIconImage.BorderSizePixel = 0
        tabIconImage.Position = UDim2.new(0.05, 0, 0.2, 0)
        tabIconImage.Size = UDim2.new(0, 30, 0, 30)
        tabIconImage.Image = tabIcon or "rbxassetid://10734895856"
        
        -- Tab Text
        tabText.Parent = tabButton
        tabText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        tabText.BackgroundTransparency = 1.000
        tabText.BorderColor3 = Color3.fromRGB(0, 0, 0)
        tabText.BorderSizePixel = 0
        tabText.Position = UDim2.new(0.3, 0, 0, 0)
        tabText.Size = UDim2.new(0.65, 0, 1, 0)
        tabText.Font = Enum.Font.GothamBold
        tabText.Text = tabName
        tabText.TextColor3 = Color3.fromRGB(230, 230, 230)
        tabText.TextSize = 12.000
        tabText.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Tab Content
        tabContent.Name = tabName.."Content"
        tabContent.Parent = TabContentContainer
        tabContent.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        tabContent.BackgroundTransparency = 0.5
        tabContent.BorderSizePixel = 0
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        tabContent.ScrollBarThickness = 5
        tabContent.Visible = false
        
        contentLayout.Parent = tabContent
        contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        contentLayout.Padding = UDim.new(0, 5)
        
        -- Auto-resize content
        contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            tabContent.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 10)
        end)
        
        -- Make first tab visible by default
        if #TabsContainer:GetChildren() == 2 then -- 1 for UIListLayout
            tabContent.Visible = true
            tabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end
        
        -- Tab button click functionality
        tabButton.MouseEnter:Connect(function()
            if not tabContent.Visible then
                tabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            end
        end)
        
        tabButton.MouseLeave:Connect(function()
            if not tabContent.Visible then
                tabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            end
        end)
        
        tabButton.MouseButton1Click:Connect(function()
            -- Hide all tab contents
            for _, content in ipairs(TabContentContainer:GetChildren()) do
                if content:IsA("ScrollingFrame") then
                    content.Visible = false
                end
            end
            
            -- Reset all tab button appearances
            for _, tab in ipairs(TabsContainer:GetChildren()) do
                if tab:IsA("Frame") then
                    tab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                end
            end
            
            -- Show selected tab content
            tabContent.Visible = true
            tabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end)
        
        return {
            Button = tabButton,
            Content = tabContent,
            SetText = function(self, newText)
                tabText.Text = newText
            end,
            SetIcon = function(self, newIcon)
                tabIconImage.Image = newIcon
            end,
            AddElement = function(self, element)
                element.Parent = tabContent
                return element
            end
        }
    end

    -- Return the window with tab functionality
    return {
        Main = Frame,
        Topbar = Topbar,
        Title = TitleLabel,
        Subtitle = SubtitleLabel,
        Icon = IconImage,
        CloseButton = CloseButton,
        Destroy = function()
            ScreenGui:Destroy()
        end,
        
        -- Tab management
        CreateTab = CreateTab,
        GetTabContent = function(tabName)
            return TabContentContainer:FindFirstChild(tabName.."Content")
        end,
        
        -- Methods to update properties
        SetTitle = function(self, newTitle)
            TitleLabel.Text = newTitle
        end,
        
        SetSubtitle = function(self, newSubtitle)
            SubtitleLabel.Text = newSubtitle
        end,
        
        SetIcon = function(self, newIconId, visible)
            visible = visible == nil and true or visible
            IconImage.Image = newIconId
            IconImage.Visible = visible
            
            -- Adjust text positions based on icon visibility
            local newTitleX = visible and 0.08 or 0.022
            TitleLabel.Position = UDim2.new(newTitleX, 0, TitleLabel.Position.Y.Scale, TitleLabel.Position.Y.Offset)
            SubtitleLabel.Position = UDim2.new(newTitleX, 0, SubtitleLabel.Position.Y.Scale, SubtitleLabel.Position.Y.Offset)
        end
    }
end

return EyeUI
