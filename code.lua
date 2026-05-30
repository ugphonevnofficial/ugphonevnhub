local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

local function hideName(name)
	if #name <= 5 then
		return name .. "******"
	end
	return string.sub(name, 1, 5) .. "******"
end

pcall(function()
	local old = game:GetService("CoreGui"):FindFirstChild("NameHub")
	if old then
		old:Destroy()
	end
end)

local gui = Instance.new("ScreenGui")
gui.Name = "NameHub"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

local main = Instance.new("Frame")
main.Parent = gui
main.Size = UDim2.new(0, 320, 0, 80)
main.Position = UDim2.new(0.5, -160, 0.15, 0)
main.BackgroundColor3 = Color3.fromRGB(30, 15, 15)
main.BorderSizePixel = 0

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 18)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 60, 60)
stroke.Thickness = 2
stroke.Parent = main

-- Drag
local dragging = false
local dragStart
local startPos

main.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = main.Position
	end
end)

main.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

UIS.InputChanged:Connect(function(input)
	if not dragging then return end

	if input.UserInputType == Enum.UserInputType.MouseMovement
	or input.UserInputType == Enum.UserInputType.Touch then

		local delta = input.Position - dragStart

		main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

-- Order Box
local orderBox = Instance.new("TextBox")
orderBox.Parent = main
orderBox.Size = UDim2.new(0.72, 0, 0, 18)
orderBox.Position = UDim2.new(0.03, 0, 0.05, 0)
orderBox.BackgroundTransparency = 1
orderBox.Text = ""
orderBox.PlaceholderText = "Nhập Đơn..."
orderBox.ClearTextOnFocus = false
orderBox.Font = Enum.Font.GothamBold
orderBox.TextColor3 = Color3.fromRGB(255, 120, 170)
orderBox.PlaceholderColor3 = Color3.fromRGB(180, 120, 150)
orderBox.TextSize = 14
orderBox.TextXAlignment = Enum.TextXAlignment.Left

local fullOrderText = ""
local maxLen = 20

local function shortenText(text)
	if #text > maxLen then
		return string.sub(text, 1, maxLen) .. "... Xem Thêm"
	end
	return text
end

orderBox.Focused:Connect(function()
	orderBox.Text = fullOrderText
end)

orderBox.FocusLost:Connect(function()
	fullOrderText = orderBox.Text
	orderBox.Text = shortenText(fullOrderText)
end)

-- Status
local status = Instance.new("TextLabel")
status.Parent = main
status.Size = UDim2.new(0, 85, 0, 20)
status.Position = UDim2.new(1, -95, 0.05, 0)
status.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
status.Text = "ĐANG XỬ LÝ"
status.TextColor3 = Color3.new(1,1,1)
status.Font = Enum.Font.GothamBold
status.TextSize = 10

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(1,0)
statusCorner.Parent = status

-- Name
local nameLabel = Instance.new("TextLabel")
nameLabel.Parent = main
nameLabel.Size = UDim2.new(0.95,0,0,16)
nameLabel.Position = UDim2.new(0.03,0,0.42,0)
nameLabel.BackgroundTransparency = 1
nameLabel.Text = "Tên: " .. hideName(player.Name)
nameLabel.TextColor3 = Color3.fromRGB(255, 60, 60)
nameLabel.Font = Enum.Font.GothamBold
nameLabel.TextSize = 11
nameLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Note Title
local noteTitle = Instance.new("TextLabel")
noteTitle.Parent = main
noteTitle.Size = UDim2.new(0,60,0,16)
noteTitle.Position = UDim2.new(0.03,0,0.68,0)
noteTitle.BackgroundTransparency = 1
noteTitle.Text = "Ghi Chú:"
noteTitle.TextColor3 = Color3.fromRGB(255, 160, 200)
noteTitle.Font = Enum.Font.GothamBold
noteTitle.TextSize = 11
noteTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Note Box
local noteBox = Instance.new("TextBox")
noteBox.Parent = main
noteBox.Size = UDim2.new(0.78,0,0,16)
noteBox.Position = UDim2.new(0.22,0,0.68,0)
noteBox.BackgroundTransparency = 1
noteBox.Text = ""
noteBox.PlaceholderText = "Nhập Ghi Chú..."
noteBox.PlaceholderColor3 = Color3.fromRGB(180, 120, 150)
noteBox.ClearTextOnFocus = false
noteBox.TextColor3 = Color3.fromRGB(255, 160, 200)
noteBox.Font = Enum.Font.GothamBold
noteBox.TextSize = 11
noteBox.TextXAlignment = Enum.TextXAlignment.Left