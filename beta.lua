--!strict
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Library = {}

-- Easing styles for animations
local UI_EASING_STYLE = Enum.EasingStyle.Quart
local UI_EASING_DIRECTION = Enum.EasingDirection.Out
local UI_TWEEN_TIME = 0.25

-- Helper function to create a UICorner
local function createUICorner(parent: GuiObject, radiusScale: number, radiusOffset: number)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(radiusScale, radiusOffset)
    corner.Parent = parent
    return corner
end

-- Helper function to create a TextLabel
local function createTextLabel(parent: GuiObject, name: string, position: UDim2, size: UDim2, font: Enum.Font, text: string, textColor: Color3, textSize: number, textXAlignment: Enum.TextXAlignment, backgroundTransparency: number?)
    local label = Instance.new("TextLabel")
    label.Name = name
    label.Parent = parent
    label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    label.BackgroundTransparency = backgroundTransparency or 1.000
    label.BorderColor3 = Color3.fromRGB(0, 0, 0)
    label.BorderSizePixel = 0
    label.Position = position
    label.Size = size
    label.Font = font
    label.Text = text
    label.TextColor3 = textColor
    label.TextSize = textSize
    label.TextXAlignment = textXAlignment
    return label
end

-- Helper function to create an ImageLabel
local function createImageLabel(parent: GuiObject, name: string, position: UDim2, size: UDim2, image: string, imageColor: Color3?, backgroundTransparency: number?)
    local imgLabel = Instance.new("ImageLabel")
    imgLabel.Name = name
    imgLabel.Parent = parent
    imgLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    imgLabel.BackgroundTransparency = backgroundTransparency or 1.000
    imgLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    imgLabel.BorderSizePixel = 0
    imgLabel.Position = position
    imgLabel.Size = size
    imgLabel.Image = image
    if imageColor then
        imgLabel.ImageColor3 = imageColor
    end
    return imgLabel
end

---
## Window Creation
---
function Library:Window(name: string)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Menu = Instance.new("Frame")
    Menu.Name = "Menu"
    Menu.Parent = ScreenGui
    Menu.AnchorPoint = Vector2.new(0.5, 0.5)
    Menu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Menu.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Menu.BorderSizePixel = 0
    Menu.Position = UDim2.new(0.5, 0, 0.5, 0)
    Menu.Size = UDim2.new(0, 580, 0, 390)
    createUICorner(Menu, 0.05, 0)

    -- Initial state for UI coming animation
    Menu.Size = UDim2.new(0, 0, 0, 0)
    Menu.BackgroundTransparency = 1
    Menu.Position = UDim2.new(0.5, 0, 0.5, 0)

    local Topbar = Instance.new("Folder")
    Topbar.Name = "Topbar"
    Topbar.Parent = Menu

    local Close = Instance.new("TextButton")
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
    createUICorner(Close, 0.0199999996, 8)

    createImageLabel(Close, "ImageLabel", UDim2.new(0.0619053431, 0, 0.275676012, 0), UDim2.new(0, 22, 0, 22), "rbxassetid://10747384394")

    createTextLabel(Topbar, "Title", UDim2.new(0.0913793072, 0, 0, 0), UDim2.new(0, 266, 0, 38), Enum.Font.GothamBold, name, Color3.fromRGB(230, 230, 230), 12.000, Enum.TextXAlignment.Left)
    createTextLabel(Topbar, "Description", UDim2.new(0.0913793072, 0, 0.0307692308, 0), UDim2.new(0, 266, 0, 38), Enum.Font.GothamBold, "premium ui library", Color3.fromRGB(176, 176, 176), 12.000, Enum.TextXAlignment.Left)
    createImageLabel(Topbar, "Image", UDim2.new(0.0327586196, 0, 0.0307692308, 0), UDim2.new(0, 25, 0, 26), "rbxassetid://6523858394")

    local Tabs = Instance.new("Frame")
    Tabs.Name = "Tabs"
    Tabs.Parent = Menu
    Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tabs.BackgroundTransparency = 1.000
    Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tabs.BorderSizePixel = 0
    Tabs.Position = UDim2.new(0, 0, 0.128204897, 0)
    Tabs.Size = UDim2.new(0, 127, 0, 339)

    local TabsListLayout = Instance.new("UIListLayout")
    TabsListLayout.Parent = Tabs
    TabsListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local Elements = Instance.new("ScrollingFrame") -- Changed to ScrollingFrame for content
    Elements.Name = "Elements"
    Elements.Parent = Menu
    Elements.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
    Elements.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Elements.BorderSizePixel = 0
    Elements.Position = UDim2.new(0.219580084, 0, 0.128204897, 0)
    Elements.Size = UDim2.new(0, 452, 0, 337)
    Elements.CanvasSize = UDim2.new(0, 0, 0, 0) -- Will be adjusted dynamically
    Elements.ScrollBarThickness = 6
    Elements.VerticalScrollBarInset = Enum.ScrollBarInset.Always
    createUICorner(Elements, 0.05, 0)

    local ElementsListLayout = Instance.new("UIListLayout")
    ElementsListLayout.Parent = Elements
    ElementsListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ElementsListLayout.Padding = UDim.new(0, 7)
    ElementsListLayout.FillDirection = Enum.FillDirection.Vertical
    ElementsListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local ElementsPadding = Instance.new("UIPadding")
    ElementsPadding.Parent = Elements
    ElementsPadding.PaddingBottom = UDim.new(0, 10)
    ElementsPadding.PaddingLeft = UDim.new(0, 15)
    ElementsPadding.PaddingRight = UDim.new(0, 15)
    ElementsPadding.PaddingTop = UDim.new(0, 10)

    local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
    UIAspectRatioConstraint.AspectRatio = 1.487
    UIAspectRatioConstraint.Parent = Menu

    -- UI Coming Animation
    TweenService:Create(Menu, TweenInfo.new(0.5, UI_EASING_STYLE, UI_EASING_DIRECTION), {
        Size = UDim2.new(0, 580, 0, 390),
        BackgroundTransparency = 0,
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()

    -- Draggable UI
    local dragging = false
    local dragInput: InputObject | nil = nil
    local dragStart: Vector2 | nil = nil
    local startPos: UDim2 | nil = nil

    local function updateInput(input: InputObject)
        if dragStart and startPos then
            local delta = input.Position - dragStart
            local newPosition = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            TweenService:Create(Menu, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Position = newPosition}):Play()
        end
    end

    Topbar.InputBegan:Connect(function(input: InputObject)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if UserInputService:GetFocusedTextBox() == nil then
                dragging = true
                dragStart = input.Position
                startPos = Menu.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end
    end)

    UserInputService.InputChanged:Connect(function(input: InputObject)
        if input == dragInput and dragging and Menu.Parent then
            updateInput(input)
        end
    end)

    UserInputService.InputEnded:Connect(function(input: InputObject)
        if input == dragInput then
            dragging = false
        end
    end)

    Topbar.InputChanged:Connect(function(input: InputObject)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    Close.MouseButton1Click:Connect(function()
        TweenService:Create(Menu, TweenInfo.new(0.3, UI_EASING_STYLE, UI_EASING_DIRECTION), {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        task.wait(0.3)
        ScreenGui:Destroy()
    end)

    local currentTabContent: Frame? = nil

    local Window = {
        Menu = Menu,
        Elements = Elements,
        Tabs = Tabs,
        CurrentTab = nil
    }

    ---
    ### Tab Creation
    ---
    function Window:Tab(tabName: string, iconAssetId: string)
        local TabButton = Instance.new("Frame")
        TabButton.Name = tabName
        TabButton.Parent = Tabs
        TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.BackgroundTransparency = 1.000
        TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TabButton.BorderSizePixel = 0
        TabButton.Size = UDim2.new(0, 127, 0, 48)
        TabButton.LayoutOrder = #Tabs:GetChildren()

        createImageLabel(TabButton, "ImageLabel", UDim2.new(0.144427419, 0, 0.221702576, 0), UDim2.new(0, 25, 0, 25), iconAssetId)
        local tabText = createTextLabel(TabButton, "TextLabel", UDim2.new(0.413412273, 0, 0.0416666679, 0), UDim2.new(0, 82, 0, 44), Enum.Font.GothamBold, tabName, Color3.fromRGB(150, 150, 150), 14.000, Enum.TextXAlignment.Left)

        local TabContent = Instance.new("Frame")
        TabContent.Name = tabName .. "Content"
        TabContent.Parent = Elements
        TabContent.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
        TabContent.BackgroundTransparency = 1.000
        TabContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TabContent.BorderSizePixel = 0
        TabContent.Size = UDim2.new(1, 0, 1, 0) -- Occupy full Elements space
        TabContent.Visible = false -- Hidden by default
        TabContent.LayoutOrder = TabButton.LayoutOrder

        local TabContentListLayout = Instance.new("UIListLayout")
        TabContentListLayout.Parent = TabContent
        TabContentListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        TabContentListLayout.Padding = UDim.new(0, 7)
        TabContentListLayout.FillDirection = Enum.FillDirection.Vertical
        TabContentListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

        local TabContentPadding = Instance.new("UIPadding")
        TabContentPadding.Parent = TabContent
        TabContentPadding.PaddingBottom = UDim.new(0, 10)
        TabContentPadding.PaddingLeft = UDim.new(0, 0) -- Padding applied to main Elements ScrollingFrame
        TabContentPadding.PaddingRight = UDim.new(0, 0)
        TabContentPadding.PaddingTop = UDim.new(0, 10)


        TabButton.MouseButton1Click:Connect(function()
            if currentTabContent == TabContent then return end -- Don't animate if already on this tab

            -- Reset all tab text colors
            for _, tab in Tabs:GetChildren() do
                if tab:IsA("Frame") and tab.Name ~= "TabContent" then
                    local textLabel = tab:FindFirstChild("TextLabel")
                    local imageLabel = tab:FindFirstChild("ImageLabel")
                    if textLabel then
                        textLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
                    end
                    if imageLabel then
                        imageLabel.ImageColor3 = Color3.fromRGB(150, 150, 150)
                    end
                end
            end

            -- Set active tab text color
            tabText.TextColor3 = Color3.fromRGB(230, 230, 230)
            local imageLabel = TabButton:FindFirstChild("ImageLabel")
            if imageLabel then
                imageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
            end

            -- Tab change animation
            TweenService:Create(Elements, TweenInfo.new(UI_TWEEN_TIME, UI_EASING_STYLE, UI_EASING_DIRECTION), {
                BackgroundTransparency = 1
            }):Play()

            task.wait(UI_TWEEN_TIME)

            if currentTabContent then
                currentTabContent.Visible = false
            end
            TabContent.Visible = true
            currentTabContent = TabContent

            -- Update CanvasSize after changing content to ensure scrolling works correctly
            Elements.CanvasSize = UDim2.new(0, 0, 0, TabContentListLayout.AbsoluteContentSize.Y)

            TweenService:Create(Elements, TweenInfo.new(UI_TWEEN_TIME, UI_EASING_STYLE, UI_EASING_DIRECTION), {
                BackgroundTransparency = 0
            }):Play()
        end)

        if not Window.CurrentTab then -- Set the first tab as active by default
            Window.CurrentTab = TabContent
            TabContent.Visible = true
            tabText.TextColor3 = Color3.fromRGB(230, 230, 230)
            local imageLabel = TabButton:FindFirstChild("ImageLabel")
            if imageLabel then
                imageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
            end
            currentTabContent = TabContent
            -- Set initial CanvasSize for the first tab
            Elements.CanvasSize = UDim2.new(0, 0, 0, TabContentListLayout.AbsoluteContentSize.Y)
        end
        
        return {
            Container = TabContent,
            ---
            #### Section Creation
            ---
            Section = function(sectionTitle: string)
                local SectionFrame = Instance.new("Frame")
                SectionFrame.Name = "Section"
                SectionFrame.Parent = TabContent
                SectionFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                SectionFrame.BackgroundTransparency = 1 -- Transparent, only for organization
                SectionFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SectionFrame.BorderSizePixel = 0
                SectionFrame.Size = UDim2.new(1, 0, 0, 25) -- Adjust height as needed, will grow with content
                SectionFrame.AutomaticSize = Enum.AutomaticSize.Y
                
                createTextLabel(SectionFrame, "Title", UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), Enum.Font.GothamBold, sectionTitle, Color3.fromRGB(230, 230, 230), 14.000, Enum.TextXAlignment.Left)

                return {
                    Container = SectionFrame,
                    ---
                    #### Toggle Element
                    ---
                    Toggle = function(title: string, description: string, callback: (value: boolean) -> ())
                        local ToggleFrame = Instance.new("Frame")
                        ToggleFrame.Name = "Toggle"
                        ToggleFrame.Parent = TabContent
                        ToggleFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                        ToggleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        ToggleFrame.BorderSizePixel = 0
                        ToggleFrame.Size = UDim2.new(1, 0, 0, 53)
                        createUICorner(ToggleFrame, 0.2, 0)

                        createTextLabel(ToggleFrame, "Title", UDim2.new(0.0487804599, 0, 0.0570333228, 0), UDim2.new(0, 200, 0, 30), Enum.Font.GothamBold, title, Color3.fromRGB(230, 230, 230), 14.000, Enum.TextXAlignment.Left)
                        createTextLabel(ToggleFrame, "Description", UDim2.new(0.0463995077, 0, 0.301886797, 0), UDim2.new(0, 200, 0, 30), Enum.Font.GothamBold, description, Color3.fromRGB(153, 153, 153), 14.000, Enum.TextXAlignment.Left)

                        local ToggleSwitch = Instance.new("Frame")
                        ToggleSwitch.Name = "ToggleSwitch"
                        ToggleSwitch.Parent = ToggleFrame
                        ToggleSwitch.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                        ToggleSwitch.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        ToggleSwitch.BorderSizePixel = 0
                        ToggleSwitch.Position = UDim2.new(0.842343211, 0, 0.318181813, 0)
                        ToggleSwitch.Size = UDim2.new(0, 42, 0, 15)
                        createUICorner(ToggleSwitch, 0.4, 0)

                        local ToggleButton = Instance.new("Frame")
                        ToggleButton.Name = "ToggleButton"
                        ToggleButton.Parent = ToggleSwitch
                        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ToggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        ToggleButton.BorderSizePixel = 0
                        ToggleButton.Position = UDim2.new(-0.00775024435, 0, -0.0666666701, 0) -- Initial Left position
                        ToggleButton.Size = UDim2.new(0, 18, 0, 18)
                        createUICorner(ToggleButton, 1, 0)

                        local isOn = false
                        local toggleTweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                        local buttonLeftPos = UDim2.new(-0.00775024435, 0, -0.0666666701, 0)
                        local buttonRightPos = UDim2.new(1, -ToggleButton.Size.X.Offset + (ToggleButton.Size.X.Offset * 0.1), -0.0666666701, 0) -- Adjusted right position

                        ToggleSwitch.MouseButton1Click:Connect(function()
                            isOn = not isOn
                            if isOn then
                                TweenService:Create(ToggleButton, toggleTweenInfo, {Position = buttonRightPos, BackgroundColor3 = Color3.fromRGB(70, 130, 180)}):Play()
                                TweenService:Create(ToggleSwitch, toggleTweenInfo, {BackgroundColor3 = Color3.fromRGB(70, 130, 180)}):Play()
                            else
                                TweenService:Create(ToggleButton, toggleTweenInfo, {Position = buttonLeftPos, BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                                TweenService:Create(ToggleSwitch, toggleTweenInfo, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
                            end
                            callback(isOn)
                        end)
                    end,

                    ---
                    #### Input Field
                    ---
                    Input = function(title: string, description: string, placeholder: string, callback: (text: string) -> ())
                        local InputFrame = Instance.new("Frame")
                        InputFrame.Name = "Input"
                        InputFrame.Parent = TabContent
                        InputFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                        InputFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        InputFrame.BorderSizePixel = 0
                        InputFrame.Size = UDim2.new(1, 0, 0, 53)
                        createUICorner(InputFrame, 0.2, 0)

                        createTextLabel(InputFrame, "Title", UDim2.new(0.048780486, 0, 0.0566037744, 0), UDim2.new(0, 200, 0, 30), Enum.Font.GothamBold, title, Color3.fromRGB(230, 230, 230), 14.000, Enum.TextXAlignment.Left)
                        createTextLabel(InputFrame, "Description", UDim2.new(0.048780486, 0, 0.320754707, 0), UDim2.new(0, 200, 0, 30), Enum.Font.GothamBold, description, Color3.fromRGB(153, 153, 153), 14.000, Enum.TextXAlignment.Left)

                        local InputTextBox = Instance.new("TextBox")
                        InputTextBox.Parent = InputFrame
                        InputTextBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
                        InputTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        InputTextBox.BorderSizePixel = 0
                        InputTextBox.Position = UDim2.new(0.673159838, 0, 0.169811323, 0)
                        InputTextBox.Size = UDim2.new(0, 122, 0, 34)
                        InputTextBox.Font = Enum.Font.GothamBold
                        InputTextBox.PlaceholderText = placeholder
                        InputTextBox.Text = ""
                        InputTextBox.TextColor3 = Color3.fromRGB(230, 230, 230)
                        InputTextBox.TextSize = 14.000
                        InputTextBox.ClearTextOnFocus = false
                        createUICorner(InputTextBox, 0.2, 0)

                        InputTextBox.FocusLost:Connect(function(enterPressed)
                            if enterPressed then
                                callback(InputTextBox.Text)
                            end
                        end)

                        InputTextBox.TextService:Connect(function(text)
                            callback(text)
                        end)
                    end,

                    ---
                    #### Slider Element
                    ---
                    Slider = function(title: string, minValue: number, maxValue: number, initialValue: number, callback: (value: number) -> ())
                        local SliderFrame = Instance.new("Frame")
                        SliderFrame.Name = "Slider"
                        SliderFrame.Parent = TabContent
                        SliderFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                        SliderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        SliderFrame.BorderSizePixel = 0
                        SliderFrame.Size = UDim2.new(1, 0, 0, 44)
                        createUICorner(SliderFrame, 0.2, 0)

                        local SliderTitle = createTextLabel(SliderFrame, "Title", UDim2.new(0.0487804599, 0, 0.170240223, 0), UDim2.new(0, 200, 0, 30), Enum.Font.GothamBold, title, Color3.fromRGB(230, 230, 230), 14.000, Enum.TextXAlignment.Left)

                        local SliderBar = Instance.new("Frame")
                        SliderBar.Name = "SliderBar"
                        SliderBar.Parent = SliderFrame
                        SliderBar.AnchorPoint = Vector2.new(0.5, 0.5)
                        SliderBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                        SliderBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        SliderBar.BorderSizePixel = 0
                        SliderBar.Position = UDim2.new(0.584289372, 0, 0.5, 0)
                        SliderBar.Size = UDim2.new(0, 177, 0, 15)
                        createUICorner(SliderBar, 0.4, 0)

                        local SliderFill = Instance.new("Frame")
                        SliderFill.Name = "SliderFill"
                        SliderFill.Parent = SliderBar
                        SliderFill.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
                        SliderFill.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        SliderFill.BorderSizePixel = 0
                        SliderFill.Position = UDim2.new(0, 0, 0, 0)
                        SliderFill.Size = UDim2.new(0, 0, 0, 15) -- Initial width
                        createUICorner(SliderFill, 0.4, 0)

                        local SliderHandle = Instance.new("Frame")
                        SliderHandle.Name = "SliderHandle"
                        SliderHandle.Parent = SliderBar
                        SliderHandle.AnchorPoint = Vector2.new(0.5, 0.5)
                        SliderHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        SliderHandle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        SliderHandle.BorderSizePixel = 0
                        SliderHandle.Position = UDim2.new(0, 0, 0.5, 0) -- Initial position
                        SliderHandle.Size = UDim2.new(0, 18, 0, 18)
                        createUICorner(SliderHandle, 1, 0)

                        local ValueTextBox = Instance.new("TextBox")
                        ValueTextBox.Parent = SliderFrame
                        ValueTextBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
                        ValueTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        ValueTextBox.BorderSizePixel = 0
                        ValueTextBox.Position = UDim2.new(0.852177501, 0, 0.120497271, 0)
                        ValueTextBox.Size = UDim2.new(0, 49, 0, 34)
                        ValueTextBox.Font = Enum.Font.GothamBold
                        ValueTextBox.PlaceholderText = tostring(initialValue)
                        ValueTextBox.Text = tostring(initialValue)
                        ValueTextBox.TextColor3 = Color3.fromRGB(230, 230, 230)
                        ValueTextBox.TextSize = 14.000
                        ValueTextBox.ClearTextOnFocus = false
                        createUICorner(ValueTextBox, 0.2, 0)

                        local isDraggingSlider = false
                        local function updateSlider(inputX: number)
                            local relativeX = inputX - SliderBar.AbsolutePosition.X
                            local percentage = math.clamp(relativeX / SliderBar.AbsoluteSize.X, 0, 1)
                            local value = minValue + (maxValue - minValue) * percentage
                            value = math.round(value) -- Round to nearest integer for simplicity

                            SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
                            SliderHandle.Position = UDim2.new(percentage, 0, 0.5, 0)
                            ValueTextBox.Text = tostring(value)
                            callback(value)
                        end

                        SliderBar.InputBegan:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                isDraggingSlider = true
                                updateSlider(input.Position.X)
                            end
                        end)

                        SliderBar.InputEnded:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                isDraggingSlider = false
                            end
                        end)

                        UserInputService.InputChanged:Connect(function(input)
                            if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and isDraggingSlider then
                                updateSlider(input.Position.X)
                            end
                        end)

                        ValueTextBox.FocusLost:Connect(function(enterPressed)
                            if enterPressed then
                                local value = tonumber(ValueTextBox.Text)
                                if value and value >= minValue and value <= maxValue then
                                    local percentage = (value - minValue) / (maxValue - minValue)
                                    TweenService:Create(SliderFill, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Size = UDim2.new(percentage, 0, 1, 0)}):Play()
                                    TweenService:Create(SliderHandle, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Position = UDim2.new(percentage, 0, 0.5, 0)}):Play()
                                    callback(value)
                                else
                                    ValueTextBox.Text = tostring(initialValue) -- Revert if invalid
                                end
                            end
                        end)

                        -- Set initial slider state
                        local initialPercentage = (initialValue - minValue) / (maxValue - minValue)
                        SliderFill.Size = UDim2.new(initialPercentage, 0, 1, 0)
                        SliderHandle.Position = UDim2.new(initialPercentage, 0, 0.5, 0)
                        ValueTextBox.Text = tostring(initialValue)
                    end,

                    ---
                    #### Button Element
                    ---
                    Button = function(title: string, description: string, callback: () -> ())
                        local ButtonFrame = Instance.new("Frame")
                        ButtonFrame.Name = "Button"
                        ButtonFrame.Parent = TabContent
                        ButtonFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                        ButtonFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        ButtonFrame.BorderSizePixel = 0
                        ButtonFrame.Size = UDim2.new(1, 0, 0, 53)
                        createUICorner(ButtonFrame, 0.2, 0)

                        createTextLabel(ButtonFrame, "Title", UDim2.new(0.048780486, 0, 0.0566037744, 0), UDim2.new(0, 200, 0, 30), Enum.Font.GothamBold, title, Color3.fromRGB(230, 230, 230), 14.000, Enum.TextXAlignment.Left)
                        createTextLabel(ButtonFrame, "Description", UDim2.new(0.048780486, 0, 0.320754707, 0), UDim2.new(0, 200, 0, 30), Enum.Font.GothamBold, description, Color3.fromRGB(153, 153, 153), 14.000, Enum.TextXAlignment.Left)

                        local InteractButton = Instance.new("TextButton")
                        InteractButton.Name = "Interact"
                        InteractButton.Parent = ButtonFrame
                        InteractButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180) -- Blue color for interaction
                        InteractButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        InteractButton.BorderSizePixel = 0
                        InteractButton.Position = UDim2.new(0.88, 0, 0.25, 0) -- Adjusted position
                        InteractButton.Size = UDim2.new(0, 40, 0, 28)
                        InteractButton.Font = Enum.Font.SourceSans
                        InteractButton.Text = "Go" -- Changed to "Go" for a more active feel
                        InteractButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                        InteractButton.TextSize = 14.000
                        createUICorner(InteractButton, 0.2, 0)

                        InteractButton.MouseButton1Click:Connect(function()
                            callback()
                            TweenService:Create(InteractButton, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                                BackgroundColor3 = Color3.fromRGB(50, 90, 120),
                                Size = UDim2.new(0, 38, 0, 26),
                                Position = UDim2.new(0.88 + (2/420), 0, 0.25 + (2/53), 0)
                            }):Play()
                            task.wait(0.1)
                            TweenService:Create(InteractButton, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                                BackgroundColor3 = Color3.fromRGB(70, 130, 180),
                                Size = UDim2.new(0, 40, 0, 28),
                                Position = UDim2.new(0.88, 0, 0.25, 0)
                            }):Play()
                        end)
                    end,

                    ---
                    #### Color Picker Element
                    ---
                    ColorPicker = function(title: string, description: string, initialColor: Color3, callback: (color: Color3) -> ())
                        local ColorPickerFrame = Instance.new("Frame")
                        ColorPickerFrame.Name = "ColorPicker"
                        ColorPickerFrame.Parent = TabContent
                        ColorPickerFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                        ColorPickerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        ColorPickerFrame.BorderSizePixel = 0
                        ColorPickerFrame.Size = UDim2.new(1, 0, 0, 170) -- Increased height for picker
                        createUICorner(ColorPickerFrame, 0.2, 0)

                        createTextLabel(ColorPickerFrame, "Title", UDim2.new(0.048780486, 0, 0.03, 0), UDim2.new(0, 200, 0, 30), Enum.Font.GothamBold, title, Color3.fromRGB(230, 230, 230), 14.000, Enum.TextXAlignment.Left)
                        createTextLabel(ColorPickerFrame, "Description", UDim2.new(0.048780486, 0, 0.15, 0), UDim2.new(0, 200, 0, 30), Enum.Font.GothamBold, description, Color3.fromRGB(153, 153, 153), 14.000, Enum.TextXAlignment.Left)

                        local ColorDisplay = Instance.new("Frame")
                        ColorDisplay.Name = "ColorDisplay"
                        ColorDisplay.Parent = ColorPickerFrame
                        ColorDisplay.BackgroundColor3 = initialColor
                        ColorDisplay.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        ColorDisplay.BorderSizePixel = 0
                        ColorDisplay.Position = UDim2.new(0.85, 0, 0.08, 0)
                        ColorDisplay.Size = UDim2.new(0, 40, 0, 20)
                        createUICorner(ColorDisplay, 0.2, 0)

                        local HueSliderBar = Instance.new("Frame")
                        HueSliderBar.Name = "HueSliderBar"
                        HueSliderBar.Parent = ColorPickerFrame
                        HueSliderBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                        HueSliderBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        HueSliderBar.BorderSizePixel = 0
                        HueSliderBar.Position = UDim2.new(0.05, 0, 0.35, 0)
                        HueSliderBar.Size = UDim2.new(0.9, 0, 0, 15)
                        createUICorner(HueSliderBar, 0.4, 0)

                        -- Gradient for Hue Slider
                        local UIGradientHue = Instance.new("UIGradient")
                        UIGradientHue.Color = ColorSequence.new{
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                            ColorSequenceKeypoint.new(0.16, Color3.fromRGB(255, 255, 0)),
                            ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
                            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
                            ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
                            ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
                            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
                        }
                        UIGradientHue.Parent = HueSliderBar

                        local HueHandle = Instance.new("Frame")
                        HueHandle.Name = "HueHandle"
                        HueHandle.Parent = HueSliderBar
                        HueHandle.AnchorPoint = Vector2.new(0.5, 0.5)
                        HueHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        HueHandle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        HueHandle.BorderSizePixel = 0
                        HueHandle.Position = UDim2.new(0, 0, 0.5, 0)
                        HueHandle.Size = UDim2.new(0, 18, 0, 18)
                        createUICorner(HueHandle, 1, 0)

                        local SatValPicker = Instance.new("Frame")
                        SatValPicker.Name = "SatValPicker"
                        SatValPicker.Parent = ColorPickerFrame
                        SatValPicker.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Initial black
                        SatValPicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        SatValPicker.BorderSizePixel = 0
                        SatValPicker.Position = UDim2.new(0.05, 0, 0.5, 0)
                        SatValPicker.Size = UDim2.new(0.9, 0, 0, 80) -- Wider for better interaction
                        createUICorner(SatValPicker, 0.1, 0)

                        local SatGradient = Instance.new("UIGradient")
                        SatGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(128, 128, 128)) -- White to grey (for saturation)
                        SatGradient.Rotation = 90 -- Horizontal gradient
                        SatGradient.Parent = SatValPicker

                        local ValGradient = Instance.new("UIGradient")
                        ValGradient.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.new(0, 0, 0)) -- Black to transparent (for value)
                        ValGradient.Transparency = NumberSequence.new(0, 1)
                        ValGradient.Parent = SatValPicker

                        local SatValHandle = Instance.new("Frame")
                        SatValHandle.Name = "SatValHandle"
                        SatValHandle.Parent = SatValPicker
                        SatValHandle.AnchorPoint = Vector2.new(0.5, 0.5)
                        SatValHandle.BackgroundColor3 = Color3.new(1, 1, 1)
                        SatValHandle.BorderColor3 = Color3.fromRGB(255, 255, 255)
                        SatValHandle.BorderSizePixel = 1
                        SatValHandle.Position = UDim2.new(0, 0, 1, 0) -- Initial bottom-left for max saturation, min value
                        SatValHandle.Size = UDim2.new(0, 12, 0, 12)
                        createUICorner(SatValHandle, 1, 0)

                        local currentHue = 0
                        local currentSaturation = 1
                        local currentBrightness = 1

                        local function HSVtoRGB(h: number, s: number, v: number): Color3
                            local r, g, b = 0, 0, 0
                            local i = math.floor(h * 6)
                            local f = h * 6 - i
                            local p = v * (1 - s)
                            local q = v * (1 - f * s)
                            local t = v * (1 - (1 - f) * s)
                            if i == 0 then r, g, b = v, t, p
                            elseif i == 1 then r, g, b = q, v, p
                            elseif i == 2 then r, g, b = p, v, t
                            elseif i == 3 then r, g, b = p, q, v
                            elseif i == 4 then r, g, b = t, p, v
                            else r, g, b = v, p, q end
                            return Color3.new(r, g, b)
                        end

                        local function updateColor()
                            local baseColor = HSVtoRGB(currentHue, 1, 1) -- Pure hue for SatValPicker background
                            SatValPicker.BackgroundColor3 = baseColor
                            
                            local finalColor = HSVtoRGB(currentHue, currentSaturation, currentBrightness)
                            ColorDisplay.BackgroundColor3 = finalColor
                            callback(finalColor)
                        end

                        local isDraggingHue = false
                        HueSliderBar.InputBegan:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                isDraggingHue = true
                            end
                        end)
                        HueSliderBar.InputEnded:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                isDraggingHue = false
                            end
                        end)
                        UserInputService.InputChanged:Connect(function(input)
                            if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and isDraggingHue then
                                local relativeX = math.clamp((input.Position.X - HueSliderBar.AbsolutePosition.X) / HueSliderBar.AbsoluteSize.X, 0, 1)
                                currentHue = relativeX
                                TweenService:Create(HueHandle, TweenInfo.new(0.05, Enum.EasingStyle.Linear), {Position = UDim2.new(relativeX, 0, 0.5, 0)}):Play()
                                updateColor()
                            end
                        end)

                        local isDraggingSatVal = false
                        SatValPicker.InputBegan:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                isDraggingSatVal = true
                            end
                        end)
                        SatValPicker.InputEnded:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                isDraggingSatVal = false
                            end
                        end)
                        UserInputService.InputChanged:Connect(function(input)
                            if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and isDraggingSatVal then
                                local relativeX = math.clamp((input.Position.X - SatValPicker.AbsolutePosition.X) / SatValPicker.AbsoluteSize.X, 0, 1)
                                local relativeY = math.clamp((input.Position.Y - SatValPicker.AbsolutePosition.Y) / SatValPicker.AbsoluteSize.Y, 0, 1)
                                
                                currentSaturation = relativeX
                                currentBrightness = 1 - relativeY -- Invert Y for brightness

                                TweenService:Create(SatValHandle, TweenInfo.new(0.05, Enum.EasingStyle.Linear), {Position = UDim2.new(relativeX, 0, relativeY, 0)}):Play()
                                updateColor()
                            end
                        end)

                        -- Set initial color
                        local r, g, b = initialColor.R, initialColor.G, initialColor.B
                        local M = math.max(r, g, b)
                        local m = math.min(r, g, b)
                        local C = M - m

                        currentBrightness = M
                        currentSaturation = (C == 0) and 0 or (C / M)

                        if C == 0 then currentHue = 0
                        elseif M == r then currentHue = (g - b) / C / 6 + ((g < b) and 1 or 0)
                        elseif M == g then currentHue = (b - r) / C / 6 + 1/3
                        else currentHue = (r - g) / C / 6 + 2/3 end

                        HueHandle.Position = UDim2.new(currentHue, 0, 0.5, 0)
                        SatValHandle.Position = UDim2.new(currentSaturation, 0, 1 - currentBrightness, 0)
                        updateColor()
                    end
                }
            end
        }
    end

    -- Update Elements CanvasSize whenever children change or layout is updated
    Elements.ChildAdded:Connect(function()
        task.defer(function()
            Elements.CanvasSize = UDim2.new(0, 0, 0, ElementsListLayout.AbsoluteContentSize.Y + ElementsPadding.PaddingTop.Offset + ElementsPadding.PaddingBottom.Offset)
        end)
    end)
    Elements.ChildRemoved:Connect(function()
        task.defer(function()
            Elements.CanvasSize = UDim2.new(0, 0, 0, ElementsListLayout.AbsoluteContentSize.Y + ElementsPadding.PaddingTop.Offset + ElementsPadding.PaddingBottom.Offset)
        end)
    end)
    ElementsListLayout.PropertyChanged:Connect(function(prop)
        if prop == "AbsoluteContentSize" then
             task.defer(function()
                Elements.CanvasSize = UDim2.new(0, 0, 0, ElementsListLayout.AbsoluteContentSize.Y + ElementsPadding.PaddingTop.Offset + ElementsPadding.PaddingBottom.Offset)
            end)
        end
    end)

    return Window
end

return Library
