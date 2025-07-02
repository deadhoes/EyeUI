--!strict
local Library = {}
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

-- Animation configurations
local ANIMATIONS = {
    WINDOW_OPEN = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    WINDOW_CLOSE = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
    TOGGLE_SWITCH = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    DROPDOWN_EXPAND = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    SLIDER_SMOOTH = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    BUTTON_PRESS = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    FADE = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
}

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
    local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

    -- Setup UI components
    UIAspectRatioConstraint.AspectRatio = 1.487
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Name = "LibraryGui_" .. name

    Menu.Name = "Menu"
    Menu.Parent = ScreenGui
    Menu.AnchorPoint = Vector2.new(0.5, 0.5)
    Menu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Menu.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Menu.BorderSizePixel = 0
    Menu.Position = UDim2.new(0.5, 0, 0.5, 0)
    Menu.Size = UDim2.new(0, 580, 0, 390)
    Menu.BackgroundTransparency = 1
    Menu.ClipsDescendants = true

    -- Add drop shadow effect
    local Shadow = Instance.new("Frame")
    Shadow.Name = "Shadow"
    Shadow.Parent = Menu
    Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.BackgroundTransparency = 0.7
    Shadow.BorderSizePixel = 0
    Shadow.Position = UDim2.new(0.5, 3, 0.5, 3)
    Shadow.Size = UDim2.new(1, 0, 1, 0)
    Shadow.ZIndex = -1
    local ShadowCorner = Instance.new("UICorner")
    ShadowCorner.CornerRadius = UDim.new(0.0500000007, 0)
    ShadowCorner.Parent = Shadow

    Topbar.Name = "Topbar"
    Topbar.Parent = Menu

    Close.Name = "Close"
    Close.Parent = Topbar
    Close.BackgroundColor3 = Color3.fromRGB(255, 95, 95)
    Close.BackgroundTransparency = 0.1
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

    -- Opening animation
    Menu.Size = UDim2.new(0, 0, 0, 0)
    TweenService:Create(Menu, ANIMATIONS.FADE, {BackgroundTransparency = 0}):Play()
    TweenService:Create(Menu, ANIMATIONS.WINDOW_OPEN, {Size = UDim2.new(0, 580, 0, 390)}):Play()

    -- Close button functionality with animation
    local isClosing = false
    Close.MouseButton1Click:Connect(function()
        if isClosing then return end
        isClosing = true

        -- Button press animation
        TweenService:Create(Close, ANIMATIONS.BUTTON_PRESS, {Size = UDim2.new(0, 32, 0, 34)}):Play()
        task.wait(0.1) -- wait(0.1) yerine task.wait kullanıldı
        TweenService:Create(Close, ANIMATIONS.BUTTON_PRESS, {Size = UDim2.new(0, 35, 0, 37)}):Play()

        -- Window close animation
        local closeTween = TweenService:Create(Menu, ANIMATIONS.WINDOW_CLOSE, {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1
        })
        closeTween:Play()

        closeTween.Completed:Connect(function()
            ScreenGui:Destroy()
        end)
    end)

    -- Close button hover effects
    Close.MouseEnter:Connect(function()
        TweenService:Create(Close, ANIMATIONS.FADE, {BackgroundTransparency = 0}):Play()
    end)

    Close.MouseLeave:Connect(function()
        TweenService:Create(Close, ANIMATIONS.FADE, {BackgroundTransparency = 0.1}):Play()
    end)

    -- Drag functionality with improved smoothness
    local dragToggle = nil
    local dragSpeed = 0.25 -- Bu satır kullanılıyor, yorum satırı yapmıyoruz
    local dragInput = nil
    local dragStart = nil
    local dragPos = nil
    local startPos = nil

    local function updateInput(input)
        local Delta = input.Position - dragStart
        local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        TweenService:Create(Menu, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {Position = Position}):Play()
    end

    Menu.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
            dragToggle = true
            dragStart = input.Position
            startPos = Menu.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)

    Menu.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then
            updateInput(input)
        end
    end)

    local WindowFunctions = {}
    WindowFunctions.tabs = {}
    WindowFunctions.selectedTab = nil
    WindowFunctions.Menu = Menu -- Bu satır eklendi, böylece myWindow.Menu'ya erişebilirsiniz.

    function WindowFunctions:Tab(name, iconId) -- iconId parametresi eklendi
        local Tab = Instance.new("Frame")
        local ImageLabel = Instance.new("ImageLabel")
        local TextLabel = Instance.new("TextLabel")
        local TabButton = Instance.new("TextButton")
        local TabCorner = Instance.new("UICorner")

        Tab.Name = name
        Tab.Parent = Tabs
        Tab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Tab.BackgroundTransparency = 1
        Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Tab.BorderSizePixel = 0
        Tab.Size = UDim2.new(0, 127, 0, 48)

        TabCorner.CornerRadius = UDim.new(0.1, 0)
        TabCorner.Parent = Tab

        ImageLabel.Parent = Tab
        ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel.BackgroundTransparency = 1.000
        ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ImageLabel.BorderSizePixel = 0
        ImageLabel.Position = UDim2.new(0.144427419, 0, 0.221702576, 0)
        ImageLabel.Size = UDim2.new(0, 25, 0, 25)
        ImageLabel.Image = iconId or "rbxassetid://10734966248" -- Varsayılan bir simge

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

        -- Tab hover effects
        TabButton.MouseEnter:Connect(function()
            if WindowFunctions.selectedTab ~= TabFunctions then
                TweenService:Create(Tab, ANIMATIONS.FADE, {BackgroundTransparency = 0.9}):Play()
            end
        end)

        TabButton.MouseLeave:Connect(function()
            if WindowFunctions.selectedTab ~= TabFunctions then
                TweenService:Create(Tab, ANIMATIONS.FADE, {BackgroundTransparency = 1}):Play()
            end
        end)

        TabButton.MouseButton1Click:Connect(function()
            -- Deselect all tabs
            for _, tab in pairs(WindowFunctions.tabs) do
                TweenService:Create(tab.textLabel, ANIMATIONS.FADE, {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
                TweenService:Create(tab.imageLabel, ANIMATIONS.FADE, {ImageColor3 = Color3.fromRGB(150, 150, 150)}):Play()
                TweenService:Create(tab.tab, ANIMATIONS.FADE, {BackgroundTransparency = 1}):Play()

                for _, element in pairs(tab.elements) do
                    element.Visible = false
                end
            end

            -- Select current tab with animations
            TweenService:Create(TabFunctions.textLabel, ANIMATIONS.FADE, {TextColor3 = Color3.fromRGB(230, 230, 230)}):Play()
            TweenService:Create(TabFunctions.imageLabel, ANIMATIONS.FADE, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            TweenService:Create(Tab, ANIMATIONS.FADE, {BackgroundTransparency = 0.85}):Play()

            for _, element in pairs(TabFunctions.elements) do
                element.Visible = true
            end

            WindowFunctions.selectedTab = TabFunctions
        end)

        -- Auto-select first tab
        if WindowFunctions.selectedTab == nil then
            TweenService:Create(TabFunctions.textLabel, ANIMATIONS.FADE, {TextColor3 = Color3.fromRGB(230, 230, 230)}):Play()
            TweenService:Create(TabFunctions.imageLabel, ANIMATIONS.FADE, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            TweenService:Create(Tab, ANIMATIONS.FADE, {BackgroundTransparency = 0.85}):Play()
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

            function SectionFunctions:Button(text, description, callback) -- description parametresi eklendi
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

                UICorner.CornerRadius = UDim.new(0.1, 0)
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
                Description.Text = description or "Click to perform action"
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

                -- Button interactions with animations
                Interact.MouseEnter:Connect(function()
                    TweenService:Create(Button, ANIMATIONS.FADE, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
                end)

                Interact.MouseLeave:Connect(function()
                    TweenService:Create(Button, ANIMATIONS.FADE, {BackgroundColor3 = Color3.fromRGB(26, 26, 26)}):Play()
                end)

                Interact.MouseButton1Down:Connect(function()
                    TweenService:Create(Button, ANIMATIONS.BUTTON_PRESS, {Size = UDim2.new(0, 415, 0, 50)}):Play()
                end)

                Interact.MouseButton1Up:Connect(function()
                    TweenService:Create(Button, ANIMATIONS.BUTTON_PRESS, {Size = UDim2.new(0, 420, 0, 53)}):Play()
                end)

                Interact.MouseButton1Click:Connect(function()
                    if callback then
                        callback()
                    end
                end)
            end

            function SectionFunctions:Toggle(text, description, default, callback) -- description ve default parametreleri eklendi
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

                UICorner.CornerRadius = UDim.new(0.1, 0)
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
                ToggleSwitch.Size = UDim2.new(0, 42, 0, 15)

                UICorner_2.CornerRadius = UDim.new(0.4, 0)
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
                Description.Text = description or "Toggle to enable or disable the feature"
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

                -- Enhanced toggle animation
                local function updateToggle()
                    if toggled then
                        TweenService:Create(ToggleButton, ANIMATIONS.TOGGLE_SWITCH, {
                            Position = UDim2.new(0.57, 0, -0.0666666701, 0),
                            BackgroundColor3 = Color3.fromRGB(85, 255, 85)
                        }):Play()
                        TweenService:Create(ToggleSwitch, ANIMATIONS.TOGGLE_SWITCH, {
                            BackgroundColor3 = Color3.fromRGB(85, 255, 85)
                        }):Play()
                    else
                        TweenService:Create(ToggleButton, ANIMATIONS.TOGGLE_SWITCH, {
                            Position = UDim2.new(-0.00775024435, 0, -0.0666666701, 0),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        }):Play()
                        TweenService:Create(ToggleSwitch, ANIMATIONS.TOGGLE_SWITCH, {
                            BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                        }):Play()
                    end
                end

                -- Initialize toggle state
                updateToggle()

                Interact.MouseButton1Click:Connect(function()
                    toggled = not toggled
                    updateToggle()
                    if callback then
                        callback(toggled)
                    end
                end)
            end

            function SectionFunctions:Input(text, description, defaultText, callback)
                local InputFrame = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local Title = Instance.new("TextLabel")
                local Description = Instance.new("TextLabel")
                local TextBox = Instance.new("TextBox")
                local UICorner_2 = Instance.new("UICorner")

                InputFrame.Name = "Input"
                InputFrame.Parent = Elements
                InputFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                InputFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                InputFrame.BorderSizePixel = 0
                InputFrame.Size = UDim2.new(0, 420, 0, 53)

                UICorner.CornerRadius = UDim.new(0.1, 0)
                UICorner.Parent = InputFrame

                Title.Name = "Title"
                Title.Parent = InputFrame
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
                Description.Parent = InputFrame
                Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Description.BackgroundTransparency = 1.000
                Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Description.BorderSizePixel = 0
                Description.Position = UDim2.new(0.048780486, 0, 0.320754707, 0)
                Description.Size = UDim2.new(0, 200, 0, 30)
                Description.Font = Enum.Font.GothamBold
                Description.Text = description or "Enter text here"
                Description.TextColor3 = Color3.fromRGB(153, 153, 153)
                Description.TextSize = 14.000
                Description.TextXAlignment = Enum.TextXAlignment.Left

                TextBox.Name = "TextBox"
                TextBox.Parent = InputFrame
                TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
                TextBox.BorderSizePixel = 0
                TextBox.Position = UDim2.new(0.598780453, 0, 0.283018887, 0)
                TextBox.Size = UDim2.new(0, 150, 0, 24)
                TextBox.Font = Enum.Font.SourceSans
                TextBox.Text = defaultText or ""
                TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextBox.TextSize = 14.000
                TextBox.TextXAlignment = Enum.TextXAlignment.Left
                TextBox.ClearTextOnFocus = false

                UICorner_2.CornerRadius = UDim.new(0.1, 0)
                UICorner_2.Parent = TextBox

                if WindowFunctions.selectedTab ~= TabFunctions then
                    InputFrame.Visible = false
                end

                table.insert(TabFunctions.elements, InputFrame)

                TextBox.FocusLost:Connect(function(enterPressed)
                    if enterPressed then
                        if callback then
                            callback(TextBox.Text)
                        end
                    end
                end)

                TextBox.Changed:Connect(function(property)
                    if property == "Text" then
                        -- Can call callback here for live updates, or only on FocusLost
                    end
                end)
            end

            function SectionFunctions:Slider(text, min, max, defaultValue, callback)
                local SliderFrame = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local Title = Instance.new("TextLabel")
                local ValueLabel = Instance.new("TextLabel")
                local SliderBackground = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local SliderFill = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local SliderButton = Instance.new("Frame")
                local UICorner_4 = Instance.new("UICorner")

                local currentValue = defaultValue or min
                currentValue = math.max(min, math.min(max, currentValue)) -- Değeri min-max arasına sıkıştır

                SliderFrame.Name = "Slider"
                SliderFrame.Parent = Elements
                SliderFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                SliderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SliderFrame.BorderSizePixel = 0
                SliderFrame.Size = UDim2.new(0, 420, 0, 53)

                UICorner.CornerRadius = UDim.new(0.1, 0)
                UICorner.Parent = SliderFrame

                Title.Name = "Title"
                Title.Parent = SliderFrame
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

                ValueLabel.Name = "ValueLabel"
                ValueLabel.Parent = SliderFrame
                ValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ValueLabel.BackgroundTransparency = 1.000
                ValueLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ValueLabel.BorderSizePixel = 0
                ValueLabel.Position = UDim2.new(0.814634144, 0, 0.0566037744, 0)
                ValueLabel.Size = UDim2.new(0, 50, 0, 30)
                ValueLabel.Font = Enum.Font.GothamBold
                ValueLabel.Text = string.format("%.0f", currentValue) -- Başlangıç değeri
                ValueLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
                ValueLabel.TextSize = 14.000
                ValueLabel.TextXAlignment = Enum.TextXAlignment.Right

                SliderBackground.Name = "SliderBackground"
                SliderBackground.Parent = SliderFrame
                SliderBackground.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                SliderBackground.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SliderBackground.BorderSizePixel = 0
                SliderBackground.Position = UDim2.new(0.048780486, 0, 0.641509414, 0)
                SliderBackground.Size = UDim2.new(0, 360, 0, 8)

                UICorner_2.CornerRadius = UDim.new(1, 0)
                UICorner_2.Parent = SliderBackground

                SliderFill.Name = "SliderFill"
                SliderFill.Parent = SliderBackground
                SliderFill.BackgroundColor3 = Color3.fromRGB(85, 255, 85)
                SliderFill.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SliderFill.BorderSizePixel = 0
                SliderFill.Size = UDim2.new((currentValue - min) / (max - min), 0, 1, 0) -- Başlangıç doluluğu

                UICorner_3.CornerRadius = UDim.new(1, 0)
                UICorner_3.Parent = SliderFill

                SliderButton.Name = "SliderButton"
                SliderButton.Parent = SliderBackground
                SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SliderButton.BorderSizePixel = 0
                SliderButton.Size = UDim2.new(0, 16, 0, 16)
                SliderButton.Position = UDim2.new(((currentValue - min) / (max - min)), -8, 0.5, -8) -- Başlangıç pozisyonu
                SliderButton.AnchorPoint = Vector2.new(0.5, 0.5)

                UICorner_4.CornerRadius = UDim.new(1, 0)
                UICorner_4.Parent = SliderButton

                if WindowFunctions.selectedTab ~= TabFunctions then
                    SliderFrame.Visible = false
                end

                table.insert(TabFunctions.elements, SliderFrame)

                local isDragging = false

                local function updateSlider(input)
                    local mouseX = input.Position.X
                    local relativeX = mouseX - SliderBackground.AbsolutePosition.X
                    local percentage = math.max(0, math.min(1, relativeX / SliderBackground.AbsoluteSize.X))
                    local newValue = min + (max - min) * percentage
                    currentValue = math.round(newValue) -- Yuvarlama eklendi

                    TweenService:Create(SliderFill, ANIMATIONS.SLIDER_SMOOTH, {
                        Size = UDim2.new(percentage, 0, 1, 0)
                    }):Play()
                    TweenService:Create(SliderButton, ANIMATIONS.SLIDER_SMOOTH, {
                        Position = UDim2.new(percentage, -8, 0.5, -8)
                    }):Play()

                    ValueLabel.Text = string.format("%.0f", currentValue)
                    if callback then
                        callback(currentValue)
                    end
                end

                SliderButton.MouseButton1Down:Connect(function()
                    isDragging = true
                    UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
                end)

                UIS.InputChanged:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement and isDragging then
                        updateSlider(input)
                    end
                end)

                UIS.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 and isDragging then
                        isDragging = false
                        UIS.MouseBehavior = Enum.MouseBehavior.Default
                    end
                end)

                -- Allow clicking on the background to adjust
                SliderBackground.MouseButton1Down:Connect(function(input)
                    isDragging = true
                    UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
                    updateSlider(input)
                end)

            end

            function SectionFunctions:ColorPicker(text, description, defaultColor, callback)
                local ColorPickerFrame = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local Title = Instance.new("TextLabel")
                local Description = Instance.new("TextLabel")
                local ColorDisplay = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local ColorButton = Instance.new("TextButton")

                local currentHue = 0.0
                local currentSaturation = 0.0
                local currentValue = 0.0

                if defaultColor then
                    local h, s, v = Color3.toHSV(defaultColor)
                    currentHue = h
                    currentSaturation = s
                    currentValue = v
                end

                local HSVPicker = Instance.new("Frame")
                local SatValPicker = Instance.new("Frame")
                local HueSlider = Instance.new("Frame")
                local HueSliderBG = Instance.new("Frame")
                local HueSliderBtn = Instance.new("Frame")
                local HueCorner = Instance.new("UICorner")
                local SatValImage = Instance.new("ImageLabel")
                local SatValButton = Instance.new("Frame")
                local SatValCorner = Instance.new("UICorner")

                ColorPickerFrame.Name = "ColorPicker"
                ColorPickerFrame.Parent = Elements
                ColorPickerFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                ColorPickerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ColorPickerFrame.BorderSizePixel = 0
                ColorPickerFrame.Size = UDim2.new(0, 420, 0, 180) -- Daha büyük boyut

                UICorner.CornerRadius = UDim.new(0.1, 0)
                UICorner.Parent = ColorPickerFrame

                Title.Name = "Title"
                Title.Parent = ColorPickerFrame
                Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title.BackgroundTransparency = 1.000
                Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Title.BorderSizePixel = 0
                Title.Position = UDim2.new(0.048780486, 0, 0.03, 0)
                Title.Size = UDim2.new(0, 200, 0, 20)
                Title.Font = Enum.Font.GothamBold
                Title.Text = text
                Title.TextColor3 = Color3.fromRGB(230, 230, 230)
                Title.TextSize = 14.000
                Title.TextXAlignment = Enum.TextXAlignment.Left

                Description.Name = "Description"
                Description.Parent = ColorPickerFrame
                Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Description.BackgroundTransparency = 1.000
                Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Description.BorderSizePixel = 0
                Description.Position = UDim2.new(0.048780486, 0, 0.15, 0)
                Description.Size = UDim2.new(0, 200, 0, 15)
                Description.Font = Enum.Font.GothamBold
                Description.Text = description or "Pick a color"
                Description.TextColor3 = Color3.fromRGB(153, 153, 153)
                Description.TextSize = 10.000
                Description.TextXAlignment = Enum.TextXAlignment.Left

                ColorDisplay.Name = "ColorDisplay"
                ColorDisplay.Parent = ColorPickerFrame
                ColorDisplay.BackgroundColor3 = defaultColor or Color3.fromRGB(70, 130, 180)
                ColorDisplay.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ColorDisplay.BorderSizePixel = 0
                ColorDisplay.Position = UDim2.new(0.85, 0, 0.05, 0)
                ColorDisplay.Size = UDim2.new(0, 40, 0, 30)

                UICorner_2.CornerRadius = UDim.new(0.1, 0)
                UICorner_2.Parent = ColorDisplay

                ColorButton.Name = "ColorButton"
                ColorButton.Parent = ColorDisplay
                ColorButton.BackgroundTransparency = 1
                ColorButton.Size = UDim2.new(1, 0, 1, 0)
                ColorButton.Text = ""

                HSVPicker.Name = "HSVPicker"
                HSVPicker.Parent = ColorPickerFrame
                HSVPicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                HSVPicker.BackgroundTransparency = 1
                HSVPicker.Size = UDim2.new(0, 390, 0, 110)
                HSVPicker.Position = UDim2.new(0.04, 0, 0.35, 0)

                -- Saturation/Value Picker
                SatValPicker.Name = "SatValPicker"
                SatValPicker.Parent = HSVPicker
                SatValPicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SatValPicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SatValPicker.BorderSizePixel = 0
                SatValPicker.Size = UDim2.new(0, 340, 0, 110)

                local satValGradientLeft = Instance.new("UIGradient")
                satValGradientLeft.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
                satValGradientLeft.Transparency = NumberSequence.new(0, 0)
                satValGradientLeft.Rotation = 0
                satValGradientLeft.Parent = SatValPicker

                local satValGradientTop = Instance.new("UIGradient")
                satValGradientTop.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0))
                satValGradientTop.Transparency = NumberSequence.new(0, 1)
                satValGradientTop.Rotation = 90
                satValGradientTop.Parent = SatValPicker

                SatValImage.Name = "SatValImage"
                SatValImage.Parent = SatValPicker
                SatValImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SatValImage.BackgroundTransparency = 1
                SatValImage.Size = UDim2.new(1, 0, 1, 0)
                SatValImage.Image = "rbxassetid://10734994849" -- Sat/Val picker image
                SatValImage.ImageColor3 = Color3.fromHSV(currentHue, 1, 1) -- İlk renk

                SatValButton.Name = "SatValButton"
                SatValButton.Parent = SatValPicker
                SatValButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SatValButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SatValButton.BorderSizePixel = 0
                SatValButton.Size = UDim2.new(0, 10, 0, 10)
                SatValButton.AnchorPoint = Vector2.new(0.5, 0.5)
                SatValButton.Position = UDim2.new(currentSaturation, 0, 1 - currentValue, 0) -- İlk pozisyon

                SatValCorner.CornerRadius = UDim.new(1, 0)
                SatValCorner.Parent = SatValButton

                -- Hue Slider
                HueSlider.Name = "HueSlider"
                HueSlider.Parent = HSVPicker
                HueSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                HueSlider.BackgroundTransparency = 1
                HueSlider.Size = UDim2.new(0, 30, 0, 110)
                HueSlider.Position = UDim2.new(1, -30, 0, 0)

                HueSliderBG.Name = "HueSliderBG"
                HueSliderBG.Parent = HueSlider
                HueSliderBG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                HueSliderBG.BackgroundTransparency = 1
                HueSliderBG.BorderColor3 = Color3.fromRGB(0, 0, 0)
                HueSliderBG.BorderSizePixel = 0
                HueSliderBG.Size = UDim2.new(1, 0, 1, 0)
                HueSliderBG.Image = "rbxassetid://10734996417" -- Hue gradient image

                HueSliderBtn.Name = "HueSliderBtn"
                HueSliderBtn.Parent = HueSlider
                HueSliderBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                HueSliderBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
                HueSliderBtn.BorderSizePixel = 0
                HueSliderBtn.Size = UDim2.new(1, 0, 0, 10)
                HueSliderBtn.AnchorPoint = Vector2.new(0.5, 0.5)
                HueSliderBtn.Position = UDim2.new(0.5, 0, 1 - currentHue, 0) -- İlk pozisyon

                HueCorner.CornerRadius = UDim.new(0.1, 0)
                HueCorner.Parent = HueSliderBtn

                if WindowFunctions.selectedTab ~= TabFunctions then
                    ColorPickerFrame.Visible = false
                end

                table.insert(TabFunctions.elements, ColorPickerFrame)

                local isDraggingHue = false
                local isDraggingSatVal = false

                local function updateColor()
                    local newColor = Color3.fromHSV(currentHue, currentSaturation, currentValue)
                    ColorDisplay.BackgroundColor3 = newColor
                    if callback then
                        callback(newColor)
                    end
                end

                local function updateSatValPickerColor()
                    SatValImage.ImageColor3 = Color3.fromHSV(currentHue, 1, 1)
                end

                local function updateHueSlider(input)
                    local mouseY = input.Position.Y
                    local relativeY = mouseY - HueSlider.AbsolutePosition.Y
                    local percentage = math.max(0, math.min(1, relativeY / HueSlider.AbsoluteSize.Y))
                    currentHue = 1 - percentage -- Y ekseni tersine
                    TweenService:Create(HueSliderBtn, ANIMATIONS.SLIDER_SMOOTH, {
                        Position = UDim2.new(0.5, 0, percentage, 0)
                    }):Play()
                    updateSatValPickerColor()
                    updateColor()
                end

                local function updateSatVal(input)
                    local mouseX = input.Position.X
                    local mouseY = input.Position.Y
                    local relativeX = mouseX - SatValPicker.AbsolutePosition.X
                    local relativeY = mouseY - SatValPicker.AbsolutePosition.Y
                    currentSaturation = math.max(0, math.min(1, relativeX / SatValPicker.AbsoluteSize.X))
                    currentValue = 1 - math.max(0, math.min(1, relativeY / SatValPicker.AbsoluteSize.Y)) -- V değeri Y ekseni tersine
                    TweenService:Create(SatValButton, ANIMATIONS.SLIDER_SMOOTH, {
                        Position = UDim2.new(currentSaturation, 0, 1 - currentValue, 0)
                    }):Play()
                    updateColor()
                end

                HueSliderBtn.MouseButton1Down:Connect(function()
                    isDraggingHue = true
                    UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
                end)

                HueSlider.MouseButton1Down:Connect(function(input)
                    isDraggingHue = true
                    UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
                    updateHueSlider(input)
                end)

                SatValButton.MouseButton1Down:Connect(function()
                    isDraggingSatVal = true
                    UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
                end)

                SatValPicker.MouseButton1Down:Connect(function(input)
                    isDraggingSatVal = true
                    UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
                    updateSatVal(input)
                end)

                UIS.InputChanged:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement then
                        if isDraggingHue then
                            updateHueSlider(input)
                        elseif isDraggingSatVal then
                            updateSatVal(input)
                        end
                    end
                end)

                UIS.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isDraggingHue = false
                        isDraggingSatVal = false
                        UIS.MouseBehavior = Enum.MouseBehavior.Default
                    end
                end)

                -- Initialize display and picker positions
                updateSatValPickerColor()
                updateColor()

            end

            return SectionFunctions
        end

        return TabFunctions
    end

    return WindowFunctions
end

return Library
