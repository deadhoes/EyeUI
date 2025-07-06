local EyeUI = {}

function EyeUI:CreateWindow(title, description)
    local ScreenGui = Instance.new("ScreenGui")
    local Menu = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Tabs = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
    local ScrollingFrame = Instance.new("ScrollingFrame")
    local UIPadding = Instance.new("UIPadding")
    local UIListLayout_2 = Instance.new("UIListLayout")
    local Drag = Instance.new("Frame")
    local UICorner_14 = Instance.new("UICorner")
    local Topbar = Instance.new("Frame")
    local Close = Instance.new("TextButton")
    local ImageLabel_4 = Instance.new("ImageLabel")
    local UICorner_15 = Instance.new("UICorner")
    local Minimize = Instance.new("TextButton")
    local ImageLabel_5 = Instance.new("ImageLabel")
    local UICorner_16 = Instance.new("UICorner")
    local Title_7 = Instance.new("TextLabel")
    local Image = Instance.new("ImageLabel")
    local Description_5 = Instance.new("TextLabel")

    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Menu.Name = "Menu"
    Menu.Parent = ScreenGui
    Menu.AnchorPoint = Vector2.new(0.5, 0.5)
    Menu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Menu.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Menu.BorderSizePixel = 0
    Menu.Position = UDim2.new(0.5, 0, 0.5, 0)
    Menu.Size = UDim2.new(0, 580, 0, 390)

    UICorner.CornerRadius = UDim.new(0.05, 0)
    UICorner.Parent = Menu

    Tabs.Name = "Tabs"
    Tabs.Parent = Menu
    Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tabs.BackgroundTransparency = 1.000
    Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tabs.BorderSizePixel = 0
    Tabs.Position = UDim2.new(0, 0, 0.128, 0)
    Tabs.Size = UDim2.new(0, 127, 0, 339)

    UIListLayout.Parent = Tabs
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    
    local TabIndicator = Instance.new("Frame")
    TabIndicator.Name = "TabIndicator"
    TabIndicator.Parent = Tabs
    TabIndicator.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
    TabIndicator.BorderSizePixel = 0
    TabIndicator.Size = UDim2.new(0, 4, 0, 48)
    TabIndicator.Position = UDim2.new(0, 2, 0, 0)
    TabIndicator.ZIndex = 2
    
    local TabIndicatorCorner = Instance.new("UICorner")
    TabIndicatorCorner.CornerRadius = UDim.new(0, 2)
    TabIndicatorCorner.Parent = TabIndicator

    UIAspectRatioConstraint.Parent = Menu
    UIAspectRatioConstraint.AspectRatio = 1.487

    ScrollingFrame.Parent = Menu
    ScrollingFrame.Active = true
    ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollingFrame.BackgroundTransparency = 1.000
    ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.Position = UDim2.new(0.232, 0, 0.131, 0)
    ScrollingFrame.Size = UDim2.new(0, 444, 0, 338)
    ScrollingFrame.ScrollBarThickness = 4
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 1000)

    UIPadding.Parent = ScrollingFrame
    UIPadding.PaddingBottom = UDim.new(0, 10)
    UIPadding.PaddingLeft = UDim.new(0, 15)
    UIPadding.PaddingRight = UDim.new(0, 15)
    UIPadding.PaddingTop = UDim.new(0, 10)

    UIListLayout_2.Parent = ScrollingFrame
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_2.Padding = UDim.new(0, 7)
    UIListLayout_2.FillDirection = Enum.FillDirection.Vertical

    Drag.Name = "Drag"
    Drag.Parent = Menu
    Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Drag.BackgroundTransparency = 0.750
    Drag.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Drag.BorderSizePixel = 0
    Drag.Position = UDim2.new(0.377, 0, 1.026, 0)
    Drag.Size = UDim2.new(0, 192, 0, 5)

    UICorner_14.Parent = Drag

    Topbar.Name = "Topbar"
    Topbar.Parent = Menu
    Topbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Topbar.BackgroundTransparency = 1.000
    Topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Topbar.BorderSizePixel = 0
    Topbar.Position = UDim2.new(0, 0, 0, 0)
    Topbar.Size = UDim2.new(0, 579, 0, 50)

    Close.Name = "Close"
    Close.Parent = Topbar
    Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Close.BackgroundTransparency = 1.000
    Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Close.BorderSizePixel = 0
    Close.Position = UDim2.new(0.938, 0, 0, 0)
    Close.Size = UDim2.new(0, 35, 0, 37)
    Close.Font = Enum.Font.SourceSans
    Close.Text = ""
    Close.TextColor3 = Color3.fromRGB(0, 0, 0)
    Close.TextSize = 14.000

    ImageLabel_4.Parent = Close
    ImageLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_4.BackgroundTransparency = 1.000
    ImageLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageLabel_4.BorderSizePixel = 0
    ImageLabel_4.Position = UDim2.new(0.062, 0, 0.276, 0)
    ImageLabel_4.Size = UDim2.new(0, 22, 0, 22)
    ImageLabel_4.Image = "rbxassetid://10747384394"

    UICorner_15.CornerRadius = UDim.new(0.02, 8)
    UICorner_15.Parent = Close

    Minimize.Name = "Minimize"
    Minimize.Parent = Close
    Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Minimize.BackgroundTransparency = 1.000
    Minimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Minimize.BorderSizePixel = 0
    Minimize.Position = UDim2.new(-1.042, 0, 0, 0)
    Minimize.Size = UDim2.new(0, 29, 0, 37)
    Minimize.Font = Enum.Font.SourceSans
    Minimize.Text = ""
    Minimize.TextColor3 = Color3.fromRGB(0, 0, 0)
    Minimize.TextSize = 14.000

    ImageLabel_5.Parent = Minimize
    ImageLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_5.BackgroundTransparency = 1.000
    ImageLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageLabel_5.BorderSizePixel = 0
    ImageLabel_5.Position = UDim2.new(0.293, 0, 0.249, 0)
    ImageLabel_5.Size = UDim2.new(0, 22, 0, 22)
    ImageLabel_5.Image = "rbxassetid://10734896206"

    UICorner_16.CornerRadius = UDim.new(0.02, 8)
    UICorner_16.Parent = Minimize

    Title_7.Name = "Title"
    Title_7.Parent = Topbar
    Title_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_7.BackgroundTransparency = 1.000
    Title_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title_7.BorderSizePixel = 0
    Title_7.Position = UDim2.new(0.091, 0, 0, 0)
    Title_7.Size = UDim2.new(0, 266, 0, 38)
    Title_7.Font = Enum.Font.GothamBold
    Title_7.Text = title or "Eye UI"
    Title_7.TextColor3 = Color3.fromRGB(230, 230, 230)
    Title_7.TextSize = 12.000
    Title_7.TextXAlignment = Enum.TextXAlignment.Left

    Image.Name = "Image"
    Image.Parent = Topbar
    Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Image.BackgroundTransparency = 1.000
    Image.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Image.BorderSizePixel = 0
    Image.Position = UDim2.new(0.031, 0, 0.191, 0)
    Image.Size = UDim2.new(0, 25, 0, 26)
    Image.Image = "rbxassetid://6523858394"

    Description_5.Name = "Description"
    Description_5.Parent = Topbar
    Description_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Description_5.BackgroundTransparency = 1.000
    Description_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Description_5.BorderSizePixel = 0
    Description_5.Position = UDim2.new(0.09, 0, 0.271, 0)
    Description_5.Size = UDim2.new(0, 266, 0, 38)
    Description_5.Font = Enum.Font.GothamBold
    Description_5.Text = description or "A sleek UI library"
    Description_5.TextColor3 = Color3.fromRGB(176, 176, 176)
    Description_5.TextSize = 12.000
    Description_5.TextXAlignment = Enum.TextXAlignment.Left

    
    local UIS = game:GetService("UserInputService")
    local dragging = false
    local dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        Menu.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    Topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Menu.Position

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

    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    
    Close.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    
    local isMinimized = false
    Minimize.MouseButton1Click:Connect(function()
        if isMinimized then
            ScrollingFrame.Visible = true
            Menu.Size = UDim2.new(0, 580, 0, 390)
            ImageLabel_5.Image = "rbxassetid://10734896206"
        else
            ScrollingFrame.Visible = false
            Menu.Size = UDim2.new(0, 580, 0, 50)
            ImageLabel_5.Image = "rbxassetid://10734896206"
        end
        isMinimized = not isMinimized
    end)

    
    local tabFunctions = {}
    local allTabs = {}
    local currentActiveTab = nil

    function tabFunctions:CreateTab(name, icon)
        local Tab = Instance.new("Frame")
        local ImageLabel = Instance.new("ImageLabel")
        local TextLabel = Instance.new("TextLabel")
        local TabButton = Instance.new("TextButton")

        Tab.Name = name
        Tab.Parent = Tabs
        Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundTransparency = 1.000
        Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Tab.BorderSizePixel = 0
        Tab.Size = UDim2.new(0, 127, 0, 48)

        TabButton.Name = "TabButton"
        TabButton.Parent = Tab
        TabButton.BackgroundTransparency = 1.000
        TabButton.Size = UDim2.new(1, 0, 1, 0)
        TabButton.Text = ""
        TabButton.Font = Enum.Font.SourceSans
        TabButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        TabButton.TextSize = 14.000

        ImageLabel.Parent = Tab
        ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel.BackgroundTransparency = 1.000
        ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ImageLabel.BorderSizePixel = 0
        ImageLabel.Position = UDim2.new(0, 16, 0.5, -12)
        ImageLabel.Size = UDim2.new(0, 24, 0, 24)
        ImageLabel.Image = icon or "rbxassetid://10734966248"
        ImageLabel.ImageColor3 = Color3.fromRGB(150, 150, 150)

        TextLabel.Parent = Tab
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1.000
        TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel.BorderSizePixel = 0
        TextLabel.Position = UDim2.new(0, 48, 0, 0)
        TextLabel.Size = UDim2.new(1, -56, 1, 0)
        TextLabel.Font = Enum.Font.GothamBold
        TextLabel.Text = name
        TextLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
        TextLabel.TextSize = 14.000
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel.TextYAlignment = Enum.TextYAlignment.Center

        
        local TabContentFrame = Instance.new("Frame")
        TabContentFrame.Name = name .. "_Content"
        TabContentFrame.Parent = ScrollingFrame
        TabContentFrame.BackgroundTransparency = 1
        TabContentFrame.Size = UDim2.new(1, 0, 0, 0)
        TabContentFrame.AutomaticSize = Enum.AutomaticSize.Y
        
        local TabContentLayout = Instance.new("UIListLayout")
        TabContentLayout.Parent = TabContentFrame
        TabContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        TabContentLayout.Padding = UDim.new(0, 7)

        
        local tabInfo = {
            tab = Tab,
            imageLabel = ImageLabel,
            textLabel = TextLabel,
            contentFrame = TabContentFrame,
            contentLayout = TabContentLayout,
            name = name
        }
        table.insert(allTabs, tabInfo)

        
        local function selectTab()
            
            for _, tabData in ipairs(allTabs) do
                tabData.contentFrame.Visible = false
                tabData.imageLabel.ImageColor3 = Color3.fromRGB(150, 150, 150)
                tabData.textLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
            end
            
            
            TabContentFrame.Visible = true
            ImageLabel.ImageColor3 = Color3.fromRGB(85, 170, 255)
            TextLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
            currentActiveTab = tabInfo
            
            
            local tabPosition = Tab.AbsolutePosition.Y - Tabs.AbsolutePosition.Y
            TabIndicator.Position = UDim2.new(0, 2, 0, tabPosition)
        end

        TabButton.MouseButton1Click:Connect(selectTab)

        
        if #allTabs == 1 then
            selectTab()
        end

        local tabContent = {}

        function tabContent:CreateSection(title)
            local Title = Instance.new("TextLabel")
            
            Title.Name = "Title"
            Title.Parent = TabContentFrame
            Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title.BackgroundTransparency = 1.000
            Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title.BorderSizePixel = 0
            Title.Size = UDim2.new(1, 0, 0, 25)
            Title.Font = Enum.Font.GothamBold
            Title.Text = title or "Section"
            Title.TextColor3 = Color3.fromRGB(230, 230, 230)
            Title.TextSize = 14.000
            
            local sectionElements = {}
            
            function sectionElements:CreateToggle(options)
                local Toggle = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local Title_2 = Instance.new("TextLabel")
                local ToggleSwitch = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local ToggleButton = Instance.new("Frame")
                local UICorner_4 = Instance.new("UICorner")
                local Description = Instance.new("TextLabel")
                local Interact = Instance.new("TextButton")
                
                Toggle.Name = "Toggle"
                Toggle.Parent = TabContentFrame
                Toggle.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Toggle.BorderSizePixel = 0
                Toggle.Size = UDim2.new(1, 0, 0, 53)
                
                UICorner_2.CornerRadius = UDim.new(0.2, 0)
                UICorner_2.Parent = Toggle
                
                Title_2.Name = "Title"
                Title_2.Parent = Toggle
                Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title_2.BackgroundTransparency = 1.000
                Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Title_2.BorderSizePixel = 0
                Title_2.Position = UDim2.new(0.049, 0, 0.057, 0)
                Title_2.Size = UDim2.new(0, 200, 0, 30)
                Title_2.Font = Enum.Font.GothamBold
                Title_2.Text = options.Title or "Enable Feature"
                Title_2.TextColor3 = Color3.fromRGB(230, 230, 230)
                Title_2.TextSize = 14.000
                Title_2.TextXAlignment = Enum.TextXAlignment.Left
                Title_2.TextYAlignment = Enum.TextYAlignment.Center
                
                ToggleSwitch.Name = "ToggleSwitch"
                ToggleSwitch.Parent = Toggle
                ToggleSwitch.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                ToggleSwitch.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ToggleSwitch.BorderSizePixel = 0
                ToggleSwitch.Position = UDim2.new(0.869, 0, 0.356, 0)
                ToggleSwitch.Size = UDim2.new(0, 35, 0, 15)
                
                UICorner_3.CornerRadius = UDim.new(0.4, 0)
                UICorner_3.Parent = ToggleSwitch
                
                ToggleButton.Name = "ToggleButton"
                ToggleButton.Parent = ToggleSwitch
                ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ToggleButton.BorderSizePixel = 0
                ToggleButton.Position = UDim2.new(-0.008, 0, -0.067, 0)
                ToggleButton.Size = UDim2.new(0, 18, 0, 18)
                
                UICorner_4.CornerRadius = UDim.new(1, 0)
                UICorner_4.Parent = ToggleButton
                
                Description.Name = "Description"
                Description.Parent = Toggle
                Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Description.BackgroundTransparency = 1.000
                Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Description.BorderSizePixel = 0
                Description.Position = UDim2.new(0.046, 0, 0.302, 0)
                Description.Size = UDim2.new(0, 200, 0, 30)
                Description.Font = Enum.Font.GothamBold
                Description.Text = options.Description or "Toggle to enable or disable the feature"
                Description.TextColor3 = Color3.fromRGB(153, 153, 153)
                Description.TextSize = 14.000
                Description.TextXAlignment = Enum.TextXAlignment.Left
                Description.TextYAlignment = Enum.TextYAlignment.Center
                
                Interact.Name = "Interact"
                Interact.Parent = Toggle
                Interact.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Interact.BackgroundTransparency = 1.000
                Interact.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Interact.BorderSizePixel = 0
                Interact.Size = UDim2.new(0, 419, 0, 50)
                Interact.Font = Enum.Font.SourceSans
                Interact.Text = ""
                Interact.TextColor3 = Color3.fromRGB(0, 0, 0)
                Interact.TextSize = 14.000
                
                local toggled = options.Default or false
                
                local function updateToggle()
                    if toggled then
                        ToggleButton.Position = UDim2.new(0.486, 0, -0.067, 0)
                        ToggleButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
                    else
                        ToggleButton.Position = UDim2.new(-0.008, 0, -0.067, 0)
                        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    end
                end
                
                updateToggle()
                
                Interact.MouseButton1Click:Connect(function()
                    toggled = not toggled
                    updateToggle()
                    if options.Callback then
                        options.Callback(toggled)
                    end
                end)
                
                local toggleFunctions = {}
                
                function toggleFunctions:Set(value)
                    toggled = value
                    updateToggle()
                    if options.Callback then
                        options.Callback(toggled)
                    end
                end
                
                return toggleFunctions
            end
            
            function sectionElements:CreateButton(options)
                local Button = Instance.new("Frame")
                local UICorner_12 = Instance.new("UICorner")
                local Title_5 = Instance.new("TextLabel")
                local Description_3 = Instance.new("TextLabel")
                local ImageLabel_3 = Instance.new("ImageLabel")
                local Interact = Instance.new("TextButton")
                
                Button.Name = "Button"
                Button.Parent = TabContentFrame
                Button.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Button.BorderSizePixel = 0
                Button.Size = UDim2.new(1, 0, 0, 53)
                
                UICorner_12.CornerRadius = UDim.new(0.2, 0)
                UICorner_12.Parent = Button
                
                Title_5.Name = "Title"
                Title_5.Parent = Button
                Title_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title_5.BackgroundTransparency = 1.000
                Title_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Title_5.BorderSizePixel = 0
                Title_5.Position = UDim2.new(0.049, 0, 0.057, 0)
                Title_5.Size = UDim2.new(0, 200, 0, 30)
                Title_5.Font = Enum.Font.GothamBold
                Title_5.Text = options.Title or "Run Action"
                Title_5.TextColor3 = Color3.fromRGB(230, 230, 230)
                Title_5.TextSize = 14.000
                Title_5.TextXAlignment = Enum.TextXAlignment.Left
                
                Description_3.Name = "Description"
                Description_3.Parent = Button
                Description_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Description_3.BackgroundTransparency = 1.000
                Description_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Description_3.BorderSizePixel = 0
                Description_3.Position = UDim2.new(0.049, 0, 0.321, 0)
                Description_3.Size = UDim2.new(0, 200, 0, 30)
                Description_3.Font = Enum.Font.GothamBold
                Description_3.Text = options.Description or "Click to perform something"
                Description_3.TextColor3 = Color3.fromRGB(153, 153, 153)
                Description_3.TextSize = 14.000
                Description_3.TextXAlignment = Enum.TextXAlignment.Left
                
                ImageLabel_3.Parent = Button
                ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageLabel_3.BackgroundTransparency = 1.000
                ImageLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ImageLabel_3.BorderSizePixel = 0
                ImageLabel_3.Position = UDim2.new(0.922, 0, 0.309, 0)
                ImageLabel_3.Size = UDim2.new(0, 20, 0, 20)
                ImageLabel_3.Image = "rbxassetid://10734898355"
                
                Interact.Name = "Interact"
                Interact.Parent = Button
                Interact.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Interact.BackgroundTransparency = 1.000
                Interact.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Interact.BorderSizePixel = 0
                Interact.Size = UDim2.new(0, 419, 0, 50)
                Interact.Font = Enum.Font.SourceSans
                Interact.Text = ""
                Interact.TextColor3 = Color3.fromRGB(0, 0, 0)
                Interact.TextSize = 14.000
                
                Interact.MouseButton1Click:Connect(function()
                    if options.Callback then
                        options.Callback()
                    end
                end)
                
                local buttonFunctions = {}
                
                return buttonFunctions
            end
            
            function sectionElements:CreateSlider(options)
                local Slider = Instance.new("Frame")
                local UICorner_5 = Instance.new("UICorner")
                local Title_3 = Instance.new("TextLabel")
                local SliderBar = Instance.new("Frame")
                local UICorner_6 = Instance.new("UICorner")
                local SliderFill = Instance.new("Frame")
                local UICorner_7 = Instance.new("UICorner")
                local SliderHandle = Instance.new("Frame")
                local UICorner_8 = Instance.new("UICorner")
                local TextBox = Instance.new("TextBox")
                local UICorner_9 = Instance.new("UICorner")
                
                Slider.Name = "Slider"
                Slider.Parent = TabContentFrame
                Slider.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Slider.BorderSizePixel = 0
                Slider.Size = UDim2.new(1, 0, 0, 44)
                
                UICorner_5.CornerRadius = UDim.new(0.2, 0)
                UICorner_5.Parent = Slider
                
                Title_3.Name = "Title"
                Title_3.Parent = Slider
                Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title_3.BackgroundTransparency = 1.000
                Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Title_3.BorderSizePixel = 0
                Title_3.Position = UDim2.new(0.049, 0, 0.17, 0)
                Title_3.Size = UDim2.new(0, 200, 0, 30)
                Title_3.Font = Enum.Font.GothamBold
                Title_3.Text = options.Title or "Set Value"
                Title_3.TextColor3 = Color3.fromRGB(230, 230, 230)
                Title_3.TextSize = 14.000
                Title_3.TextXAlignment = Enum.TextXAlignment.Left
                
                SliderBar.Name = "SliderBar"
                SliderBar.Parent = Slider
                SliderBar.AnchorPoint = Vector2.new(0.5, 0.5)
                SliderBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                SliderBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SliderBar.BorderSizePixel = 0
                SliderBar.Position = UDim2.new(0.584, 0, 0.5, 0)
                SliderBar.Size = UDim2.new(0, 177, 0, 15)
                
                UICorner_6.CornerRadius = UDim.new(0.4, 0)
                UICorner_6.Parent = SliderBar
                
                SliderFill.Name = "SliderFill"
                SliderFill.Parent = SliderBar
                SliderFill.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
                SliderFill.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SliderFill.BorderSizePixel = 0
                SliderFill.Position = UDim2.new(0.001, 0, -0.015, 0)
                SliderFill.Size = UDim2.new(0, 32, 0, 15)
                
                UICorner_7.CornerRadius = UDim.new(0.4, 0)
                UICorner_7.Parent = SliderFill
                
                SliderHandle.Name = "SliderHandle"
                SliderHandle.Parent = SliderBar
                SliderHandle.AnchorPoint = Vector2.new(0.05, 0.05)
                SliderHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderHandle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SliderHandle.BorderSizePixel = 0
                SliderHandle.Position = UDim2.new(0.083, 0, 0.01, 0)
                SliderHandle.Size = UDim2.new(0, 18, 0, 18)
                
                UICorner_8.CornerRadius = UDim.new(1, 0)
                UICorner_8.Parent = SliderHandle
                
                TextBox.Parent = Slider
                TextBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
                TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
                TextBox.BorderSizePixel = 0
                TextBox.Position = UDim2.new(0.852, 0, 0.12, 0)
                TextBox.Size = UDim2.new(0, 49, 0, 34)
                TextBox.Font = Enum.Font.GothamBold
                TextBox.PlaceholderText = tostring(options.Default or 25)
                TextBox.Text = tostring(options.Default or 25)
                TextBox.TextColor3 = Color3.fromRGB(230, 230, 230)
                TextBox.TextSize = 14.000
                
                UICorner_9.CornerRadius = UDim.new(0.2, 0)
                UICorner_9.Parent = TextBox
                
                local min = options.Min or 0
                local max = options.Max or 100
                local default = options.Default or 25
                local value = default
                
                local function updateSlider(val)
                    value = math.clamp(val, min, max)
                    local percentage = (value - min) / (max - min)
                    SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
                    SliderHandle.Position = UDim2.new(percentage, 0, 0.01, 0)
                    TextBox.Text = tostring(math.floor(value))
                    
                    if options.Callback then
                        options.Callback(value)
                    end
                end
                
                updateSlider(default)
                
                local isDragging = false
                
                local function updateSliderFromInput(input)
                    local sliderAbsoluteSize = SliderBar.AbsoluteSize.X
                    local sliderAbsolutePosition = SliderBar.AbsolutePosition.X
                    local inputX = math.clamp(input.Position.X, sliderAbsolutePosition, sliderAbsolutePosition + sliderAbsoluteSize)
                    local percentage = (inputX - sliderAbsolutePosition) / sliderAbsoluteSize
                    local newValue = min + (max - min) * percentage
                    updateSlider(newValue)
                end
                
                SliderHandle.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isDragging = true
                    end
                end)
                
                SliderHandle.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isDragging = false
                    end
                end)
                
                game:GetService("UserInputService").InputChanged:Connect(function(input)
                    if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        updateSliderFromInput(input)
                    end
                end)
                
                SliderBar.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        updateSliderFromInput(input)
                    end
                end)
                
                TextBox.FocusLost:Connect(function()
                    local num = tonumber(TextBox.Text)
                    if num then
                        updateSlider(num)
                    else
                        TextBox.Text = tostring(value)
                    end
                end)
                
                local sliderFunctions = {}
                
                function sliderFunctions:Set(value)
                    updateSlider(value)
                end
                
                function sliderFunctions:Get()
                    return value
                end
                
                return sliderFunctions
            end
            
            function sectionElements:CreateInput(options)
                local Input = Instance.new("Frame")
                local UICorner_10 = Instance.new("UICorner")
                local Title_4 = Instance.new("TextLabel")
                local Description_2 = Instance.new("TextLabel")
                local TextBox_2 = Instance.new("TextBox")
                local UICorner_11 = Instance.new("UICorner")
                
                Input.Name = "Input"
                Input.Parent = TabContentFrame
                Input.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Input.BorderSizePixel = 0
                Input.Size = UDim2.new(1, 0, 0, 53)
                
                UICorner_10.CornerRadius = UDim.new(0.2, 0)
                UICorner_10.Parent = Input
                
                Title_4.Name = "Title"
                Title_4.Parent = Input
                Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title_4.BackgroundTransparency = 1.000
                Title_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Title_4.BorderSizePixel = 0
                Title_4.Position = UDim2.new(0.049, 0, 0.057, 0)
                Title_4.Size = UDim2.new(0, 200, 0, 30)
                Title_4.Font = Enum.Font.GothamBold
                Title_4.Text = options.Title or "Input Value"
                Title_4.TextColor3 = Color3.fromRGB(230, 230, 230)
                Title_4.TextSize = 14.000
                Title_4.TextXAlignment = Enum.TextXAlignment.Left
                
                Description_2.Name = "Description"
                Description_2.Parent = Input
                Description_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Description_2.BackgroundTransparency = 1.000
                Description_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Description_2.BorderSizePixel = 0
                Description_2.Position = UDim2.new(0.049, 0, 0.302, 0)
                Description_2.Size = UDim2.new(0, 200, 0, 30)
                Description_2.Font = Enum.Font.GothamBold
                Description_2.Text = options.Description or "Enter some text"
                Description_2.TextColor3 = Color3.fromRGB(153, 153, 153)
                Description_2.TextSize = 14.000
                Description_2.TextXAlignment = Enum.TextXAlignment.Left
                
                TextBox_2.Parent = Input
                TextBox_2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
                TextBox_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                TextBox_2.BorderSizePixel = 0
                TextBox_2.Position = UDim2.new(0.7, 0, 0.2, 0)
                TextBox_2.Size = UDim2.new(0, 100, 0, 30)
                TextBox_2.Font = Enum.Font.GothamBold
                TextBox_2.PlaceholderText = options.Placeholder or "Enter text..."
                TextBox_2.Text = options.Default or ""
                TextBox_2.TextColor3 = Color3.fromRGB(230, 230, 230)
                TextBox_2.TextSize = 14.000
                
                UICorner_11.CornerRadius = UDim.new(0.2, 0)
                UICorner_11.Parent = TextBox_2
                
                local inputFunctions = {}
                
                function inputFunctions:Set(text)
                    TextBox_2.Text = tostring(text)
                end
                
                function inputFunctions:Get()
                    return TextBox_2.Text
                end
                
                TextBox_2.FocusLost:Connect(function()
                    if options.Callback then
                        options.Callback(TextBox_2.Text)
                    end
                end)
                
                return inputFunctions
            end
            
            function sectionElements:CreateLabel(text)
                local Label = Instance.new("TextLabel")
                
                Label.Name = "Label"
                Label.Parent = TabContentFrame
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Label.BorderSizePixel = 0
                Label.Size = UDim2.new(1, 0, 0, 25)
                Label.Font = Enum.Font.GothamBold
                Label.Text = text or "Label Text"
                Label.TextColor3 = Color3.fromRGB(230, 230, 230)
                Label.TextSize = 14.000
                Label.TextXAlignment = Enum.TextXAlignment.Left
                
                local labelFunctions = {}
                
                function labelFunctions:Set(text)
                    Label.Text = text
                end
                
                return labelFunctions
            end
            
            function sectionElements:CreateDropdown(options)
                local Dropdown = Instance.new("Frame")
                local UICorner_17 = Instance.new("UICorner")
                local Title_6 = Instance.new("TextLabel")
                local Description_4 = Instance.new("TextLabel")
                local DropdownButton = Instance.new("TextButton")
                local UICorner_18 = Instance.new("UICorner")
                local Selected = Instance.new("TextLabel")
                local ImageLabel_6 = Instance.new("ImageLabel")
                local DropdownList = Instance.new("ScrollingFrame")
                local UIListLayout_3 = Instance.new("UIListLayout")
                local UIPadding_2 = Instance.new("UIPadding")
                
                Dropdown.Name = "Dropdown"
                Dropdown.Parent = TabContentFrame
                Dropdown.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Dropdown.BorderSizePixel = 0
                Dropdown.ClipsDescendants = true
                Dropdown.Size = UDim2.new(1, 0, 0, 53)
                
                UICorner_17.CornerRadius = UDim.new(0.2, 0)
                UICorner_17.Parent = Dropdown
                
                Title_6.Name = "Title"
                Title_6.Parent = Dropdown
                Title_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title_6.BackgroundTransparency = 1.000
                Title_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Title_6.BorderSizePixel = 0
                Title_6.Position = UDim2.new(0.049, 0, 0.057, 0)
                Title_6.Size = UDim2.new(0, 200, 0, 30)
                Title_6.Font = Enum.Font.GothamBold
                Title_6.Text = options.Title or "Select Option"
                Title_6.TextColor3 = Color3.fromRGB(230, 230, 230)
                Title_6.TextSize = 14.000
                Title_6.TextXAlignment = Enum.TextXAlignment.Left
                
                Description_4.Name = "Description"
                Description_4.Parent = Dropdown
                Description_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Description_4.BackgroundTransparency = 1.000
                Description_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Description_4.BorderSizePixel = 0
                Description_4.Position = UDim2.new(0.049, 0, 0.302, 0)
                Description_4.Size = UDim2.new(0, 200, 0, 30)
                Description_4.Font = Enum.Font.GothamBold
                Description_4.Text = options.Description or "Choose from list"
                Description_4.TextColor3 = Color3.fromRGB(153, 153, 153)
                Description_4.TextSize = 14.000
                Description_4.TextXAlignment = Enum.TextXAlignment.Left
                
                DropdownButton.Name = "DropdownButton"
                DropdownButton.Parent = Dropdown
                DropdownButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
                DropdownButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
                DropdownButton.BorderSizePixel = 0
                DropdownButton.Position = UDim2.new(0.7, 0, 0.2, 0)
                DropdownButton.Size = UDim2.new(0, 100, 0, 30)
                DropdownButton.Font = Enum.Font.SourceSans
                DropdownButton.Text = ""
                DropdownButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropdownButton.TextSize = 14.000
                
                UICorner_18.CornerRadius = UDim.new(0.2, 0)
                UICorner_18.Parent = DropdownButton
                
                Selected.Name = "Selected"
                Selected.Parent = DropdownButton
                Selected.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Selected.BackgroundTransparency = 1.000
                Selected.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Selected.BorderSizePixel = 0
                Selected.Size = UDim2.new(0, 70, 0, 30)
                Selected.Font = Enum.Font.GothamBold
                Selected.Text = options.Default or options.List[1] or "Select"
                Selected.TextColor3 = Color3.fromRGB(230, 230, 230)
                Selected.TextSize = 14.000
                Selected.TextXAlignment = Enum.TextXAlignment.Left
                
                ImageLabel_6.Parent = DropdownButton
                ImageLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageLabel_6.BackgroundTransparency = 1.000
                ImageLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ImageLabel_6.BorderSizePixel = 0
                ImageLabel_6.Position = UDim2.new(0.8, 0, 0.167, 0)
                ImageLabel_6.Size = UDim2.new(0, 20, 0, 20)
                ImageLabel_6.Image = "rbxassetid://10734966248"
                ImageLabel_6.Rotation = 90
                
                DropdownList.Name = "DropdownList"
                DropdownList.Parent = Dropdown
                DropdownList.Active = true
                DropdownList.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
                DropdownList.BorderColor3 = Color3.fromRGB(0, 0, 0)
                DropdownList.BorderSizePixel = 0
                DropdownList.Position = UDim2.new(0.049, 0, 1, 0)
                DropdownList.Size = UDim2.new(0, 400, 0, 0)
                DropdownList.ScrollBarThickness = 3
                DropdownList.Visible = false
                
                UIListLayout_3.Parent = DropdownList
                UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
                
                UIPadding_2.Parent = DropdownList
                UIPadding_2.PaddingBottom = UDim.new(0, 5)
                UIPadding_2.PaddingLeft = UDim.new(0, 5)
                UIPadding_2.PaddingRight = UDim.new(0, 5)
                UIPadding_2.PaddingTop = UDim.new(0, 5)
                
                local isOpen = false
                local selectedOption = options.Default or options.List[1] or "Select"
                local maxHeight = math.min(#options.List * 30 + 10, 150)
                
                local function toggleDropdown()
                    isOpen = not isOpen
                    if isOpen then
                        DropdownList.Visible = true
                        Dropdown.Size = UDim2.new(1, 0, 0, 53 + maxHeight)
                        DropdownList.Size = UDim2.new(0, 400, 0, maxHeight)
                        ImageLabel_6.Rotation = 270
                    else
                        DropdownList.Visible = false
                        Dropdown.Size = UDim2.new(1, 0, 0, 53)
                        ImageLabel_6.Rotation = 90
                    end
                end
                
                DropdownButton.MouseButton1Click:Connect(toggleDropdown)
                
                
                for i, option in ipairs(options.List) do
                    local OptionButton = Instance.new("TextButton")
                    local UICorner_19 = Instance.new("UICorner")
                    
                    OptionButton.Name = option
                    OptionButton.Parent = DropdownList
                    OptionButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                    OptionButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    OptionButton.BorderSizePixel = 0
                    OptionButton.Size = UDim2.new(0, 390, 0, 25)
                    OptionButton.Font = Enum.Font.GothamBold
                    OptionButton.Text = option
                    OptionButton.TextColor3 = Color3.fromRGB(230, 230, 230)
                    OptionButton.TextSize = 14.000
                    
                    UICorner_19.CornerRadius = UDim.new(0.2, 0)
                    UICorner_19.Parent = OptionButton
                    
                    OptionButton.MouseButton1Click:Connect(function()
                        selectedOption = option
                        Selected.Text = option
                        toggleDropdown()
                        if options.Callback then
                            options.Callback(option)
                        end
                    end)
                end
                
                local dropdownFunctions = {}
                
                function dropdownFunctions:Set(option)
                    if table.find(options.List, option) then
                        selectedOption = option
                        Selected.Text = option
                        if options.Callback then
                            options.Callback(option)
                        end
                    end
                end
                
                function dropdownFunctions:Get()
                    return selectedOption
                end
                
                function dropdownFunctions:Refresh(newList)
                    options.List = newList or options.List
                    maxHeight = math.min(#options.List * 30 + 10, 150)
                    
                
                    for _, child in ipairs(DropdownList:GetChildren()) do
                        if child:IsA("TextButton") then
                            child:Destroy()
                        end
                    end
                    
                
                    for i, option in ipairs(options.List) do
                        local OptionButton = Instance.new("TextButton")
                        local UICorner_19 = Instance.new("UICorner")
                        
                        OptionButton.Name = option
                        OptionButton.Parent = DropdownList
                        OptionButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                        OptionButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        OptionButton.BorderSizePixel = 0
                        OptionButton.Size = UDim2.new(0, 390, 0, 25)
                        OptionButton.Font = Enum.Font.GothamBold
                        OptionButton.Text = option
                        OptionButton.TextColor3 = Color3.fromRGB(230, 230, 230)
                        OptionButton.TextSize = 14.000
                        
                        UICorner_19.CornerRadius = UDim.new(0.2, 0)
                        UICorner_19.Parent = OptionButton
                        
                        OptionButton.MouseButton1Click:Connect(function()
                            selectedOption = option
                            Selected.Text = option
                            toggleDropdown()
                            if options.Callback then
                                options.Callback(option)
                            end
                        end)
                    end
                end
                
                return dropdownFunctions
            end
            
            return sectionElements
        end
        
        return tabContent
    end
    
    return tabFunctions
end

return EyeUI