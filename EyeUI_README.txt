
# 🧪 EyeUI Example Script

This project demonstrates how to use the **EyeUI** library in Roblox using a clean and simple UI system.  
It includes a window with tabs, sections, and various interactive elements like buttons, toggles, and sliders.

---

## 📥 Load the Library

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deadhoes/EyeUI/refs/heads/main/init.lua"))()
```

---

## 🪟 Create the Window

```lua
local Window = Library:Window("Test GUI")
```

- "Test GUI" is the title shown on the UI window.

---

## 🗂️ Create Tabs

```lua
local Tab = Window:Tab("Main")
local Tab1 = Window:Tab("a")
```

- Creates two tabs named "Main" and "a".

---

## 📑 Create a Section

```lua
local Section = Tab:Section("Controls")
```

- Adds a section named "Controls" inside the "Main" tab.

---

## 🔘 Add a Button

```lua
Section:Button("Test Button", function()
    print("Button clicked!")
end)
```

- Prints "Button clicked!" when pressed.

---

## 🟢 Add a Toggle

```lua
Section:Toggle("Auto Farm", false, function(state)
    print("Toggle:", state)
end)
```

- "Auto Farm" is the toggle label.
- false is the default value.
- state returns true or false.

---

## 🎚️ Add a Slider

```lua
Section:Slider("Speed", 1, 100, 50, function(value)
    print("Slider value:", value)
end)
```

- 1 is the minimum value.
- 100 is the maximum value.
- 50 is the default value.

---

## ⌨️ Input (Possible Issue)

```lua
Section:Input("Speed", 1, 100, 50, function(value)
    print("Slider value:", value)
end)
```

⚠️ Warning: The above line looks like a duplicate of the slider syntax. EyeUI may not support `Input` in this form. Please verify its correctness.

---

## 📎 GitHub Source

You can find the full EyeUI library here:  
https://github.com/deadhoes/EyeUI

---

## 🧪 License

This example script is provided for educational purposes and does not claim ownership of the EyeUI library.
