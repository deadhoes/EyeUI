local EyeUI = {}

function EyeUI:CreateWindow(config)
    -- Default configuration
    local defaultConfig = {
        title = "EyeUI",
        subtitle = "subtitle",
        icon = "rbxassetid://10747364761", -- Default eye icon
        size = UDim2.new(0, 626, 0, 414),
        position = UDim2.new(0.3, 0, 0.3, 0), -- Centered position
        closeIcon = "rbxassetid://10747384394",
        showIcon = true -- Added to control icon visibility
    }
    
    -- Merge user config with defaults
    config = setmetatable(config or {}, {__index = defaultConfig})

    -- Create main GUI elements
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Topbar = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local TextLabel = Instance.new("TextLabel")
    local TextLabel_2 = Instance.new("TextLabel")
    local ImageLabel = Instance.new("ImageLabel")
    local TextButton = Instance.new("TextButton")
    local ImageLabel_2 = Instance.new("ImageLabel")

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

    Topbar.Name = "Topbar"
    Topbar.Parent = Frame
    Topbar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Topbar.BorderSizePixel = 0
    Topbar.Size = UDim2.new(1, 0, 0, 50)

    UICorner_2.CornerRadius = UDim.new(1, 0)
    UICorner_2.Parent = Topbar

    -- Calculate positions based on icon visibility
    local titleXPosition = config.showIcon and 0.08 or 0.022
    local subtitleXPosition = config.showIcon and 0.08 or 0.022

    -- Title
    TextLabel.Parent = Topbar
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(titleXPosition, 0, -0.14, 0)
    TextLabel.Size = UDim2.new(0, 416, 0, 50)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.Text = config.title
    TextLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
    TextLabel.TextSize = 14.000
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- Subtitle
    TextLabel_2.Parent = Topbar
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.BackgroundTransparency = 1.000
    TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_2.BorderSizePixel = 0
    TextLabel_2.Position = UDim2.new(subtitleXPosition, 0, 0.12, 0)
    TextLabel_2.Size = UDim2.new(0, 416, 0, 50)
    TextLabel_2.Font = Enum.Font.GothamBold
    TextLabel_2.Text = config.subtitle
    TextLabel_2.TextColor3 = Color3.fromRGB(200, 200, 200)
    TextLabel_2.TextSize = 12.000
    TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

    -- Icon (only shown if showIcon is true)
    ImageLabel.Parent = Topbar
    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel.BackgroundTransparency = 1.000
    ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageLabel.BorderSizePixel = 0
    ImageLabel.Position = UDim2.new(0.022, 0, 0.22, 0)
    ImageLabel.Size = UDim2.new(0, 25, 0, 25)
    ImageLabel.Image = config.icon
    ImageLabel.Visible = config.showIcon
    ImageLabel.Name = "WindowIcon"

    -- Close button
    TextButton.Parent = Topbar
    TextButton.BackgroundColor3 = Color3.fromRGB(84, 75, 75)
    TextButton.BackgroundTransparency = 1.000
    TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.BorderSizePixel = 0
    TextButton.Position = UDim2.new(0.929, 0, 0, 0)
    TextButton.Size = UDim2.new(0, 32, 0, 50)
    TextButton.Font = Enum.Font.SourceSans
    TextButton.Text = ""
    TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.TextSize = 14.000

    ImageLabel_2.Parent = TextButton
    ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_2.BackgroundTransparency = 1.000
    ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageLabel_2.BorderSizePixel = 0
    ImageLabel_2.Position = UDim2.new(0.246, 0, 0.203, 0)
    ImageLabel_2.Size = UDim2.new(0, 23, 0, 23)
    ImageLabel_2.Image = config.closeIcon

    -- Close button functionality
    TextButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Return the window and its components
    return {
        Main = Frame,
        Topbar = Topbar,
        Title = TextLabel,
        Subtitle = TextLabel_2,
        Icon = ImageLabel,
        CloseButton = TextButton,
        Destroy = function()
            ScreenGui:Destroy()
        end,
        
        -- Methods to update properties
        SetTitle = function(self, newTitle)
            TextLabel.Text = newTitle
        end,
        
        SetSubtitle = function(self, newSubtitle)
            TextLabel_2.Text = newSubtitle
        end,
        
        SetIcon = function(self, newIconId, visible)
            visible = visible == nil and true or visible
            ImageLabel.Image = newIconId
            ImageLabel.Visible = visible
            
            -- Adjust text positions based on icon visibility
            local newTitleX = visible and 0.08 or 0.022
            local newSubtitleX = visible and 0.08 or 0.022
            
            TextLabel.Position = UDim2.new(newTitleX, 0, TextLabel.Position.Y.Scale, TextLabel.Position.Y.Offset)
            TextLabel_2.Position = UDim2.new(newSubtitleX, 0, TextLabel_2.Position.Y.Scale, TextLabel_2.Position.Y.Offset)
        end
    }
end

return EyeUI
