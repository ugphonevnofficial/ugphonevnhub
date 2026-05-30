local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function hideName(name)
	local visibleLength = math.max(3, math.floor(#name * 0.5))
	return string.sub(name, 1, visibleLength) .. string.rep("*", #name - visibleLength)
end

local gui = Instance.new("ScreenGui")
gui.Name = "NameHub"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Parent = gui
main.Size = UDim2.new(0, 550, 0, 150)
main.Position = UDim2.new(0.5, 0, 0.15, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 20)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(0, 170, 255)
stroke.Thickness = 2
stroke.Parent = main

-- Đơn (dòng vàng trên cùng)
local orderBox = Instance.new("TextBox")
orderBox.Parent = main
orderBox.Size = UDim2.new(0.65, 0, 0.22, 0)
orderBox.Position = UDim2.new(0.03, 0, 0.05, 0)
orderBox.BackgroundTransparency = 1
orderBox.Text = ""
orderBox.PlaceholderText = ""
orderBox.ClearTextOnFocus = false
orderBox.Font = Enum.Font.GothamBold
orderBox.TextColor3 = Color3.fromRGB(255, 215, 0)
orderBox.TextScaled = true
orderBox.TextXAlignment = Enum.TextXAlignment.Left

-- Nút ĐANG XỬ LÝ
local status = Instance.new("TextButton")
status.Parent = main
status.Size = UDim2.new(0, 160, 0, 40)
status.Position = UDim2.new(1, -180, 0.05, 0)
status.BackgroundColor3 = Color3.fromRGB(80, 170, 255)
status.Text = "ĐANG XỬ LÝ"
status.TextColor3 = Color3.new(1,1,1)
status.Font = Enum.Font.GothamBold
status.TextScaled = true
status.AutoButtonColor = false

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(1, 0)
statusCorner.Parent = status

-- Tên
local nameLabel = Instance.new("TextLabel")
nameLabel.Parent = main
nameLabel.Size = UDim2.new(0.9, 0, 0.15, 0)
nameLabel.Position = UDim2.new(0.03, 0, 0.38, 0)
nameLabel.BackgroundTransparency = 1
nameLabel.Text = "Tên: " .. hideName(player.Name)
nameLabel.TextColor3 = Color3.fromRGB(255,255,255)
nameLabel.Font = Enum.Font.GothamBold
nameLabel.TextScaled = true
nameLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Ghi chú
local noteBox = Instance.new("TextBox")
noteBox.Parent = main
noteBox.Size = UDim2.new(0.9, 0, 0.15, 0)
noteBox.Position = UDim2.new(0.03, 0, 0.62, 0)
noteBox.BackgroundTransparency = 1
noteBox.Text = ""
noteBox.PlaceholderText = ""
noteBox.ClearTextOnFocus = false
noteBox.Font = Enum.Font.GothamBold
noteBox.TextColor3 = Color3.fromRGB(255,255,255)
noteBox.TextScaled = true
noteBox.TextXAlignment = Enum.TextXAlignment.Left

local noteTitle = Instance.new("TextLabel")
noteTitle.Parent = main
noteTitle.Size = UDim2.new(0.2, 0, 0.15, 0)
noteTitle.Position = UDim2.new(0.03, 0, 0.62, 0)
noteTitle.BackgroundTransparency = 1
noteTitle.Text = "Ghi chú:"
noteTitle.TextColor3 = Color3.fromRGB(255,255,255)
noteTitle.Font = Enum.Font.GothamBold
noteTitle.TextScaled = true
noteTitle.TextXAlignment = Enum.TextXAlignment.Left

noteBox.Position = UDim2.new(0.20, 0, 0.62, 0)
noteBox.Size = UDim2.new(0.75, 0, 0.15, 0)