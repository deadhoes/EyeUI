-- Gui to Lua
-- Version: 3.2

-- Instances:

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
local Home = Instance.new("Frame")
local ImageLabel_2 = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local Extra = Instance.new("Frame")
local ImageLabel_3 = Instance.new("ImageLabel")
local TextLabel_2 = Instance.new("TextLabel")
local Folder = Instance.new("Folder")
local Frame = Instance.new("Frame")
local Elements = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local UIListLayout_2 = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
local Title_2 = Instance.new("TextLabel")
local Toggle = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local Title_3 = Instance.new("TextLabel")
local ToggleSwitch = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local ToggleButton = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local Description_2 = Instance.new("TextLabel")
local Slider = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local Title_4 = Instance.new("TextLabel")
local SliderBar = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local SliderFill = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local SliderHandle = Instance.new("Frame")
local UICorner_10 = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")
local UICorner_11 = Instance.new("UICorner")
local Input = Instance.new("Frame")
local UICorner_12 = Instance.new("UICorner")
local Title_5 = Instance.new("TextLabel")
local Description_3 = Instance.new("TextLabel")
local TextBox_2 = Instance.new("TextBox")
local UICorner_13 = Instance.new("UICorner")
local Button = Instance.new("Frame")
local UICorner_14 = Instance.new("UICorner")
local Title_6 = Instance.new("TextLabel")
local Description_4 = Instance.new("TextLabel")
local ImageLabel_4 = Instance.new("ImageLabel")
local Interact = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Menu.Name = "Menu"
Menu.Parent = ScreenGui
Menu.AnchorPoint = Vector2.new(0.5, 0.5)
Menu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Menu.
Menu.BorderColor3 = Color3.fromRGB(0, 0, 0)
Menu.BorderSizePixel = 0
Menu.Position = UDim2.new(0.472140759, 0, 0.431551486, 0)
Menu.Size = UDim2.new(0, 580, 0, 390)

Topbar.Name = "Topbar"
Topbar.Parent = Menu

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
Title.Text = "Eye UI"
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
Description.Text = "worst ui ever"
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

Home.Name = "Home"
Home.Parent = Tabs
Home.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Home.BackgroundTransparency = 1.000
Home.BorderColor3 = Color3.fromRGB(0, 0, 0)
Home.BorderSizePixel = 0
Home.Position = UDim2.new(-3.00369862e-08, 0, 0, 0)
Home.Size = UDim2.new(0, 127, 0, 48)

ImageLabel_2.Parent = Home
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_2.BackgroundTransparency = 1.000
ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_2.BorderSizePixel = 0
ImageLabel_2.Position = UDim2.new(0.144427419, 0, 0.221702576, 0)
ImageLabel_2.Size = UDim2.new(0, 25, 0, 25)
ImageLabel_2.Image = "rbxassetid://10734966248"

TextLabel.Parent = Home
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.413412273, 0, 0.0416666679, 0)
TextLabel.Size = UDim2.new(0, 82, 0, 44)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "Main"
TextLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
TextLabel.TextSize = 14.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

Extra.Name = "Extra"
Extra.Parent = Tabs
Extra.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Extra.BackgroundTransparency = 1.000
Extra.BorderColor3 = Color3.fromRGB(0, 0, 0)
Extra.BorderSizePixel = 0
Extra.Position = UDim2.new(-3.00369862e-08, 0, 0, 0)
Extra.Size = UDim2.new(0, 127, 0, 48)

ImageLabel_3.Parent = Extra
ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_3.BackgroundTransparency = 1.000
ImageLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_3.BorderSizePixel = 0
ImageLabel_3.Position = UDim2.new(0.144427419, 0, 0.221702576, 0)
ImageLabel_3.Size = UDim2.new(0, 25, 0, 25)
ImageLabel_3.Image = "rbxassetid://10734976528"
ImageLabel_3.ImageColor3 = Color3.fromRGB(150, 150, 150)

TextLabel_2.Parent = Extra
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.413412273, 0, 0.0416666679, 0)
TextLabel_2.Size = UDim2.new(0, 82, 0, 44)
TextLabel_2.Font = Enum.Font.GothamBold
TextLabel_2.Text = "Extra"
TextLabel_2.TextColor3 = Color3.fromRGB(150, 150, 150)
TextLabel_2.TextSize = 14.000
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

Folder.Parent = Tabs

Frame.Parent = Folder
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0629921257, 0, 0.0206489675, 0)
Frame.Size = UDim2.new(0, 3, 0, 33)

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

Title_2.Name = "Title"
Title_2.Parent = Elements
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title_2.BorderSizePixel = 0
Title_2.Position = UDim2.new(0, 0, -0.289120018, 0)
Title_2.Size = UDim2.new(0, 419, 0, 25)
Title_2.Font = Enum.Font.GothamBold
Title_2.Text = "Section Example"
Title_2.TextColor3 = Color3.fromRGB(230, 230, 230)
Title_2.TextSize = 14.000

Toggle.Name = "Toggle"
Toggle.Parent = Elements
Toggle.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle.BorderSizePixel = 0
Toggle.Position = UDim2.new(0, 0, 0.404934764, 0)
Toggle.Size = UDim2.new(0, 420, 0, 53)

UICorner_4.CornerRadius = UDim.new(0.200000003, 0)
UICorner_4.Parent = Toggle

Title_3.Name = "Title"
Title_3.Parent = Toggle
Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_3.BackgroundTransparency = 1.000
Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title_3.BorderSizePixel = 0
Title_3.Position = UDim2.new(0.0487804599, 0, 0.0570333228, 0)
Title_3.Size = UDim2.new(0, 200, 0, 30)
Title_3.Font = Enum.Font.GothamBold
Title_3.Text = "Enable Feature"
Title_3.TextColor3 = Color3.fromRGB(230, 230, 230)
Title_3.TextSize = 14.000
Title_3.TextXAlignment = Enum.TextXAlignment.Left

ToggleSwitch.Name = "ToggleSwitch"
ToggleSwitch.Parent = Toggle
ToggleSwitch.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ToggleSwitch.BorderColor3 = Color3.fromRGB(0, 0, 0)
ToggleSwitch.BorderSizePixel = 0
ToggleSwitch.Position = UDim2.new(0.842343211, 0, 0.318181813, 0)
ToggleSwitch.Size = UDim2.new(0, 42, 0, 15)

UICorner_5.CornerRadius = UDim.new(0.400000006, 0)
UICorner_5.Parent = ToggleSwitch

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ToggleSwitch
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(-0.00775024435, 0, -0.0666666701, 0)
ToggleButton.Size = UDim2.new(0, 18, 0, 18)

UICorner_6.CornerRadius = UDim.new(1, 0)
UICorner_6.Parent = ToggleButton

Description_2.Name = "Description"
Description_2.Parent = Toggle
Description_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Description_2.BackgroundTransparency = 1.000
Description_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Description_2.BorderSizePixel = 0
Description_2.Position = UDim2.new(0.0463995077, 0, 0.301886797, 0)
Description_2.Size = UDim2.new(0, 200, 0, 30)
Description_2.Font = Enum.Font.GothamBold
Description_2.Text = "Toggle to enable or disable the feature"
Description_2.TextColor3 = Color3.fromRGB(153, 153, 153)
Description_2.TextSize = 14.000
Description_2.TextXAlignment = Enum.TextXAlignment.Left

Slider.Name = "Slider"
Slider.Parent = Elements
Slider.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
Slider.BorderSizePixel = 0
Slider.Position = UDim2.new(0, 0, 0.404934764, 0)
Slider.Size = UDim2.new(0, 420, 0, 44)

UICorner_7.CornerRadius = UDim.new(0.200000003, 0)
UICorner_7.Parent = Slider

Title_4.Name = "Title"
Title_4.Parent = Slider
Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_4.BackgroundTransparency = 1.000
Title_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title_4.BorderSizePixel = 0
Title_4.Position = UDim2.new(0.0487804599, 0, 0.170240223, 0)
Title_4.Size = UDim2.new(0, 200, 0, 30)
Title_4.Font = Enum.Font.GothamBold
Title_4.Text = "Set Speed"
Title_4.TextColor3 = Color3.fromRGB(230, 230, 230)
Title_4.TextSize = 14.000
Title_4.TextXAlignment = Enum.TextXAlignment.Left

SliderBar.Name = "SliderBar"
SliderBar.Parent = Slider
SliderBar.AnchorPoint = Vector2.new(0.5, 0.5)
SliderBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SliderBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
SliderBar.BorderSizePixel = 0
SliderBar.Position = UDim2.new(0.584289372, 0, 0.5, 0)
SliderBar.Size = UDim2.new(0, 177, 0, 15)

UICorner_8.CornerRadius = UDim.new(0.400000006, 0)
UICorner_8.Parent = SliderBar

SliderFill.Name = "SliderFill"
SliderFill.Parent = SliderBar
SliderFill.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
SliderFill.BorderColor3 = Color3.fromRGB(0, 0, 0)
SliderFill.BorderSizePixel = 0
SliderFill.Position = UDim2.new(0.00121609005, 0, -0.0151509605, 0)
SliderFill.Size = UDim2.new(0, 32, 0, 15)

UICorner_9.CornerRadius = UDim.new(0.400000006, 0)
UICorner_9.Parent = SliderFill

SliderHandle.Name = "SliderHandle"
SliderHandle.Parent = SliderBar
SliderHandle.AnchorPoint = Vector2.new(0.0500000007, 0.0500000007)
SliderHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderHandle.BorderColor3 = Color3.fromRGB(0, 0, 0)
SliderHandle.BorderSizePixel = 0
SliderHandle.Position = UDim2.new(0.0551425368, 0, -0.190263465, 0)
SliderHandle.Size = UDim2.new(0, 23, 0, 23)

UICorner_10.CornerRadius = UDim.new(1, 0)
UICorner_10.Parent = SliderHandle

TextBox.Parent = Slider
TextBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.852177501, 0, 0.120497271, 0)
TextBox.Size = UDim2.new(0, 49, 0, 34)
TextBox.Font = Enum.Font.GothamBold
TextBox.PlaceholderText = "25"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(230, 230, 230)
TextBox.TextSize = 14.000

UICorner_11.CornerRadius = UDim.new(0.200000003, 0)
UICorner_11.Parent = TextBox

Input.Name = "Input"
Input.Parent = Elements
Input.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
Input.BorderSizePixel = 0
Input.Position = UDim2.new(3.61582693e-08, 0, 0, 0)
Input.Size = UDim2.new(0, 420, 0, 53)

UICorner_12.CornerRadius = UDim.new(0.200000003, 0)
UICorner_12.Parent = Input

Title_5.Name = "Title"
Title_5.Parent = Input
Title_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_5.BackgroundTransparency = 1.000
Title_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title_5.BorderSizePixel = 0
Title_5.Position = UDim2.new(0.048780486, 0, 0.0566037744, 0)
Title_5.Size = UDim2.new(0, 200, 0, 30)
Title_5.Font = Enum.Font.GothamBold
Title_5.Text = "Input Text"
Title_5.TextColor3 = Color3.fromRGB(230, 230, 230)
Title_5.TextSize = 14.000
Title_5.TextXAlignment = Enum.TextXAlignment.Left

Description_3.Name = "Description"
Description_3.Parent = Input
Description_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Description_3.BackgroundTransparency = 1.000
Description_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Description_3.BorderSizePixel = 0
Description_3.Position = UDim2.new(0.048780486, 0, 0.320754707, 0)
Description_3.Size = UDim2.new(0, 200, 0, 30)
Description_3.Font = Enum.Font.GothamBold
Description_3.Text = "Type something here"
Description_3.TextColor3 = Color3.fromRGB(153, 153, 153)
Description_3.TextSize = 14.000
Description_3.TextXAlignment = Enum.TextXAlignment.Left

TextBox_2.Parent = Input
TextBox_2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TextBox_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox_2.BorderSizePixel = 0
TextBox_2.Position = UDim2.new(0.673159838, 0, 0.169811323, 0)
TextBox_2.Size = UDim2.new(0, 122, 0, 34)
TextBox_2.Font = Enum.Font.GothamBold
TextBox_2.PlaceholderText = "Enter value"
TextBox_2.Text = ""
TextBox_2.TextColor3 = Color3.fromRGB(230, 230, 230)
TextBox_2.TextSize = 14.000

UICorner_13.CornerRadius = UDim.new(0.200000003, 0)
UICorner_13.Parent = TextBox_2

Button.Name = "Button"
Button.Parent = Elements
Button.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(0, 0, 0.362776011, 0)
Button.Size = UDim2.new(0, 420, 0, 53)

UICorner_14.CornerRadius = UDim.new(0.200000003, 0)
UICorner_14.Parent = Button

Title_6.Name = "Title"
Title_6.Parent = Button
Title_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_6.BackgroundTransparency = 1.000
Title_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title_6.BorderSizePixel = 0
Title_6.Position = UDim2.new(0.048780486, 0, 0.0566037744, 0)
Title_6.Size = UDim2.new(0, 200, 0, 30)
Title_6.Font = Enum.Font.GothamBold
Title_6.Text = "Run Action"
Title_6.TextColor3 = Color3.fromRGB(230, 230, 230)
Title_6.TextSize = 14.000
Title_6.TextXAlignment = Enum.TextXAlignment.Left

Description_4.Name = "Description"
Description_4.Parent = Button
Description_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Description_4.BackgroundTransparency = 1.000
Description_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Description_4.BorderSizePixel = 0
Description_4.Position = UDim2.new(0.048780486, 0, 0.320754707, 0)
Description_4.Size = UDim2.new(0, 200, 0, 30)
Description_4.Font = Enum.Font.GothamBold
Description_4.Text = "Click to perform something"
Description_4.TextColor3 = Color3.fromRGB(153, 153, 153)
Description_4.TextSize = 14.000
Description_4.TextXAlignment = Enum.TextXAlignment.Left

ImageLabel_4.Parent = Button
ImageLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_4.BackgroundTransparency = 1.000
ImageLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_4.BorderSizePixel = 0
ImageLabel_4.Position = UDim2.new(0.922207296, 0, 0.308760732, 0)
ImageLabel_4.Size = UDim2.new(0, 20, 0, 20)
ImageLabel_4.Image = "rbxassetid://10734898355"

Interact.Name = "Interact"
Interact.Parent = Button
Interact.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Interact.BackgroundTransparency = 1.000
Interact.BorderColor3 = Color3.fromRGB(0, 0, 0)
Interact.BorderSizePixel = 0
Interact.Position = UDim2.new(3.63304515e-08, 0, 0, 0)
Interact.Size = UDim2.new(0, 419, 0, 50)
Interact.Font = Enum.Font.SourceSans
Interact.Text = ""
Interact.TextColor3 = Color3.fromRGB(0, 0, 0)
Interact.TextSize = 14.000

-- Scripts:

local function XLXIIX_fake_script() -- Close.LocalScript 
	local script = Instance.new('LocalScript', Close)

	local closeButton = script.Parent
	local window = closeButton.Parent.Parent
	
	closeButton.MouseButton1Click:Connect(function()
		window:Destroy()
	end)
	
end
coroutine.wrap(XLXIIX_fake_script)()
local function HFJI_fake_script() -- Menu.Dragify 
	local script = Instance.new('LocalScript', Menu)

	--This script has been modified by MetaliumWorks (@jgfuhjkkl_2) [mw/ʍɯ]
	
	local UIS = game:GetService("UserInputService")
	function dragify(Frame)
	    dragToggle = nil
	    dragSpeed = 0.25
	    dragInput = nil
	    dragStart = nil
	    dragPos = nil
	    function updateInput(input)
	        Delta = input.Position - dragStart
	        Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
	        game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.20, Enum.EasingStyle.Back), {Position = Position}):Play()
	    end
	    Frame.InputBegan:Connect(function(input)
	        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
	            dragToggle = true
	            dragStart = input.Position
	            startPos = Frame.Position
	            input.Changed:Connect(function()
	                if input.UserInputState == Enum.UserInputState.End then
	                    dragToggle = false
	                end
	            end)
	        end
	    end)
	    Frame.InputChanged:Connect(function(input)
	        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
	            dragInput = input
	        end
	    end)
	    game:GetService("UserInputService").InputChanged:Connect(function(input)
	        if input == dragInput and dragToggle then
	            updateInput(input)
	        end
	    end)
	end
	
	dragify(script.Parent)
end
coroutine.wrap(HFJI_fake_script)()
