-- @ScriptType: LocalScript
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui

local main = Instance.new("Frame")
main.Size = UDim2.new(1, 0, 1, 0)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BorderSizePixel = 0
main.Parent = gui

--== UIListLayout ==--
local layout = Instance.new("UIListLayout")
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = main

--====================================================
-- CONFIG SECTION
--====================================================

local configFrame = Instance.new("Frame")
configFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
configFrame.Size = UDim2.new(1, 0, 0, 120)
configFrame.LayoutOrder = 1
configFrame.Parent = main

local configLayout = Instance.new("UIListLayout")
configLayout.Padding = UDim.new(0, 5)
configLayout.Parent = configFrame

-- Label Title
local configTitle = Instance.new("TextLabel")
configTitle.Size = UDim2.new(1, -10, 0, 20)
configTitle.BackgroundTransparency = 1
configTitle.Font = Enum.Font.SourceSansBold
configTitle.TextSize = 16
configTitle.Text = "Configuration GitHub"
configTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
configTitle.Parent = configFrame

-- Token Input
local tokenBox = Instance.new("TextBox")
tokenBox.Size = UDim2.new(1, -10, 0, 30)
tokenBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tokenBox.TextColor3 = Color3.fromRGB(255, 255, 255)
tokenBox.PlaceholderText = "GitHub Token (ghp_xxx...)"
tokenBox.Font = Enum.Font.SourceSans
tokenBox.TextSize = 14
tokenBox.Text = ""
tokenBox.Parent = configFrame

-- Repo Input
local repoBox = Instance.new("TextBox")
repoBox.Size = UDim2.new(1, -10, 0, 30)
repoBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
repoBox.TextColor3 = Color3.fromRGB(255, 255, 255)
repoBox.PlaceholderText = "Repo URL (https://github.com/... )"
repoBox.Font = Enum.Font.SourceSans
repoBox.TextSize = 14
repoBox.Text = ""
repoBox.Parent = configFrame

-- Save Button
local saveBtn = Instance.new("TextButton")
saveBtn.Size = UDim2.new(1, -10, 0, 30)
saveBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
saveBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
saveBtn.Font = Enum.Font.SourceSansBold
saveBtn.TextSize = 14
saveBtn.Text = "Save Settings"
saveBtn.Parent = configFrame

-- Save Settings Logic
saveBtn.MouseButton1Click:Connect(function()
	plugin:SetSetting("githubToken", tokenBox.Text)
	plugin:SetSetting("repoUrl", repoBox.Text)
	saveBtn.Text = "Saved ✔️"
	task.delay(1, function()
		saveBtn.Text = "Save Settings"
	end)
end)

--====================================================
-- TERMINAL SECTION
--====================================================

local terminalFrame = Instance.new("Frame")
terminalFrame.Size = UDim2.new(1, 0, 1, -120)
terminalFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
terminalFrame.LayoutOrder = 2
terminalFrame.Parent = main

local termLayout = Instance.new("UIListLayout")
termLayout.Parent = terminalFrame

-- Output window
local output = Instance.new("TextLabel")
output.Size = UDim2.new(1, -10, 1, -50)
output.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
output.TextColor3 = Color3.fromRGB(200, 200, 200)
output.TextXAlignment = Enum.TextXAlignment.Left
output.TextYAlignment = Enum.TextYAlignment.Top
output.Font = Enum.Font.Code
output.TextWrapped = false
output.TextSize = 13
output.Text = "> Terminal Git\n"
output.Parent = terminalFrame

-- Input Box
local input = Instance.new("TextBox")
input.Size = UDim2.new(1, -10, 0, 40)
input.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
input.TextColor3 = Color3.fromRGB(255, 255, 255)
input.Font = Enum.Font.Code
input.TextSize = 13
input.PlaceholderText = "Tape une commande..."
input.Text = ""
input.Parent = terminalFrame