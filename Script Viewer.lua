-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local OpenClose = Instance.new("TextButton")
local Frame = Instance.new("Frame")
local Print = Instance.new("TextButton")
local UIListLayout = Instance.new("UIListLayout")
local Close = Instance.new("TextButton")
local Value1 = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

OpenClose.Name = "OpenClose"
OpenClose.Parent = ScreenGui
OpenClose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OpenClose.BorderColor3 = Color3.fromRGB(0, 0, 0)
OpenClose.BorderSizePixel = 0
OpenClose.Position = UDim2.new(0, 0, 0.491412222, 0)
OpenClose.Size = UDim2.new(0.137337238, 0, 0.0926526636, 0)
OpenClose.Font = Enum.Font.SourceSans
OpenClose.Text = "Open Menu"
OpenClose.TextColor3 = Color3.fromRGB(0, 0, 0)
OpenClose.TextScaled = true
OpenClose.TextSize = 14.000
OpenClose.TextWrapped = true

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.222981766, 0, 0.145515263, 0)
Frame.Size = UDim2.new(0.649414062, 0, 0.729961812, 0)
Frame.Visible = false

Print.Name = "Print"
Print.Parent = Frame
Print.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Print.BorderColor3 = Color3.fromRGB(0, 0, 0)
Print.BorderSizePixel = 0
Print.Size = UDim2.new(1, 0, 0.200000003, 0)
Print.Font = Enum.Font.SourceSans
Print.Text = "Print"
Print.TextColor3 = Color3.fromRGB(0, 0, 0)
Print.TextScaled = true
Print.TextSize = 14.000
Print.TextWrapped = true

UIListLayout.Parent = Frame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Close.Name = "Close"
Close.Parent = Frame
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Size = UDim2.new(1, 0, 0.200000003, 0)
Close.Font = Enum.Font.SourceSans
Close.Text = "Print"
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true

Value1.Name = "Value : 1"
Value1.Parent = Frame
Value1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Value1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Value1.BorderSizePixel = 0
Value1.Size = UDim2.new(1, 0, 0.200000003, 0)
Value1.Font = Enum.Font.SourceSans
Value1.Text = "Print"
Value1.TextColor3 = Color3.fromRGB(0, 0, 0)
Value1.TextScaled = true
Value1.TextSize = 14.000
Value1.TextWrapped = true

-- Scripts:

local function ZFKEH_fake_script() -- ScreenGui.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui)

	local OpenClose = script.Parent.OpenClose
	local Value = script.Parent.Frame["Value : 1"]
	local Print = script.Parent.Frame.Print
	local Close = script.Parent.Frame.Close
	
	OpenClose.MouseButton1Down:Connect(function()
		script.Parent.Frame.Visible = not script.Parent.Frame.Visible
	end)
	
	local valuee = 1
	Value.MouseButton1Down:Connect(function()
		valuee += 1
		Value.Text = "Value : "..valuee
	end)
	
	Print.MouseButton1Down:Connect(function()
		print('Hello')
	end)
	
	Close.MouseButton1Down:Connect(function()
		script.Parent.Frame.Visible = false
	end)
end
coroutine.wrap(ZFKEH_fake_script)()
local function AXPZ_fake_script() -- Print.LocalScript 
	local script = Instance.new('LocalScript', Print)

	script.Parent.Text = script.Parent.Name
end
coroutine.wrap(AXPZ_fake_script)()
local function UGORFP_fake_script() -- Close.LocalScript 
	local script = Instance.new('LocalScript', Close)

	script.Parent.Text = script.Parent.Name
end
coroutine.wrap(UGORFP_fake_script)()
local function ZRIIOYJ_fake_script() -- Value1.LocalScript 
	local script = Instance.new('LocalScript', Value1)

	script.Parent.Text = script.Parent.Name
end
coroutine.wrap(ZRIIOYJ_fake_script)()
