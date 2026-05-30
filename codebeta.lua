local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

local function hideName(name)
	local visible = math.min(5, #name)
	return string.sub(name, 1, visible) .. "******"
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
main.Size = UDim2.new(0, 340, 0, 95)
main.Position = UDim2.new(0.5, -170, 0.15, 0)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
main.BorderSizePixel = 0

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 20)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(0, 170, 255)
stroke.Thickness = 2
stroke.Parent = main

-- Drag
local dragging = false
local dragStart
local startPos

main.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch
	or input.UserInputType == Enum.UserInputType.MouseButton1 then

		dragging = true
		dragStart = input.Position
		startPos = main.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and (
		input.UserInputType == Enum.UserInputType.Touch
		or input.UserInputType == Enum.UserInputType.MouseMovement
	) then

		local delta = input.Position - dragStart

		main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

-- Đơn
local orderBox = Instance.new("TextBox")
orderBox.Parent = main
orderBox.Size = UDim2.new(0.55, 0, 0, 20)
orderBox.Position = UDim2.new(0.03, 0, 0.05, 0)
orderBox.BackgroundTransparency = 1
orderBox.Text = ""
orderBox.PlaceholderText = "Nhập đơn..."
orderBox.ClearTextOnFocus = false
orderBox.Font = Enum.Font.GothamBold
orderBox.TextColor3 = Color3.fromRGB(255, 215, 0)
orderBox.TextScaled = false
orderBox.TextSize = 16
orderBox.TextXAlignment = Enum.TextXAlignment.Left

-- Trạng thái
local status = Instance.new("TextLabel")
status.Parent = main
status.Size = UDim2.new(0, 95, 0, 24)
status.Position = UDim2.new(1, -105, 0.05, 0)
status.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
status.Text = "ĐANG XỬ LÝ"
status.TextColor3 = Color3.new(1,1,1)
status.Font = Enum.Font.GothamBold
status.TextScaled = false
status.TextSize = 11

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(1,0)
statusCorner.Parent = status

-- Tên
local nameLabel = Instance.new("TextLabel")
nameLabel.Parent = main
nameLabel.Size = UDim2.new(0.9,0,0,18)
nameLabel.Position = UDim2.new(0.03,0,0.42,0)
nameLabel.BackgroundTransparency = 1
nameLabel.Text = "Tên: " .. hideName(player.Name)
nameLabel.TextColor3 = Color3.fromRGB(100,180,255)
nameLabel.Font = Enum.Font.GothamBold
nameLabel.TextScaled = false
nameLabel.TextSize = 12
nameLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Ghi chú
local noteTitle = Instance.new("TextLabel")
noteTitle.Parent = main
noteTitle.Size = UDim2.new(0,60,0,18)
noteTitle.Position = UDim2.new(0.03,0,0.68,0)
noteTitle.BackgroundTransparency = 1
noteTitle.Text = "Ghi chú:"
noteTitle.TextColor3 = Color3.new(1,1,1)
noteTitle.Font = Enum.Font.GothamBold
noteTitle.TextScaled = false
noteTitle.TextSize = 12
noteTitle.TextXAlignment = Enum.TextXAlignment.Left

local noteBox = Instance.new("TextBox")
noteBox.Parent = main
noteBox.Size = UDim2.new(0.72,0,0,18)
noteBox.Position = UDim2.new(0.22,0,0.68,0)
noteBox.BackgroundTransparency = 1
noteBox.Text = ""
noteBox.PlaceholderText = "Nhập ghi chú..."
noteBox.ClearTextOnFocus = false
noteBox.TextColor3 = Color3.new(1,1,1)
noteBox.Font = Enum.Font.GothamBold
noteBox.TextScaled = false
noteBox.TextSize = 12
noteBox.TextXAlignment = Enum.TextXAlignment.Left