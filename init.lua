local EyeUI = {}

function EyeUI:CreateWindow(config)
    -- Default configuration
    local defaultConfig = {
        title = "EyeUI",
        subtitle = "subtitle",
        icon = "rbxassetid://10747364761",
        closeIcon = "rbxassetid://10747384394",
        tabIcon = "rbxassetid://10734895856",
        size = UDim2.new(0, 511, 0, 337),
        position = UDim2.new(0.007, 0, 0.224, 0),
        accentColor = Color3.fromRGB(0, 120, 215)
    }
    
    -- Merge user config with defaults
    config = setmetatable(config or {}, {__index = defaultConfig})

    -- Create main UI elements
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local TopBar = Instance.new("Frame")
    local TabContainer = Instance.new("Frame")
    local ContentContainer = Instance.new("Frame")
    
    -- Setup ScreenGui
    ScreenGui.Name = "EyeUI"
    ScreenGui.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Main Window Frame
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = config.position
    MainFrame.Size = config.size
    MainFrame.Active = true
    MainFrame.Draggable = true

    -- Add rounded corners
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.02, 8)
    corner.Parent = MainFrame

    -- Top Bar
    TopBar.Name = "TopBar"
    TopBar.Parent = MainFrame
    TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    TopBar.BorderSizePixel = 0
    TopBar.Size = UDim2.new(1, 0, 0, 50)

    -- Title
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Parent = TopBar
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0.092, 0, -0.14, 0)
    TitleLabel.Size = UDim2.new(0, 416, 0, 50)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = config.title
    TitleLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
    TitleLabel.TextSize = 14
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- Subtitle
    local SubtitleLabel = Instance.new("TextLabel")
    SubtitleLabel.Parent = TopBar
    SubtitleLabel.BackgroundTransparency = 1
    SubtitleLabel.Position = UDim2.new(0.092, 0, 0.12, 0)
    SubtitleLabel.Size = UDim2.new(0, 416, 0, 50)
    SubtitleLabel.Font = Enum.Font.GothamBold
    SubtitleLabel.Text = config.subtitle
    SubtitleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    SubtitleLabel.TextSize = 12
    SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- Icon
    local IconImage = Instance.new("ImageLabel")
    IconImage.Parent = TopBar
    IconImage.BackgroundTransparency = 1
    IconImage.Position = UDim2.new(0.022, 0, 0.22, 0)
    IconImage.Size = UDim2.new(0, 25, 0, 25)
    IconImage.Image = config.icon

    -- Close Button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Parent = TopBar
    CloseButton.BackgroundTransparency = 1
    CloseButton.Position = UDim2.new(0.929, 0, 0, 0)
    CloseButton.Size = UDim2.new(0, 36, 0, 50)
    CloseButton.Text = ""

    local CloseIcon = Instance.new("ImageLabel")
    CloseIcon.Parent = CloseButton
    CloseIcon.BackgroundTransparency = 1
    CloseIcon.Position = UDim2.new(0.135, 0, 0.263, 0)
    CloseIcon.Size = UDim2.new(0, 23, 0, 23)
    CloseIcon.Image = config.closeIcon

    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Tab System
    TabContainer.Name = "Tabs"
    TabContainer.Parent = MainFrame
    TabContainer.BackgroundTransparency = 1
    TabContainer.Position = UDim2.new(0, 0, 0.135, 0)
    TabContainer.Size = UDim2.new(0, 139, 0, 287)

    local TabListLayout = Instance.new("UIListLayout")
    TabListLayout.Parent = TabContainer
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 5)

    ContentContainer.Name = "Content"
    ContentContainer.Parent = MainFrame
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.Position = UDim2.new(0, 139, 0.135, 0)
    ContentContainer.Size = UDim2.new(1, -139, 0, 287)

    -- Tab management
    local tabs = {}
    local currentTab = nil

    local function CreateTab(tabName)
        local tabButton = Instance.new("Frame")
        local tabText = Instance.new("TextLabel")
        local tabIcon = Instance.new("ImageLabel")
        local tabContent = Instance.new("Frame")
        
        -- Tab Button
        tabButton.Name = tabName
        tabButton.Parent = TabContainer
        tabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        tabButton.BackgroundTransparency = 0.9
        tabButton.Size = UDim2.new(1, 0, 0, 29)
        
        -- Tab Icon
        tabIcon.Parent = tabButton
        tabIcon.BackgroundTransparency = 1
        tabIcon.Position = UDim2.new(0.115, 0, 0.135, 0)
        tabIcon.Size = UDim2.new(0, 20, 0, 20)
        tabIcon.Image = config.tabIcon
        
        -- Tab Text
        tabText.Parent = tabButton
        tabText.BackgroundTransparency = 1
        tabText.Position = UDim2.new(0.334, 0, 0.239, 0)
        tabText.Size = UDim2.new(0, 79, 0, 14)
        tabText.Font = Enum.Font.GothamBold
        tabText.Text = tabName
        tabText.TextColor3 = Color3.fromRGB(230, 230, 230)
        tabText.TextSize = 12
        tabText.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Tab Content
        tabContent.Name = tabName.."Content"
        tabContent.Parent = ContentContainer
        tabContent.BackgroundTransparency = 1
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.Visible = false
        
        -- Tab selection
        tabButton.MouseButton1Click:Connect(function()
            if currentTab then
                currentTab.button.BackgroundTransparency = 0.9
                currentTab.content.Visible = false
            end
            
            tabButton.BackgroundTransparency = 0.8
            tabContent.Visible = true
            
            currentTab = {
                button = tabButton,
                content = tabContent
            }
        end)
        
        -- Select first tab
        if #tabs == 0 then
            tabButton.BackgroundTransparency = 0.8
            tabContent.Visible = true
            currentTab = {
                button = tabButton,
                content = tabContent
            }
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
        Destroy = function()
            ScreenGui:Destroy()
        end
    }
end

return EyeUI
