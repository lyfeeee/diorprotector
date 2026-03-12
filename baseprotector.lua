local TweenService = game:GetService("TweenService")
local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local DropdownBtn = Instance.new("TextButton")
local DropdownCorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local DefenseLabel = Instance.new("TextLabel")
local StatusBtn = Instance.new("TextButton")
local StatusCorner = Instance.new("UICorner")
local ActionBtn = Instance.new("TextButton")
local ActionCorner = Instance.new("UICorner")
local CreditLabel = Instance.new("TextLabel")
local UIStroke = Instance.new("UIStroke")

-- ScreenGui Setup
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Main Frame
Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.BackgroundTransparency = 0.45
Main.Position = UDim2.new(0.5, -82, 0.5, -52)
Main.Size = UDim2.new(0, 165, 0, 105) 
Main.Active = true
Main.Draggable = true 
Main.ClipsDescendants = true

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Main

UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 1.5
UIStroke.Parent = Main

-- Dropdown Button
DropdownBtn.Parent = Main
DropdownBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
DropdownBtn.Position = UDim2.new(0.78, 0, 0.05, 0)
DropdownBtn.Size = UDim2.new(0, 30, 0, 22)
DropdownBtn.Font = Enum.Font.LuckiestGuy
DropdownBtn.Text = "◀"
DropdownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DropdownBtn.TextSize = 10

DropdownCorner.CornerRadius = UDim.new(0, 5)
DropdownCorner.Parent = DropdownBtn

-- Title
Title.Parent = Main
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.06, 0, 0.05, 0)
Title.Size = UDim2.new(0.7, 0, 0, 22)
Title.Font = Enum.Font.LuckiestGuy
Title.Text = "DIORS PROTECTOR"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 13
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Defense Label
DefenseLabel.Parent = Main
DefenseLabel.BackgroundTransparency = 1
DefenseLabel.Position = UDim2.new(0.06, 0, 0.32, 0)
DefenseLabel.Size = UDim2.new(0.35, 0, 0, 22)
DefenseLabel.Font = Enum.Font.LuckiestGuy
DefenseLabel.Text = "DEFENSE"
DefenseLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DefenseLabel.TextSize = 12

-- Status Button
StatusBtn.Parent = Main
StatusBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
StatusBtn.Position = UDim2.new(0.48, 0, 0.32, 0)
StatusBtn.Size = UDim2.new(0, 75, 0, 22)
StatusBtn.Font = Enum.Font.LuckiestGuy
StatusBtn.Text = "ACTIVE" -- Default on execution
StatusBtn.TextColor3 = Color3.fromRGB(100, 180, 50)
StatusBtn.TextSize = 12

StatusCorner.CornerRadius = UDim.new(0, 5)
StatusCorner.Parent = StatusBtn

-- Action Button
ActionBtn.Parent = Main
ActionBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Default on execution
ActionBtn.Position = UDim2.new(0.06, 0, 0.6, 0)
ActionBtn.Size = UDim2.new(0, 145, 0, 24)
ActionBtn.Font = Enum.Font.LuckiestGuy
ActionBtn.Text = "ACTIVATED" -- Default on execution
ActionBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ActionBtn.TextSize = 14

ActionCorner.CornerRadius = UDim.new(0, 5)
ActionCorner.Parent = ActionBtn

-- Bottom Tag
CreditLabel.Parent = Main
CreditLabel.BackgroundTransparency = 1
CreditLabel.Position = UDim2.new(0, 0, 0.85, 0)
CreditLabel.Size = UDim2.new(1, 0, 0, 15)
CreditLabel.Font = Enum.Font.LuckiestGuy
CreditLabel.Text = "#1 DEFENDER😈"
CreditLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditLabel.TextSize = 10

-- Logic Functions
local active = true -- Starts active
local function toggle()
    active = not active
    if active then
        StatusBtn.Text = "ACTIVE"
        StatusBtn.TextColor3 = Color3.fromRGB(100, 180, 50)
        ActionBtn.Text = "ACTIVATED"
        ActionBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ActionBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    else
        StatusBtn.Text = "OFF"
        StatusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        ActionBtn.Text = "ACTIVATE"
        ActionBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        ActionBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end

StatusBtn.MouseButton1Click:Connect(toggle)
ActionBtn.MouseButton1Click:Connect(toggle)

-- Animation Logic
local minimized = false
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

DropdownBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    local targetSize = minimized and UDim2.new(0, 165, 0, 32) or UDim2.new(0, 165, 0, 105)
    local targetText = minimized and "▶" or "◀"
    
    TweenService:Create(Main, tweenInfo, {Size = targetSize}):Play()
    DropdownBtn.Text = targetText
    
    local content = {DefenseLabel, StatusBtn, ActionBtn, CreditLabel}
    for _, obj in pairs(content) do
        obj.Visible = not minimized
    end
end)

-- Rainbow Credit Tag Effect
spawn(function()
	while task.wait() do
		local hue = tick() % 5 / 5
		CreditLabel.TextColor3 = Color3.fromHSV(hue, 0.7, 1)
	end
end)
