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
