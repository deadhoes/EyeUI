-- Gui to Lua
-- Version: 3.2

-- Instances:

local Eye = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Elements = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local Pattern = Instance.new("ImageLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
local Section = Instance.new("Frame")
local label = Instance.new("TextLabel")
local UIGradient_2 = Instance.new("UIGradient")
local Input = Instance.new("Frame")
local label_2 = Instance.new("TextLabel")
local interact = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")
local UIGradient_3 = Instance.new("UIGradient")
local Button = Instance.new("Frame")
local label_3 = Instance.new("TextLabel")
local interact_2 = Instance.new("TextButton")
local type = Instance.new("TextLabel")
local UIGradient_4 = Instance.new("UIGradient")
local Toggle = Instance.new("Frame")
local label_4 = Instance.new("TextLabel")
local Switch = Instance.new("Frame")
local Button_2 = Instance.new("Frame")
local interact_3 = Instance.new("TextButton")
local UIGradient_5 = Instance.new("UIGradient")
local Slider = Instance.new("Frame")
local label_5 = Instance.new("TextLabel")
local slider = Instance.new("Frame")
local mankey = Instance.new("Frame")
local interact_4 = Instance.new("TextButton")
local UIGradient_6 = Instance.new("UIGradient")
local Keybind = Instance.new("Frame")
local label_6 = Instance.new("TextLabel")
local interact_5 = Instance.new("TextButton")
local TextBox_2 = Instance.new("TextBox")
local UIGradient_7 = Instance.new("UIGradient")
local Divider = Instance.new("Frame")
local Divider_2 = Instance.new("Frame")
local UIGradient_8 = Instance.new("UIGradient")
local Paragraph = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Content = Instance.new("TextLabel")
local Buffer = Instance.new("Frame")
local Buffer_2 = Instance.new("Frame")
local UIGradient_9 = Instance.new("UIGradient")
local Label = Instance.new("Frame")
local Title_2 = Instance.new("TextLabel")
local Icon = Instance.new("ImageLabel")
local UIGradient_10 = Instance.new("UIGradient")
local Tabs = Instance.new("Frame")
local UIGradient_11 = Instance.new("UIGradient")
local UIListLayout_2 = Instance.new("UIListLayout")
local Selected = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Selected_2 = Instance.new("Frame")
local TextLabel_2 = Instance.new("TextLabel")
local Label_2 = Instance.new("TextLabel")
local hide = Instance.new("ImageButton")

--Properties:

Eye.Name = "Eye"
Eye.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Eye.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = Eye
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Position = UDim2.new(0, 353, 0, 216)
Main.Size = UDim2.new(0, 683, 0, 452)

Elements.Name = "Elements"
Elements.Parent = Main
Elements.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Elements.BackgroundTransparency = 0.500
Elements.BorderColor3 = Color3.fromRGB(0, 0, 0)
Elements.BorderSizePixel = 0
Elements.ClipsDescendants = true
Elements.Position = UDim2.new(0.0112690283, 0, 0.0843886286, 0)
Elements.Size = UDim2.new(0.97706306, 0, 0.892794132, 0)
Elements.ZIndex = 2

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(207, 207, 207))}
UIGradient.Rotation = 90
UIGradient.Parent = Elements

Pattern.Name = "Pattern"
Pattern.Parent = Elements
Pattern.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Pattern.BackgroundTransparency = 1.000
Pattern.BorderColor3 = Color3.fromRGB(0, 0, 0)
Pattern.BorderSizePixel = 0
Pattern.Position = UDim2.new(-0.0176015031, 0, -0.353956819, 0)
Pattern.Size = UDim2.new(1.03699994, 0, 1.93499994, 0)
Pattern.Image = "http://www.roblox.com/asset/?id=306565057"
Pattern.ImageTransparency = 0.650
Pattern.ScaleType = Enum.ScaleType.Fit
Pattern.TileSize = UDim2.new(0.600000024, 0, 0.899999976, 0)

ScrollingFrame.Parent = Elements
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.220654145, 0, 3.78120575e-08, 0)
ScrollingFrame.Size = UDim2.new(0, 528, 0, 394)
ScrollingFrame.BottomImage = ""
ScrollingFrame.MidImage = ""
ScrollingFrame.ScrollBarThickness = 13
ScrollingFrame.TopImage = ""

UIListLayout.Parent = ScrollingFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

UIPadding.Parent = ScrollingFrame
UIPadding.PaddingTop = UDim.new(0, 15)

Section.Name = "Section"
Section.Parent = ScrollingFrame
Section.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Section.BackgroundTransparency = 1.000
Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
Section.BorderSizePixel = 0
Section.Position = UDim2.new(0.0246062987, 0, -0.0105610145, 0)
Section.Size = UDim2.new(0, 483, 0, 31)

label.Name = "label"
label.Parent = Section
label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1.000
label.BorderColor3 = Color3.fromRGB(0, 0, 0)
label.BorderSizePixel = 0
label.Position = UDim2.new(0, 0, 0.354838699, 0)
label.Size = UDim2.new(0, 476, 0, 18)
label.Font = Enum.Font.Unknown
label.Text = "section bro"
label.TextColor3 = Color3.fromRGB(230, 230, 230)
label.TextSize = 14.000
label.TextXAlignment = Enum.TextXAlignment.Left

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(207, 207, 207))}
UIGradient_2.Rotation = 90
UIGradient_2.Parent = Section

Input.Name = "Input"
Input.Parent = ScrollingFrame
Input.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
Input.BorderSizePixel = 0
Input.Position = UDim2.new(0.0246062987, 0, -0.0105610145, 0)
Input.Size = UDim2.new(0, 483, 0, 31)

label_2.Name = "label"
label_2.Parent = Input
label_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
label_2.BackgroundTransparency = 1.000
label_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
label_2.BorderSizePixel = 0
label_2.Position = UDim2.new(0.0393374749, 0, 0, 0)
label_2.Size = UDim2.new(0, 200, 0, 29)
label_2.Font = Enum.Font.Unknown
label_2.Text = "type for input"
label_2.TextColor3 = Color3.fromRGB(230, 230, 230)
label_2.TextSize = 14.000
label_2.TextXAlignment = Enum.TextXAlignment.Left

interact.Name = "interact"
interact.Parent = Input
interact.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
interact.BackgroundTransparency = 1.000
interact.BorderColor3 = Color3.fromRGB(0, 0, 0)
interact.BorderSizePixel = 0
interact.Size = UDim2.new(0, 483, 0, 31)
interact.Font = Enum.Font.SourceSans
interact.Text = ""
interact.TextColor3 = Color3.fromRGB(0, 0, 0)
interact.TextSize = 14.000

TextBox.Parent = Input
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.616977215, 0, 0.193548381, 0)
TextBox.Size = UDim2.new(0, 171, 0, 18)
TextBox.Font = Enum.Font.Code
TextBox.PlaceholderText = "..."
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(230, 230, 230)
TextBox.TextSize = 14.000

UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(207, 207, 207))}
UIGradient_3.Rotation = 90
UIGradient_3.Parent = Input

Button.Name = "Button"
Button.Parent = ScrollingFrame
Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(0.0246062987, 0, -0.0105610145, 0)
Button.Size = UDim2.new(0, 483, 0, 31)

label_3.Name = "label"
label_3.Parent = Button
label_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
label_3.BackgroundTransparency = 1.000
label_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
label_3.BorderSizePixel = 0
label_3.Position = UDim2.new(0.0393374749, 0, 0, 0)
label_3.Size = UDim2.new(0, 200, 0, 29)
label_3.Font = Enum.Font.Unknown
label_3.Text = "click me pls"
label_3.TextColor3 = Color3.fromRGB(230, 230, 230)
label_3.TextSize = 14.000
label_3.TextXAlignment = Enum.TextXAlignment.Left

interact_2.Name = "interact"
interact_2.Parent = Button
interact_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
interact_2.BackgroundTransparency = 1.000
interact_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
interact_2.BorderSizePixel = 0
interact_2.Size = UDim2.new(0, 483, 0, 31)
interact_2.Font = Enum.Font.SourceSans
interact_2.Text = ""
interact_2.TextColor3 = Color3.fromRGB(0, 0, 0)
interact_2.TextSize = 14.000

type.Name = "type"
type.Parent = Button
type.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
type.BackgroundTransparency = 1.000
type.BorderColor3 = Color3.fromRGB(0, 0, 0)
type.BorderSizePixel = 0
type.Position = UDim2.new(0.571428597, 0, 0.0645161271, 0)
type.Size = UDim2.new(0, 194, 0, 29)
type.Font = Enum.Font.Unknown
type.Text = "button"
type.TextColor3 = Color3.fromRGB(200, 200, 200)
type.TextSize = 10.000
type.TextWrapped = true
type.TextXAlignment = Enum.TextXAlignment.Right

UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(207, 207, 207))}
UIGradient_4.Rotation = 90
UIGradient_4.Parent = Button

Toggle.Name = "Toggle"
Toggle.Parent = ScrollingFrame
Toggle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle.BorderSizePixel = 0
Toggle.Position = UDim2.new(0.0246062987, 0, -0.0105610145, 0)
Toggle.Size = UDim2.new(0, 483, 0, 31)

label_4.Name = "label"
label_4.Parent = Toggle
label_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
label_4.BackgroundTransparency = 1.000
label_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
label_4.BorderSizePixel = 0
label_4.Position = UDim2.new(0.0393374749, 0, 0, 0)
label_4.Size = UDim2.new(0, 200, 0, 29)
label_4.Font = Enum.Font.Unknown
label_4.Text = "toggle me bro"
label_4.TextColor3 = Color3.fromRGB(230, 230, 230)
label_4.TextSize = 14.000
label_4.TextXAlignment = Enum.TextXAlignment.Left

Switch.Name = "Switch"
Switch.Parent = Toggle
Switch.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Switch.BorderColor3 = Color3.fromRGB(0, 0, 0)
Switch.BorderSizePixel = 0
Switch.Position = UDim2.new(0.896480322, 0, 0.290322572, 0)
Switch.Size = UDim2.new(0, 37, 0, 14)

Button_2.Name = "Button"
Button_2.Parent = Switch
Button_2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Button_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Button_2.BorderSizePixel = 0
Button_2.Position = UDim2.new(-0.0224378426, 0, -0.014033, 0)
Button_2.Size = UDim2.new(0, 14, 0, 12)

interact_3.Name = "interact"
interact_3.Parent = Switch
interact_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
interact_3.BackgroundTransparency = 1.000
interact_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
interact_3.BorderSizePixel = 0
interact_3.Position = UDim2.new(-11.7027025, 0, -0.642857134, 0)
interact_3.Size = UDim2.new(0, 483, 0, 31)
interact_3.Font = Enum.Font.SourceSans
interact_3.Text = ""
interact_3.TextColor3 = Color3.fromRGB(0, 0, 0)
interact_3.TextSize = 14.000

UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(207, 207, 207))}
UIGradient_5.Rotation = 90
UIGradient_5.Parent = Toggle

Slider.Name = "Slider"
Slider.Parent = ScrollingFrame
Slider.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
Slider.BorderSizePixel = 0
Slider.Position = UDim2.new(0.0246062987, 0, -0.0105610145, 0)
Slider.Size = UDim2.new(0, 483, 0, 31)

label_5.Name = "label"
label_5.Parent = Slider
label_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
label_5.BackgroundTransparency = 1.000
label_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
label_5.BorderSizePixel = 0
label_5.Position = UDim2.new(0.0393374749, 0, 0, 0)
label_5.Size = UDim2.new(0, 200, 0, 29)
label_5.Font = Enum.Font.Unknown
label_5.Text = "slide me to value"
label_5.TextColor3 = Color3.fromRGB(230, 230, 230)
label_5.TextSize = 14.000
label_5.TextXAlignment = Enum.TextXAlignment.Left

slider.Name = "slider"
slider.Parent = Slider
slider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
slider.BorderSizePixel = 0
slider.Position = UDim2.new(0.637681186, 0, 0.419354826, 0)
slider.Size = UDim2.new(0, 162, 0, 8)

mankey.Name = "mankey"
mankey.Parent = slider
mankey.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mankey.BorderColor3 = Color3.fromRGB(0, 0, 0)
mankey.BorderSizePixel = 0
mankey.Position = UDim2.new(-0.0224379543, 0, -0.0140457153, 0)
mankey.Size = UDim2.new(0, 90, 0, 8)

interact_4.Name = "interact"
interact_4.Parent = slider
interact_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
interact_4.BackgroundTransparency = 1.000
interact_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
interact_4.BorderSizePixel = 0
interact_4.Position = UDim2.new(-1.90875769, 0, -1.625, 0)
interact_4.Size = UDim2.new(0, 484, 0, 31)
interact_4.Font = Enum.Font.SourceSans
interact_4.Text = ""
interact_4.TextColor3 = Color3.fromRGB(0, 0, 0)
interact_4.TextSize = 14.000

UIGradient_6.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(207, 207, 207))}
UIGradient_6.Rotation = 90
UIGradient_6.Parent = Slider

Keybind.Name = "Keybind"
Keybind.Parent = ScrollingFrame
Keybind.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keybind.BorderSizePixel = 0
Keybind.Position = UDim2.new(0.0246062987, 0, -0.0105610145, 0)
Keybind.Size = UDim2.new(0, 483, 0, 31)

label_6.Name = "label"
label_6.Parent = Keybind
label_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
label_6.BackgroundTransparency = 1.000
label_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
label_6.BorderSizePixel = 0
label_6.Position = UDim2.new(0.0393374749, 0, 0, 0)
label_6.Size = UDim2.new(0, 200, 0, 29)
label_6.Font = Enum.Font.Unknown
label_6.Text = "keybind"
label_6.TextColor3 = Color3.fromRGB(230, 230, 230)
label_6.TextSize = 14.000
label_6.TextXAlignment = Enum.TextXAlignment.Left

interact_5.Name = "interact"
interact_5.Parent = Keybind
interact_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
interact_5.BackgroundTransparency = 1.000
interact_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
interact_5.BorderSizePixel = 0
interact_5.Size = UDim2.new(0, 483, 0, 31)
interact_5.Font = Enum.Font.SourceSans
interact_5.Text = ""
interact_5.TextColor3 = Color3.fromRGB(0, 0, 0)
interact_5.TextSize = 14.000

TextBox_2.Parent = Keybind
TextBox_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox_2.BorderSizePixel = 0
TextBox_2.Position = UDim2.new(0.908902705, 0, 0.193548381, 0)
TextBox_2.Size = UDim2.new(0, 30, 0, 18)
TextBox_2.Font = Enum.Font.Code
TextBox_2.PlaceholderText = "..."
TextBox_2.Text = ""
TextBox_2.TextColor3 = Color3.fromRGB(230, 230, 230)
TextBox_2.TextSize = 14.000

UIGradient_7.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(207, 207, 207))}
UIGradient_7.Rotation = 90
UIGradient_7.Parent = Keybind

Divider.Name = "Divider"
Divider.Parent = ScrollingFrame
Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Divider.BackgroundTransparency = 1.000
Divider.BorderColor3 = Color3.fromRGB(27, 42, 53)
Divider.BorderSizePixel = 0
Divider.Size = UDim2.new(1, 0, 0, 20)

Divider_2.Name = "Divider"
Divider_2.Parent = Divider
Divider_2.AnchorPoint = Vector2.new(0.5, 0.5)
Divider_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Divider_2.BackgroundTransparency = 0.850
Divider_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Divider_2.BorderSizePixel = 0
Divider_2.Position = UDim2.new(0.504982769, 0, 0.5, 0)
Divider_2.Size = UDim2.new(1.03924704, -50, 0, 2)

UIGradient_8.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(207, 207, 207))}
UIGradient_8.Rotation = 90
UIGradient_8.Parent = Divider_2

Paragraph.Name = "Paragraph"
Paragraph.Parent = ScrollingFrame
Paragraph.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Paragraph.BorderColor3 = Color3.fromRGB(27, 42, 53)
Paragraph.BorderSizePixel = 0
Paragraph.Position = UDim2.new(0.0422881171, 0, 0.728232205, 0)
Paragraph.Size = UDim2.new(0.934363067, -10, 0.0844277218, 0)

Title.Name = "Title"
Title.Parent = Paragraph
Title.AnchorPoint = Vector2.new(1, 0.5)
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(27, 42, 53)
Title.BorderSizePixel = 0
Title.LayoutOrder = 1
Title.Position = UDim2.new(0.956197202, -10, 0.0166339427, 18)
Title.Size = UDim2.new(0, 441, 0, 14)
Title.Font = Enum.Font.Unknown
Title.Text = "Paragraph Title"
Title.TextColor3 = Color3.fromRGB(240, 240, 240)
Title.TextSize = 14.000
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left

Content.Name = "Content"
Content.Parent = Paragraph
Content.AnchorPoint = Vector2.new(1, 0.5)
Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Content.BackgroundTransparency = 1.000
Content.BorderColor3 = Color3.fromRGB(27, 42, 53)
Content.BorderSizePixel = 0
Content.LayoutOrder = 2
Content.Position = UDim2.new(0.95598489, -10, 0.595133305, 0)
Content.Size = UDim2.new(0, 441, 0, 13)
Content.Font = Enum.Font.Unknown
Content.Text = "hi"
Content.TextColor3 = Color3.fromRGB(180, 180, 180)
Content.TextSize = 13.000
Content.TextWrapped = true
Content.TextXAlignment = Enum.TextXAlignment.Left
Content.TextYAlignment = Enum.TextYAlignment.Top

Buffer.Name = "Buffer"
Buffer.Parent = Paragraph
Buffer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Buffer.BorderColor3 = Color3.fromRGB(0, 0, 0)
Buffer.BorderSizePixel = 0
Buffer.LayoutOrder = 5
Buffer.Size = UDim2.new(0, 0, 0, 8)

Buffer_2.Name = "Buffer"
Buffer_2.Parent = Paragraph
Buffer_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Buffer_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Buffer_2.BorderSizePixel = 0
Buffer_2.LayoutOrder = -1
Buffer_2.Size = UDim2.new(0, 0, 0, 8)

UIGradient_9.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(207, 207, 207))}
UIGradient_9.Rotation = 90
UIGradient_9.Parent = Paragraph

Label.Name = "Label"
Label.Parent = ScrollingFrame
Label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Label.BorderColor3 = Color3.fromRGB(27, 42, 53)
Label.BorderSizePixel = 0
Label.Position = UDim2.new(0.0345718488, 0, 0.488126636, 0)
Label.Size = UDim2.new(0.975270689, -10, 0, 35)

Title_2.Name = "Title"
Title_2.Parent = Label
Title_2.AnchorPoint = Vector2.new(0, 0.5)
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Title_2.BorderSizePixel = 0
Title_2.Position = UDim2.new(0.0144199822, 15, 0.5, 0)
Title_2.Size = UDim2.new(0, 441, 0, 14)
Title_2.Font = Enum.Font.Unknown
Title_2.TextColor3 = Color3.fromRGB(240, 240, 240)
Title_2.TextSize = 14.000
Title_2.TextWrapped = true
Title_2.TextXAlignment = Enum.TextXAlignment.Left

Icon.Name = "Icon"
Icon.Parent = Label
Icon.AnchorPoint = Vector2.new(0, 0.5)
Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.BackgroundTransparency = 1.000
Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Icon.BorderSizePixel = 0
Icon.Position = UDim2.new(0, 15, 0.5, 0)
Icon.Size = UDim2.new(0, 24, 0, 24)
Icon.Visible = false
Icon.Image = "rbxassetid://11745872910"
Icon.ImageTransparency = 0.200

UIGradient_10.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(207, 207, 207))}
UIGradient_10.Rotation = 90
UIGradient_10.Parent = Elements

Tabs.Name = "Tabs"
Tabs.Parent = Main
Tabs.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Tabs.BackgroundTransparency = 0.500
Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tabs.BorderSizePixel = 0
Tabs.ClipsDescendants = true
Tabs.Position = UDim2.new(0.0112690348, 0, 0.0843886659, 0)
Tabs.Size = UDim2.new(0.230113, 0, 0.892794073, 0)
Tabs.ZIndex = 2

UIGradient_11.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(207, 207, 207))}
UIGradient_11.Rotation = 90
UIGradient_11.Parent = Tabs

UIListLayout_2.Parent = Tabs
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 2)

Selected.Name = "Selected"
Selected.Parent = Tabs
Selected.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Selected.BackgroundTransparency = 1.000
Selected.BorderColor3 = Color3.fromRGB(0, 0, 0)
Selected.BorderSizePixel = 0
Selected.Size = UDim2.new(0, 172, 0, 26)

TextLabel.Parent = Selected
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.119435787, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 113, 0, 26)
TextLabel.Font = Enum.Font.Unknown
TextLabel.Text = "Home"
TextLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
TextLabel.TextSize = 14.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

Selected_2.Name = "Selected"
Selected_2.Parent = Tabs
Selected_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Selected_2.BackgroundTransparency = 1.000
Selected_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Selected_2.BorderSizePixel = 0
Selected_2.Position = UDim2.new(0, 0, 0.0693854317, 0)
Selected_2.Size = UDim2.new(0, 172, 0, 26)

TextLabel_2.Parent = Selected_2
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.119435787, 0, 0, 0)
TextLabel_2.Size = UDim2.new(0, 113, 0, 26)
TextLabel_2.Font = Enum.Font.Unknown
TextLabel_2.Text = "UI Settings"
TextLabel_2.TextColor3 = Color3.fromRGB(230, 230, 230)
TextLabel_2.TextSize = 14.000
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

Label_2.Name = "Label"
Label_2.Parent = Main
Label_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label_2.BackgroundTransparency = 1.000
Label_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Label_2.BorderSizePixel = 0
Label_2.Position = UDim2.new(0.0239841975, 0, 0, 0)
Label_2.Size = UDim2.new(0, 658, 0, 37)
Label_2.Font = Enum.Font.Unknown
Label_2.Text = "EyeHub - Grow a Garden"
Label_2.TextColor3 = Color3.fromRGB(230, 230, 230)
Label_2.TextSize = 14.000
Label_2.TextXAlignment = Enum.TextXAlignment.Left

hide.Name = "hide"
hide.Parent = Main
hide.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
hide.BackgroundTransparency = 1.000
hide.BorderColor3 = Color3.fromRGB(0, 0, 0)
hide.BorderSizePixel = 0
hide.Position = UDim2.new(0.959367871, 0, 0.0176695101, 0)
hide.Size = UDim2.new(0, 20, 0, 20)
hide.Image = "rbxassetid://2777727756"
