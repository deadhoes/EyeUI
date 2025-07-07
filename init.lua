local Eye = {}

-- Configuration System
do
    local ConfigService = {}
    
    function ConfigService:SaveConfig(configName, data)
        local success, result = pcall(function()
            return game:GetService("HttpService"):JSONEncode(data)
        end)
        
        if success then
            writefile("Eye_" .. configName .. ".json", result)
            Eye.Notify("success", "Config Saved", "Configuration saved successfully", 3)
        else
            Eye.Notify("error", "Save Failed", "Failed to save configuration", 3)
        end
    end
    
    function ConfigService:LoadConfig(configName)
        local success, result = pcall(function()
            if isfile("Eye_" .. configName .. ".json") then
                local data = readfile("Eye_" .. configName .. ".json")
                return game:GetService("HttpService"):JSONDecode(data)
            end
            return {}
        end)
        
        if success then
            Eye.Notify("success", "Config Loaded", "Configuration loaded successfully", 3)
            return result
        else
            Eye.Notify("error", "Load Failed", "Failed to load configuration", 3)
            return {}
        end
    end
    
    function ConfigService:GetConfigs()
        local configs = {}
        local success, result = pcall(function()
            return listfiles("Eye_*.json")
        end)
        
        if success then
            for _, file in pairs(result) do
                local name = file:match("Eye_(.+)%.json")
                if name then
                    table.insert(configs, name)
                end
            end
        end
        
        return configs
    end
    
    Eye.ConfigService = ConfigService
end

-- Keybind System
do
    local KeybindService = {}
    local keybinds = {}
    local UserInputService = game:GetService("UserInputService")
    
    function KeybindService:CreateKeybind(name, key, callback)
        local keybind = {
            Name = name,
            Key = key,
            Callback = callback,
            Enabled = true
        }
        
        keybinds[name] = keybind
        
        local function onKeyPress(input)
            if input.KeyCode == key and keybind.Enabled then
                callback()
            end
        end
        
        keybind.Connection = UserInputService.InputBegan:Connect(onKeyPress)
        
        return keybind
    end
    
    function KeybindService:RemoveKeybind(name)
        if keybinds[name] then
            keybinds[name].Connection:Disconnect()
            keybinds[name] = nil
        end
    end
    
    function KeybindService:ToggleKeybind(name, enabled)
        if keybinds[name] then
            keybinds[name].Enabled = enabled
        end
    end
    
    function KeybindService:GetKeybinds()
        return keybinds
    end
    
    Eye.KeybindService = KeybindService
end

-- Theme System
do
    local ThemeService = {}
    
    local themes = {
        Dark = {
            Background = Color3.fromRGB(20, 20, 20),
            Secondary = Color3.fromRGB(26, 26, 26),
            Primary = Color3.fromRGB(70, 130, 180),
            Text = Color3.fromRGB(230, 230, 230),
            TextSecondary = Color3.fromRGB(153, 153, 153),
            Accent = Color3.fromRGB(176, 176, 176)
        },
        Light = {
            Background = Color3.fromRGB(240, 240, 240),
            Secondary = Color3.fromRGB(255, 255, 255),
            Primary = Color3.fromRGB(70, 130, 180),
            Text = Color3.fromRGB(30, 30, 30),
            TextSecondary = Color3.fromRGB(100, 100, 100),
            Accent = Color3.fromRGB(80, 80, 80)
        },
        Blue = {
            Background = Color3.fromRGB(15, 25, 35),
            Secondary = Color3.fromRGB(20, 30, 45),
            Primary = Color3.fromRGB(100, 150, 255),
            Text = Color3.fromRGB(230, 240, 255),
            TextSecondary = Color3.fromRGB(150, 170, 200),
            Accent = Color3.fromRGB(180, 190, 220)
        },
        Purple = {
            Background = Color3.fromRGB(25, 15, 35),
            Secondary = Color3.fromRGB(35, 20, 45),
            Primary = Color3.fromRGB(150, 100, 255),
            Text = Color3.fromRGB(240, 230, 255),
            TextSecondary = Color3.fromRGB(170, 150, 200),
            Accent = Color3.fromRGB(190, 180, 220)
        },
        Green = {
            Background = Color3.fromRGB(15, 25, 20),
            Secondary = Color3.fromRGB(20, 35, 25),
            Primary = Color3.fromRGB(100, 200, 150),
            Text = Color3.fromRGB(230, 255, 240),
            TextSecondary = Color3.fromRGB(150, 200, 170),
            Accent = Color3.fromRGB(180, 220, 190)
        }
    }
    
    local currentTheme = "Dark"
    local themeElements = {}
    
    function ThemeService:GetTheme(name)
        return themes[name] or themes.Dark
    end
    
    function ThemeService:SetTheme(name, windowInstance)
        if not themes[name] then return end
        
        currentTheme = name
        local theme = themes[name]
        
        -- Apply theme to all registered elements
        for _, element in pairs(themeElements) do
            if element.Instance and element.Instance.Parent then
                if element.Type == "Background" then
                    element.Instance.BackgroundColor3 = theme.Background
                elseif element.Type == "Secondary" then
                    element.Instance.BackgroundColor3 = theme.Secondary
                elseif element.Type == "Primary" then
                    element.Instance.BackgroundColor3 = theme.Primary
                elseif element.Type == "Text" then
                    element.Instance.TextColor3 = theme.Text
                elseif element.Type == "TextSecondary" then
                    element.Instance.TextColor3 = theme.TextSecondary
                elseif element.Type == "Accent" then
                    if element.Instance:IsA("TextLabel") or element.Instance:IsA("TextButton") then
                        element.Instance.TextColor3 = theme.Accent
                    else
                        element.Instance.BackgroundColor3 = theme.Accent
                    end
                end
            end
        end
        
        Eye.Notify("info", "Theme Changed", "Theme changed to " .. name, 3)
    end
    
    function ThemeService:RegisterElement(instance, type)
        table.insert(themeElements, {
            Instance = instance,
            Type = type
        })
    end
    
    function ThemeService:GetCurrentTheme()
        return currentTheme
    end
    
    function ThemeService:GetThemes()
        local themeList = {}
        for name, _ in pairs(themes) do
            table.insert(themeList, name)
        end
        return themeList
    end
    
    Eye.ThemeService = ThemeService
end

-- Notification System (Enhanced)
do
    local Notification = {}
    Notification.__index = Notification

    local ts = game:GetService("TweenService")
    local txtS = game:GetService("TextService")

    local notifications = Instance.new("ScreenGui")
    notifications.Name = "EyeNotifications"
    notifications.Parent = game:GetService("CoreGui")
    notifications.ZIndexBehavior = Enum.ZIndexBehavior.Global
    notifications.ResetOnSpawn = false

    local notifsHolderFrame = Instance.new("Frame")
    notifsHolderFrame.Name = "notifsHolderFrame"
    notifsHolderFrame.Parent = notifications
    notifsHolderFrame.AnchorPoint = Vector2.new(1, 1)
    notifsHolderFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    notifsHolderFrame.BackgroundTransparency = 0.2
    notifsHolderFrame.BorderSizePixel = 0
    notifsHolderFrame.Position = UDim2.new(1, -10, 1, -10)
    notifsHolderFrame.Size = UDim2.new(0.25, 0, 0.3, 0)
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = notifsHolderFrame

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = notifsHolderFrame
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    UIListLayout.Padding = UDim.new(0, 5)

    local function createNotificationTemplate(name, bgColor, accentColor)
        local template = Instance.new("Frame")
        template.Name = name
        template.AnchorPoint = Vector2.new(1, 1)
        template.BackgroundTransparency = 1
        template.Size = UDim2.new(1, 0, 0, 60)

        local frame = Instance.new("Frame")
        frame.Name = "templateFrame"
        frame.Parent = template
        frame.BackgroundColor3 = bgColor
        frame.BorderSizePixel = 0
        frame.Size = UDim2.new(1, 0, 1, 0)
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = frame

        local severity = Instance.new("Frame")
        severity.Name = "severityFrame"
        severity.Parent = frame
        severity.BackgroundColor3 = accentColor
        severity.Size = UDim2.new(0, 5, 1, 0)

        local icon = Instance.new("ImageLabel")
        icon.Name = "icon"
        icon.Parent = frame
        icon.AnchorPoint = Vector2.new(0, 0.5)
        icon.BackgroundTransparency = 1
        icon.Position = UDim2.new(0, 15, 0.5, 0)
        icon.Size = UDim2.new(0, 20, 0, 20)
        icon.ImageColor3 = accentColor

        local info = Instance.new("Frame")
        info.Name = "informationFrame"
        info.Parent = frame
        info.BackgroundTransparency = 1
        info.Position = UDim2.new(0, 45, 0, 0)
        info.Size = UDim2.new(1, -70, 1, 0)

        local heading = Instance.new("TextLabel")
        heading.Name = "headingText"
        heading.Parent = info
        heading.BackgroundTransparency = 1
        heading.Size = UDim2.new(1, 0, 0, 25)
        heading.Font = Enum.Font.GothamBold
        heading.TextColor3 = Color3.fromRGB(230, 230, 230)
        heading.TextSize = 14
        heading.TextXAlignment = Enum.TextXAlignment.Left
        heading.TextYAlignment = Enum.TextYAlignment.Bottom

        local body = Instance.new("TextLabel")
        body.Name = "bodyText"
        body.Parent = info
        body.BackgroundTransparency = 1
        body.Position = UDim2.new(0, 0, 0, 25)
        body.Size = UDim2.new(1, 0, 1, -25)
        body.Font = Enum.Font.GothamSemibold
        body.TextColor3 = Color3.fromRGB(200, 200, 200)
        body.TextSize = 13
        body.TextWrapped = true
        body.TextXAlignment = Enum.TextXAlignment.Left
        body.TextYAlignment = Enum.TextYAlignment.Top

        local close = Instance.new("ImageButton")
        close.Name = "closeButton"
        close.Parent = frame
        close.AnchorPoint = Vector2.new(1, 0.5)
        close.BackgroundTransparency = 1
        close.Position = UDim2.new(1, -10, 0.5, 0)
        close.Size = UDim2.new(0, 15, 0, 15)
        close.Image = "rbxassetid://7072718162"
        close.ImageColor3 = accentColor

        return template
    end

    local errorTemplate = createNotificationTemplate("error", Color3.fromRGB(40, 20, 20), Color3.fromRGB(236, 88, 76))
    errorTemplate.templateFrame.icon.Image = "rbxassetid://7072723420"

    local infoTemplate = createNotificationTemplate("info", Color3.fromRGB(20, 30, 40), Color3.fromRGB(50, 131, 226))
    infoTemplate.templateFrame.icon.Image = "rbxassetid://7072718536"

    local successTemplate = createNotificationTemplate("success", Color3.fromRGB(20, 40, 25), Color3.fromRGB(50, 195, 125))
    successTemplate.templateFrame.icon.Image = "rbxassetid://7072717837"

    local warningTemplate = createNotificationTemplate("warning", Color3.fromRGB(40, 35, 20), Color3.fromRGB(234, 159, 53))
    warningTemplate.templateFrame.icon.Image = "rbxassetid://7072719426"

    local messageTemplate = createNotificationTemplate("message", Color3.fromRGB(30, 30, 30), Color3.fromRGB(150, 150, 150))
    messageTemplate.templateFrame.icon.Image = "rbxassetid://7072718979"

    function Notification.new(notifType, heading, body, autoRemove, autoRemoveTime, callback)
        local templates = {
            error = errorTemplate,
            info = infoTemplate,
            success = successTemplate,
            warning = warningTemplate,
            message = messageTemplate
        }

        local template = templates[notifType:lower()]
        if not template then
            warn("Invalid notification type: "..tostring(notifType))
            return
        end

        local notif = template:Clone()
        notif.templateFrame.Position = UDim2.new(1, 0, 0, 0)

        local function open()
            ts:Create(notif.templateFrame, TweenInfo.new(0.25), {Position = UDim2.new(0, 0, 0, 0)}):Play()
        end

        local function close()
            local tween = ts:Create(notif.templateFrame, TweenInfo.new(0.25), {Position = UDim2.new(1, 0, 0, 0)})
            tween:Play()
            tween.Completed:Wait()
            notif:Destroy()
            if callback then callback() end
        end

        notif.templateFrame.closeButton.MouseButton1Click:Connect(close)
        notif.templateFrame.informationFrame.headingText.Text = heading or ""
        notif.templateFrame.informationFrame.bodyText.Text = body or ""
        notif.Parent = notifsHolderFrame
        open()

        if autoRemove then
            task.delay(autoRemoveTime or 5, function()
                if notif and notif.Parent then
                    close()
                end
            end)
        end

        local self = setmetatable({
            Instance = notif,
            Heading = heading,
            Body = body,
            Type = notifType:lower()
        }, Notification)

        return self
    end

    function Notification:ChangeHeading(newHeading)
        if self.Instance and self.Instance.Parent then
            self.Instance.templateFrame.informationFrame.headingText.Text = newHeading
            self.Heading = newHeading
        end
    end

    function Notification:ChangeBody(newBody)
        if self.Instance and self.Instance.Parent then
            self.Instance.templateFrame.informationFrame.bodyText.Text = newBody
            self.Body = newBody
        end
    end

    function Notification:Delete()
        if self.Instance and self.Instance.Parent then
            local tween = ts:Create(self.Instance.templateFrame, TweenInfo.new(0.25), {Position = UDim2.new(1, 0, 0, 0)})
            tween:Play()
            tween.Completed:Wait()
            self.Instance:Destroy()
        end
    end

    Eye.Notify = function(notifType, heading, body, duration, callback)
        duration = duration or 5
        return Notification.new(notifType, heading, body, true, duration, callback)
    end
end

-- Enhanced UI with Search and Additional Features
do
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    
    local function CreateDraggable(frame, handle)
        local dragging
        local dragInput
        local dragStart
        local startPos
        
        handle.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                dragStart = input.Position
                startPos = frame.Position
                
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        
        handle.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                dragInput = input
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
    end
    
    local function RippleEffect(button)
        local ripple = Instance.new("Frame")
        ripple.Name = "Ripple"
        ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ripple.BackgroundTransparency = 0.8
        ripple.Size = UDim2.new(0, 0, 0, 0)
        ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
        ripple.AnchorPoint = Vector2.new(0.5, 0.5)
        ripple.ZIndex = -1
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(1, 0)
        corner.Parent = ripple
        
        ripple.Parent = button
        
        local mouse = game.Players.LocalPlayer:GetMouse()
        local pos = UDim2.new(
            (mouse.X - ripple.AbsolutePosition.X) / button.AbsoluteSize.X,
            0,
            (mouse.Y - ripple.AbsolutePosition.Y) / button.AbsoluteSize.Y,
            0
        )
        
        ripple.Position = pos
        
        local size = math.max(button.AbsoluteSize.X, button.AbsoluteSize.Y) * 1.5
        
        TweenService:Create(ripple, TweenInfo.new(0.5), {
            Size = UDim2.new(0, size, 0, size),
            Position = pos - UDim2.new(0, size/2, 0, size/2),
            BackgroundTransparency = 1
        }):Play()
        
        game.Debris:AddItem(ripple, 0.5)
    end
    
    function Eye:CreateWindow(title, subtitle)
        title = title or "Eye UI"
        subtitle = subtitle or "Enhanced UI Library"
        
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "EyeUI"
        ScreenGui.Parent = game.CoreGui
        ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        
        local Main = Instance.new("Frame")
        Main.Name = "Main"
        Main.Parent = ScreenGui
        Main.AnchorPoint = Vector2.new(0.5, 0.5)
        Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        Main.BorderSizePixel = 0
        Main.Position = UDim2.new(0.5, 0, 0.5, 0)
        Main.Size = UDim2.new(0, 650, 0, 450)
        
        Eye.ThemeService:RegisterElement(Main, "Background")
        
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0.05, 0)
        UICorner.Parent = Main
        
        local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
        UIAspectRatioConstraint.AspectRatio = 1.44
        UIAspectRatioConstraint.Parent = Main
        
        local Topbar = Instance.new("Frame")
        Topbar.Name = "Topbar"
        Topbar.Parent = Main
        Topbar.BackgroundTransparency = 1
        Topbar.Size = UDim2.new(1, 0, 0, 50)
        
        local Title = Instance.new("TextLabel")
        Title.Name = "Title"
        Title.Parent = Topbar
        Title.BackgroundTransparency = 1
        Title.Position = UDim2.new(0.09, 0, 0, 0)
        Title.Size = UDim2.new(0, 266, 0, 38)
        Title.Font = Enum.Font.GothamBold
        Title.Text = title
        Title.TextColor3 = Color3.fromRGB(230, 230, 230)
        Title.TextSize = 14
        Title.TextXAlignment = Enum.TextXAlignment.Left
        
        Eye.ThemeService:RegisterElement(Title, "Text")
        
        local Subtitle = Instance.new("TextLabel")
        Subtitle.Name = "Subtitle"
        Subtitle.Parent = Topbar
        Subtitle.BackgroundTransparency = 1
        Subtitle.Position = UDim2.new(0.09, 0, 0.27, 0)
        Subtitle.Size = UDim2.new(0, 266, 0, 38)
        Subtitle.Font = Enum.Font.GothamBold
        Subtitle.Text = subtitle
        Subtitle.TextColor3 = Color3.fromRGB(176, 176, 176)
        Subtitle.TextSize = 12
        Subtitle.TextXAlignment = Enum.TextXAlignment.Left
        
        Eye.ThemeService:RegisterElement(Subtitle, "Accent")
        
        local Logo = Instance.new("ImageLabel")
        Logo.Name = "Logo"
        Logo.Parent = Topbar
        Logo.BackgroundTransparency = 1
        Logo.Position = UDim2.new(0.03, 0, 0.19, 0)
        Logo.Size = UDim2.new(0, 25, 0, 26)
        Logo.Image = "rbxassetid://6523858394"
        
        -- Search Box
        local SearchBox = Instance.new("Frame")
        SearchBox.Name = "SearchBox"
        SearchBox.Parent = Topbar
        SearchBox.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
        SearchBox.Position = UDim2.new(0.45, 0, 0.2, 0)
        SearchBox.Size = UDim2.new(0, 200, 0, 30)
        
        Eye.ThemeService:RegisterElement(SearchBox, "Secondary")
        
        local SearchCorner = Instance.new("UICorner")
        SearchCorner.CornerRadius = UDim.new(0.2, 0)
        SearchCorner.Parent = SearchBox
        
        local SearchIcon = Instance.new("ImageLabel")
        SearchIcon.Name = "SearchIcon"
        SearchIcon.Parent = SearchBox
        SearchIcon.BackgroundTransparency = 1
        SearchIcon.Position = UDim2.new(0, 8, 0.5, 0)
        SearchIcon.Size = UDim2.new(0, 16, 0, 16)
        SearchIcon.AnchorPoint = Vector2.new(0, 0.5)
        SearchIcon.Image = "rbxassetid://7072718162" -- Search icon
        SearchIcon.ImageColor3 = Color3.fromRGB(150, 150, 150)
        
        local SearchInput = Instance.new("TextBox")
        SearchInput.Name = "SearchInput"
        SearchInput.Parent = SearchBox
        SearchInput.BackgroundTransparency = 1
        SearchInput.Position = UDim2.new(0, 30, 0, 0)
        SearchInput.Size = UDim2.new(1, -35, 1, 0)
        SearchInput.Font = Enum.Font.Gotham
        SearchInput.PlaceholderText = "Search tabs..."
        SearchInput.Text = ""
        SearchInput.TextColor3 = Color3.fromRGB(230, 230, 230)
        SearchInput.TextSize = 12
        SearchInput.TextXAlignment = Enum.TextXAlignment.Left
        
        Eye.ThemeService:RegisterElement(SearchInput, "Text")
        
        local Close = Instance.new("TextButton")
        Close.Name = "Close"
        Close.Parent = Topbar
        Close.BackgroundTransparency = 1
        Close.Position = UDim2.new(0.94, 0, 0, 0)
        Close.Size = UDim2.new(0, 35, 0, 37)
        Close.Text = ""
        
        local CloseIcon = Instance.new("ImageLabel")
        CloseIcon.Name = "CloseIcon"
        CloseIcon.Parent = Close
        CloseIcon.BackgroundTransparency = 1
        CloseIcon.Position = UDim2.new(0.06, 0, 0.28, 0)
        CloseIcon.Size = UDim2.new(0, 22, 0, 22)
        CloseIcon.Image = "rbxassetid://10747384394"
        
        local Minimize = Instance.new("TextButton")
        Minimize.Name = "Minimize"
        Minimize.Parent = Topbar
        Minimize.BackgroundTransparency = 1
        Minimize.Position = UDim2.new(0.88, 0, 0, 0)
        Minimize.Size = UDim2.new(0, 29, 0, 37)
        Minimize.Text = ""
        
        local MinimizeIcon = Instance.new("ImageLabel")
        MinimizeIcon.Name = "MinimizeIcon"
        MinimizeIcon.Parent = Minimize
        MinimizeIcon.BackgroundTransparency = 1
        MinimizeIcon.Position = UDim2.new(0.29, 0, 0.25, 0)
        MinimizeIcon.Size = UDim2.new(0, 22, 0, 22)
        MinimizeIcon.Image = "rbxassetid://10734896206"
        
        local Tabs = Instance.new("Frame")
        Tabs.Name = "Tabs"
        Tabs.Parent = Main
        Tabs.BackgroundTransparency = 1
        Tabs.Position = UDim2.new(0, 0, 0.11, 0)
        Tabs.Size = UDim2.new(0, 140, 0, 400)
        
        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Parent = Tabs
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 2)
        
        local Content = Instance.new("ScrollingFrame")
        Content.Name = "Content"
        Content.Parent = Main
        Content.BackgroundTransparency = 1
        Content.Position = UDim2.new(0.22, 0, 0.11, 0)
        Content.Size = UDim2.new(0, 500, 0, 400)
        Content.ScrollBarThickness = 7
        Content.CanvasSize = UDim2.new(0, 0, 0, 0)
        
        local UIPadding = Instance.new("UIPadding")
        UIPadding.Parent = Content
        UIPadding.PaddingBottom = UDim.new(0, 10)
        UIPadding.PaddingLeft = UDim.new(0, 15)
        UIPadding.PaddingRight = UDim.new(0, 15)
        UIPadding.PaddingTop = UDim.new(0, 10)
        
        local UIListLayout2 = Instance.new("UIListLayout")
        UIListLayout2.Parent = Content
        UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout2.Padding = UDim.new(0, 7)
        
        local Drag = Instance.new("Frame")
        Drag.Name = "Drag"
        Drag.Parent = Main
        Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Drag.BackgroundTransparency = 0.75
        Drag.Position = UDim2.new(0.38, 0, 1.03, 0)
        Drag.Size = UDim2.new(0, 192, 0, 5)
        
        local UICorner2 = Instance.new("UICorner")
        UICorner2.Parent = Drag
        
        CreateDraggable(Main, Topbar)
        
        Close.MouseButton1Click:Connect(function()
            RippleEffect(Close)
            ScreenGui:Destroy()
        end)
        
        Minimize.MouseButton1Click:Connect(function()
            RippleEffect(Minimize)
            Main.Visible = not Main.Visible
        end)
        
        local tabs = {}
        local currentTab = nil
        local tabContents = {}
        
        -- Search functionality
        local function FilterTabs(searchText)
            for _, tab in pairs(tabs) do
                if searchText == "" or string.lower(tab.Name):find(string.lower(searchText)) then
                    tab.Button.Visible = true
                else
                    tab.Button.Visible = false
                end
            end
        end
        
        SearchInput.Changed:Connect(function()
            if SearchInput.Text then
                FilterTabs(SearchInput.Text)
            end
        end)
        
        local Window = {}
        Window.Tabs = tabs
        Window.Instance = Main
        Window.ScreenGui = ScreenGui
        
        function Window:CreateTab(name, icon)
            name = name or "Tab"
            icon = icon or "rbxassetid://7072718162"
            
            local TabButton = Instance.new("TextButton")
            TabButton.Name = name
            TabButton.Parent = Tabs
            TabButton.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
            TabButton.BorderSizePixel = 0
            TabButton.Size = UDim2.new(0, 130, 0, 40)
            TabButton.Text = ""
            TabButton.ClipsDescendants = true
            
            Eye.ThemeService:RegisterElement(TabButton, "Secondary")
            
            local TabCorner = Instance.new("UICorner")
            TabCorner.CornerRadius = UDim.new(0.2, 0)
            TabCorner.Parent = TabButton
            
            local TabIcon = Instance.new("ImageLabel")
            TabIcon.Name = "Icon"
            TabIcon.Parent = TabButton
            TabIcon.BackgroundTransparency = 1
            TabIcon.Position = UDim2.new(0, 10, 0.5, 0)
            TabIcon.Size = UDim2.new(0, 20, 0, 20)
            TabIcon.AnchorPoint = Vector2.new(0, 0.5)
            TabIcon.Image = icon
            TabIcon.ImageColor3 = Color3.fromRGB(150, 150, 150)
            
            local TabLabel = Instance.new("TextLabel")
            TabLabel.Name = "Label"
            TabLabel.Parent = TabButton
            TabLabel.BackgroundTransparency = 1
            TabLabel.Position = UDim2.new(0, 35, 0, 0)
            TabLabel.Size = UDim2.new(1, -40, 1, 0)
            TabLabel.Font = Enum.Font.GothamSemibold
            TabLabel.Text = name
            TabLabel.TextColor3 = Color3.fromRGB(176, 176, 176)
            TabLabel.TextSize = 12
            TabLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            Eye.ThemeService:RegisterElement(TabLabel, "Accent")
            
            local TabContent = Instance.new("Frame")
            TabContent.Name = name .. "Content"
            TabContent.Parent = Content
            TabContent.BackgroundTransparency = 1
            TabContent.Size = UDim2.new(1, 0, 0, 0)
            TabContent.Visible = false
            
            local TabUIListLayout = Instance.new("UIListLayout")
            TabUIListLayout.Parent = TabContent
            TabUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            TabUIListLayout.Padding = UDim.new(0, 7)
            
            local function SelectTab()
                -- Deselect all tabs
                for _, tab in pairs(tabs) do
                    tab.Button.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                    tab.Icon.ImageColor3 = Color3.fromRGB(150, 150, 150)
                    tab.Label.TextColor3 = Color3.fromRGB(176, 176, 176)
                    tab.Content.Visible = false
                    Eye.ThemeService:RegisterElement(tab.Button, "Secondary")
                end
                
                -- Select current tab
                TabButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
                TabIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
                TabLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                TabContent.Visible = true
                Eye.ThemeService:RegisterElement(TabButton, "Primary")
                
                currentTab = name
            end
            
            TabButton.MouseButton1Click:Connect(function()
                RippleEffect(TabButton)
                SelectTab()
            end)
            
            -- Auto-select first tab
            if #tabs == 0 then
                SelectTab()
            end
            
            local Tab = {
                Name = name,
                Button = TabButton,
                Icon = TabIcon,
                Label = TabLabel,
                Content = TabContent,
                UIListLayout = TabUIListLayout
            }
            
            tabs[name] = Tab
            table.insert(tabs, Tab)
            
            -- Tab methods
            function Tab:CreateSection(name)
                name = name or "Section"
                
                local Section = Instance.new("Frame")
                Section.Name = name
                Section.Parent = TabContent
                Section.BackgroundTransparency = 1
                Section.Size = UDim2.new(1, 0, 0, 30)
                
                local SectionLabel = Instance.new("TextLabel")
                SectionLabel.Name = "Label"
                SectionLabel.Parent = Section
                SectionLabel.BackgroundTransparency = 1
                SectionLabel.Size = UDim2.new(1, 0, 1, 0)
                SectionLabel.Font = Enum.Font.GothamBold
                SectionLabel.Text = name
                SectionLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
                SectionLabel.TextSize = 14
                SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
                
                Eye.ThemeService:RegisterElement(SectionLabel, "Text")
                
                return {
                    Instance = Section,
                    Label = SectionLabel
                }
            end
            
            function Tab:CreateLabel(text)
                text = text or "Label"
                
                local Label = Instance.new("TextLabel")
                Label.Name = "Label"
                Label.Parent = TabContent
                Label.BackgroundTransparency = 1
                Label.Size = UDim2.new(1, 0, 0, 20)
                Label.Font = Enum.Font.Gotham
                Label.Text = text
                Label.TextColor3 = Color3.fromRGB(176, 176, 176)
                Label.TextSize = 12
                Label.TextXAlignment = Enum.TextXAlignment.Left
                Label.TextWrapped = true
                
                Eye.ThemeService:RegisterElement(Label, "Accent")
                
                return {
                    Instance = Label,
                    SetText = function(self, newText)
                        Label.Text = newText
                    end
                }
            end
            
            function Tab:CreateButton(text, callback)
                text = text or "Button"
                callback = callback or function() end
                
                local Button = Instance.new("TextButton")
                Button.Name = "Button"
                Button.Parent = TabContent
                Button.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
                Button.BorderSizePixel = 0
                Button.Size = UDim2.new(1, 0, 0, 35)
                Button.Font = Enum.Font.GothamSemibold
                Button.Text = text
                Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                Button.TextSize = 12
                Button.ClipsDescendants = true
                
                Eye.ThemeService:RegisterElement(Button, "Primary")
                
                local ButtonCorner = Instance.new("UICorner")
                ButtonCorner.CornerRadius = UDim.new(0.2, 0)
                ButtonCorner.Parent = Button
                
                Button.MouseButton1Click:Connect(function()
                    RippleEffect(Button)
                    callback()
                end)
                
                return {
                    Instance = Button,
                    SetText = function(self, newText)
                        Button.Text = newText
                    end,
                    SetCallback = function(self, newCallback)
                        callback = newCallback
                    end
                }
            end
            
            function Tab:CreateToggle(text, default, callback)
                text = text or "Toggle"
                default = default or false
                callback = callback or function() end
                
                local Toggle = Instance.new("Frame")
                Toggle.Name = "Toggle"
                Toggle.Parent = TabContent
                Toggle.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                Toggle.BorderSizePixel = 0
                Toggle.Size = UDim2.new(1, 0, 0, 40)
                
                Eye.ThemeService:RegisterElement(Toggle, "Secondary")
                
                local ToggleCorner = Instance.new("UICorner")
                ToggleCorner.CornerRadius = UDim.new(0.2, 0)
                ToggleCorner.Parent = Toggle
                
                local ToggleLabel = Instance.new("TextLabel")
                ToggleLabel.Name = "Label"
                ToggleLabel.Parent = Toggle
                ToggleLabel.BackgroundTransparency = 1
                ToggleLabel.Position = UDim2.new(0, 15, 0, 0)
                ToggleLabel.Size = UDim2.new(1, -70, 1, 0)
                ToggleLabel.Font = Enum.Font.GothamSemibold
                ToggleLabel.Text = text
                ToggleLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
                ToggleLabel.TextSize = 12
                ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
                
                Eye.ThemeService:RegisterElement(ToggleLabel, "Text")
                
                local ToggleButton = Instance.new("TextButton")
                ToggleButton.Name = "Button"
                ToggleButton.Parent = Toggle
                ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                ToggleButton.BorderSizePixel = 0
                ToggleButton.Position = UDim2.new(1, -45, 0.5, 0)
                ToggleButton.Size = UDim2.new(0, 35, 0, 20)
                ToggleButton.AnchorPoint = Vector2.new(0, 0.5)
                ToggleButton.Text = ""
                
                local ToggleButtonCorner = Instance.new("UICorner")
                ToggleButtonCorner.CornerRadius = UDim.new(1, 0)
                ToggleButtonCorner.Parent = ToggleButton
                
                local ToggleCircle = Instance.new("Frame")
                ToggleCircle.Name = "Circle"
                ToggleCircle.Parent = ToggleButton
                ToggleCircle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                ToggleCircle.BorderSizePixel = 0
                ToggleCircle.Position = UDim2.new(0, 2, 0.5, 0)
                ToggleCircle.Size = UDim2.new(0, 16, 0, 16)
                ToggleCircle.AnchorPoint = Vector2.new(0, 0.5)
                
                local ToggleCircleCorner = Instance.new("UICorner")
                ToggleCircleCorner.CornerRadius = UDim.new(1, 0)
                ToggleCircleCorner.Parent = ToggleCircle
                
                local toggled = default
                
                local function UpdateToggle()
                    if toggled then
                        TweenService:Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 130, 180)}):Play()
                        TweenService:Create(ToggleCircle, TweenInfo.new(0.2), {
                            Position = UDim2.new(1, -18, 0.5, 0),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        }):Play()
                    else
                        TweenService:Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
                        TweenService:Create(ToggleCircle, TweenInfo.new(0.2), {
                            Position = UDim2.new(0, 2, 0.5, 0),
                            BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                        }):Play()
                    end
                end
                
                UpdateToggle()
                
                ToggleButton.MouseButton1Click:Connect(function()
                    toggled = not toggled
                    UpdateToggle()
                    callback(toggled)
                end)
                
                return {
                    Instance = Toggle,
                    SetText = function(self, newText)
                        ToggleLabel.Text = newText
                    end,
                    SetValue = function(self, value)
                        toggled = value
                        UpdateToggle()
                    end,
                    GetValue = function(self)
                        return toggled
                    end
                }
            end
            
            function Tab:CreateSlider(text, min, max, default, callback)
                text = text or "Slider"
                min = min or 0
                max = max or 100
                default = default or 50
                callback = callback or function() end
                
                local Slider = Instance.new("Frame")
                Slider.Name = "Slider"
                Slider.Parent = TabContent
                Slider.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                Slider.BorderSizePixel = 0
                Slider.Size = UDim2.new(1, 0, 0, 50)
                
                Eye.ThemeService:RegisterElement(Slider, "Secondary")
                
                local SliderCorner = Instance.new("UICorner")
                SliderCorner.CornerRadius = UDim.new(0.2, 0)
                SliderCorner.Parent = Slider
                
                local SliderLabel = Instance.new("TextLabel")
                SliderLabel.Name = "Label"
                SliderLabel.Parent = Slider
                SliderLabel.BackgroundTransparency = 1
                SliderLabel.Position = UDim2.new(0, 15, 0, 5)
                SliderLabel.Size = UDim2.new(1, -80, 0, 20)
                SliderLabel.Font = Enum.Font.GothamSemibold
                SliderLabel.Text = text
                SliderLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
                SliderLabel.TextSize = 12
                SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
                
                Eye.ThemeService:RegisterElement(SliderLabel, "Text")
                
                local SliderValue = Instance.new("TextLabel")
                SliderValue.Name = "Value"
                SliderValue.Parent = Slider
                SliderValue.BackgroundTransparency = 1
                SliderValue.Position = UDim2.new(1, -70, 0, 5)
                SliderValue.Size = UDim2.new(0, 55, 0, 20)
                SliderValue.Font = Enum.Font.GothamBold
                SliderValue.Text = tostring(default)
                SliderValue.TextColor3 = Color3.fromRGB(70, 130, 180)
                SliderValue.TextSize = 12
                SliderValue.TextXAlignment = Enum.TextXAlignment.Right
                
                Eye.ThemeService:RegisterElement(SliderValue, "Primary")
                
                local SliderTrack = Instance.new("Frame")
                SliderTrack.Name = "Track"
                SliderTrack.Parent = Slider
                SliderTrack.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                SliderTrack.BorderSizePixel = 0
                SliderTrack.Position = UDim2.new(0, 15, 0, 30)
                SliderTrack.Size = UDim2.new(1, -30, 0, 5)
                
                local SliderTrackCorner = Instance.new("UICorner")
                SliderTrackCorner.CornerRadius = UDim.new(1, 0)
                SliderTrackCorner.Parent = SliderTrack
                
                local SliderFill = Instance.new("Frame")
                SliderFill.Name = "Fill"
                SliderFill.Parent = SliderTrack
                SliderFill.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
                SliderFill.BorderSizePixel = 0
                SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
                
                Eye.ThemeService:RegisterElement(SliderFill, "Primary")
                
                local SliderFillCorner = Instance.new("UICorner")
                SliderFillCorner.CornerRadius = UDim.new(1, 0)
                SliderFillCorner.Parent = SliderFill
                
                local SliderHandle = Instance.new("Frame")
                SliderHandle.Name = "Handle"
                SliderHandle.Parent = SliderTrack
                SliderHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderHandle.BorderSizePixel = 0
                SliderHandle.Position = UDim2.new((default - min) / (max - min), -7, 0.5, 0)
                SliderHandle.Size = UDim2.new(0, 14, 0, 14)
                SliderHandle.AnchorPoint = Vector2.new(0, 0.5)
                
                local SliderHandleCorner = Instance.new("UICorner")
                SliderHandleCorner.CornerRadius = UDim.new(1, 0)
                SliderHandleCorner.Parent = SliderHandle
                
                local value = default
                local dragging = false
                
                local function UpdateSlider(input)
                    local percent = math.clamp((input.Position.X - SliderTrack.AbsolutePosition.X) / SliderTrack.AbsoluteSize.X, 0, 1)
                    value = math.floor(min + (max - min) * percent)
                    
                    SliderValue.Text = tostring(value)
                    SliderFill.Size = UDim2.new(percent, 0, 1, 0)
                    SliderHandle.Position = UDim2.new(percent, -7, 0.5, 0)
                    
                    callback(value)
                end
                
                SliderTrack.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                        UpdateSlider(input)
                    end
                end)
                
                SliderTrack.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)
                
                UserInputService.InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        UpdateSlider(input)
                    end
                end)
                
                return {
                    Instance = Slider,
                    SetText = function(self, newText)
                        SliderLabel.Text = newText
                    end,
                    SetValue = function(self, newValue)
                        value = math.clamp(newValue, min, max)
                        local percent = (value - min) / (max - min)
                        SliderValue.Text = tostring(value)
                        SliderFill.Size = UDim2.new(percent, 0, 1, 0)
                        SliderHandle.Position = UDim2.new(percent, -7, 0.5, 0)
                    end,
                    GetValue = function(self)
                        return value
                    end
                }
            end
            
            function Tab:CreateDropdown(text, options, default, callback)
                text = text or "Dropdown"
                options = options or {}
                default = default or ""
                callback = callback or function() end
                
                local Dropdown = Instance.new("Frame")
                Dropdown.Name = "Dropdown"
                Dropdown.Parent = TabContent
                Dropdown.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                Dropdown.BorderSizePixel = 0
                Dropdown.Size = UDim2.new(1, 0, 0, 40)
                Dropdown.ClipsDescendants = true
                
                Eye.ThemeService:RegisterElement(Dropdown, "Secondary")
                
                local DropdownCorner = Instance.new("UICorner")
                DropdownCorner.CornerRadius = UDim.new(0.2, 0)
                DropdownCorner.Parent = Dropdown
                
                local DropdownLabel = Instance.new("TextLabel")
                DropdownLabel.Name = "Label"
                DropdownLabel.Parent = Dropdown
                DropdownLabel.BackgroundTransparency = 1
                DropdownLabel.Position = UDim2.new(0, 15, 0, 0)
                DropdownLabel.Size = UDim2.new(1, -60, 0, 40)
                DropdownLabel.Font = Enum.Font.GothamSemibold
                DropdownLabel.Text = text
                DropdownLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
                DropdownLabel.TextSize = 12
                DropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
                
                Eye.ThemeService:RegisterElement(DropdownLabel, "Text")
                
                local DropdownButton = Instance.new("TextButton")
                DropdownButton.Name = "Button"
                DropdownButton.Parent = Dropdown
                DropdownButton.BackgroundTransparency = 1
                DropdownButton.Position = UDim2.new(1, -40, 0, 0)
                DropdownButton.Size = UDim2.new(0, 40, 0, 40)
                DropdownButton.Text = ""
                
                local DropdownArrow = Instance.new("ImageLabel")
                DropdownArrow.Name = "Arrow"
                DropdownArrow.Parent = DropdownButton
                DropdownArrow.BackgroundTransparency = 1
                DropdownArrow.Position = UDim2.new(0.5, 0, 0.5, 0)
                DropdownArrow.Size = UDim2.new(0, 16, 0, 16)
                DropdownArrow.AnchorPoint = Vector2.new(0.5, 0.5)
                DropdownArrow.Image = "rbxassetid://7072718162"
                DropdownArrow.ImageColor3 = Color3.fromRGB(150, 150, 150)
                
                local DropdownContent = Instance.new("Frame")
                DropdownContent.Name = "Content"
                DropdownContent.Parent = Dropdown
                DropdownContent.BackgroundTransparency = 1
                DropdownContent.Position = UDim2.new(0, 0, 0, 40)
                DropdownContent.Size = UDim2.new(1, 0, 0, 0)
                
                local DropdownUIListLayout = Instance.new("UIListLayout")
                DropdownUIListLayout.Parent = DropdownContent
                DropdownUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                
                local expanded = false
                local currentValue = default
                
                local function CreateOption(option)
                    local OptionButton = Instance.new("TextButton")
                    OptionButton.Name = option
                    OptionButton.Parent = DropdownContent
                    OptionButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                    OptionButton.BorderSizePixel = 0
                    OptionButton.Size = UDim2.new(1, 0, 0, 30)
                    OptionButton.Font = Enum.Font.Gotham
                    OptionButton.Text = option
                    OptionButton.TextColor3 = Color3.fromRGB(176, 176, 176)
                    OptionButton.TextSize = 11
                    
                    Eye.ThemeService:RegisterElement(OptionButton, "Background")
                    
                    OptionButton.MouseButton1Click:Connect(function()
                        currentValue = option
                        DropdownLabel.Text = text .. ": " .. option
                        callback(option)
                        
                        -- Close dropdown
                        expanded = false
                        TweenService:Create(Dropdown, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 40)}):Play()
                        TweenService:Create(DropdownArrow, TweenInfo.new(0.2), {Rotation = 0}):Play()
                    end)
                    
                    OptionButton.MouseEnter:Connect(function()
                        TweenService:Create(OptionButton, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
                    end)
                    
                    OptionButton.MouseLeave:Connect(function()
                        TweenService:Create(OptionButton, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(20, 20, 20)}):Play()
                    end)
                end
                
                -- Create options
                for _, option in ipairs(options) do
                    CreateOption(option)
                end
                
                -- Set default
                if default ~= "" then
                    DropdownLabel.Text = text .. ": " .. default
                end
                
                DropdownButton.MouseButton1Click:Connect(function()
                    expanded = not expanded
                    if expanded then
                        local contentHeight = #options * 30
                        TweenService:Create(Dropdown, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 40 + contentHeight)}):Play()
                        TweenService:Create(DropdownArrow, TweenInfo.new(0.2), {Rotation = 180}):Play()
                    else
                        TweenService:Create(Dropdown, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 40)}):Play()
                        TweenService:Create(DropdownArrow, TweenInfo.new(0.2), {Rotation = 0}):Play()
                    end
                end)
                
                return {
                    Instance = Dropdown,
                    SetText = function(self, newText)
                        text = newText
                        DropdownLabel.Text = currentValue ~= "" and (newText .. ": " .. currentValue) or newText
                    end,
                    SetValue = function(self, value)
                        currentValue = value
                        DropdownLabel.Text = text .. ": " .. value
                    end,
                    GetValue = function(self)
                        return currentValue
                    end,
                    AddOption = function(self, option)
                        table.insert(options, option)
                        CreateOption(option)
                    end
                }
            end
            
            function Tab:CreateTextBox(text, placeholder, callback)
                text = text or "TextBox"
                placeholder = placeholder or "Enter text..."
                callback = callback or function() end
                
                local TextBox = Instance.new("Frame")
                TextBox.Name = "TextBox"
                TextBox.Parent = TabContent
                TextBox.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                TextBox.BorderSizePixel = 0
                TextBox.Size = UDim2.new(1, 0, 0, 50)
                
                Eye.ThemeService:RegisterElement(TextBox, "Secondary")
                
                local TextBoxCorner = Instance.new("UICorner")
                TextBoxCorner.CornerRadius = UDim.new(0.2, 0)
                TextBoxCorner.Parent = TextBox
                
                local TextBoxLabel = Instance.new("TextLabel")
                TextBoxLabel.Name = "Label"
                TextBoxLabel.Parent = TextBox
                TextBoxLabel.BackgroundTransparency = 1
                TextBoxLabel.Position = UDim2.new(0, 15, 0, 5)
                TextBoxLabel.Size = UDim2.new(1, -30, 0, 20)
                TextBoxLabel.Font = Enum.Font.GothamSemibold
                TextBoxLabel.Text = text
                TextBoxLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
                TextBoxLabel.TextSize = 12
                TextBoxLabel.TextXAlignment = Enum.TextXAlignment.Left
                
                Eye.ThemeService:RegisterElement(TextBoxLabel, "Text")
                
                local TextBoxInput = Instance.new("TextBox")
                TextBoxInput.Name = "Input"
                TextBoxInput.Parent = TextBox
                TextBoxInput.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                TextBoxInput.BorderSizePixel = 0
                TextBoxInput.Position = UDim2.new(0, 15, 0, 25)
                TextBoxInput.Size = UDim2.new(1, -30, 0, 20)
                TextBoxInput.Font = Enum.Font.Gotham
                TextBoxInput.PlaceholderText = placeholder
                TextBoxInput.Text = ""
                TextBoxInput.TextColor3 = Color3.fromRGB(230, 230, 230)

                TextBoxInput.TextSize = 11
                TextBoxInput.TextXAlignment = Enum.TextXAlignment.Left
                TextBoxInput.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
                TextBoxInput.ClearTextOnFocus = false
                
                Eye.ThemeService:RegisterElement(TextBoxInput, "Background")
                
                local TextBoxInputCorner = Instance.new("UICorner")
                TextBoxInputCorner.CornerRadius = UDim.new(0.15, 0)
                TextBoxInputCorner.Parent = TextBoxInput
                
                local TextBoxInputPadding = Instance.new("UIPadding")
                TextBoxInputPadding.PaddingLeft = UDim.new(0, 8)
                TextBoxInputPadding.PaddingRight = UDim.new(0, 8)
                TextBoxInputPadding.Parent = TextBoxInput
                
                TextBoxInput.FocusLost:Connect(function()
                    callback(TextBoxInput.Text)
                end)
                
                return {
                    Instance = TextBox,
                    SetText = function(self, newText)
                        TextBoxLabel.Text = newText
                    end,
                    SetValue = function(self, value)
                        TextBoxInput.Text = value
                    end,
                    GetValue = function(self)
                        return TextBoxInput.Text
                    end,
                    SetPlaceholder = function(self, newPlaceholder)
                        TextBoxInput.PlaceholderText = newPlaceholder
                    end
                }
            end
            
            function Tab:CreateKeybind(text, default, callback)
                text = text or "Keybind"
                default = default or Enum.KeyCode.F
                callback = callback or function() end
                
                local Keybind = Instance.new("Frame")
                Keybind.Name = "Keybind"
                Keybind.Parent = TabContent
                Keybind.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                Keybind.BorderSizePixel = 0
                Keybind.Size = UDim2.new(1, 0, 0, 40)
                
                Eye.ThemeService:RegisterElement(Keybind, "Secondary")
                
                local KeybindCorner = Instance.new("UICorner")
                KeybindCorner.CornerRadius = UDim.new(0.2, 0)
                KeybindCorner.Parent = Keybind
                
                local KeybindLabel = Instance.new("TextLabel")
                KeybindLabel.Name = "Label"
                KeybindLabel.Parent = Keybind
                KeybindLabel.BackgroundTransparency = 1
                KeybindLabel.Position = UDim2.new(0, 15, 0, 0)
                KeybindLabel.Size = UDim2.new(1, -80, 1, 0)
                KeybindLabel.Font = Enum.Font.GothamSemibold
                KeybindLabel.Text = text
                KeybindLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
                KeybindLabel.TextSize = 12
                KeybindLabel.TextXAlignment = Enum.TextXAlignment.Left
                
                Eye.ThemeService:RegisterElement(KeybindLabel, "Text")
                
                local KeybindButton = Instance.new("TextButton")
                KeybindButton.Name = "Button"
                KeybindButton.Parent = Keybind
                KeybindButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                KeybindButton.BorderSizePixel = 0
                KeybindButton.Position = UDim2.new(1, -65, 0.5, 0)
                KeybindButton.Size = UDim2.new(0, 50, 0, 25)
                KeybindButton.AnchorPoint = Vector2.new(0, 0.5)
                KeybindButton.Font = Enum.Font.GothamBold
                KeybindButton.Text = default.Name
                KeybindButton.TextColor3 = Color3.fromRGB(230, 230, 230)
                KeybindButton.TextSize = 10
                
                local KeybindButtonCorner = Instance.new("UICorner")
                KeybindButtonCorner.CornerRadius = UDim.new(0.2, 0)
                KeybindButtonCorner.Parent = KeybindButton
                
                local currentKey = default
                local listening = false
                
                KeybindButton.MouseButton1Click:Connect(function()
                    if not listening then
                        listening = true
                        KeybindButton.Text = "..."
                        KeybindButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
                        
                        local connection
                        connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
                            if not gameProcessed and input.UserInputType == Enum.UserInputType.Keyboard then
                                currentKey = input.KeyCode
                                KeybindButton.Text = currentKey.Name
                                KeybindButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                                listening = false
                                connection:Disconnect()
                            end
                        end)
                    end
                end)
                
                UserInputService.InputBegan:Connect(function(input, gameProcessed)
                    if not gameProcessed and input.KeyCode == currentKey then
                        callback(currentKey)
                    end
                end)
                
                return {
                    Instance = Keybind,
                    SetText = function(self, newText)
                        KeybindLabel.Text = newText
                    end,
                    SetKey = function(self, newKey)
                        currentKey = newKey
                        KeybindButton.Text = newKey.Name
                    end,
                    GetKey = function(self)
                        return currentKey
                    end
                }
            end
            
            function Tab:CreateColorPicker(text, default, callback)
                text = text or "Color Picker"
                default = default or Color3.fromRGB(255, 255, 255)
                callback = callback or function() end
                
                local ColorPicker = Instance.new("Frame")
                ColorPicker.Name = "ColorPicker"
                ColorPicker.Parent = TabContent
                ColorPicker.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                ColorPicker.BorderSizePixel = 0
                ColorPicker.Size = UDim2.new(1, 0, 0, 40)
                
                Eye.ThemeService:RegisterElement(ColorPicker, "Secondary")
                
                local ColorPickerCorner = Instance.new("UICorner")
                ColorPickerCorner.CornerRadius = UDim.new(0.2, 0)
                ColorPickerCorner.Parent = ColorPicker
                
                local ColorPickerLabel = Instance.new("TextLabel")
                ColorPickerLabel.Name = "Label"
                ColorPickerLabel.Parent = ColorPicker
                ColorPickerLabel.BackgroundTransparency = 1
                ColorPickerLabel.Position = UDim2.new(0, 15, 0, 0)
                ColorPickerLabel.Size = UDim2.new(1, -60, 1, 0)
                ColorPickerLabel.Font = Enum.Font.GothamSemibold
                ColorPickerLabel.Text = text
                ColorPickerLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
                ColorPickerLabel.TextSize = 12
                ColorPickerLabel.TextXAlignment = Enum.TextXAlignment.Left
                
                Eye.ThemeService:RegisterElement(ColorPickerLabel, "Text")
                
                local ColorPreview = Instance.new("Frame")
                ColorPreview.Name = "Preview"
                ColorPreview.Parent = ColorPicker
                ColorPreview.BackgroundColor3 = default
                ColorPreview.BorderSizePixel = 0
                ColorPreview.Position = UDim2.new(1, -35, 0.5, 0)
                ColorPreview.Size = UDim2.new(0, 20, 0, 20)
                ColorPreview.AnchorPoint = Vector2.new(0, 0.5)
                
                local ColorPreviewCorner = Instance.new("UICorner")
                ColorPreviewCorner.CornerRadius = UDim.new(0.2, 0)
                ColorPreviewCorner.Parent = ColorPreview
                
                local ColorPreviewStroke = Instance.new("UIStroke")
                ColorPreviewStroke.Color = Color3.fromRGB(70, 70, 70)
                ColorPreviewStroke.Thickness = 1
                ColorPreviewStroke.Parent = ColorPreview
                
                local currentColor = default
                
                local ColorPickerButton = Instance.new("TextButton")
                ColorPickerButton.Name = "Button"
                ColorPickerButton.Parent = ColorPicker
                ColorPickerButton.BackgroundTransparency = 1
                ColorPickerButton.Size = UDim2.new(1, 0, 1, 0)
                ColorPickerButton.Text = ""
                
                ColorPickerButton.MouseButton1Click:Connect(function()
                    -- Simple color picker - cycles through preset colors
                    local colors = {
                        Color3.fromRGB(255, 0, 0),
                        Color3.fromRGB(0, 255, 0),
                        Color3.fromRGB(0, 0, 255),
                        Color3.fromRGB(255, 255, 0),
                        Color3.fromRGB(255, 0, 255),
                        Color3.fromRGB(0, 255, 255),
                        Color3.fromRGB(255, 255, 255),
                        Color3.fromRGB(0, 0, 0)
                    }
                    
                    local currentIndex = 1
                    for i, color in ipairs(colors) do
                        if currentColor == color then
                            currentIndex = i
                            break
                        end
                    end
                    
                    currentIndex = (currentIndex % #colors) + 1
                    currentColor = colors[currentIndex]
                    ColorPreview.BackgroundColor3 = currentColor
                    callback(currentColor)
                end)
                
                return {
                    Instance = ColorPicker,
                    SetText = function(self, newText)
                        ColorPickerLabel.Text = newText
                    end,
                    SetColor = function(self, color)
                        currentColor = color
                        ColorPreview.BackgroundColor3 = color
                    end,
                    GetColor = function(self)
                        return currentColor
                    end
                }
            end
            
            return Tab
        end
        
        -- Auto-resize content based on elements
        local function UpdateContentSize()
            local totalHeight = 0
            for _, tab in pairs(tabs) do
                if tab.Content.Visible then
                    for _, child in pairs(tab.Content:GetChildren()) do
                        if child:IsA("GuiObject") and child.Visible then
                            totalHeight = totalHeight + child.AbsoluteSize.Y + 7
                        end
                    end
                    tab.Content.Size = UDim2.new(1, 0, 0, totalHeight)
                    break
                end
            end
        end
        
        -- Update content size when elements are added
        game:GetService("RunService").Heartbeat:Connect(function()
            UpdateContentSize()
        end)
        
        return Window
    end
    
    return Eye
