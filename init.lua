local EyeUI = {}

function EyeUI:CreateWindow(config)
    local defaultConfig = {
        title = "EyeUI",
        size = UDim2.new(0, 600, 0, 400),
        position = UDim2.new(0.3, 0, 0.3, 0),
        tabWidth = 150,
        accentColor = Color3.fromRGB(0, 120, 215)
    }
    
    config = setmetatable(config or {}, {__index = defaultConfig})

    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local TopBar = Instance.new("Frame")
    local TabContainer = Instance.new("Frame")
    local ContentContainer = Instance.new("Frame")
    
    ScreenGui.Name = "EyeUI"
    ScreenGui.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = config.position
    MainFrame.Size = config.size
    MainFrame.Active = true
    MainFrame.Draggable = true

    TopBar.Name = "TopBar"
    TopBar.Parent = MainFrame
    TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TopBar.BorderSizePixel = 0
    TopBar.Size = UDim2.new(1, 0, 0, 40)

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Parent = TopBar
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0.05, 0, 0, 0)
    TitleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    TitleLabel.Font = Enum.Font.GothamSemibold
    TitleLabel.Text = config.title
    TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
    TitleLabel.TextSize = 14
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local CloseButton = Instance.new("TextButton")
    CloseButton.Parent = TopBar
    CloseButton.BackgroundTransparency = 1
    CloseButton.Position = UDim2.new(0.95, -30, 0.5, -10)
    CloseButton.Size = UDim2.new(0, 20, 0, 20)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    CloseButton.TextSize = 14
    CloseButton.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    TabContainer.Name = "TabContainer"
    TabContainer.Parent = MainFrame
    TabContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TabContainer.BorderSizePixel = 0
    TabContainer.Position = UDim2.new(0, 0, 0, 40)
    TabContainer.Size = UDim2.new(0, config.tabWidth, 1, -40)

    ContentContainer.Name = "ContentContainer"
    ContentContainer.Parent = MainFrame
    ContentContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    ContentContainer.BorderSizePixel = 0
    ContentContainer.Position = UDim2.new(0, config.tabWidth, 0, 40)
    ContentContainer.Size = UDim2.new(1, -config.tabWidth, 1, -40)

    local tabs = {}
    local currentTab = nil

    local function CreateTab(tabName)
        local tabButton = Instance.new("TextButton")
        local tabContent = Instance.new("ScrollingFrame")
        local contentLayout = Instance.new("UIListLayout")
        
        tabButton.Name = tabName
        tabButton.Parent = TabContainer
        tabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        tabButton.BorderSizePixel = 0
        tabButton.Size = UDim2.new(1, 0, 0, 40)
        tabButton.Font = Enum.Font.Gotham
        tabButton.Text = "  "..tabName
        tabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
        tabButton.TextSize = 12
        tabButton.TextXAlignment = Enum.TextXAlignment.Left
        
        tabContent.Name = tabName.."Content"
        tabContent.Parent = ContentContainer
        tabContent.BackgroundTransparency = 1
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        tabContent.ScrollBarThickness = 4
        tabContent.ScrollBarImageColor3 = config.accentColor
        tabContent.Visible = false
        
        contentLayout.Parent = tabContent
        contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        contentLayout.Padding = UDim.new(0, 5)
        contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            tabContent.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 10)
        end)
        
        tabButton.MouseButton1Click:Connect(function()
            if currentTab then
                currentTab.button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                currentTab.content.Visible = false
            end
            tabButton.BackgroundColor3 = config.accentColor
            tabContent.Visible = true
            currentTab = {button = tabButton, content = tabContent}
        end)
        
        if #tabs == 0 then
            tabButton.BackgroundColor3 = config.accentColor
            tabContent.Visible = true
            currentTab = {button = tabButton, content = tabContent}
        end
        
        local tabAPI = {
            Content = tabContent,
            Button = tabButton,
            AddElement = function(self, element)
                element.Parent = tabContent
                return element
            end
        }
        
        table.insert(tabs, tabAPI)
        return tabAPI
    end

    return {
        Main = MainFrame,
        CreateTab = CreateTab,
        Destroy = function() ScreenGui:Destroy() end
    }
end

return EyeUI
