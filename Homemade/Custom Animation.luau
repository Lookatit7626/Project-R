local Animations = {
	["R6"] = {
		["HEIL"] = {
			["ID"] = "rbxassetid://32326240";
			["TimePos"] = .18;
			["ToTimePos"] = nil;
			["FullAnimation"] = false;
			["Looped"] = false;
			["AnimationSpeed"] = nil;
		};
		["SURRENDER"] = {
			["ID"] = "rbxassetid://42071644";
			["TimePos"] = 3;
			["ToTimePos"] = nil;
			["FullAnimation"] = false;
			["Looped"] = false;
			["AnimationSpeed"] = 3;
		};
		["DANCE?"] = {
			["ID"] = "rbxassetid://90814669";
			["TimePos"] = nil;
			["ToTimePos"] = nil;
			["FullAnimation"] = true;
			["Looped"] = true;
			["AnimationSpeed"] = .8;
		};
		["DANCE? BUT 2"] = {
			["ID"] = "rbxassetid://88038181";
			["TimePos"] = 1;
			["ToTimePos"] = 2.35;
			["FullAnimation"] = false;
			["Looped"] = true;
			["AnimationSpeed"] = 6;
		};
		["DANCE? BUT 3"] = {
			["ID"] = "rbxassetid://101862746";
			["TimePos"] = nil;
			["ToTimePos"] = nil;
			["FullAnimation"] = true;
			["Looped"] = true;
			["AnimationSpeed"] = 1.7;
		};
	};
	["R15"] = {
		["HEIL"] = {
			["ID"] = "rbxassetid://2459124514";
			["TimePos"] = .1;
			["ToTimePos"] = nil;
			["FullAnimation"] = false;
			["Looped"] = false;
			["AnimationSpeed"] = 0.25;
		};
		["HYPE DANCE"] = {
			["ID"] = "rbxassetid://10714369624";
			["TimePos"] = 1;
			["ToTimePos"] = 4;
			["FullAnimation"] = false;
			["Looped"] = false;
			["AnimationSpeed"] = 3;
		};
		["DOLPHIN"] = {
			["ID"] = "rbxassetid://10714068222";
			["TimePos"] = .07;
			["ToTimePos"] = nil;
			["FullAnimation"] = true;
			["Looped"] = true;
			["AnimationSpeed"] = 5;
		};
		["LETVITATE"] = {
			["ID"] = "rbxassetid://11394033602";
			["TimePos"] = 5;
			["ToTimePos"] = 6.6;
			["FullAnimation"] = false;
			["Looped"] = false;
			["AnimationSpeed"] = nil;
		};
		["FUNNY DANCE"] = {
			["ID"] = "rbxassetid://15122972413";
			["TimePos"] = nil;
			["ToTimePos"] = nil;
			["FullAnimation"] = true;
			["Looped"] = true;
			["AnimationSpeed"] = 2;
		};
		["TRUMP DANCE"] = {
			["ID"] = "rbxassetid://16553163212";
			["TimePos"] = nil;
			["ToTimePos"] = nil;
			["FullAnimation"] = true;
			["Looped"] = true;
			["AnimationSpeed"] = nil;
		};

	}
}


local Animation = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

--Properties:

Animation.Name = "Animation"
Animation.Parent = game.CoreGui
Animation.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = Animation
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.289959013, 0, 0.140151575, 0)
Frame.Size = UDim2.new(0.303278685, 0, 0.321969688, 0)

Frame.Active = true
Frame.Draggable = true

UIAspectRatioConstraint.Parent = Frame
UIAspectRatioConstraint.AspectRatio = 1.700

UICorner.Parent = Frame

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.151649982, 0, 0.0183154829, 0)
Title.Size = UDim2.new(0.692041516, 0, 0.100000001, 0)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "CUSTOM ANIMATIONS [H]"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

ScrollingFrame.Parent = Frame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.0492041516, 0, 0.152941227, 0)
ScrollingFrame.Size = UDim2.new(0.893, 0,0.835, 0)
ScrollingFrame.CanvasSize = UDim2.new(0,0,0,0)
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 1)


local UIS = game:GetService("UserInputService")
local RUN = game:GetService("RunService")
local lplr = game:GetService("Players").LocalPlayer

local IsR15 = lplr.Character:FindFirstChildOfClass('Humanoid').RigType == Enum.HumanoidRigType.R15
local humanoid = lplr.Character.Humanoid

local SelectedTrackButton
local SelectedTrackData

local CacheSelectedTrackData

local ToDo = false
local LShiftDown = false
UIS.InputBegan:Connect(function(InputObj, Chatted)
	if Chatted then
		return
	end
	if InputObj.KeyCode == Enum.KeyCode.LeftShift then
		LShiftDown = true
	end
	if InputObj.KeyCode == Enum.KeyCode.H then
		ToDo = true
	end
end)
UIS.InputEnded:Connect(function(InputObj, Chatted)
	if InputObj.KeyCode == Enum.KeyCode.H and not LShiftDown then
		ToDo = false
	end
	if InputObj.KeyCode == Enum.KeyCode.LeftShift then
		LShiftDown = false
	end
end)

local function createButton(i,v)
	local TextButton = Instance.new("TextButton")

	TextButton.Name = i
	TextButton.Parent = ScrollingFrame
	TextButton.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.BorderSizePixel = 0
	TextButton.Size = UDim2.new(1, 0, 0, 17)
	TextButton.Font = Enum.Font.SourceSansSemibold
	TextButton.Text = i
	TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.TextScaled = true
	TextButton.TextSize = 14.000
	TextButton.TextWrapped = true
	TextButton.TextXAlignment = Enum.TextXAlignment.Left
	
	TextButton.MouseButton1Click:Connect(function()
		if SelectedTrackButton == TextButton then
			SelectedTrackButton = nil
			TextButton.Text = TextButton.Name
			return
		end
		if SelectedTrackButton then
			SelectedTrackButton.Text = SelectedTrackButton.Name
		end
		SelectedTrackButton = TextButton
		SelectedTrackData = v
		TextButton.Text = i.." - SELECTED"
	end)
end

if IsR15 then
	for i,v in pairs(Animations["R15"]) do
		createButton(i,v)
	end
else
	for i,v in pairs(Animations["R6"]) do
		createButton(i,v)
	end
end

--local Animator
local Animation
local PreviousCharacter = nil

local TrackToUse
while true do -- Full animation
	task.wait()
	if not ToDo or SelectedTrackButton == nil then continue end

	if PreviousCharacter ~= lplr.Character or SelectedTrackData ~= CacheSelectedTrackData or TrackToUse == nil then
		if not Animator then
			--Animator = Instance.new("Animator")
		end
		if Animation then
			Animation:Destroy()
		end
		
		Animation = Instance.new("Animation")
		
		PreviousCharacter = lplr.Character
		CacheSelectedTrackData = SelectedTrackData
		
		--Animator.Parent = PreviousCharacter:FindFirstChildOfClass("Humanoid")
		Animation.Parent = PreviousCharacter:FindFirstChildOfClass("Humanoid")
		
		Animation.AnimationId = CacheSelectedTrackData.ID
		
		TrackToUse = PreviousCharacter:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
		TrackToUse.Looped = CacheSelectedTrackData.Looped
		TrackToUse.Priority = Enum.AnimationPriority.Action2
	end
	if ToDo and CacheSelectedTrackData then
		TrackToUse:Play()
		while ToDo do
			
			--TrackToUse:Play()
			RUN.RenderStepped:Wait()
			if CacheSelectedTrackData.TimePos then
				TrackToUse.TimePosition = CacheSelectedTrackData.TimePos
			end
			
			TrackToUse:AdjustSpeed(CacheSelectedTrackData.AnimationSpeed or 1)
			
			if CacheSelectedTrackData.ToTimePos ~= nil then
				repeat
					RUN.RenderStepped:Wait()
				until (CacheSelectedTrackData.ToTimePos or TrackToUse.Length) < TrackToUse.TimePosition or not ToDo
			else
				if CacheSelectedTrackData.FullAnimation then
					repeat
						RUN.RenderStepped:Wait()
					until TrackToUse.IsPlaying == false or not ToDo
				end
			end
			
			--print(Track.TimePosition)
		end
		TrackToUse:Stop()
	end
end
