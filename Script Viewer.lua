-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScriptViewer = Instance.new("ScreenGui")
local Topbar = Instance.new("Frame")
local BackFrame = Instance.new("Frame")
local BottomFrame = Instance.new("ScrollingFrame")
local IDE = Instance.new("TextLabel")
local TopFrame = Instance.new("Frame")
local Clear = Instance.new("TextButton")
local GetScript = Instance.new("TextButton")
local Script = Instance.new("TextBox")
local Title = Instance.new("TextLabel")
local X = Instance.new("TextButton")

--Properties:

ScriptViewer.Name = "Script Viewer"
ScriptViewer.Parent = game.CoreGui
ScriptViewer.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Topbar.Name = "Topbar"
Topbar.Parent = ScriptViewer
Topbar.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
Topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
Topbar.BorderSizePixel = 0
Topbar.Position = UDim2.new(0.250651032, 0, 0.250477105, 0)
Topbar.Size = UDim2.new(0, 339, 0, 27)

BackFrame.Name = "BackFrame"
BackFrame.Parent = Topbar
BackFrame.BackgroundColor3 = Color3.fromRGB(79, 79, 79)
BackFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
BackFrame.BorderSizePixel = 0
BackFrame.Position = UDim2.new(0, 0, 0.999999702, 0)
BackFrame.Size = UDim2.new(1, 0, 2.40740681, 100)

BottomFrame.Name = "BottomFrame"
BottomFrame.Parent = BackFrame
BottomFrame.Active = true
BottomFrame.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
BottomFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
BottomFrame.BorderSizePixel = 0
BottomFrame.Position = UDim2.new(0, 0, 0.100000001, 0)
BottomFrame.Size = UDim2.new(1, 0, 0.899999976, 0)
BottomFrame.CanvasSize = UDim2.new(0, 0, 58, 0)

IDE.Name = "IDE"
IDE.Parent = BottomFrame
IDE.Active = true
IDE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
IDE.BackgroundTransparency = 1.000
IDE.BorderColor3 = Color3.fromRGB(0, 0, 0)
IDE.BorderSizePixel = 0
IDE.Position = UDim2.new(0.0500000007, 0, 0.0500000007, 0)
IDE.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
IDE.Font = Enum.Font.SourceSans
IDE.Text = "<Insert Script>"
IDE.TextColor3 = Color3.fromRGB(255, 255, 255)
IDE.TextSize = 14.000
IDE.TextWrapped = true
IDE.TextXAlignment = Enum.TextXAlignment.Left
IDE.TextYAlignment = Enum.TextYAlignment.Top

TopFrame.Name = "TopFrame"
TopFrame.Parent = BackFrame
TopFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TopFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
TopFrame.BorderSizePixel = 0
TopFrame.Size = UDim2.new(1, 0, 0.100000001, 0)

Clear.Name = "Clear"
Clear.Parent = TopFrame
Clear.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Clear.BorderColor3 = Color3.fromRGB(0, 0, 0)
Clear.BorderSizePixel = 0
Clear.Size = UDim2.new(0.232153431, 0, 1.00000012, 0)
Clear.Font = Enum.Font.SourceSans
Clear.Text = "Clear"
Clear.TextColor3 = Color3.fromRGB(0, 0, 0)
Clear.TextScaled = true
Clear.TextSize = 14.000
Clear.TextWrapped = true

GetScript.Name = "GetScript"
GetScript.Parent = TopFrame
GetScript.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GetScript.BorderColor3 = Color3.fromRGB(0, 0, 0)
GetScript.BorderSizePixel = 0
GetScript.Position = UDim2.new(0.230088502, 0, 0, 0)
GetScript.Size = UDim2.new(0.235103279, 0, 1.00000012, 0)
GetScript.Font = Enum.Font.SourceSans
GetScript.Text = "GetScript"
GetScript.TextColor3 = Color3.fromRGB(0, 0, 0)
GetScript.TextScaled = true
GetScript.TextSize = 14.000
GetScript.TextWrapped = true

Script.Name = "Script"
Script.Parent = TopFrame
Script.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Script.BorderColor3 = Color3.fromRGB(0, 0, 0)
Script.BorderSizePixel = 0
Script.Position = UDim2.new(0.465191782, 0, 0, 0)
Script.Size = UDim2.new(0.534808159, 0, 1, 0)
Script.Font = Enum.Font.SourceSans
Script.Text = "<src>/<module>"
Script.TextColor3 = Color3.fromRGB(0, 0, 0)
Script.TextScaled = true
Script.TextSize = 14.000
Script.TextWrapped = true

Title.Name = "Title"
Title.Parent = Topbar
Title.Active = true
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.0500000007, 0, 0.100000001, 0)
Title.Size = UDim2.new(0.449999988, 0, 0.800000012, 0)
Title.Font = Enum.Font.SourceSans
Title.Text = "Script Viewer by Chilli"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

X.Name = "X"
X.Parent = Topbar
X.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
X.BackgroundTransparency = 1.000
X.BorderColor3 = Color3.fromRGB(0, 0, 0)
X.BorderSizePixel = 0
X.Position = UDim2.new(0.699999988, 0, 0, 0)
X.Size = UDim2.new(0.300000012, 0, 1, 0)
X.Font = Enum.Font.SourceSans
X.Text = "Close"
X.TextColor3 = Color3.fromRGB(255, 255, 255)
X.TextScaled = true
X.TextSize = 14.000
X.TextWrapped = true

-- Scripts:

local function GYMWV_fake_script() -- Topbar.Dragger 
	local script = Instance.new('LocalScript', Topbar)

	script.Parent.Active = true
	script.Parent.Draggable = true
end
coroutine.wrap(GYMWV_fake_script)()
local function LZCQ_fake_script() -- Topbar.ScriptViewerManager 
	local script = Instance.new('LocalScript', Topbar)

	local Clear = script.Parent.BackFrame.TopFrame.Clear
	local GetScript = script.Parent.BackFrame.TopFrame.GetScript
	local ScriptPath  = script.Parent.BackFrame.TopFrame.Script
	
	local IDE = script.Parent.BackFrame.BottomFrame.IDE
	
	local function CreateNotification(Title, Message, Dur)
		Dur = Dur or 3
		local StarterGui = game:GetService('StarterGui')
		local properties = {
			Color = Color3.new(1,1,0);
			Font = Enum.Font.SourceSansItalic;
			TextSize = 16;
		}
		game:GetService("StarterGui"):SetCore("SendNotification",
		{
			Title = Title,
			Text = Message,
			Duration = Dur
		}
		)
		StarterGui:SetCore("ChatMakeSystemMessage", properties)
	end
	
	Clear.MouseButton1Down:Connect(function()
		IDE.Text = "<Insert Script>"
	end)
	
	GetScript.MouseButton1Down:Connect(function()
		local Path = ScriptPath.Text
		--"Workspace.Script"
		
		local ScriptInstance = game
		local PathArray = string.split(Path,".")
		for i = 2, #PathArray do
			local stringCccc = PathArray[i]
			print(stringCccc)
			if ScriptInstance:FindFirstChild(PathArray[i]) then
				ScriptInstance = ScriptInstance:FindFirstChild(stringCccc)
			else
				return "Failed, Could not find instance : "..stringCccc.." in: "..stringCccc
			end
		end
		
		if ScriptInstance:IsA('LocalScript') or ScriptInstance:IsA('ModuleScript') then
			if identifyexecutor() ~= "Fluxus" then
				CreateNotification("Warning","This only works for fluxus, any other executors might cause some error(s).",3)
			end
			local ScriptCode = getscriptbytecode(ScriptInstance)
			local ERRCount = 1
			while (ScriptCode == nil or ScriptCode == "") and ERRCount < 6 do
				ERRCount += 1
				ScriptCode = getscriptbytecode(ScriptInstance)
			end
			
			if ScriptCode == nil or ScriptCode == "" then
				CreateNotification("Warning","We had an error while getting your code, please try again",5)
			else
				IDE.Text = ScriptCode
			end
			
		elseif ScriptInstance:IsA('Script') then
			CreateNotification("Warning","The script you provided is a Server Script, Note that this would only work for Local Script and Module Script.",5)
		end
	end)
end
coroutine.wrap(LZCQ_fake_script)()
