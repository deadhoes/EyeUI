-- EyeUI Library - Modern & Smooth UI Library
-- Version: 4.0 Basic
-- Created by: EyeUI Team

local EyeUI = {}
EyeUI.__index = EyeUI

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")

-- Local Player
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Utility Functions
local function CreateTween(object, info, properties)
    local tween = TweenService:Create(object, info, properties)
    tween:Play()
    return tween
end

local function CreateSound(id, volume, pitch)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. id
    sound.Volume = volume or 0.5
    sound.Pitch = pitch or 1
    sound.Parent = SoundService
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
    return sound
end

local function MakeDraggable(frame, dragFrame)
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    dragFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            CreateTween(frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = frame.Size + UDim2.new(0, 4, 0, 4)
            })
        end
    end)
    
    dragFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and dragging then
            dragging = false
            CreateTween(frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = frame.Size - UDim2.new(0, 4, 0, 4)
            })
        end
    end)
end

-- Main Library
function EyeUI:CreateWindow(config)
    local Window = {}
    Window.Tabs = {}
    Window.CurrentTab = nil
    
    -- Default Configuration
    config = config or {}
    config.Name = config.Name or "EyeUI"
    config.Description = config.Description or "Modern UI Library"
    config.Icon = config.Icon or "rbxassetid://10709770005"
    config.Size = config.Size or UDim2.new(0, 580, 0, 400)
    config.Position = config.Position or UDim2.new(0.5, -290, 0.5, -200)
    config.Theme = config.Theme or "Dark"
    
    -- Create Main GUI
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "EyeUI_" .. config.Name
    ScreenGui.Parent = PlayerGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    
    -- Main Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = config.Position
    MainFrame.Size = config.Size
    MainFrame.ClipsDescendants = true
    
    -- Corner Radius
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame
    
    -- Shadow Effect
    local Shadow = Instance.new("Frame")
    Shadow.Name = "Shadow"
    Shadow.Parent = ScreenGui
    Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.BackgroundTransparency = 0.7
    Shadow.BorderSizePixel = 0
    Shadow.Position = UDim2.new(0.5, 2, 0.5, 2)
    Shadow.Size = config.Size + UDim2.new(0, 20, 0, 20)
    Shadow.ZIndex = -1
    
    local ShadowCorner = Instance.new("UICorner")
    ShadowCorner.CornerRadius = UDim.new(0, 16)
    ShadowCorner.Parent = Shadow
    
    -- Top Bar
    local TopBar = Instance.new("Frame")
    TopBar.Name = "TopBar"
    TopBar.Parent = MainFrame
    TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TopBar.BorderSizePixel = 0
    TopBar.Size = UDim2.new(1, 0, 0, 50)
    
    local TopBarCorner = Instance.new("UICorner")
    TopBarCorner.CornerRadius = UDim.new(0, 12)
    TopBarCorner.Parent = TopBar
    
    -- Top Bar Bottom Cover
    local TopBarCover = Instance.new("Frame")
    TopBarCover.Name = "Cover"
    TopBarCover.Parent = TopBar
    TopBarCover.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TopBarCover.BorderSizePixel = 0
    TopBarCover.Position = UDim2.new(0, 0, 0.5, 0)
    TopBarCover.Size = UDim2.new(1, 0, 0.5, 0)
    
    -- Icon
    local Icon = Instance.new("ImageLabel")
    Icon.Name = "Icon"
    Icon.Parent = TopBar
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0, 15, 0.5, -12)
    Icon.Size = UDim2.new(0, 24, 0, 24)
    Icon.Image = config.Icon
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = TopBar
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 50, 0, 8)
    Title.Size = UDim2.new(0, 200, 0, 20)
    Title.Font = Enum.Font.GothamBold
    Title.Text = config.Name
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 16
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Description
    local Description = Instance.new("TextLabel")
    Description.Name = "Description"
    Description.Parent = TopBar
    Description.BackgroundTransparency = 1
    Description.Position = UDim2.new(0, 50, 0, 26)
    Description.Size = UDim2.new(0, 200, 0, 16)
    Description.Font = Enum.Font.Gotham
    Description.Text = config.Description
    Description.TextColor3 = Color3.fromRGB(150, 150, 150)
    Description.TextSize = 12
    Description.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Close Button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = TopBar
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
    CloseButton.BorderSizePixel = 0
    CloseButton.Position = UDim2.new(1, -35, 0.5, -10)
    CloseButton.Size = UDim2.new(0, 20, 0, 20)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "×"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 14
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 10)
    CloseCorner.Parent = CloseButton
    
    -- Minimize Button
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Parent = TopBar
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 200, 70)
    MinimizeButton.BorderSizePixel = 0
    MinimizeButton.Position = UDim2.new(1, -60, 0.5, -10)
    MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Text = "—"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.TextSize = 14
    
    local MinimizeCorner = Instance.new("UICorner")
    MinimizeCorner.CornerRadius = UDim.new(0, 10)
    MinimizeCorner.Parent = MinimizeButton
    
    -- Tab Container
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = MainFrame
    TabContainer.BackgroundTransparency = 1
    TabContainer.Position = UDim2.new(0, 0, 0, 50)
    TabContainer.Size = UDim2.new(0, 150, 1, -50)
    
    -- Tab List
    local TabList = Instance.new("ScrollingFrame")
    TabList.Name = "TabList"
    TabList.Parent = TabContainer
    TabList.BackgroundTransparency = 1
    TabList.BorderSizePixel = 0
    TabList.Position = UDim2.new(0, 10, 0, 10)
    TabList.Size = UDim2.new(1, -20, 1, -20)
    TabList.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabList.ScrollBarThickness = 4
    TabList.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
    
    local TabListLayout = Instance.new("UIListLayout")
    TabListLayout.Parent = TabList
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 5)
    
    -- Content Container
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Parent = MainFrame
    ContentContainer.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    ContentContainer.BorderSizePixel = 0
    ContentContainer.Position = UDim2.new(0, 150, 0, 50)
    ContentContainer.Size = UDim2.new(1, -150, 1, -50)
    
    local ContentCorner = Instance.new("UICorner")
    ContentCorner.CornerRadius = UDim.new(0, 8)
    ContentCorner.Parent = ContentContainer
    
    -- Make window draggable
    MakeDraggable(MainFrame, TopBar)
    
    -- Button Effects
    local function AddButtonEffects(button)
        button.MouseEnter:Connect(function()
            CreateTween(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                BackgroundTransparency = 0.7
            })
        end)
        
        button.MouseLeave:Connect(function()
            CreateTween(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                BackgroundTransparency = 0
            })
        end)
        
        button.MouseButton1Down:Connect(function()
            CreateTween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
                Size = button.Size - UDim2.new(0, 2, 0, 2)
            })
        end)
        
        button.MouseButton1Up:Connect(function()
            CreateTween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
                Size = button.Size + UDim2.new(0, 2, 0, 2)
            })
        end)
    end
    
    AddButtonEffects(CloseButton)
    AddButtonEffects(MinimizeButton)
    
    -- Window Functions
    local isMinimized = false
    local originalSize = config.Size
    
    CloseButton.MouseButton1Click:Connect(function()
        CreateSound(131961136, 0.3, 1.2)
        CreateTween(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = config.Position + UDim2.new(0, originalSize.X.Offset/2, 0, originalSize.Y.Offset/2)
        })
        CreateTween(Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1
        })
        wait(0.3)
        ScreenGui:Destroy()
    end)
    
    MinimizeButton.MouseButton1Click:Connect(function()
        CreateSound(131961136, 0.2, 1.5)
        if not isMinimized then
            CreateTween(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0, originalSize.X.Offset, 0, 50)
            })
            CreateTween(Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0, originalSize.X.Offset + 20, 0, 70)
            })
            MinimizeButton.Text = "+"
            isMinimized = true
        else
            CreateTween(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Size = originalSize
            })
            CreateTween(Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Size = originalSize + UDim2.new(0, 20, 0, 20)
            })
            MinimizeButton.Text = "—"
            isMinimized = false
        end
    end)
    
    -- Tab System
    function Window:CreateTab(config)
        local Tab = {}
        
        config = config or {}
        config.Name = config.Name or "Tab"
        config.Icon = config.Icon or "rbxassetid://10723407389"
        
        -- Tab Button
        local TabButton = Instance.new("TextButton")
        TabButton.Name = "TabButton_" .. config.Name
        TabButton.Parent = TabList
        TabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        TabButton.BorderSizePixel = 0
        TabButton.Size = UDim2.new(1, 0, 0, 40)
        TabButton.Font = Enum.Font.Gotham
        TabButton.Text = ""
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 14
        
        local TabButtonCorner = Instance.new("UICorner")
        TabButtonCorner.CornerRadius = UDim.new(0, 8)
        TabButtonCorner.Parent = TabButton
        
        -- Tab Icon
        local TabIcon = Instance.new("ImageLabel")
        TabIcon.Name = "TabIcon"
        TabIcon.Parent = TabButton
        TabIcon.BackgroundTransparency = 1
        TabIcon.Position = UDim2.new(0, 10, 0.5, -8)
        TabIcon.Size = UDim2.new(0, 16, 0, 16)
        TabIcon.Image = config.Icon
        TabIcon.ImageColor3 = Color3.fromRGB(200, 200, 200)
        
        -- Tab Label
        local TabLabel = Instance.new("TextLabel")
        TabLabel.Name = "TabLabel"
        TabLabel.Parent = TabButton
        TabLabel.BackgroundTransparency = 1
        TabLabel.Position = UDim2.new(0, 35, 0, 0)
        TabLabel.Size = UDim2.new(1, -40, 1, 0)
        TabLabel.Font = Enum.Font.Gotham
        TabLabel.Text = config.Name
        TabLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        TabLabel.TextSize = 14
        TabLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Tab Content
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Name = "TabContent_" .. config.Name
        TabContent.Parent = ContentContainer
        TabContent.BackgroundTransparency = 1
        TabContent.BorderSizePixel = 0
        TabContent.Position = UDim2.new(0, 10, 0, 10)
        TabContent.Size = UDim2.new(1, -20, 1, -20)
        TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        TabContent.ScrollBarThickness = 4
        TabContent.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
        TabContent.Visible = false
        
        local TabContentLayout = Instance.new("UIListLayout")
        TabContentLayout.Parent = TabContent
        TabContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        TabContentLayout.Padding = UDim.new(0, 10)
        
        -- Tab Selection
        local function SelectTab()
            -- Deselect all tabs
            for _, tab in pairs(Window.Tabs) do
                tab.Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                tab.Icon.ImageColor3 = Color3.fromRGB(200, 200, 200)
                tab.Label.TextColor3 = Color3.fromRGB(200, 200, 200)
                tab.Content.Visible = false
            end
            
            -- Select this tab
            CreateTween(TabButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                BackgroundColor3 = Color3.fromRGB(70, 130, 255)
            })
            CreateTween(TabIcon, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                ImageColor3 = Color3.fromRGB(255, 255, 255)
            })
            CreateTween(TabLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            })
            
            TabContent.Visible = true
            Window.CurrentTab = Tab
            
            CreateSound(131961136, 0.1, 2)
        end
        
        TabButton.MouseButton1Click:Connect(SelectTab)
        
        -- Tab hover effects
        TabButton.MouseEnter:Connect(function()
            if Window.CurrentTab ~= Tab then
                CreateTween(TabButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                    BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                })
            end
        end)
        
        TabButton.MouseLeave:Connect(function()
            if Window.CurrentTab ~= Tab then
                CreateTween(TabButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                    BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                })
            end
        end)
        
        -- Store tab data
        Tab.Button = TabButton
        Tab.Icon = TabIcon
        Tab.Label = TabLabel
        Tab.Content = TabContent
        Tab.Layout = TabContentLayout
        
        Window.Tabs[#Window.Tabs + 1] = Tab
        
        -- Auto-select first tab
        if #Window.Tabs == 1 then
            SelectTab()
        end
        
        -- Update canvas size
        TabList.CanvasSize = UDim2.new(0, 0, 0, TabListLayout.AbsoluteContentSize.Y)
        
        return Tab
    end
    
    return Window
end

return EyeUI
