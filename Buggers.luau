-- Gui to Lua
-- Version: 3.2
-- Instances:
local Clippy = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
function toClipboard(txt)
	if Clippy then
		Clippy(tostring(txt))
	else
		warn("There is no way to save text!")
	end
end

local debugTool = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local Frame_2 = Instance.new("Frame")
local ScriptName = Instance.new("TextBox")
local FuncName = Instance.new("TextBox")
local ScriptNameTitle = Instance.new("TextButton")
local FuncNameTitle = Instance.new("TextButton")
local ScrollFrameStuff = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local GetAllFunctions = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local GetAllUpvalues = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local GetAllConstants = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Folder = Instance.new("Folder")
local FunctionUse = Instance.new("Frame")
local FunctionName = Instance.new("TextButton")
local FunctionNups = Instance.new("TextButton")
local SaveFunctionInstance = Instance.new("TextButton")
local ValueUse = Instance.new("Frame")
local Index = Instance.new("TextButton")
local IndexValue = Instance.new("TextBox")
local ToEditButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")

local Eye = Instance.new("TextButton")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local UICorner_4 = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")

local OriginalButtonText = {}

--Properties:

local DEBUGTOOL_PARENT = game.CoreGui
--local DEBUGTOOL_PARENT = game:GetService("Players").LocalPlayer.PlayerGui
if DEBUGTOOL_PARENT:FindFirstChild("debugTool") then
	DEBUGTOOL_PARENT:FindFirstChild("debugTool"):Destroy()
end
debugTool.Name = "debugTool"
debugTool.Parent = DEBUGTOOL_PARENT
debugTool.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
debugTool.DisplayOrder = 10101

Frame.Parent = debugTool
Frame.BackgroundColor3 = Color3.fromRGB(52, 21, 21)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.189722463, 0, 0.211828858, 0)
Frame.Size = UDim2.new(0.334, 0, 0.138, 0)
Frame.Active = true
Frame.Draggable = true

UIAspectRatioConstraint.Parent = Frame
UIAspectRatioConstraint.AspectRatio = 10.000
UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
UIAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Width

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(34, 14, 14)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0, 0, 0.949999988, 0)
Frame_2.Size = UDim2.new(1, 0, 5, 0)

ScriptName.Name = "ScriptName"
ScriptName.Parent = Frame_2
ScriptName.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
ScriptName.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScriptName.BorderSizePixel = 0
ScriptName.Position = UDim2.new(0.0497838743, 0, 0.153873697, 0)
ScriptName.Size = UDim2.new(0.381999999, 0, 0.108000003, 0)
ScriptName.Font = Enum.Font.SourceSans
ScriptName.Text = ""
ScriptName.TextColor3 = Color3.fromRGB(0, 0, 0)
ScriptName.TextSize = 14.000

FuncName.Name = "FuncName"
FuncName.Parent = Frame_2
FuncName.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
FuncName.BorderColor3 = Color3.fromRGB(0, 0, 0)
FuncName.BorderSizePixel = 0
FuncName.Position = UDim2.new(0.566017985, 0, 0.153873697, 0)
FuncName.Size = UDim2.new(0.382051289, 0, 0.107692309, 0)
FuncName.Font = Enum.Font.SourceSans
FuncName.Text = ""
FuncName.TextColor3 = Color3.fromRGB(0, 0, 0)
FuncName.TextSize = 14.000

ScriptNameTitle.Name = "ScriptNameTitle"
ScriptNameTitle.Parent = Frame_2
ScriptNameTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptNameTitle.BackgroundTransparency = 1.000
ScriptNameTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScriptNameTitle.BorderSizePixel = 0
ScriptNameTitle.Position = UDim2.new(0.0489743762, 0, 0.0516153984, 0)
ScriptNameTitle.Size = UDim2.new(0.38199994, 0, 0.0973606333, 0)
ScriptNameTitle.Font = Enum.Font.SourceSansBold
ScriptNameTitle.Text = "Script Name :"
ScriptNameTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptNameTitle.TextScaled = true
ScriptNameTitle.TextSize = 14.000
ScriptNameTitle.TextWrapped = true

FuncNameTitle.Name = "FuncNameTitle"
FuncNameTitle.Parent = Frame_2
FuncNameTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FuncNameTitle.BackgroundTransparency = 1.000
FuncNameTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
FuncNameTitle.BorderSizePixel = 0
FuncNameTitle.Position = UDim2.new(0.566017985, 0, 0.0517675951, 0)
FuncNameTitle.Size = UDim2.new(0.382051289, 0, 0.0973606333, 0)
FuncNameTitle.Font = Enum.Font.SourceSansBold
FuncNameTitle.Text = "Function Name :"
FuncNameTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
FuncNameTitle.TextScaled = true
FuncNameTitle.TextSize = 14.000
FuncNameTitle.TextWrapped = true

ScrollFrameStuff.Name = "ScrollFrameStuff"
ScrollFrameStuff.Parent = Frame_2
ScrollFrameStuff.Active = true
ScrollFrameStuff.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
ScrollFrameStuff.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollFrameStuff.BorderSizePixel = 0
ScrollFrameStuff.Position = UDim2.new(0.0489742979, 0, 0.493617207, 0)
ScrollFrameStuff.Size = UDim2.new(0.897, 0, 0.436, 0)
ScrollFrameStuff.ScrollBarThickness = 6
ScrollFrameStuff.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollFrameStuff.CanvasSize = UDim2.new(0,0,0,0)

UIListLayout.Parent = ScrollFrameStuff
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 3)

GetAllFunctions.Name = "GetAllFunctions"
GetAllFunctions.Parent = Frame_2
GetAllFunctions.BackgroundColor3 = Color3.fromRGB(83, 0, 0)
GetAllFunctions.BorderColor3 = Color3.fromRGB(0, 0, 0)
GetAllFunctions.BorderSizePixel = 0
GetAllFunctions.Position = UDim2.new(0.051282052, 0, 0.333333343, 0)
GetAllFunctions.Size = UDim2.new(0.379, 0, 0.103, 0)
GetAllFunctions.Font = Enum.Font.SourceSansBold
GetAllFunctions.Text = "Get All Functions"
GetAllFunctions.TextColor3 = Color3.fromRGB(255, 255, 255)
GetAllFunctions.TextScaled = true
GetAllFunctions.TextSize = 14.000
GetAllFunctions.TextWrapped = true

UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = GetAllFunctions

GetAllUpvalues.Name = "GetAllUpvalues"
GetAllUpvalues.Parent = Frame_2
GetAllUpvalues.BackgroundColor3 = Color3.fromRGB(83, 0, 0)
GetAllUpvalues.BorderColor3 = Color3.fromRGB(0, 0, 0)
GetAllUpvalues.BorderSizePixel = 0
GetAllUpvalues.Position = UDim2.new(0.56410259, 0, 0.333333343, 0)
GetAllUpvalues.Size = UDim2.new(0.169, 0, 0.103, 0)
GetAllUpvalues.Font = Enum.Font.SourceSansBold
GetAllUpvalues.Text = "Get UpValues"
GetAllUpvalues.TextColor3 = Color3.fromRGB(255, 255, 255)
GetAllUpvalues.TextScaled = true
GetAllUpvalues.TextSize = 14.000
GetAllUpvalues.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0, 3)
UICorner_2.Parent = GetAllUpvalues

GetAllConstants.Name = "GetAllConstants"
GetAllConstants.Parent = Frame_2
GetAllConstants.BackgroundColor3 = Color3.fromRGB(83, 0, 0)
GetAllConstants.BorderColor3 = Color3.fromRGB(0, 0, 0)
GetAllConstants.BorderSizePixel = 0
GetAllConstants.Position = UDim2.new(0.77692306, 0, 0.333333343, 0)
GetAllConstants.Size = UDim2.new(0.169, 0, 0.103, 0)
GetAllConstants.Font = Enum.Font.SourceSansBold
GetAllConstants.Text = "Get Constants"
GetAllConstants.TextColor3 = Color3.fromRGB(255, 255, 255)
GetAllConstants.TextScaled = true
GetAllConstants.TextSize = 14.000
GetAllConstants.TextWrapped = true

UICorner_3.CornerRadius = UDim.new(0, 3)
UICorner_3.Parent = GetAllConstants

Folder.Parent = Frame_2

FunctionUse.Name = "FunctionUse"
FunctionUse.Parent = Folder
FunctionUse.BackgroundColor3 = Color3.fromRGB(152, 152, 152)
FunctionUse.BackgroundTransparency = 0.900
FunctionUse.BorderColor3 = Color3.fromRGB(0, 0, 0)
FunctionUse.BorderSizePixel = 0
FunctionUse.Size = UDim2.new(1, 0, 0, 35)
FunctionUse.Visible = false

FunctionName.Name = "FunctionName"
FunctionName.Parent = FunctionUse
FunctionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FunctionName.BackgroundTransparency = 1.000
FunctionName.BorderColor3 = Color3.fromRGB(0, 0, 0)
FunctionName.BorderSizePixel = 0
FunctionName.Position = UDim2.new(0.00285714283, 0, 0.170940176, 0)
FunctionName.Size = UDim2.new(0.423, 0, 0.641, 0)
FunctionName.Font = Enum.Font.SourceSansBold
FunctionName.Text = "Activate"
FunctionName.TextColor3 = Color3.fromRGB(255, 255, 255)
FunctionName.TextScaled = true
FunctionName.TextSize = 14.000
FunctionName.TextWrapped = true

SaveFunctionInstance.Name = "SaveFunctionInstance"
SaveFunctionInstance.Parent = FunctionUse
SaveFunctionInstance.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SaveFunctionInstance.BackgroundTransparency = 1.000
SaveFunctionInstance.BorderColor3 = Color3.fromRGB(0, 0, 0)
SaveFunctionInstance.BorderSizePixel = 0
SaveFunctionInstance.Position = UDim2.new(0.765428662, 0, 0.170940176, 0)
SaveFunctionInstance.Size = UDim2.new(0.214, 0, 0.641, 0)
SaveFunctionInstance.Font = Enum.Font.SourceSans
SaveFunctionInstance.Text = "Get Instance"
SaveFunctionInstance.TextColor3 = Color3.fromRGB(56, 255, 11)
SaveFunctionInstance.TextScaled = true
SaveFunctionInstance.TextSize = 14.000
SaveFunctionInstance.TextWrapped = true

FunctionNups.Name = "FunctionNups"
FunctionNups.Parent = FunctionUse
FunctionNups.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FunctionNups.BackgroundTransparency = 1.000
FunctionNups.BorderColor3 = Color3.fromRGB(0, 0, 0)
FunctionNups.BorderSizePixel = 0
FunctionNups.Position = UDim2.new(0.574000061, 0, 0.170940176, 0)
FunctionNups.Size = UDim2.new(0.214, 0, 0.641, 0)
FunctionNups.Font = Enum.Font.SourceSans
FunctionNups.Text = "Nups : 9"
FunctionNups.TextColor3 = Color3.fromRGB(255, 255, 255)
FunctionNups.TextScaled = true
FunctionNups.TextSize = 14.000
FunctionNups.TextWrapped = true

ValueUse.Name = "ValueUse"
ValueUse.Parent = Folder
ValueUse.BackgroundColor3 = Color3.fromRGB(152, 152, 152)
ValueUse.BackgroundTransparency = 0.900
ValueUse.BorderColor3 = Color3.fromRGB(0, 0, 0)
ValueUse.BorderSizePixel = 0
ValueUse.Size = UDim2.new(1, 0, 0, 35)
ValueUse.Visible = false

Index.Name = "Index"
Index.Parent = ValueUse
Index.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Index.BackgroundTransparency = 1.000
Index.BorderColor3 = Color3.fromRGB(0, 0, 0)
Index.BorderSizePixel = 0
Index.Position = UDim2.new(0.0257142857, 0, 0.170940176, 0)
Index.Size = UDim2.new(0.094, 0, 0.641, 0)
Index.Font = Enum.Font.SourceSansBold
Index.Text = "1"
Index.TextColor3 = Color3.fromRGB(255, 255, 255)
Index.TextScaled = true
Index.TextSize = 14.000
Index.TextWrapped = true

IndexValue.Name = "IndexValue"
IndexValue.Parent = ValueUse
IndexValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
IndexValue.BackgroundTransparency = 1.000
IndexValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
IndexValue.BorderSizePixel = 0
IndexValue.Position = UDim2.new(0.21685721, 0, 0.170940176, 0)
IndexValue.Size = UDim2.new(0.46, 0, 0.641, 0)
IndexValue.Font = Enum.Font.SourceSans
IndexValue.Text = "Brrr"
IndexValue.TextColor3 = Color3.fromRGB(255, 255, 255)
IndexValue.TextScaled = true
IndexValue.TextSize = 14.000
IndexValue.TextWrapped = true
IndexValue.Active = false

ToEditButton.Name = "ToEditButton"
ToEditButton.Parent = ValueUse
ToEditButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToEditButton.BackgroundTransparency = 1.000
ToEditButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ToEditButton.BorderSizePixel = 0
ToEditButton.Position = UDim2.new(0.716857195, 0, 0.170940176, 0)
ToEditButton.Size = UDim2.new(0.266, 0, 0.641, 0)
ToEditButton.Font = Enum.Font.SourceSansBold
ToEditButton.Text = "EDIT"
ToEditButton.TextColor3 = Color3.fromRGB(26, 255, 0)
ToEditButton.TextScaled = true
ToEditButton.TextSize = 14.000
ToEditButton.TextWrapped = true

TextLabel.Parent = Frame
TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.5, 0, 0.479807734, 0)
TextLabel.Size = UDim2.new(0.512820542, 0, 0.641025662, 0)
TextLabel.Font = Enum.Font.SourceSansItalic
TextLabel.Text = "Buggers | Icarus Software."
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true




Eye.Name = "Eye"
Eye.Parent = debugTool
Eye.BackgroundColor3 = Color3.fromRGB(97, 0, 0)
Eye.BorderColor3 = Color3.fromRGB(0, 0, 0)
Eye.BorderSizePixel = 0
Eye.Position = UDim2.new(0.566999972, 0, 0.140000001, 0)
Eye.Size = UDim2.new(0.075, 0, 0.075, 0)
Eye.SizeConstraint = Enum.SizeConstraint.RelativeYY
Eye.Active = true
Eye.Draggable = true
Eye.Text = "B"
Eye.TextScaled = true
Eye.TextWrapped = true
Eye.Font = Enum.Font.SourceSansItalic
Eye.TextColor3 = Color3.new(1,1,1)

UIAspectRatioConstraint_2.Parent = Eye

UICorner_4.CornerRadius = UDim.new(1, 0)
UICorner_4.Parent = Eye

Eye.MouseButton1Click:Connect(function()
	Frame.Visible = not Frame.Visible
end)


ScriptName.TextColor3 = Color3.new(1,1,1)
FuncName.TextColor3 = Color3.new(1,1,1)

OriginalButtonText[GetAllFunctions] = GetAllFunctions.Text
OriginalButtonText[GetAllUpvalues] = GetAllUpvalues.Text
OriginalButtonText[GetAllConstants] = GetAllConstants.Text


local function ClearSFS()
	for i, child in pairs(ScrollFrameStuff:GetChildren()) do
		if child:IsA("Frame") then
			child:Destroy()
		end
	end
end

local function NumberOfChildrenInSFS()
	local III = 0
	for i, child in pairs(ScrollFrameStuff:GetChildren()) do
		if child:IsA("Frame") then
			III += 1
		end
	end
	return III
end

local SaveFuncInstance_Text = [[
local SavedFunc
local Script_Name = "%s"
for i, Func in pairs(getgc()) do
	if type(Func) == "function" and string.sub(getinfo(Func).short_src, -#Script_Name) == Script_Name and #getupvalues(Func) == %i and getinfo(Func).name == "%s" then
		SavedFunc = Func
		break
	end
end
]]

local SaveUpValueInstance_Text = [[
local SavedFunc
local Script_Name = "%s"
for i, Func in pairs(getgc()) do
	if type(Func) == "function" and string.sub(getinfo(Func).short_src, -#Script_Name) == Script_Name and #getupvalues(Func) == %i and getinfo(Func).name == "%s" then
		SavedFunc = Func
		break
	end
end
local UpValue = getupvalues(SavedFunc)[%i]
]]

local SaveConstantsInstance_Text = [[
local SavedFunc
local Script_Name = "%s"
for i, Func in pairs(getgc()) do
	if type(Func) == "function" and string.sub(getinfo(Func).short_src, -#Script_Name) == Script_Name and #getconstants(Func) == %i and getinfo(Func).name == "%s" then
		SavedFunc = Func
		break
	end
end
local Constant = getconstants(SavedFunc)[%i]
]]

local function StringToEnum(Stringed)
	local EnumCheck = Enum
	local suc, err = pcall(function()
		for i,v in pairs(string.split(Stringed, ".")) do
			if v == "Enum" then
				continue
			end
			EnumCheck = EnumCheck[v]
		end
	end)
	if not suc then
		print(err)
		return nil
	else
		return EnumCheck
	end
end

local function CreateButton(Type, Args)
	if Type == "Func" then
		local MyFrame = FunctionUse:Clone()
		MyFrame.Parent = ScrollFrameStuff
		MyFrame.FunctionName.Text = getinfo(Args["Func"]).name
		MyFrame.FunctionNups.Text = getinfo(Args["Func"]).nups
		MyFrame.Visible = true

		MyFrame.FunctionName.MouseButton1Click:Connect(function()
			toClipboard(getinfo(Args["Func"]).name)
		end)
		MyFrame.SaveFunctionInstance.MouseButton1Click:Connect(function()
			toClipboard(string.format(SaveFuncInstance_Text,Args["Short_SRC_Format"],#getupvalues(Args["Func"]), getinfo(Args["Func"]).name ))
		end)
	elseif Type == "Value" then
		local MyFrame = ValueUse:Clone()
		MyFrame.Parent = ScrollFrameStuff
		MyFrame.Index.Text = Args["Index"]
		MyFrame.IndexValue.Text = Args["Value"]
		MyFrame.Visible = true
		
		MyFrame.ToEditButton.MouseButton1Click:Connect(function()
			MyFrame.IndexValue:CaptureFocus()
		end)
		MyFrame.IndexValue.FocusLost:Connect(function()
			if (typeof(MyFrame.IndexValue.Text) == Args["ValueType"]) or (Args["ValueType"] == "number" and tonumber(MyFrame.IndexValue.Text) ~= nil)  or (Args["ValueType"] == "EnumItem" and StringToEnum(MyFrame.IndexValue.Text) ~= nil) then
				Args["Value"] = MyFrame.IndexValue.Text
				local SelectedFuncToUse
				if Args["WhichOne"] == "UV" then
					SelectedFuncToUse = setupvalue
				elseif Args["WhichOne"] == "CN" then
					SelectedFuncToUse= setconstant
				end
				if Args["ValueType"] == "number" then
					Args["Value"] = tonumber(Args["Value"])
				elseif Args["ValueType"] == "boolean" then
					if Args["Value"] == "false" then
						Args["Value"] = false
					elseif Args["Value"] == "true" then
						Args["Value"] = true
					end
				elseif Args["ValueType"] == "EnumItem" then
					Args["Value"] = StringToEnum(Args["Value"])
				end
				SelectedFuncToUse(Args["Func"], Args["Index"], Args["Value"])
			else
				MyFrame.IndexValue.Text = "Invalid Type | Original Type : "..Args["ValueType"]
				task.wait(1)
				MyFrame.IndexValue.Text = Args["Value"]
			end
		end)
		MyFrame.Index.MouseButton1Click:Connect(function()
			print(string.format(SaveUpValueInstance_Text,Args["Short_SRC_Format"],#getupvalues(Args["Func"]), getinfo(Args["Func"]).name, Args["Index"]))
			if Args["WhichOne"] == "UV" then
				toClipboard(string.format(SaveUpValueInstance_Text,Args["Short_SRC_Format"],#getupvalues(Args["Func"]), getinfo(Args["Func"]).name, Args["Index"]))
			elseif Args["WhichOne"] == "CN" then
				toClipboard(string.format(SaveConstantsInstance_Text,Args["Short_SRC_Format"],#getconstants(Args["Func"]), getinfo(Args["Func"]).name, Args["Index"]))
			end
		end)
	end
end

local function TempText(Button, TextToChange,timeWait)
	Button.Text = TextToChange
	task.wait(tonumber(timeWait) or 3)
	Button.Text = OriginalButtonText[Button]
end

local Short_SRC_Format
local Func_Format
GetAllFunctions.MouseButton1Click:Connect(function()
	if ScriptName.Text == "" or ScriptName.Text == nil then
		TempText(GetAllFunctions,"Null Script Name",1)
	else
		ClearSFS()
		Short_SRC_Format = ScriptName.Text
		for i, Func in pairs(getgc()) do
			if type(Func) == "function" and string.sub(getinfo(Func).short_src, -#Short_SRC_Format) == Short_SRC_Format then
				CreateButton("Func", {["Func"] = Func, ["Index"] = i, ["Short_SRC_Format"] = Short_SRC_Format})
			end
		end
		if NumberOfChildrenInSFS() == 0 then
			TempText(GetAllFunctions,"No Function Found!",1)
		end
	end
end)

GetAllUpvalues.MouseButton1Click:Connect(function()
	if ScriptName.Text == "" or ScriptName.Text == nil then
		TempText(GetAllUpvalues,"Null Script Name",1)
	else
		ClearSFS()
		Short_SRC_Format = ScriptName.Text
		Func_Format = FuncName.Text
		for i, Func in pairs(getgc()) do
			if type(Func) == "function" and string.sub(getinfo(Func).short_src, -#Short_SRC_Format) == Short_SRC_Format and getinfo(Func).name == FuncName.Text then
				for j, UpValue in pairs(getupvalues(Func)) do
					CreateButton("Value", {["WhichOne"] = "UV", ["Func"] = Func, ["Index"] = j, ["Value"] = tostring(UpValue), ["ValueType"] = typeof(UpValue), ["Short_SRC_Format"] = Short_SRC_Format})
				end
			end
		end
		if NumberOfChildrenInSFS() == 0 then
			TempText(GetAllUpvalues,"No UpValues Found!",1)
		end
	end
end)


GetAllConstants.MouseButton1Click:Connect(function()
	if ScriptName.Text == "" or ScriptName.Text == nil then
		TempText(GetAllConstants,"Null Script Name",1)
	else
		ClearSFS()
		Short_SRC_Format = ScriptName.Text
		Func_Format = FuncName.Text
		for i, Func in pairs(getgc()) do
			if type(Func) == "function" and string.sub(getinfo(Func).short_src, -#Short_SRC_Format) == Short_SRC_Format and getinfo(Func).name == FuncName.Text then
				for j, UpValue in pairs(getconstants(Func)) do
					CreateButton("Value", {["WhichOne"] = "CN", ["Func"] = Func, ["Index"] = j, ["Value"] = tostring(UpValue), ["ValueType"] = typeof(UpValue), ["Short_SRC_Format"] = Short_SRC_Format})
				end
			end
		end
		if NumberOfChildrenInSFS() == 0 then
			TempText(GetAllConstants,"No Constants Found!",1)
		end
	end
end)
