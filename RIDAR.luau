-- NO SKIIDING
--GIVE CREDITS

-- Instances:
local NAME_GUI = "RIDAR"
if game.CoreGui:FindFirstChild(NAME_GUI) then
	return error("THERE IS ALREADY A "..NAME_GUI.."!")
end

local ScreenGui = Instance.new("ScreenGui")
local Audio = Instance.new("Folder")
local Frame = Instance.new("Frame")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local ViewportFrame = Instance.new("ViewportFrame")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local Arrow = Instance.new("Frame")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local ImageLabel = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local Line = Instance.new("Frame")
local ERRORTEXT = Instance.new("TextLabel")
local LeScript = Instance.new('LocalScript', ScreenGui)
local Grid = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")

local UICorner_3 = Instance.new("UICorner")

local CurrentCamera = game.Workspace.CurrentCamera

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = NAME_GUI
ScreenGui.DisplayOrder = 10000000
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Audio.Name = "Audio"
Audio.Parent = LeScript

local function CreateAudioFile(Name, ID)
	local AudioA = Instance.new("Sound")
	AudioA.Name = Name
	AudioA.SoundId = ID
	AudioA.Parent = Audio
	AudioA.Volume = 1.5
end
CreateAudioFile("ButtonPressed", "rbxassetid://16480549841")
CreateAudioFile("DebugAlert", "rbxassetid://9113462101")
CreateAudioFile("ErrorSound", "rbxassetid://106019244766279")
CreateAudioFile("Ringing", "rbxassetid://87085224980395")
CreateAudioFile("RingingLoop", "rbxassetid://87085224980395")
CreateAudioFile("Ping", "rbxassetid://136773762677501")

Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(1, 1)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.972678661, 0, 0.939122438, 0)
Frame.Size = UDim2.new(0.175388396, 0, 0.340151519, 0)

UICorner_3.CornerRadius = UDim.new(0, 10)
UICorner_3.Parent = Frame

UIAspectRatioConstraint.Parent = Frame

ViewportFrame.Ambient = Color3.fromRGB(0, 0, 0)
ViewportFrame.LightColor = Color3.fromRGB(255, 255, 255)
ViewportFrame.BackgroundTransparency = 0.500
ViewportFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ViewportFrame.BackgroundColor3 = Color3.fromRGB(22, 118, 15)
ViewportFrame.BorderSizePixel = 0
ViewportFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ViewportFrame.Parent = Frame
ViewportFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
ViewportFrame.ClipsDescendants = true
ViewportFrame.Size = UDim2.new(.9,0,.9,0)

UIAspectRatioConstraint_2.Parent = ViewportFrame

Arrow.Name = "Arrow"
Arrow.Parent = ViewportFrame
Arrow.AnchorPoint = Vector2.new(0.5, 0.5)
Arrow.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Arrow.BackgroundTransparency = 1.000
Arrow.BorderColor3 = Color3.fromRGB(0, 0, 0)
Arrow.BorderSizePixel = 0
Arrow.Position = UDim2.new(0.5, 0, 0.5, 0)
Arrow.Rotation = 67.000
Arrow.Size = UDim2.new(0, 8, 0, 17)

UIAspectRatioConstraint_3.Parent = Arrow

ImageLabel.Parent = Arrow
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Rotation = 180.000
ImageLabel.Size = UDim2.new(1, 0, 1, 0)
ImageLabel.Image = "rbxassetid://16699943408"

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = ViewportFrame

Line.Name = "Line"
Line.Parent = Frame
Line.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line.BorderSizePixel = 0
Line.Size = UDim2.new(1, 0, 0, 3)

ERRORTEXT.Name = "ERRORTEXT"
ERRORTEXT.Parent = Frame
ERRORTEXT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ERRORTEXT.BackgroundTransparency = 1.000
ERRORTEXT.BorderColor3 = Color3.fromRGB(0, 0, 0)
ERRORTEXT.BorderSizePixel = 0
ERRORTEXT.Position = UDim2.new(0.0106555428, 0, -0.155901074, 0)
ERRORTEXT.Size = UDim2.new(0.979020953, 0, 0.128205121, 0)
ERRORTEXT.Visible = false
ERRORTEXT.Font = Enum.Font.Unknown
ERRORTEXT.Text = "AN ERROR HAS OCCURED"
ERRORTEXT.TextColor3 = Color3.fromRGB(255, 3, 3)
ERRORTEXT.TextScaled = true
ERRORTEXT.TextSize = 14.000
ERRORTEXT.TextStrokeTransparency = 0.000
ERRORTEXT.TextWrapped = true

Grid.Name = "Grid"
Grid.Parent = Frame
Grid.AnchorPoint = Vector2.new(0.5, 0.5)
Grid.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Grid.BorderColor3 = Color3.fromRGB(0, 0, 0)
Grid.BorderSizePixel = 0
Grid.Position = UDim2.new(0.5, 0, 0.5, 0)
Grid.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
Grid.Visible = false
Grid.Image = "rbxassetid://130813632439126"
Grid.ImageColor3 = Color3.fromRGB(11, 158, 4)
Grid.ScaleType = Enum.ScaleType.Tile
Grid.TileSize = UDim2.new(0.5, 0, 0.5, 0)
Grid.ZIndex = -10

UICorner_2.CornerRadius = UDim.new(1, 0)
UICorner_2.Parent = Grid

-- Scripts:

local AlreadyPing = false
local function NBSJMTZ_fake_script() -- ScreenGui.LocalScript 
	local script = LeScript



	-----// SERVICES //-----
	local PLRS = game:GetService("Players") 
	local RUN = game:GetService("RunService") 

	-----// VARIABLES //-----
	local player = PLRS.LocalPlayer;
	repeat RUN.RenderStepped:Wait() until player.Character
	local character = player.Character;

	local screen = script.Parent;
	local viewport = ViewportFrame
	local arrow = Arrow
	local Line = Line

	local UIS = game:GetService("UserInputService")
	local camera = Instance.new("Camera", viewport) 


	local SsizeX, SsizeY, SsizeZ = 100, 1200, 100;
	local BsizeX, BsizeY, BsizeZ = 225, 2250, 225;

	local sizeX, sizeY, sizeZ = SsizeX, SsizeY, SsizeZ;

	local ListOfDataStored_MAXHEIGHT = {}
	local StoredCharacter = {}
	local StoredCharacter2 = {}
	local HoldingDownList = {}
	local DoneKeybindList = {}
	local StoredParts_1 = {}
	local StoredParts_2 = {}

	local BigSize = UDim2.new(0.421, 0,0.6, 0)
	local SmallSize = UDim2.new(0.175, 0,0.34, 0)

	local Errored = false
	local Off = false
	local BigSizeBool = false
	local OnlyHumanoids = false

	local ERRTXT = screen.Frame.ERRORTEXT
	local SelfTick
	local function TriggerError(text, ToPlayAudio, ToStop)
		if ToStop == nil then
			ToStop = true
			Errored = ToStop
		end
		if ToPlayAudio == nil then
			ToPlayAudio = true
		end
		ERRTXT.Visible = true
		local Tick = tick()
		SelfTick = Tick
		ERRTXT.Text = text
		if ToPlayAudio then
			Audio.ErrorSound:Play()
		end
		task.delay(5, function()
			if SelfTick == Tick then
				ERRTXT.Text = ""
				ERRTXT.Visible = false
			end
		end)
	end

	UIS.InputBegan:Connect(function(inputobj, IsChat)
		if IsChat then return end
		if ScreenGui == nil then return end
		HoldingDownList[inputobj.keyCode] = true
	end)

	UIS.InputEnded:Connect(function(inputobj, IsChat)
		--if IsChat then return end
		HoldingDownList[inputobj.keyCode] = false
	end)

	local ClearEveryTwentyInterval = 0

	RUN.RenderStepped:Connect(function()
		if HoldingDownList[Enum.KeyCode.LeftAlt] and HoldingDownList[Enum.KeyCode.LeftShift] and HoldingDownList[Enum.KeyCode.D] then
			if DoneKeybindList["Debug1"] then
				return
			end

			DoneKeybindList["Debug1"] = true
			TriggerError("DEBUG #1 - AUDIO TESTING", nil ,false)
			Audio.ButtonPressed:Play()
			Audio.ButtonPressed.Ended:Wait()
			task.wait(1)
			TriggerError("D1 AUDIO TESTING / DEBUG AUDIO", false,false)
			Audio.DebugAlert:Play()
			Audio.DebugAlert.Ended:Wait()
			task.wait(1)
			TriggerError("D1 AUDIO TESTING / ERROR SOUND", false,false)
			Audio.ErrorSound:Play()
			Audio.ErrorSound.Ended:Wait()
			task.wait(1)
			TriggerError("D1 AUDIO TESTING / RINGING SOUND", false,false)
			Audio.Ringing:Play()
			Audio.Ringing.Ended:Wait()
			task.wait(1)
			TriggerError("D1 AUDIO TESTING / CLICKING SOUND", false,false)
			Audio.ButtonPressed:Play()
			Audio.ButtonPressed.Ended:Wait()
			task.wait(1)
			TriggerError("D1 AUDIO TESTING / PING SOUND", false,false)
			Audio.Ping:Play()
			Audio.Ping.Ended:Wait()
			task.wait(1)
			TriggerError("D1 AUDIO TESTING / RINGING_LOOP SOUND", false,false)
			Audio.RingingLoop:Play()
			task.wait(2)
			Audio.RingingLoop:Stop()
			task.wait(1)
			TriggerError("D1 AUDIO TESTING / ENDED", false,false)
			task.wait(0.5)
		elseif HoldingDownList[Enum.KeyCode.LeftAlt] and HoldingDownList[Enum.KeyCode.LeftShift] and HoldingDownList[Enum.KeyCode.Backspace] then
			if DoneKeybindList["Destroy"] then
				return
			end

			DoneKeybindList["Destroy"] = true
			Off = true
			
			task.wait(0.1)
			
			pcall(function()
				for _, child in pairs(viewport:GetChildren()) do
					if child:IsA("BasePart") then child:Destroy() end
				end
			end)
			ScreenGui:Destroy()
		elseif HoldingDownList[Enum.KeyCode.LeftAlt] and HoldingDownList[Enum.KeyCode.LeftShift] and HoldingDownList[Enum.KeyCode.X] then
			if DoneKeybindList["HumanoidChoice"] then
				return
			end

			DoneKeybindList["HumanoidChoice"] = true
			Audio.ButtonPressed:Play()
			OnlyHumanoids = not OnlyHumanoids
			screen.Frame.Grid.Visible = OnlyHumanoids
			if OnlyHumanoids then
				viewport.BackgroundTransparency = 1
			else
				viewport.BackgroundTransparency = 0.5
			end
			Audio.ButtonPressed.Ended:Wait()
		elseif HoldingDownList[Enum.KeyCode.LeftAlt] and HoldingDownList[Enum.KeyCode.LeftShift] and HoldingDownList[Enum.KeyCode.N] then
			if DoneKeybindList["Off"] then
				return
			end
			DoneKeybindList["Off"] = true

			Audio.ButtonPressed:Play()
			pcall(function()
				for _, child in pairs(viewport:GetChildren()) do
					if child:IsA("BasePart") then child:Destroy() end
				end
			end)
			Off = not Off
			screen.Enabled = not Off
		elseif HoldingDownList[Enum.KeyCode.LeftAlt] and HoldingDownList[Enum.KeyCode.LeftShift] and HoldingDownList[Enum.KeyCode.B] then
			if DoneKeybindList["Reset"] then
				return
			end

			DoneKeybindList["Reset"] = true
			Audio.ButtonPressed:Play()
			Errored = false
			Audio.ButtonPressed.Ended:Wait()
		elseif HoldingDownList[Enum.KeyCode.LeftAlt] and HoldingDownList[Enum.KeyCode.LeftShift] and HoldingDownList[Enum.KeyCode.V] then
			local Name = "ClearAllData"
			if DoneKeybindList[Name] then
				return
			end

			Errored = true
			DoneKeybindList[Name] = true
			task.wait(.1)

			Audio.ButtonPressed:Play()
			Audio.DebugAlert:Play()

			pcall(function()
				for _, child in pairs(viewport:GetChildren()) do
					if child:IsA("BasePart") then child:Destroy() end
				end
			end)

			ListOfDataStored_MAXHEIGHT = {}
			StoredCharacter = {}
			StoredCharacter2 = {}
			HoldingDownList = {}
			DoneKeybindList = {}
			StoredParts_1 = {}
			StoredParts_2 = {}

			Audio.DebugAlert.Ended:Wait()
			task.wait()
			Errored = false
		elseif HoldingDownList[Enum.KeyCode.LeftAlt] and HoldingDownList[Enum.KeyCode.LeftShift] and HoldingDownList[Enum.KeyCode.Z] then
			local Name = "BigSize"
			if DoneKeybindList[Name] then
				return
			end
			DoneKeybindList[Name] = true

			ListOfDataStored_MAXHEIGHT = {}
			StoredCharacter = {}
			StoredCharacter2 = {}
			HoldingDownList = {}
			StoredParts_1 = {}
			StoredParts_2 = {}

			if not BigSizeBool then
				screen.Frame.Size = BigSize
				BigSizeBool = true

				sizeX = BsizeX
				sizeY = BsizeY
				sizeZ = BsizeZ
				print(sizeX)
			else
				screen.Frame.Size = SmallSize
				BigSizeBool = false

				sizeX = SsizeX
				sizeY = SsizeY
				sizeZ = SsizeZ
			end
		else
			DoneKeybindList = {}
		end
	end)

	-----// CODE //-----

	camera.FieldOfView = 10;
	viewport.CurrentCamera = camera;

	local function GetAngle()
		CurrentCamera = game.Workspace.CurrentCamera
		--local X,Y,Z = CurrentCamera.CFrame:ToOrientation()
		--local Angle = math.deg(Y)
		local Angle = character.HumanoidRootPart.Orientation.Y
		return Angle
	end

	local function HighestPointOfModel(model : Model)
		if not ListOfDataStored_MAXHEIGHT[model] then
			local SUC,ERR = pcall(function()
				--print(model)
				local Highest = 0
				local Part = nil
				for i,v in pairs(model:GetDescendants()) do
					if v:IsA("BasePart") and v.Position.Y + (v.Size.Y)/2 > Highest then
						Highest = v.Position.Y + (v.Size.Y)/2
						Part = v
						--print(Part.Position)
					end
				end
				ListOfDataStored_MAXHEIGHT[model] = {Highest, Part}
			end)
			if not SUC then
				TriggerError("AN ERROR HAS OCCURED [HPF]")
				warn("AN ERROR HAS OCCURED [HPF] ", ERR)
			end
		end
		return ListOfDataStored_MAXHEIGHT[model] or {-1,nil}
	end


	local ToCoolDownRate = 0
	local List
	local Height, Part
	while task.wait() do
		if Off then continue end
		if Errored then continue end
		AlreadyPing = false

		ClearEveryTwentyInterval += 1
		if ClearEveryTwentyInterval > 20 then
			ListOfDataStored_MAXHEIGHT = {}
			StoredCharacter = {}
			StoredCharacter2 = {}
			ClearEveryTwentyInterval = 0
			AlreadyPing = true
		end

		character = player.Character

		for i = 1, 12 do
			local y = math.abs(i/7 - 1)
			Line.Position = UDim2.new(0,0,y,0)
			task.wait()
		end

		local currentPos = character.HumanoidRootPart.Position;
		local r3 = Region3.new(Vector3.new(currentPos.X - sizeX, currentPos.Y - sizeY, currentPos.Z - sizeZ), Vector3.new(currentPos.X + sizeX, currentPos.Y + sizeY, currentPos.Z + sizeZ)) 
		local objects = workspace:FindPartsInRegion3(r3, character, math.huge) 

		for _, child in pairs(viewport:GetChildren()) do
			if StoredCharacter2[child] then
				if StoredCharacter2[child]:FindFirstChildWhichIsA("BasePart") and table.find(objects ,StoredCharacter2[child]:FindFirstChildWhichIsA("BasePart")) then
					continue
				end
			end
			if child:IsA("BasePart") and (table.find(objects, StoredParts_2[child]) == nil or OnlyHumanoids) then
				if StoredParts_2[child] then
					if StoredParts_1[ StoredParts_2[child] ] then
						StoredParts_1[ StoredParts_2[child] ] = nil
					end
					StoredParts_2[child] = nil
				end
				child:Destroy() 
			end

		end

		--print(GetAngle())
		viewport.Rotation = GetAngle() + 90
		-- Current character position

		for _, obj in pairs(objects) do
			local SUC, ERR = pcall(function()
				ToCoolDownRate = 0
				if obj.Parent ~= nil and (obj.Parent:FindFirstChildOfClass("Humanoid") or obj.Parent:FindFirstChild("HumanoidRootPart")) and StoredCharacter[obj.Parent] == nil then
					repeat
						List = HighestPointOfModel(obj.Parent)
						Height, Part = List[1], List[2]
						ToCoolDownRate += 1
					until (Height > 0 and Part ~= nil ) or ToCoolDownRate > 5

					if ToCoolDownRate > 5 then
						return warn("AN ERROR HAS OCCURED [HPF], NOTE : ToCoolDownRate OVERFLOWED")
					end

					if not AlreadyPing then
						AlreadyPing = true
						Audio.Ping:Play()
					end

					local part = Instance.new('Part')
					part.Name = "HitMarker"
					part.Parent = viewport
					part.Anchored = true
					part.Size = Vector3.new(3,1,3)
					part.Position = Vector3.new(Part.Position.X,Height + 75,Part.Position.Z)
					part.CanCollide = false
					part.Transparency = 0
					part.Material = Enum.Material.Neon
					if PLRS:GetPlayerFromCharacter(obj.Parent) == nil then
						part.BrickColor = BrickColor.new("Bright blue")
					else
						part.BrickColor = BrickColor.new("Sea green")
					end
					StoredCharacter[obj.Parent] = part
					StoredCharacter2[part] = obj.Parent
				elseif StoredCharacter[obj.Parent] ~= nil then
					
					repeat
						List = HighestPointOfModel(obj.Parent)
						Height, Part = List[1], List[2]
						ToCoolDownRate += 1
					until (Height > 0 and Part ~= nil and Part.Parent ~= nil ) or ToCoolDownRate > 5

					if ToCoolDownRate > 5 then
						return warn("AN ERROR HAS OCCURED [HPF] #2, NOTE : ToCoolDownRate OVERFLOWED")
					end

					StoredCharacter[obj.Parent].Position = Vector3.new(Part.Position.X,Height + 75,Part.Position.Z)
				end
				if obj.Parent and not obj.Parent:FindFirstChildOfClass("Humanoid") and not OnlyHumanoids then
					if StoredParts_1[obj] ~= nil then
						StoredParts_1[obj].Position = obj.Position
					else
						local _c = obj:Clone();
						if _c then
							_c.Parent = viewport;

							StoredParts_1[obj] = _c
							StoredParts_2[_c] = obj
						end
					end
				end
			end)
			if not SUC then
				TriggerError("AN ERROR HAS OCCURED [OBJ_VPF]")
				warn("AN ERROR HAS OCCURED [OBJ_VPF] ", ERR)
			end
		end

		local lookVect = character.HumanoidRootPart.CFrame.lookVector;
		arrow.Rotation = -GetAngle() + 90

		camera.CFrame = CFrame.new(Vector3.new(character.HumanoidRootPart.Position.X, character.HumanoidRootPart.Position.Y + sizeY * 1.2, character.HumanoidRootPart.Position.Z), currentPos)
		--camera.CFrame = camera.CFrame  * CFrame.Angles(math.rad(-90), math.rad(GetAngle()), 0)
	end
end
coroutine.wrap(NBSJMTZ_fake_script)()
