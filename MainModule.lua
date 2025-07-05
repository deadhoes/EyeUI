local EyeUI = {
    Components = {},
    Themes = require(script.Parent.Themes),
    Utilities = require(script.Parent.Utilities),
    CurrentTheme = "Dark"
}

-- Load components
EyeUI.Components.Window = require(script.Parent.Components.Window)
EyeUI.Components.Tab = require(script.Parent.Components.Tab)
EyeUI.Components.Notification = require(script.Parent.Components.Notification)

-- Load all UI elements
local elements = {
    "Button", "Toggle", "Slider", "Dropdown", 
    "Textbox", "Label", "Section", "Keybind"
}

for _, element in ipairs(elements) do
    EyeUI.Components[element] = require(script.Parent.Components.Elements[element])
end

function EyeUI:CreateWindow(options)
    local window = self.Components.Window.new(self, options or {})
    window:SetTheme(options.Theme or self.CurrentTheme)
    return window
end

return EyeUI
