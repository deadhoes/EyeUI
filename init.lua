local Library = {}

function Library:Window(name)
    local ScreenGui = Instance.new("ScreenGui")
    local Menu = Instance.new("Frame")
    local Topbar = Instance.new("Folder")
    local Close = Instance.new("TextButton")
    local ImageLabel = Instance.new("ImageLabel")
    local UICorner = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local Description = Instance.new("TextLabel")
    local Image = Instance.new("ImageLabel")
    local UICorner_2 = Instance.new("UICorner")
    local Tabs = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local Elements = Instance.new("Frame")
    local UICorner_3 = Instance.new("UICorner")
    local UIListLayout_2 = Instance.new("UIListLayout")
    local UIPadding = Instance.new("UIPadding")
    local Drag = Instance.new("Frame")
    local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
    UIAspectRatioConstraint.AspectRatio = 1.487

    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    Drag.Name = "Drag"
    Drag.Parent = Menu
    Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Drag.BackgroundTransparency = 0.750
    Drag.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Drag.BorderSizePixel = 0
    Drag.Position = UDim2.new(0.377262533, 0, 1.02564108, 0)
    Drag.Size = UDim2.new(0, 192, 0, 5)
    
    Menu.Name = "Menu"
    Menu.Parent = ScreenGui
    Menu.AnchorPoint = Vector2.new(0.5, 0.5)
    Menu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Menu.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Menu.BorderSizePixel = 0
    Menu.Position = UDim2.new(0.5, 0, 0.5, 0)
    Menu.Size = UDim2.new(0, 580, 0, 390)

    Topbar.Name = "Topbar"
    Topbar.Parent = Menu

    Close.Name = "Close"
    Close.Parent = Topbar
    Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Close.BackgroundTransparency = 1.000
    Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Close.BorderSizePixel = 0
    Close.Position = UDim2.new(0.937879443, 0, 0, 0)
    Close.Size = UDim2.new(0, 35, 0, 37)
    Close.Font = Enum.Font.SourceSans
    Close.Text = ""
    Close.TextColor3 = Color3.fromRGB(0, 0, 0)
    Close.TextSize = 14.000

    ImageLabel.Parent = Close
    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel.BackgroundTransparency = 1.000
    ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageLabel.BorderSizePixel = 0
    ImageLabel.Position = UDim2.new(0.0619053431, 0, 0.275676012, 0)
    ImageLabel.Size = UDim2.new(0, 22, 0, 22)
    ImageLabel.Image = "rbxassetid://10747384394"

    UICorner.CornerRadius = UDim.new(0.0199999996, 8)
    UICorner.Parent = Close

    Title.Name = "Title"
    Title.Parent = Topbar
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(0.0913793072, 0, 0, 0)
    Title.Size = UDim2.new(0, 266, 0, 38)
    Title.Font = Enum.Font.GothamBold
    Title.Text = name
    Title.TextColor3 = Color3.fromRGB(230, 230, 230)
    Title.TextSize = 12.000
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Description.Name = "Description"
    Description.Parent = Topbar
    Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Description.BackgroundTransparency = 1.000
    Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Description.BorderSizePixel = 0
    Description.Position = UDim2.new(0.0913793072, 0, 0.0307692308, 0)
    Description.Size = UDim2.new(0, 266, 0, 38)
    Description.Font = Enum.Font.GothamBold
    Description.Text = "premium ui library"
    Description.TextColor3 = Color3.fromRGB(176, 176, 176)
    Description.TextSize = 12.000
    Description.TextXAlignment = Enum.TextXAlignment.Left

    Image.Name = "Image"
    Image.Parent = Topbar
    Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Image.BackgroundTransparency = 1.000
    Image.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Image.BorderSizePixel = 0
    Image.Position = UDim2.new(0.0327586196, 0, 0.0307692308, 0)
    Image.Size = UDim2.new(0, 25, 0, 26)
    Image.Image = "rbxassetid://6523858394"

    UICorner_2.CornerRadius = UDim.new(0.0500000007, 0)
    UICorner_2.Parent = Menu

    Tabs.Name = "Tabs"
    Tabs.Parent = Menu
    Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tabs.BackgroundTransparency = 1.000
    Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tabs.BorderSizePixel = 0
    Tabs.Position = UDim2.new(0, 0, 0.128204897, 0)
    Tabs.Size = UDim2.new(0, 127, 0, 339)

    UIListLayout.Parent = Tabs
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    Elements.Name = "Elements"
    Elements.Parent = Menu
    Elements.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
    Elements.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Elements.BorderSizePixel = 0
    Elements.Position = UDim2.new(0.219580084, 0, 0.128204897, 0)
    Elements.Size = UDim2.new(0, 452, 0, 337)

    UICorner_3.CornerRadius = UDim.new(0.0500000007, 0)
    UICorner_3.Parent = Elements

    UIListLayout_2.Parent = Elements
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_2.Padding = UDim.new(0, 7)

    UIPadding.Parent = Elements
    UIPadding.PaddingBottom = UDim.new(0, 10)
    UIPadding.PaddingLeft = UDim.new(0, 15)
    UIPadding.PaddingRight = UDim.new(0, 15)
    UIPadding.PaddingTop = UDim.new(0, 10)

    Close.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Sürükleme sistemi düzeltmesi
    local UIS = game:GetService("UserInputService")
    local dragging = false
    local dragInput, dragStart, startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        Menu.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    Drag.InputBegan:Connect(function(input)
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
    
    Drag.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    local WindowFunctions = {}
    WindowFunctions.tabs = {}
    WindowFunctions.selectedTab = nil

    function WindowFunctions:Tab(name)
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

        ImageLabel.Parent = Tab
        ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel.BackgroundTransparency = 1.000
        ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ImageLabel.BorderSizePixel = 0
        ImageLabel.Position = UDim2.new(0.144427419, 0, 0.221702576, 0)
        ImageLabel.Size = UDim2.new(0, 25, 0, 25)
        ImageLabel.Image = "rbxassetid://10734966248"

        TextLabel.Parent = Tab
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1.000
        TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel.BorderSizePixel = 0
        TextLabel.Position = UDim2.new(0.413412273, 0, 0.0416666679, 0)
        TextLabel.Size = UDim2.new(0, 82, 0, 44)
        TextLabel.Font = Enum.Font.GothamBold
        TextLabel.Text = name
        TextLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
        TextLabel.TextSize = 14.000
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left

        TabButton.Parent = Tab
        TabButton.BackgroundTransparency = 1
        TabButton.Size = UDim2.new(1, 0, 1, 0)
        TabButton.Text = ""

        local TabFunctions = {}
        TabFunctions.sections = {}
        TabFunctions.elements = {}
        TabFunctions.tab = Tab
        TabFunctions.textLabel = TextLabel
        TabFunctions.imageLabel = ImageLabel

        table.insert(WindowFunctions.tabs, TabFunctions)

        TabButton.MouseButton1Click:Connect(function()
            for _, tab in pairs(WindowFunctions.tabs) do
                tab.textLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
                tab.imageLabel.ImageColor3 = Color3.fromRGB(150, 150, 150)
                for _, element in pairs(tab.elements) do
                    element.Visible = false
                end
            end
            
            TabFunctions.textLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
            TabFunctions.imageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
            for _, element in pairs(TabFunctions.elements) do
                element.Visible = true
            end
            
            WindowFunctions.selectedTab = TabFunctions
        end)

        if WindowFunctions.selectedTab == nil then
            TabFunctions.textLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
            TabFunctions.imageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
            WindowFunctions.selectedTab = TabFunctions
        end

        function TabFunctions:Section(name)
            local SectionTitle = Instance.new("TextLabel")
            
            SectionTitle.Name = "Title"
            SectionTitle.Parent = Elements
            SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionTitle.BackgroundTransparency = 1.000
            SectionTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            SectionTitle.BorderSizePixel = 0
            SectionTitle.Size = UDim2.new(0, 419, 0, 25)
            SectionTitle.Font = Enum.Font.GothamBold
            SectionTitle.Text = name
            SectionTitle.TextColor3 = Color3.fromRGB(230, 230, 230)
            SectionTitle.TextSize = 14.000
            SectionTitle.TextXAlignment = Enum.TextXAlignment.Left

            if WindowFunctions.selectedTab ~= TabFunctions then
                SectionTitle.Visible = false
            end

            table.insert(TabFunctions.elements, SectionTitle)

            local SectionFunctions = {}

            function SectionFunctions:Button(text, callback)
                local Button = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local Title = Instance.new("TextLabel")
                local Description = Instance.new("TextLabel")
                local ImageLabel = Instance.new("ImageLabel")
                local Interact = Instance.new("TextButton")

                Button.Name = "Button"
                Button.Parent = Elements
                Button.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Button.BorderSizePixel = 0
                Button.Size = UDim2.new(0, 420, 0, 53)

                UICorner.CornerRadius = UDim.new(0.200000003, 0)
                UICorner.Parent = Button

                Title.Name = "Title"
                Title.Parent = Button
                Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title.BackgroundTransparency = 1.000
                Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Title.BorderSizePixel = 0
                Title.Position = UDim2.new(0.048780486, 0, 0.0566037744, 0)
                Title.Size = UDim2.new(0, 200, 0, 30)
                Title.Font = Enum.Font.GothamBold
                Title.Text = text
                Title.TextColor3 = Color3.fromRGB(230, 230, 230)
                Title.TextSize = 14.000
                Title.TextXAlignment = Enum.TextXAlignment.Left

                Description.Name = "Description"
                Description.Parent = Button
                Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Description.BackgroundTransparency = 1.000
                Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Description.BorderSizePixel = 0
                Description.Position = UDim2.new(0.048780486, 0, 0.320754707, 0)
                Description.Size = UDim2.new(0, 200, 0, 30)
                Description.Font = Enum.Font.GothamBold
                Description.Text = "Click to perform action"
                Description.TextColor3 = Color3.fromRGB(153, 153, 153)
                Description.TextSize = 14.000
                Description.TextXAlignment = Enum.TextXAlignment.Left

                ImageLabel.Parent = Button
                ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageLabel.BackgroundTransparency = 1.000
                ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ImageLabel.BorderSizePixel = 0
                ImageLabel.Position = UDim2.new(0.922207296, 0, 0.308760732, 0)
                ImageLabel.Size = UDim2.new(0, 20, 0, 20)
                ImageLabel.Image = "rbxassetid://10734898355"

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

                if WindowFunctions.selectedTab ~= TabFunctions then
                    Button.Visible = false
                end

                table.insert(TabFunctions.elements, Button)

                Interact.MouseButton1Click:Connect(function()
                    if callback then
                        callback()
                    end
                end)
            end

            function SectionFunctions:Toggle(text, default, callback)
                local Toggle = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local Title = Instance.new("TextLabel")
                local ToggleSwitch = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local ToggleButton = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local Description = Instance.new("TextLabel")
                local Interact = Instance.new("TextButton")

                local toggled = default or false

                Toggle.Name = "Toggle"
                Toggle.Parent = Elements
                Toggle.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Toggle.BorderSizePixel = 0
                Toggle.Size = UDim2.new(0, 420, 0, 53)

                UICorner.CornerRadius = UDim.new(0.200000003, 0)
                UICorner.Parent = Toggle

                Title.Name = "Title"
                Title.Parent = Toggle
                Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title.BackgroundTransparency = 1.000
                Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Title.BorderSizePixel = 0
                Title.Position = UDim2.new(0.0487804599, 0, 0.0570333228, 0)
                Title.Size = UDim2.new(0, 200, 0, 30)
                Title.Font = Enum.Font.GothamBold
                Title.Text = text
                Title.TextColor3 = Color3.fromRGB(230, 230, 230)
                Title.TextSize = 14.000
                Title.TextXAlignment = Enum.TextXAlignment.Left

                ToggleSwitch.Name = "ToggleSwitch"
                ToggleSwitch.Parent = Toggle
                ToggleSwitch.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                ToggleSwitch.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ToggleSwitch.BorderSizePixel = 0
                ToggleSwitch.Position = UDim2.new(0.842343211, 0, 0.318181813, 0)
                ToggleSwitch.Size = UDim2.new(0, 35, 0, 15)

                UICorner_2.CornerRadius = UDim.new(0.400000006, 0)
                UICorner_2.Parent = ToggleSwitch

                ToggleButton.Name = "ToggleButton"
                ToggleButton.Parent = ToggleSwitch
                ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ToggleButton.BorderSizePixel = 0
                ToggleButton.Position = UDim2.new(-0.00775024435, 0, -0.0666666701, 0)
                ToggleButton.Size = UDim2.new(0, 18, 0, 18)

                UICorner_3.CornerRadius = UDim.new(1, 0)
                UICorner_3.Parent = ToggleButton

                Description.Name = "Description"
                Description.Parent = Toggle
                Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Description.BackgroundTransparency = 1.000
                Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Description.BorderSizePixel = 0
                Description.Position = UDim2.new(0.0463995077, 0, 0.301886797, 0)
                Description.Size = UDim2.new(0, 200, 0, 30)
                Description.Font = Enum.Font.GothamBold
                Description.Text = "Toggle to enable or disable the feature"
                Description.TextColor3 = Color3.fromRGB(153, 153, 153)
                Description.TextSize = 14.000
                Description.TextXAlignment = Enum.TextXAlignment.Left

                Interact.Name = "Interact"
                Interact.Parent = Toggle
                Interact.BackgroundTransparency = 1
                Interact.Size = UDim2.new(1, 0, 1, 0)
                Interact.Text = ""

                if WindowFunctions.selectedTab ~= TabFunctions then
                    Toggle.Visible = false
                end

                table.insert(TabFunctions.elements, Toggle)

                local function updateToggle()
                    if toggled then
                        ToggleSwitch.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
                        ToggleButton.Position = UDim2.new(0.5, 0, -0.0666666701, 0)
                    else
                        ToggleSwitch.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                        ToggleButton.Position = UDim2.new(-0.00775024435, 0, -0.0666666701, 0)
                    end
                end

                updateToggle()

                Interact.MouseButton1Click:Connect(function()
                    toggled = not toggled
                    updateToggle()
                    if callback then
                        callback(toggled)
                    end
                end)
            end

            function SectionFunctions:Slider(text, min, max, default, callback)
                local Slider = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local Title = Instance.new("TextLabel")
                local SliderBar = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local SliderFill = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local SliderHandle = Instance.new("Frame")
                local UICorner_4 = Instance.new("UICorner")
                local TextBox = Instance.new("TextBox")
                local UICorner_5 = Instance.new("UICorner")

                local value = default or min
                local dragging = false

                Slider.Name = "Slider"
                Slider.Parent = Elements
                Slider.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Slider.BorderSizePixel = 0
                Slider.Size = UDim2.new(0, 420, 0, 44)

                UICorner.CornerRadius = UDim.new(0.200000003, 0)
                UICorner.Parent = Slider

                Title.Name = "Title"
                Title.Parent = Slider
                Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title.BackgroundTransparency = 1.000
                Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Title.BorderSizePixel = 0
                Title.Position = UDim2.new(0.0487804599, 0, 0.170240223, 0)
                Title.Size = UDim2.new(0, 200, 0, 30)
                Title.Font = Enum.Font.GothamBold
                Title.Text = text
                Title.TextColor3 = Color3.fromRGB(230, 230, 230)
                Title.TextSize = 14.000
                Title.TextXAlignment = Enum.TextXAlignment.Left

                SliderBar.Name = "SliderBar"
                SliderBar.Parent = Slider
                SliderBar.AnchorPoint = Vector2.new(0.5, 0.5)
                SliderBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                SliderBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SliderBar.BorderSizePixel = 0
                SliderBar.Position = UDim2.new(0.584289372, 0, 0.5, 0)
                SliderBar.Size = UDim2.new(0, 177, 0, 15)

                UICorner_2.CornerRadius = UDim.new(0.400000006, 0)
                UICorner_2.Parent = SliderBar

                SliderFill.Name = "SliderFill"
                SliderFill.Parent = SliderBar
                SliderFill.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
                SliderFill.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SliderFill.BorderSizePixel = 0
                SliderFill.Position = UDim2.new(0.00121609005, 0, -0.0151509605, 0)
                SliderFill.Size = UDim2.new(0, 32, 0, 15)

                UICorner_3.CornerRadius = UDim.new(0.400000006, 0)
                UICorner_3.Parent = SliderFill

                SliderHandle.Name = "SliderHandle"
                SliderHandle.Parent = SliderBar
                SliderHandle.AnchorPoint = Vector2.new(0.5, 0.5)
                SliderHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderHandle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SliderHandle.BorderSizePixel = 0
                SliderHandle.Position = UDim2.new(0.1, 0, 0.5, 0)
                SliderHandle.Size = UDim2.new(0, 23, 0, 23)

                UICorner_4.CornerRadius = UDim.new(1, 0)
                UICorner_4.Parent = SliderHandle

                TextBox.Parent = Slider
                TextBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
                TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
                TextBox.BorderSizePixel = 0
                TextBox.Position = UDim2.new(0.852177501, 0, 0.120497271, 0)
                TextBox.Size = UDim2.new(0, 49, 0, 34)
                TextBox.Font = Enum.Font.GothamBold
                TextBox.Text = tostring(value)
                TextBox.TextColor3 = Color3.fromRGB(230, 230, 230)
                TextBox.TextSize = 14.000

                UICorner_5.CornerRadius = UDim.new(0.200000003, 0)
                UICorner_5.Parent = TextBox

                if WindowFunctions.selectedTab ~= TabFunctions then
                    Slider.Visible = false
                end

                table.insert(TabFunctions.elements, Slider)

                local function updateSlider()
                    local percent = (value - min) / (max - min)
                    SliderFill.Size = UDim2.new(percent, 0, 0, 15)
                    SliderHandle.Position = UDim2.new(percent, 0, 0.5, 0)
                    TextBox.Text = tostring(math.floor(value))
                end

                updateSlider()

                SliderBar.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                    end
                end)

                SliderBar.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)

                UIS.InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        local mouse = game.Players.LocalPlayer:GetMouse()
                        local percent = math.clamp((mouse.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
                        value = min + (max - min) * percent
                        updateSlider()
                        if callback then
                            callback(value)
                        end
                    end
                end)

                TextBox.FocusLost:Connect(function()
                    local newValue = tonumber(TextBox.Text)
                    if newValue then
                        value = math.clamp(newValue, min, max)
                        updateSlider()
                        if callback then
                            callback(value)
                        end
                    else
                        TextBox.Text = tostring(math.floor(value))
                    end
                end)
            end

            function SectionFunctions:Dropdown(text, options, callback)
                local Dropdown = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local Title = Instance.new("TextLabel")
                local DropdownButton = Instance.new("TextButton")
                local UICorner_2 = Instance.new("UICorner")
                local DropdownText = Instance.new("TextLabel")
                local Arrow = Instance.new("ImageLabel")
                local DropdownFrame = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local UIListLayout = Instance.new("UIListLayout")
                local UIPadding = Instance.new("UIPadding")

                local isOpen = false
                local selectedOption = options[1] or "None"

                Dropdown.Name = "Dropdown"
                Dropdown.Parent = Elements
                Dropdown.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Dropdown.BorderSizePixel = 0
                Dropdown.Size = UDim2.new(0, 420, 0, 53)

                UICorner.CornerRadius = UDim.new(0.200000003, 0)
                UICorner.Parent = Dropdown

                Title.Name = "Title"
                Title.Parent = Dropdown
                Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title.BackgroundTransparency = 1.000
                Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Title.BorderSizePixel = 0
                Title.Position = UDim2.new(0.0487804599, 0, 0.0570333228, 0)
                Title.Size = UDim2.new(0, 200, 0, 30)
                Title.Font = Enum.Font.GothamBold
                Title.Text = text
                Title.TextColor3 = Color3.fromRGB(230, 230, 230)
                Title.TextSize = 14.000
                Title.TextXAlignment = Enum.TextXAlignment.Left

                DropdownButton.Name = "DropdownButton"
                DropdownButton.Parent = Dropdown
                DropdownButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                DropdownButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
                DropdownButton.BorderSizePixel = 0
                DropdownButton.Position = UDim2.new(0.542857170, 0, 0.188679248, 0)
                DropdownButton.Size = UDim2.new(0, 170, 0, 33)
                DropdownButton.Font = Enum.Font.SourceSans
                DropdownButton.Text = ""
                DropdownButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropdownButton.TextSize = 14.000

                UICorner_2.CornerRadius = UDim.new(0.200000003, 0)
                UICorner_2.Parent = DropdownButton

                DropdownText.Name = "DropdownText"
                DropdownText.Parent = DropdownButton
                DropdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropdownText.BackgroundTransparency = 1.000
                DropdownText.BorderColor3 = Color3.fromRGB(0, 0, 0)
                DropdownText.BorderSizePixel = 0
                DropdownText.Position = UDim2.new(0.0588235296, 0, 0, 0)
                DropdownText.Size = UDim2.new(0, 130, 0, 33)
                DropdownText.Font = Enum.Font.GothamBold
                DropdownText.Text = selectedOption
                DropdownText.TextColor3 = Color3.fromRGB(230, 230, 230)
                DropdownText.TextSize = 12.000
                DropdownText.TextXAlignment = Enum.TextXAlignment.Left

                Arrow.Name = "Arrow"
                Arrow.Parent = DropdownButton
                Arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Arrow.BackgroundTransparency = 1.000
                Arrow.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Arrow.BorderSizePixel = 0
                Arrow.Position = UDim2.new(0.847058833, 0, 0.272727281, 0)
                Arrow.Size = UDim2.new(0, 15, 0, 15)
                Arrow.Image = "rbxassetid://10709791437"

                DropdownFrame.Name = "DropdownFrame"
                DropdownFrame.Parent = Dropdown
                DropdownFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                DropdownFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                DropdownFrame.BorderSizePixel = 0
                DropdownFrame.Position = UDim2.new(0.542857170, 0, 0.811320782, 0)
                DropdownFrame.Size = UDim2.new(0, 170, 0, 0)
                DropdownFrame.Visible = false
                DropdownFrame.ClipsDescendants = true

                UICorner_3.CornerRadius = UDim.new(0.200000003, 0)
                UICorner_3.Parent = DropdownFrame

                UIListLayout.Parent = DropdownFrame
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

                UIPadding.Parent = DropdownFrame
                UIPadding.PaddingBottom = UDim.new(0, 5)
                UIPadding.PaddingLeft = UDim.new(0, 5)
                UIPadding.PaddingRight = UDim.new(0, 5)
                UIPadding.PaddingTop = UDim.new(0, 5)

                if WindowFunctions.selectedTab ~= TabFunctions then
                    Dropdown.Visible = false
                end

                table.insert(TabFunctions.elements, Dropdown)

                for _, option in pairs(options) do
                    local OptionButton = Instance.new("TextButton")
                    OptionButton.Name = option
                    OptionButton.Parent = DropdownFrame
                    OptionButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    OptionButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    OptionButton.BorderSizePixel = 0
                    OptionButton.Size = UDim2.new(0, 160, 0, 25)
                    OptionButton.Font = Enum.Font.GothamBold
                    OptionButton.Text = option
                    OptionButton.TextColor3 = Color3.fromRGB(200, 200, 200)
                    OptionButton.TextSize = 12.000

                    local OptionCorner = Instance.new("UICorner")
                    OptionCorner.CornerRadius = UDim.new(0.200000003, 0)
                    OptionCorner.Parent = OptionButton

                    OptionButton.MouseButton1Click:Connect(function()
                        selectedOption = option
                        DropdownText.Text = selectedOption
                        isOpen = false
                        DropdownFrame.Visible = false
                        game:GetService("TweenService"):Create(DropdownFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 170, 0, 0)}):Play()
                        if callback then
                            callback(selectedOption)
                        end
                    end)

                    OptionButton.MouseEnter:Connect(function()
                        OptionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                    end)

                    OptionButton.MouseLeave:Connect(function()
                        OptionButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    end)
                end

                DropdownButton.MouseButton1Click:Connect(function()
                    isOpen = not isOpen
                    if isOpen then
                        DropdownFrame.Visible = true
                        local targetSize = #options * 30 + 10
                        game:GetService("TweenService"):Create(DropdownFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 170, 0, targetSize)}):Play()
                    else
                        game:GetService("TweenService"):Create(DropdownFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 170, 0, 0)}):Play()
                        wait(0.3)
                        DropdownFrame.Visible = false
                    end
                end)
            end

            function SectionFunctions:TextBox(text, placeholder, callback)
                local TextBoxFrame = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local Title = Instance.new("TextLabel")
                local TextBoxInput = Instance.new("TextBox")
                local UICorner_2 = Instance.new("UICorner")

                TextBoxFrame.Name = "TextBox"
                TextBoxFrame.Parent = Elements
                TextBoxFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                TextBoxFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                TextBoxFrame.BorderSizePixel = 0
                TextBoxFrame.Size = UDim2.new(0, 420, 0, 53)

                UICorner.CornerRadius = UDim.new(0.200000003, 0)
                UICorner.Parent = TextBoxFrame

                Title.Name = "Title"
                Title.Parent = TextBoxFrame
                Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title.BackgroundTransparency = 1.000
                Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Title.BorderSizePixel = 0
                Title.Position = UDim2.new(0.0487804599, 0, 0.0570333228, 0)
                Title.Size = UDim2.new(0, 200, 0, 30)
                Title.Font = Enum.Font.GothamBold
                Title.Text = text
                Title.TextColor3 = Color3.fromRGB(230, 230, 230)
                Title.TextSize = 14.000
                Title.TextXAlignment = Enum.TextXAlignment.Left

                TextBoxInput.Name = "TextBoxInput"
                TextBoxInput.Parent = TextBoxFrame
                TextBoxInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                TextBoxInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
                TextBoxInput.BorderSizePixel = 0
                TextBoxInput.Position = UDim2.new(0.542857170, 0, 0.188679248, 0)
                TextBoxInput.Size = UDim2.new(0, 170, 0, 33)
                TextBoxInput.Font = Enum.Font.GothamBold
                TextBoxInput.PlaceholderText = placeholder or "Enter text..."
                TextBoxInput.Text = ""
                TextBoxInput.TextColor3 = Color3.fromRGB(230, 230, 230)
                TextBoxInput.TextSize = 12.000

                UICorner_2.CornerRadius = UDim.new(0.200000003, 0)
                UICorner_2.Parent = TextBoxInput

                if WindowFunctions.selectedTab ~= TabFunctions then
                    TextBoxFrame.Visible = false
                end

                table.insert(TabFunctions.elements, TextBoxFrame)

                TextBoxInput.FocusLost:Connect(function()
                    if callback then
                        callback(TextBoxInput.Text)
                    end
                end)
            end

            return SectionFunctions
        end

        return TabFunctions
    end

    return WindowFunctions
end

return Library
