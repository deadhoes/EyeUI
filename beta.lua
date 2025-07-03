local Library = {}

function Library:Window(title, subtitle, icon)
	local screen = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
	local main = Instance.new("Frame", screen)
	main.Size = UDim2.new(0, 400, 0, 300)
	main.Position = UDim2.new(0.5, -200, 0.5, -150)
	main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

	local titleLabel = Instance.new("TextLabel", main)
	titleLabel.Text = title or "Window"
	titleLabel.Size = UDim2.new(1, 0, 0, 40)
	titleLabel.BackgroundTransparency = 1
	titleLabel.TextColor3 = Color3.new(1,1,1)
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.TextSize = 20

	local window = {}

	function window:Tab(tabName)
		local tab = {}
		function tab:Section(name)
			local section = {}
			function section:Button(text, callback)
				local btn = Instance.new("TextButton", main)
				btn.Size = UDim2.new(0, 200, 0, 30)
				btn.Position = UDim2.new(0, 100, 0, 60)
				btn.Text = text
				btn.MouseButton1Click:Connect(callback)
			end
			return section
		end
		return tab
	end

	return window
end

return Library
