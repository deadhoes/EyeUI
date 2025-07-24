local EyeHub = {}

function EyeHub:CreateWindow(title)
    local gui = Instance.new("ScreenGui")
    gui.Name = "EyeHub"
    gui.Parent = game:GetService("CoreGui")
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local main = Instance.new("Frame")
    main.Name = "Main"
    main.Parent = gui
    main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    main.BorderSizePixel = 0
    main.ClipsDescendants = true
    main.Position = UDim2.new(0.3, 0, 0.2, 0)
    main.Size = UDim2.new(0, 683, 0, 452)

    local elements = Instance.new("Frame")
    elements.Name = "Elements"
    elements.Parent = main
    elements.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    elements.BackgroundTransparency = 0.5
    elements.BorderSizePixel = 0
    elements.Position = UDim2.new(0.011, 0, 0.084, 0)
    elements.Size = UDim2.new(0.977, 0, 0.893, 0)
    elements.ZIndex = 2

    local tabs = Instance.new("Frame")
    tabs.Name = "Tabs"
    tabs.Parent = main
    tabs.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    tabs.BackgroundTransparency = 0.5
    tabs.BorderSizePixel = 0
    tabs.Position = UDim2.new(0.011, 0, 0.084, 0)
    tabs.Size = UDim2.new(0.23, 0, 0.893, 0)
    tabs.ZIndex = 2

    local scroll = Instance.new("ScrollingFrame")
    scroll.Parent = elements
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel = 0
    scroll.Position = UDim2.new(0.221, 0, 0, 0)
    scroll.Size = UDim2.new(0, 528, 0, 394)
    scroll.ScrollBarThickness = 13

    local list = Instance.new("UIListLayout")
    list.Parent = scroll
    list.HorizontalAlignment = Enum.HorizontalAlignment.Center
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 10)

    local tabList = Instance.new("UIListLayout")
    tabList.Parent = tabs
    tabList.SortOrder = Enum.SortOrder.LayoutOrder
    tabList.Padding = UDim.new(0, 2)

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = main
    titleLabel.BackgroundTransparency = 1
    titleLabel.BorderSizePixel = 0
    titleLabel.Position = UDim2.new(0.024, 0, 0, 0)
    titleLabel.Size = UDim2.new(0, 658, 0, 37)
    titleLabel.Font = Enum.Font.Gotham
    titleLabel.Text = title or "EyeHub"
    titleLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
    titleLabel.TextSize = 14
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local closeBtn = Instance.new("ImageButton")
    closeBtn.Parent = main
    closeBtn.BackgroundTransparency = 1
    closeBtn.BorderSizePixel = 0
    closeBtn.Position = UDim2.new(0.959, 0, 0.018, 0)
    closeBtn.Size = UDim2.new(0, 20, 0, 20)
    closeBtn.Image = "rbxassetid://2777727756"
    closeBtn.MouseButton1Click:Connect(function() gui:Destroy() end)

    local window = {}
    
    function window:CreateTab(name)
        local tab = Instance.new("TextButton")
        tab.Name = name
        tab.Parent = tabs
        tab.BackgroundTransparency = 1
        tab.Size = UDim2.new(0, 172, 0, 26)
        tab.Font = Enum.Font.Gotham
        tab.Text = name
        tab.TextColor3 = Color3.fromRGB(230, 230, 230)
        tab.TextSize = 14
        
        local tabContent = Instance.new("Frame")
        tabContent.Name = name.."_Content"
        tabContent.Parent = scroll
        tabContent.BackgroundTransparency = 1
        tabContent.Size = UDim2.new(1, 0, 0, 0)
        tabContent.Visible = false
        
        tab.MouseButton1Click:Connect(function()
            for _, child in ipairs(scroll:GetChildren()) do
                if child:IsA("Frame") and child.Name:match("_Content") then
                    child.Visible = false
                end
            end
            tabContent.Visible = true
        end)
        
        if #tabs:GetChildren() == 1 then
            tabContent.Visible = true
        end
        
        local tabElements = {}
        
        function tabElements:CreateSection(name)
            local section = Instance.new("Frame")
            section.Parent = tabContent
            section.BackgroundTransparency = 1
            section.Size = UDim2.new(0, 483, 0, 31)
            
            local label = Instance.new("TextLabel")
            label.Parent = section
            label.BackgroundTransparency = 1
            label.Size = UDim2.new(0, 476, 0, 18)
            label.Font = Enum.Font.Gotham
            label.Text = name
            label.TextColor3 = Color3.fromRGB(230, 230, 230)
            label.TextSize = 14
            label.TextXAlignment = Enum.TextXAlignment.Left
            
            return section
        end
        
        function tabElements:CreateButton(text, callback)
            local button = Instance.new("Frame")
            button.Parent = tabContent
            button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            button.Size = UDim2.new(0, 483, 0, 31)
            
            local label = Instance.new("TextLabel")
            label.Parent = button
            label.BackgroundTransparency = 1
            label.Position = UDim2.new(0.039, 0, 0, 0)
            label.Size = UDim2.new(0, 200, 0, 29)
            label.Font = Enum.Font.Gotham
            label.Text = text
            label.TextColor3 = Color3.fromRGB(230, 230, 230)
            label.TextSize = 14
            label.TextXAlignment = Enum.TextXAlignment.Left
            
            local btn = Instance.new("TextButton")
            btn.Parent = button
            btn.BackgroundTransparency = 1
            btn.Size = UDim2.new(1, 0, 1, 0)
            btn.Text = ""
            btn.MouseButton1Click:Connect(callback)
            
            return button
        end
        
        function tabElements:CreateToggle(text, default, callback)
            local toggle = Instance.new("Frame")
            toggle.Parent = tabContent
            toggle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            toggle.Size = UDim2.new(0, 483, 0, 31)
            
            local label = Instance.new("TextLabel")
            label.Parent = toggle
            label.BackgroundTransparency = 1
            label.Position = UDim2.new(0.039, 0, 0, 0)
            label.Size = UDim2.new(0, 200, 0, 29)
            label.Font = Enum.Font.Gotham
            label.Text = text
            label.TextColor3 = Color3.fromRGB(230, 230, 230)
            label.TextSize = 14
            label.TextXAlignment = Enum.TextXAlignment.Left
            
            local switch = Instance.new("Frame")
            switch.Parent = toggle
            switch.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            switch.Position = UDim2.new(0.896, 0, 0.29, 0)
            switch.Size = UDim2.new(0, 37, 0, 14)
            
            local btn = Instance.new("Frame")
            btn.Parent = switch
            btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            btn.Position = UDim2.new(-0.022, 0, -0.014, 0)
            btn.Size = UDim2.new(0, 14, 0, 12)
            
            local state = default or false
            local interact = Instance.new("TextButton")
            interact.Parent = switch
            interact.BackgroundTransparency = 1
            interact.Size = UDim2.new(1, 0, 1, 0)
            interact.Text = ""
            
            local function update()
                if state then
                    btn.Position = UDim2.new(0.5, 0, -0.014, 0)
                    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                else
                    btn.Position = UDim2.new(-0.022, 0, -0.014, 0)
                    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                end
                callback(state)
            end
            
            interact.MouseButton1Click:Connect(function()
                state = not state
                update()
            end)
            
            update()
            
            return toggle
        end
        
        function tabElements:CreateSlider(text, min, max, default, callback)
            local sliderFrame = Instance.new("Frame")
            sliderFrame.Parent = tabContent
            sliderFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            sliderFrame.Size = UDim2.new(0, 483, 0, 31)
            
            local label = Instance.new("TextLabel")
            label.Parent = sliderFrame
            label.BackgroundTransparency = 1
            label.Position = UDim2.new(0.039, 0, 0, 0)
            label.Size = UDim2.new(0, 200, 0, 29)
            label.Font = Enum.Font.Gotham
            label.Text = text
            label.TextColor3 = Color3.fromRGB(230, 230, 230)
            label.TextSize = 14
            label.TextXAlignment = Enum.TextXAlignment.Left
            
            local slider = Instance.new("Frame")
            slider.Parent = sliderFrame
            slider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            slider.Position = UDim2.new(0.638, 0, 0.419, 0)
            slider.Size = UDim2.new(0, 162, 0, 8)
            
            local fill = Instance.new("Frame")
            fill.Parent = slider
            fill.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            fill.Size = UDim2.new(0, 90, 0, 8)
            
            local interact = Instance.new("TextButton")
            interact.Parent = slider
            interact.BackgroundTransparency = 1
            interact.Size = UDim2.new(1, 0, 1, 0)
            interact.Text = ""
            
            local value = default or min
            local dragging = false
            
            local function update()
                local ratio = (value - min) / (max - min)
                fill.Size = UDim2.new(ratio, 0, 1, 0)
                callback(value)
            end
            
            interact.MouseButton1Down:Connect(function()
                dragging = true
            end)
            
            game:GetService("UserInputService").InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
            
            game:GetService("UserInputService").InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local pos = slider.AbsolutePosition.X
                    local size = slider.AbsoluteSize.X
                    local x = math.clamp(input.Position.X - pos, 0, size)
                    value = math.floor(min + (max - min) * (x / size))
                    update()
                end
            end)
            
            update()
            
            return sliderFrame
        end
        
        function tabElements:CreateInput(text, placeholder, callback)
            local input = Instance.new("Frame")
            input.Parent = tabContent
            input.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            input.Size = UDim2.new(0, 483, 0, 31)
            
            local label = Instance.new("TextLabel")
            label.Parent = input
            label.BackgroundTransparency = 1
            label.Position = UDim2.new(0.039, 0, 0, 0)
            label.Size = UDim2.new(0, 200, 0, 29)
            label.Font = Enum.Font.Gotham
            label.Text = text
            label.TextColor3 = Color3.fromRGB(230, 230, 230)
            label.TextSize = 14
            label.TextXAlignment = Enum.TextXAlignment.Left
            
            local box = Instance.new("TextBox")
            box.Parent = input
            box.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            box.Position = UDim2.new(0.617, 0, 0.194, 0)
            box.Size = UDim2.new(0, 171, 0, 18)
            box.Font = Enum.Font.Code
            box.PlaceholderText = placeholder or "..."
            box.Text = ""
            box.TextColor3 = Color3.fromRGB(230, 230, 230)
            box.TextSize = 14
            
            box.FocusLost:Connect(function()
                callback(box.Text)
            end)
            
            return input
        end
        
        function tabElements:CreateKeybind(text, default, callback)
            local keybind = Instance.new("Frame")
            keybind.Parent = tabContent
            keybind.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            keybind.Size = UDim2.new(0, 483, 0, 31)
            
            local label = Instance.new("TextLabel")
            label.Parent = keybind
            label.BackgroundTransparency = 1
            label.Position = UDim2.new(0.039, 0, 0, 0)
            label.Size = UDim2.new(0, 200, 0, 29)
            label.Font = Enum.Font.Gotham
            label.Text = text
            label.TextColor3 = Color3.fromRGB(230, 230, 230)
            label.TextSize = 14
            label.TextXAlignment = Enum.TextXAlignment.Left
            
            local box = Instance.new("TextBox")
            box.Parent = keybind
            box.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            box.Position = UDim2.new(0.909, 0, 0.194, 0)
            box.Size = UDim2.new(0, 30, 0, 18)
            box.Font = Enum.Font.Code
            box.PlaceholderText = "..."
            box.Text = default or ""
            box.TextColor3 = Color3.fromRGB(230, 230, 230)
            box.TextSize = 14
            
            local listening = false
            
            box.MouseButton1Click:Connect(function()
                listening = true
                box.Text = "..."
            end)
            
            game:GetService("UserInputService").InputBegan:Connect(function(input)
                if listening and input.UserInputType == Enum.UserInputType.Keyboard then
                    local key = input.KeyCode.Name
                    box.Text = key
                    callback(key)
                    listening = false
                end
            end)
            
            return keybind
        end
        
        function tabElements:CreateDivider()
            local divider = Instance.new("Frame")
            divider.Parent = tabContent
            divider.BackgroundTransparency = 1
            divider.Size = UDim2.new(1, 0, 0, 20)
            
            local line = Instance.new("Frame")
            line.Parent = divider
            line.AnchorPoint = Vector2.new(0.5, 0.5)
            line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            line.BackgroundTransparency = 0.85
            line.Position = UDim2.new(0.505, 0, 0.5, 0)
            line.Size = UDim2.new(1.039, -50, 0, 2)
            
            return divider
        end
        
        function tabElements:CreateLabel(text)
            local labelFrame = Instance.new("Frame")
            labelFrame.Parent = tabContent
            labelFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            labelFrame.Size = UDim2.new(0.975, -10, 0, 35)
            
            local label = Instance.new("TextLabel")
            label.Parent = labelFrame
            label.BackgroundTransparency = 1
            label.Position = UDim2.new(0.014, 15, 0.5, 0)
            label.Size = UDim2.new(0, 441, 0, 14)
            label.Font = Enum.Font.Gotham
            label.Text = text
            label.TextColor3 = Color3.fromRGB(240, 240, 240)
            label.TextSize = 14
            label.TextXAlignment = Enum.TextXAlignment.Left
            
            return labelFrame
        end
        
        return tabElements
    end
    
    return window
end

return EyeHub
