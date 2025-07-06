-- Eye UI Library
local Eye = {}

-- Notification System
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

        -- Severity indicator
        local severity = Instance.new("Frame")
        severity.Name = "severityFrame"
        severity.Parent = frame
        severity.BackgroundColor3 = accentColor
        severity.Size = UDim2.new(0, 5, 1, 0)

        -- Icon
        local icon = Instance.new("ImageLabel")
        icon.Name = "icon"
        icon.Parent = frame
        icon.AnchorPoint = Vector2.new(0, 0.5)
        icon.BackgroundTransparency = 1
        icon.Position = UDim2.new(0, 15, 0.5, 0)
        icon.Size = UDim2.new(0, 20, 0, 20)
        icon.ImageColor3 = accentColor

        -- Info frame
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

        -- Close button
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

    -- Notification templates
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

-- Main UI Library
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
        subtitle = subtitle or "Premium UI Library"
        
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
        Main.Size = UDim2.new(0, 580, 0, 390)
        
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0.05, 0)
        UICorner.Parent = Main
        
        local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
        UIAspectRatioConstraint.AspectRatio = 1.487
        UIAspectRatioConstraint.Parent = Main
        
        -- Topbar
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
        
        local Logo = Instance.new("ImageLabel")
        Logo.Name = "Logo"
        Logo.Parent = Topbar
        Logo.BackgroundTransparency = 1
        Logo.Position = UDim2.new(0.03, 0, 0.19, 0)
        Logo.Size = UDim2.new(0, 25, 0, 26)
        Logo.Image = "rbxassetid://6523858394"
        
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
        
        -- Tabs
        local Tabs = Instance.new("Frame")
        Tabs.Name = "Tabs"
        Tabs.Parent = Main
        Tabs.BackgroundTransparency = 1
        Tabs.Position = UDim2.new(0, 0, 0.13, 0)
        Tabs.Size = UDim2.new(0, 127, 0, 339)
        
        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Parent = Tabs
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        
        -- Content
        local Content = Instance.new("ScrollingFrame")
        Content.Name = "Content"
        Content.Parent = Main
        Content.BackgroundTransparency = 1
        Content.Position = UDim2.new(0.23, 0, 0.13, 0)
        Content.Size = UDim2.new(0, 444, 0, 338)
        Content.ScrollBarThickness = 7
        
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
        
        -- Drag
        local Drag = Instance.new("Frame")
        Drag.Name = "Drag"
        Drag.Parent = Main
        Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Drag.BackgroundTransparency = 0.75
        Drag.Position = UDim2.new(0.38, 0, 1.03, 0)
        Drag.Size = UDim2.new(0, 192, 0, 5)
        
        local UICorner2 = Instance.new("UICorner")
        UICorner2.Parent = Drag
        
        -- Window functionality
        CreateDraggable(Main, Topbar)
        
        Close.MouseButton1Click:Connect(function()
            ScreenGui:Destroy()
        end)
        
        Minimize.MouseButton1Click:Connect(function()
            if Content.Visible then
                Content.Visible = false
                Main.Size = UDim2.new(0, 580, 0, 50)
                MinimizeIcon.Image = "rbxassetid://10734896206"
            else
                Content.Visible = true
                Main.Size = UDim2.new(0, 580, 0, 390)
                MinimizeIcon.Image = "rbxassetid://10734896206"
            end
        end)
        
        -- Tab system
        local tabs = {}
        local currentTab
        
        function tabs:CreateTab(name, icon)
            local Tab = Instance.new("Frame")
            Tab.Name = name
            Tab.Parent = Tabs
            Tab.BackgroundTransparency = 1
            Tab.Size = UDim2.new(0, 127, 0, 48)
            
            local Icon = Instance.new("ImageLabel")
            Icon.Name = "Icon"
            Icon.Parent = Tab
            Icon.BackgroundTransparency = 1
            Icon.Position = UDim2.new(0.14, 0, 0.22, 0)
            Icon.Size = UDim2.new(0, 25, 0, 25)
            Icon.Image = icon or "rbxassetid://10734966248"
            Icon.ImageColor3 = Color3.fromRGB(150, 150, 150)
            
            local Label = Instance.new("TextLabel")
            Label.Name = "Label"
            Label.Parent = Tab
            Label.BackgroundTransparency = 1
            Label.Position = UDim2.new(0.41, 0, 0.04, 0)
            Label.Size = UDim2.new(0, 82, 0, 44)
            Label.Font = Enum.Font.GothamBold
            Label.Text = name
            Label.TextColor3 = Color3.fromRGB(150, 150, 150)
            Label.TextSize = 14
            Label.TextXAlignment = Enum.TextXAlignment.Left
            
            local Button = Instance.new("TextButton")
            Button.Name = "Button"
            Button.Parent = Tab
            Button.BackgroundTransparency = 1
            Button.Size = UDim2.new(1, 0, 1, 0)
            Button.Text = ""
            
            local SectionContainer = Instance.new("Frame")
            SectionContainer.Name = name.."Sections"
            SectionContainer.Parent = Content
            SectionContainer.BackgroundTransparency = 1
            SectionContainer.Size = UDim2.new(1, 0, 0, 0)
            
            local UIListLayout3 = Instance.new("UIListLayout")
            UIListLayout3.Parent = SectionContainer
            UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout3.Padding = UDim.new(0, 7)
            
            SectionContainer.Visible = false
            
            Button.MouseButton1Click:Connect(function()
                if currentTab then
                    currentTab.Icon.ImageColor3 = Color3.fromRGB(150, 150, 150)
                    currentTab.Label.TextColor3 = Color3.fromRGB(150, 150, 150)
                    game:GetService("TweenService"):Create(currentTab.Icon, TweenInfo.new(0.1), {ImageColor3 = Color3.fromRGB(150, 150, 150)}):Play()
                    game:GetService("TweenService"):Create(currentTab.Label, TweenInfo.new(0.1), {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
                    
                    for _, child in pairs(Content:GetChildren()) do
                        if child:IsA("Frame") then
                            child.Visible = false
                        end
                    end
                end
                
                currentTab = Tab
                Icon.ImageColor3 = Color3.fromRGB(230, 230, 230)
                Label.TextColor3 = Color3.fromRGB(230, 230, 230)
                game:GetService("TweenService"):Create(Icon, TweenInfo.new(0.1), {ImageColor3 = Color3.fromRGB(230, 230, 230)}):Play()
                game:GetService("TweenService"):Create(Label, TweenInfo.new(0.1), {TextColor3 = Color3.fromRGB(230, 230, 230)}):Play()
                SectionContainer.Visible = true
            end)
            
            -- Set first tab as active if none selected
            if not currentTab then
                currentTab = Tab
                Icon.ImageColor3 = Color3.fromRGB(230, 230, 230)
                Label.TextColor3 = Color3.fromRGB(230, 230, 230)
                SectionContainer.Visible = true
            end
            
            local sections = {}
            
            function sections:CreateSection(title)
                local Section = Instance.new("Frame")
                Section.Name = title
                Section.Parent = SectionContainer
                Section.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                Section.Size = UDim2.new(1, 0, 0, 30)
                
                local UICorner3 = Instance.new("UICorner")
                UICorner3.CornerRadius = UDim.new(0.2, 0)
                UICorner3.Parent = Section
                
                local TitleLabel = Instance.new("TextLabel")
                TitleLabel.Name = "Title"
                TitleLabel.Parent = Section
                TitleLabel.BackgroundTransparency = 1
                TitleLabel.Position = UDim2.new(0.05, 0, 0, 0)
                TitleLabel.Size = UDim2.new(0.95, 0, 1, 0)
                TitleLabel.Font = Enum.Font.GothamBold
                TitleLabel.Text = title
                TitleLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
                TitleLabel.TextSize = 14
                TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
                
                local Elements = Instance.new("Frame")
                Elements.Name = "Elements"
                Elements.Parent = Section
                Elements.BackgroundTransparency = 1
                Elements.Position = UDim2.new(0, 0, 0, 30)
                Elements.Size = UDim2.new(1, 0, 0, 0)
                
                local UIListLayout4 = Instance.new("UIListLayout")
                UIListLayout4.Parent = Elements
                UIListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout4.Padding = UDim.new(0, 5)
                
                local elements = {}
                
                function elements:CreateButton(name, description, callback)
                    local ButtonFrame = Instance.new("Frame")
                    ButtonFrame.Name = name
                    ButtonFrame.Parent = Elements
                    ButtonFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                    ButtonFrame.Size = UDim2.new(1, 0, 0, 53)
                    
                    local UICorner4 = Instance.new("UICorner")
                    UICorner4.CornerRadius = UDim.new(0.2, 0)
                    UICorner4.Parent = ButtonFrame
                    
                    local Title = Instance.new("TextLabel")
                    Title.Name = "Title"
                    Title.Parent = ButtonFrame
                    Title.BackgroundTransparency = 1
                    Title.Position = UDim2.new(0.05, 0, 0.06, 0)
                    Title.Size = UDim2.new(0.6, 0, 0.3, 0)
                    Title.Font = Enum.Font.GothamBold
                    Title.Text = name
                    Title.TextColor3 = Color3.fromRGB(230, 230, 230)
                    Title.TextSize = 14
                    Title.TextXAlignment = Enum.TextXAlignment.Left
                    
                    local Desc = Instance.new("TextLabel")
                    Desc.Name = "Description"
                    Desc.Parent = ButtonFrame
                    Desc.BackgroundTransparency = 1
                    Desc.Position = UDim2.new(0.05, 0, 0.32, 0)
                    Desc.Size = UDim2.new(0.6, 0, 0.6, 0)
                    Desc.Font = Enum.Font.GothamSemibold
                    Desc.Text = description or ""
                    Desc.TextColor3 = Color3.fromRGB(153, 153, 153)
                    Desc.TextSize = 14
                    Desc.TextWrapped = true
                    Desc.TextXAlignment = Enum.TextXAlignment.Left
                    Desc.TextYAlignment = Enum.TextYAlignment.Top
                    
                    local Icon = Instance.new("ImageLabel")
                    Icon.Name = "Icon"
                    Icon.Parent = ButtonFrame
                    Icon.AnchorPoint = Vector2.new(1, 0.5)
                    Icon.BackgroundTransparency = 1
                    Icon.Position = UDim2.new(1, -10, 0.5, 0)
                    Icon.Size = UDim2.new(0, 20, 0, 20)
                    Icon.Image = "rbxassetid://10734898355"
                    
                    local Button = Instance.new("TextButton")
                    Button.Name = "Button"
                    Button.Parent = ButtonFrame
                    Button.BackgroundTransparency = 1
                    Button.Size = UDim2.new(1, 0, 1, 0)
                    Button.Text = ""
                    
                    Button.MouseButton1Click:Connect(function()
                        RippleEffect(Button)
                        if callback then
                            callback()
                        end
                    end)
                    
                    return ButtonFrame
                end
                
                function elements:CreateToggle(name, description, default, callback)
                    local ToggleFrame = Instance.new("Frame")
                    ToggleFrame.Name = name
                    ToggleFrame.Parent = Elements
                    ToggleFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                    ToggleFrame.Size = UDim2.new(1, 0, 0, 53)
                    
                    local UICorner4 = Instance.new("UICorner")
                    UICorner4.CornerRadius = UDim.new(0.2, 0)
                    UICorner4.Parent = ToggleFrame
                    
                    local Title = Instance.new("TextLabel")
                    Title.Name = "Title"
                    Title.Parent = ToggleFrame
                    Title.BackgroundTransparency = 1
                    Title.Position = UDim2.new(0.05, 0, 0.06, 0)
                    Title.Size = UDim2.new(0.6, 0, 0.3, 0)
                    Title.Font = Enum.Font.GothamBold
                    Title.Text = name
                    Title.TextColor3 = Color3.fromRGB(230, 230, 230)
                    Title.TextSize = 14
                    Title.TextXAlignment = Enum.TextXAlignment.Left
                    
                    local Desc = Instance.new("TextLabel")
                    Desc.Name = "Description"
                    Desc.Parent = ToggleFrame
                    Desc.BackgroundTransparency = 1
                    Desc.Position = UDim2.new(0.05, 0, 0.32, 0)
                    Desc.Size = UDim2.new(0.6, 0, 0.6, 0)
                    Desc.Font = Enum.Font.GothamSemibold
                    Desc.Text = description or ""
                    Desc.TextColor3 = Color3.fromRGB(153, 153, 153)
                    Desc.TextSize = 14
                    Desc.TextWrapped = true
                    Desc.TextXAlignment = Enum.TextXAlignment.Left
                    Desc.TextYAlignment = Enum.TextYAlignment.Top
                    
                    local ToggleSwitch = Instance.new("Frame")
                    ToggleSwitch.Name = "ToggleSwitch"
                    ToggleSwitch.Parent = ToggleFrame
                    ToggleSwitch.AnchorPoint = Vector2.new(1, 0.5)
                    ToggleSwitch.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    ToggleSwitch.Position = UDim2.new(1, -10, 0.5, 0)
                    ToggleSwitch.Size = UDim2.new(0, 35, 0, 15)
                    
                    local UICorner5 = Instance.new("UICorner")
                    UICorner5.CornerRadius = UDim.new(0.4, 0)
                    UICorner5.Parent = ToggleSwitch
                    
                    local ToggleButton = Instance.new("Frame")
                    ToggleButton.Name = "ToggleButton"
                    ToggleButton.Parent = ToggleSwitch
                    ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ToggleButton.Position = UDim2.new(-0.01, 0, -0.07, 0)
                    ToggleButton.Size = UDim2.new(0, 18, 0, 18)
                    
                    local UICorner6 = Instance.new("UICorner")
                    UICorner6.CornerRadius = UDim.new(1, 0)
                    UICorner6.Parent = ToggleButton
                    
                    local Button = Instance.new("TextButton")
                    Button.Name = "Button"
                    Button.Parent = ToggleFrame
                    Button.BackgroundTransparency = 1
                    Button.Size = UDim2.new(1, 0, 1, 0)
                    Button.Text = ""
                    
                    local isToggled = default or false
                    
                    local function updateToggle()
                        if isToggled then
                            TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
                                Position = UDim2.new(0.5, 0, -0.07, 0),
                                BackgroundColor3 = Color3.fromRGB(70, 130, 180)
                            }):Play()
                        else
                            TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
                                Position = UDim2.new(-0.01, 0, -0.07, 0),
                                BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            }):Play()
                        end
                    end
                    
                    updateToggle()
                    
                    Button.MouseButton1Click:Connect(function()
                        isToggled = not isToggled
                        updateToggle()
                        if callback then
                            callback(isToggled)
                        end
                    end)
                    
                    local toggle = {}
                    
                    function toggle:Set(value)
                        isToggled = value
                        updateToggle()
                        if callback then
                            callback(isToggled)
                        end
                    end
                    
                    function toggle:Get()
                        return isToggled
                    end
                    
                    return toggle
                end
                
                function elements:CreateSlider(name, description, min, max, default, callback)
                    local SliderFrame = Instance.new("Frame")
                    SliderFrame.Name = name
                    SliderFrame.Parent = Elements
                    SliderFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                    SliderFrame.Size = UDim2.new(1, 0, 0, 44)
                    
                    local UICorner4 = Instance.new("UICorner")
                    UICorner4.CornerRadius = UDim.new(0.2, 0)
                    UICorner4.Parent = SliderFrame
                    
                    local Title = Instance.new("TextLabel")
                    Title.Name = "Title"
                    Title.Parent = SliderFrame
                    Title.BackgroundTransparency = 1
                    Title.Position = UDim2.new(0.05, 0, 0.17, 0)
                    Title.Size = UDim2.new(0.4, 0, 0.3, 0)
                    Title.Font = Enum.Font.GothamBold
                    Title.Text = name
                    Title.TextColor3 = Color3.fromRGB(230, 230, 230)
                    Title.TextSize = 14
                    Title.TextXAlignment = Enum.TextXAlignment.Left
                    
                    local SliderBar = Instance.new("Frame")
                    SliderBar.Name = "SliderBar"
                    SliderBar.Parent = SliderFrame
                    SliderBar.AnchorPoint = Vector2.new(0.5, 0.5)
                    SliderBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    SliderBar.Position = UDim2.new(0.58, 0, 0.5, 0)
                    SliderBar.Size = UDim2.new(0, 177, 0, 15)
                    
                    local UICorner5 = Instance.new("UICorner")
                    UICorner5.CornerRadius = UDim.new(0.4, 0)
                    UICorner5.Parent = SliderBar
                    
                    local
