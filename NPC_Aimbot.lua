--ECLIPSE HUB Aimbot
--OPEN SOURCED FOR SKIDS
--PLEASE GIVE CREDIT

print("___NPC AIMBOT BY ECLIPSE / ICARUS, ___ V:2313112")

local NPCPlayers = {}

local alreadyProcessing = false
coroutine.wrap(function()
	local function RegisterNPC(char)
		if game:GetService('Players'):FindFirstChild(char.Name) ~= nil then
			return
		end

		if table.find(NPCPlayers,char) ~= nil then
			return
		end

		table.insert(NPCPlayers,char)


		local DestroyingCharSignal
		local DescendantRemovingSignal
		local CharDiedSignal
		local Died = false

		local function ToDoOnceDied()
			if Died then
				return
			end
			Died = true
			table.remove(NPCPlayers,table.find(NPCPlayers,char))

			DestroyingCharSignal:Disconnect()
			DescendantRemovingSignal:Disconnect()
			CharDiedSignal:Disconnect()
			alreadyProcessing = false
		end
		
		
		
		DescendantRemovingSignal = char.DescendantRemoving:Connect(function(part)
			ToDoOnceDied()
		end)
		DestroyingCharSignal = char.Destroying:Connect(function()
			ToDoOnceDied()
		end)
		CharDiedSignal = char.Humanoid.Died:Connect(function()
			ToDoOnceDied()
		end)
		
		coroutine.wrap(function()
			repeat
				if table.find(NPCPlayers,char) == nil then
					table.insert(NPCPlayers,char)
				end

				task.wait(.1)
			until Died
		end)()
	end

	local function AttemptingToCheck(part)
		local continue = true
		
		pcall(function()
			if part:FindFirstChildOfClass("Humanoid") then
				continue = false
				RegisterNPC(part)
				return
			end
		end)
		
		if not continue then
			return
		end
		pcall(function()
			if part.Parent:FindFirstChildOfClass("Humanoid") then
				continue = false
				RegisterNPC(part.Parent)
				return
			end
		end)
	end

	workspace.DescendantAdded:Connect(function(part)
		AttemptingToCheck(part)
	end)
	
	for i,v in pairs(workspace:GetDescendants() ) do
		AttemptingToCheck(v)
	end

end)()

local LPCamera = game.Workspace.CurrentCamera
local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local UserInputSer = game:GetService('UserInputService')

local PlayerVeloOffset = false
local PlayerVeloOffsetTime = 800
local RadiusSize = 100
local MaxDistance = math.huge

local AutoShootBool = false

local EnabledAimbotMode = false

local UseFriendlySettings = false
local UseEnemySettings = false
local TeamCheckSettings = false


local FOVring = Drawing.new("Circle")
FOVring.Visible = false
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(255, 0, 0)
FOVring.Filled = false
FOVring.Radius = RadiusSize
FOVring.Position = LPCamera.ViewportSize / 2

local Health = Drawing.new('Text')
Health.Text = 'Health : 100'
Health.Color = Color3.fromRGB(255, 0, 0)
Health.OutlineColor = Color3.new(0, 0, 0)
Health.Center = true
Health.Outline = true
Health.Position = FOVring.Position + Vector2.new(0, RadiusSize/2)
Health.Size = 20
Health.Font = Drawing.Fonts.System -- Monospace, UI, System, Plex
Health.Transparency = .2
Health.Visible = false


local mouse1clickFunc = ""
if mouse1clickFunc == nil then
	warn("mousemoveabs is not a function on your executor!")
end

local camViewportSize
local function updateDrawings()
	camViewportSize = LPCamera.ViewportSize
	FOVring.Position = camViewportSize / 2

	FOVring.Radius = RadiusSize
	Health.Position = FOVring.Position + Vector2.new(0, RadiusSize/2)
end

local lookVector
local newCFrame

local function lookAt(target)
	lookVector = (target - LPCamera.CFrame.Position).unit
	newCFrame = CFrame.new(LPCamera.CFrame.Position, LPCamera.CFrame.Position + lookVector)
	LPCamera.CFrame = newCFrame
end

local function CheckForOb(Blacklist, PosToCheck)
	
	if not Players.LocalPlayer.Character then
		return false
	end
	
	if not Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		return false
	end
	
	local raycastParams = RaycastParams.new()
	raycastParams.FilterType = Enum.RaycastFilterType.Exclude
	raycastParams.FilterDescendantsInstances = Blacklist
	raycastParams.IgnoreWater = true
	raycastParams.RespectCanCollide = true
	
	local raycastResult = workspace:Raycast(LPCamera.CFrame.Position, (PosToCheck - LPCamera.CFrame.Position), raycastParams) -- casts ray from camera to player

	return not (raycastResult == nil)
end

local nearest = nil
local lastAB = math.huge
local playerMousePos = LPCamera.ViewportSize / 2

local distance
local PlayerDis
local part
local ePos, isVisible
local PlayerTeam = nil
local ToProceed = true
local HaveConfigured = false

local BlacklistSearchWC
local function getClosestPlayerInRing(trg_part)
	--SettingsToggleMode = "None" -- Both/Friendly/Enemy


	nearest = nil
	ToProceed = true
	playerMousePos = LPCamera.ViewportSize / 2
	lastAB = math.huge
	for _, player in ipairs(NPCPlayers) do
		if player ~= Players.LocalPlayer then
			pcall(function()
				part = player:FindFirstChild(trg_part)
				
				if part == nil and trg_part == nil then
					part = player.PrimaryPart or player:FindFirstChildOfClass('BasePart')
				end
				
				if part then
					HaveConfigured = false
					ToProceed = true
					ePos, isVisible = LPCamera:WorldToViewportPoint(part.Position)
					distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude
					PlayerDis = (Players.LocalPlayer.Character.HumanoidRootPart.Position - player.HumanoidRootPart.Position).Magnitude

					--TeamCheck

					if distance < lastAB and isVisible and distance < RadiusSize and PlayerDis < MaxDistance and player.Humanoid.Health > 0 and ToProceed then
					
						if TeamCheckSettings then
							BlacklistSearchWC = {}
							for _, Value in pairs( player:GetDescendants() ) do
								if Value:IsA('BasePart') or Value:IsA('MeshPart') or Value:IsA('Part') then
									table.insert(BlacklistSearchWC,Value)
								end
							end

							for _, Value in pairs( Players.LocalPlayer.Character:GetDescendants() ) do
								if Value:IsA('BasePart') or Value:IsA('MeshPart') or Value:IsA('Part') then
									table.insert(BlacklistSearchWC,Value)
								end
							end

							--if #(LPCamera:GetPartsObscuringTarget({player.Character.Head.Position}, BlacklistSearchWC )) > 0 then
							if CheckForOb(BlacklistSearchWC, player.Head.Position) then
								ToProceed = false
							end
						end
					
						if ToProceed then
							lastAB = distance
							nearest = player
						end
					end
				end

			end)
		end
	end

	return nearest
end

local ABBB, AEEEERRR
local closest
local PVOffSetVe = 0
local PVDis = 0
local TimeImpact = 0
local ePosForCheck, isVisibleCheck
local PlayerMousePosFromCharacter

local OnlyHeadShotBool = true
local OnlyBodyShotBool = false

local ToLookPart

local CharacterChosenTargetCharName = ""
local CharacterChosenTargetPart

RunService.RenderStepped:Connect(function()
	if EnabledAimbotMode then
		ABBB, AEEEERRR = pcall(function()
			updateDrawings()
			closest = getClosestPlayerInRing("Head")
			if closest == nil then
				closest = getClosestPlayerInRing("HumanoidRootPart")
			end
			if closest == nil then
				closest = getClosestPlayerInRing()
			end
			if closest and closest:FindFirstChild("Head") then

				if OnlyHeadShotBool then
					ToLookPart = closest.Head
				else

					if OnlyBodyShotBool then
						ToLookPart = closest:FindFirstChild("Torso") or closest:FindFirstChild("UpperTorso") or closest:FindFirstChild("HumanoidRootPart") or closest:FindFirstChildOfClass('BasePart')
					else

						if CharacterChosenTargetCharName ~= closest.Name then
							CharacterChosenTargetCharName = closest.Name
							if math.random(100) > 15 then
								ToLookPart = closest:FindFirstChild("Torso") or closest:FindFirstChild("UpperTorso") or closest:FindFirstChild("HumanoidRootPart") or closest:FindFirstChildOfClass('BasePart')
							else
								ToLookPart = closest.Head
							end
							CharacterChosenTargetPart = ToLookPart
						else
							ToLookPart = CharacterChosenTargetPart
						end

					end

				end

				if PlayerVeloOffset then
					playerMousePos = LPCamera.ViewportSize / 2
					PVDis = (Players.LocalPlayer.HumanoidRootPart.Position - closest.HumanoidRootPart.Position).Magnitude
					PVOffSetVe = closest.Head.Velocity
					TimeImpact = PVDis/PlayerVeloOffsetTime

					ePosForCheck, isVisibleCheck = LPCamera:WorldToViewportPoint(closest.Head.Position + PVOffSetVe * TimeImpact)
					PlayerMousePosFromCharacter = (Vector2.new(ePosForCheck.x, ePosForCheck.y) - playerMousePos).Magnitude
					
					
					
					if PlayerMousePosFromCharacter > (RadiusSize * 5/6) or not isVisibleCheck then
						lookAt(ToLookPart.Position + ( RadiusSize * 5/6 / PVOffSetVe ) )
					else
						lookAt(ToLookPart.Position + PVOffSetVe * TimeImpact)
					end

				else
					lookAt(ToLookPart.Position)
				end
				
				
				FOVring.Color = Color3.fromRGB(0, 200, 0)
				Health.Color = Color3.fromRGB(0, 200, 0)
				Health.Visible = true
				Health.Text = "Health : "..closest:FindFirstChild("Humanoid").Health

				if AutoShootBool and mouse1clickFunc ~= nil then
					game:GetService("VirtualInputManager"):SendMouseButtonEvent( (LPCamera.ViewportSize/2).X,  (LPCamera.ViewportSize/2).Y, 0, true, game, 1)
					task.wait()
					game:GetService("VirtualInputManager"):SendMouseButtonEvent( (LPCamera.ViewportSize/2).X,  (LPCamera.ViewportSize/2).Y, 0, false, game, 1)
				end
			else
				Health.Visible = false
				FOVring.Color = Color3.fromRGB(255, 0, 0)
			end
		end)
		if not ABBB then
			print(AEEEERRR)
		end
	end
end)

--GUI HERE

local Aimbot = Instance.new("ScreenGui")
local BackFrame = Instance.new("Frame")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local UICorner = Instance.new("UICorner")
local Line = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Radius = Instance.new("TextBox")
local EnableAB = Instance.new("TextButton")
local WallCheck = Instance.new("TextButton")
local AutoShoot = Instance.new("TextButton")
local MaxDis = Instance.new("TextBox")
local OffSetTime = Instance.new("TextBox")
local VeloCheck = Instance.new("TextButton")
local HeadshotsOnly = Instance.new("TextButton")
local OnlyBodyShot = Instance.new("TextButton")
local RadiusText = Instance.new("TextLabel")
local MaxDisText = Instance.new("TextLabel")

Aimbot.Name = "Aimbot";

xpcall(function()
	Aimbot.Parent = game:GetService("CoreGui");
	--Aimbot.Parent = game:GetService('StarterGui');
end, function()
	Aimbot.Parent = game:GetService('Players').LocalPlayer.PlayerGui;
end)

Aimbot.Name = "NPCAimbot"
Aimbot.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

BackFrame.Name = "BackFrame"
BackFrame.Parent = Aimbot
BackFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
BackFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
BackFrame.BorderSizePixel = 0
BackFrame.Position = UDim2.new(0.614691198, 0, 0.0431034639, 0)
BackFrame.Size = UDim2.new(0.334723562, 0, 0.42922768, 0)

UIAspectRatioConstraint.Parent = BackFrame
UIAspectRatioConstraint.AspectRatio = 1.720

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = BackFrame

Line.Name = "Line"
Line.Parent = BackFrame
Line.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0, 0, 0.173116893, 0)
Line.Size = UDim2.new(1, 0, 0.0223376621, 0)

Title.Name = "Title"
Title.Parent = BackFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.191009983, 0, 0.0311750602, 0)
Title.Size = UDim2.new(0.619039655, 0, 0.119904079, 0)
Title.Font = Enum.Font.Unknown
Title.Text = "NPC Aimbot"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

Radius.Name = "Radius"
Radius.Parent = BackFrame
Radius.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Radius.BorderColor3 = Color3.fromRGB(0, 0, 0)
Radius.BorderSizePixel = 0
Radius.Position = UDim2.new(0.8616364, 0, 0.318244994, 0)
Radius.Size = UDim2.new(0.0780770779, 0, 0.0863309354, 0)
Radius.Font = Enum.Font.SourceSansSemibold
Radius.Text = "100"
Radius.TextColor3 = Color3.fromRGB(255, 255, 255)
Radius.TextScaled = true
Radius.TextSize = 14.000
Radius.TextWrapped = true

EnableAB.Name = "EnableAB"
EnableAB.Parent = BackFrame
EnableAB.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
EnableAB.BorderColor3 = Color3.fromRGB(0, 0, 0)
EnableAB.BorderSizePixel = 0
EnableAB.Position = UDim2.new(0.0599520542, 0, 0.318244994, 0)
EnableAB.Size = UDim2.new(0.394568086, 0, 0.0863309354, 0)
EnableAB.Font = Enum.Font.SourceSansBold
EnableAB.Text = "Aimbot : Disabled"
EnableAB.TextColor3 = Color3.fromRGB(255, 255, 255)
EnableAB.TextScaled = true
EnableAB.TextSize = 14.000
EnableAB.TextWrapped = true


local function ToEnable()
	EnabledAimbotMode = not EnabledAimbotMode
	if EnabledAimbotMode then
		FOVring.Visible = true
		EnableAB.Text = "Aimbot : Enabled";
	else
		FOVring.Visible = false
		EnableAB.Text = "Aimbot : Disabled";
	end
end
EnableAB.MouseButton1Click:Connect(function()
	ToEnable()
end)






HeadshotsOnly.Name = "HeadshotsOnly"
HeadshotsOnly.Parent = BackFrame
HeadshotsOnly.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
HeadshotsOnly.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeadshotsOnly.BorderSizePixel = 0
HeadshotsOnly.Position = UDim2.new(0.0599520542, 0, 0.692345738, 0)
HeadshotsOnly.Size = UDim2.new(0.394568086, 0, 0.0863309354, 0)
HeadshotsOnly.Font = Enum.Font.SourceSansBold
HeadshotsOnly.Text = "Only headshot : True"
HeadshotsOnly.TextColor3 = Color3.fromRGB(255, 255, 255)
HeadshotsOnly.TextScaled = true
HeadshotsOnly.TextSize = 14.000
HeadshotsOnly.TextWrapped = true

OnlyBodyShot.Name = "OnlyBodyShot"
OnlyBodyShot.Parent = BackFrame
OnlyBodyShot.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
OnlyBodyShot.BorderColor3 = Color3.fromRGB(0, 0, 0)
OnlyBodyShot.BorderSizePixel = 0
OnlyBodyShot.Position = UDim2.new(0.545145273, 0, 0.692345738, 0)
OnlyBodyShot.Size = UDim2.new(0.394568086, 0, 0.0863309354, 0)
OnlyBodyShot.Font = Enum.Font.SourceSansBold
OnlyBodyShot.Text = "Only body shot : False"
OnlyBodyShot.TextColor3 = Color3.fromRGB(255, 255, 255)
OnlyBodyShot.TextScaled = true
OnlyBodyShot.TextSize = 14.000
OnlyBodyShot.TextWrapped = true

OnlyBodyShot.MouseButton1Click:Connect(function()
	OnlyBodyShotBool = not OnlyBodyShotBool
	if OnlyBodyShotBool then
		OnlyBodyShot.Text = "Only body shots : True";
	else
		OnlyBodyShot.Text = "Only body shots : False";
	end
end)
local OnlyHeadShot = HeadshotsOnly
OnlyHeadShot.MouseButton1Click:Connect(function()
	OnlyHeadShotBool = not OnlyHeadShotBool
	if OnlyHeadShotBool then
		OnlyHeadShot.Text = "Only head shots : True";
	else
		OnlyHeadShot.Text = "Only head shots : False";
	end
end)




WallCheck.Name = "WallCheck"
WallCheck.Parent = BackFrame
WallCheck.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
WallCheck.BorderColor3 = Color3.fromRGB(0, 0, 0)
WallCheck.BorderSizePixel = 0
WallCheck.Position = UDim2.new(0.0599520542, 0, 0.438149124, 0)
WallCheck.Size = UDim2.new(0.394568086, 0, 0.0863309354, 0)
WallCheck.Font = Enum.Font.SourceSansBold
WallCheck.Text = "Wallcheck : Disabled"
WallCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
WallCheck.TextScaled = true
WallCheck.TextSize = 14.000
WallCheck.TextWrapped = true

local TeamCheck = WallCheck
TeamCheck.MouseButton1Click:Connect(function()
	TeamCheckSettings = not TeamCheckSettings
	if TeamCheckSettings then
		TeamCheck.Text = "Wall check : Enabled";
	else
		TeamCheck.Text = "Wall check : Disabled";
	end
end)

VeloCheck.Name = "VeloCheck"
VeloCheck.Parent = BackFrame
VeloCheck.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
VeloCheck.BorderColor3 = Color3.fromRGB(0, 0, 0)
VeloCheck.BorderSizePixel = 0
VeloCheck.Position = UDim2.new(0.545145273, 0, 0.560451269, 0)
VeloCheck.Size = UDim2.new(0.305337131, 0, 0.0863309354, 0)
VeloCheck.Font = Enum.Font.SourceSansBold
VeloCheck.Text = "Velocity check [Disabled] : "
VeloCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
VeloCheck.TextScaled = true
VeloCheck.TextSize = 14.000
VeloCheck.TextWrapped = true

local TeamCheck2 = VeloCheck
TeamCheck2.MouseButton1Click:Connect(function()
	PlayerVeloOffset = not PlayerVeloOffset
	if PlayerVeloOffset then
		TeamCheck2.Text = "Velocity check [Enabled] : ";
	else
		TeamCheck2.Text = "Velocity check [Disabled] : ";
	end
end)

AutoShoot.Name = "AutoShoot"
AutoShoot.Parent = BackFrame
AutoShoot.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
AutoShoot.BorderColor3 = Color3.fromRGB(0, 0, 0)
AutoShoot.BorderSizePixel = 0
AutoShoot.Position = UDim2.new(0.0599520542, 0, 0.560451269, 0)
AutoShoot.Size = UDim2.new(0.394568086, 0, 0.0863309354, 0)
AutoShoot.Font = Enum.Font.SourceSansBold
AutoShoot.Text = "Autoshoot : Disabled"
AutoShoot.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoShoot.TextScaled = true
AutoShoot.TextSize = 14.000
AutoShoot.TextWrapped = true

AutoShoot.MouseButton1Click:Connect(function()
	AutoShootBool = not AutoShootBool
	if AutoShootBool then
		AutoShoot.Text = "AutoShoot : Enabled";
	else
		AutoShoot.Text = "AutoShoot : Disabled";
	end
end)

if mouse1clickFunc == nil then
	AutoShoot.Visible = false
end

OffSetTime.Name = "OffSetTime"
OffSetTime.Parent = BackFrame
OffSetTime.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
OffSetTime.BorderColor3 = Color3.fromRGB(0, 0, 0)
OffSetTime.BorderSizePixel = 0
OffSetTime.Position = UDim2.new(0.8616364, 0, 0.560451269, 0)
OffSetTime.Size = UDim2.new(0.0780770779, 0, 0.0863309354, 0)
OffSetTime.Font = Enum.Font.SourceSansSemibold
OffSetTime.Text = "800"
OffSetTime.TextColor3 = Color3.fromRGB(255, 255, 255)
OffSetTime.TextScaled = true
OffSetTime.TextSize = 14.000
OffSetTime.TextWrapped = true
OffSetTime.FocusLost:Connect(function()
	PlayerVeloOffsetTime = tonumber(OffSetTime.Text) or 100
end)


--TeamCheck2TextBox

MaxDis.Name = "MaxDis"
MaxDis.Parent = BackFrame
MaxDis.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
MaxDis.BorderColor3 = Color3.fromRGB(0, 0, 0)
MaxDis.BorderSizePixel = 0
MaxDis.Position = UDim2.new(0.8616364, 0, 0.438149124, 0)
MaxDis.Size = UDim2.new(0.0780770779, 0, 0.0863309354, 0)
MaxDis.Font = Enum.Font.SourceSansSemibold
MaxDis.Text = "250"
MaxDis.TextColor3 = Color3.fromRGB(255, 255, 255)
MaxDis.TextScaled = true
MaxDis.TextSize = 14.000
MaxDis.TextWrapped = true
MaxDis.FocusLost:Connect(function()
	MaxDistance = tonumber(MaxDis.Text) or math.huge
end)

RadiusText.Name = "RadiusText"
RadiusText.Parent = BackFrame
RadiusText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RadiusText.BackgroundTransparency = 1.000
RadiusText.BorderColor3 = Color3.fromRGB(0, 0, 0)
RadiusText.BorderSizePixel = 0
RadiusText.Position = UDim2.new(0.545145273, 0, 0.316145509, 0)
RadiusText.Size = UDim2.new(0.304178268, 0, 0.0859999955, 0)
RadiusText.Font = Enum.Font.Unknown
RadiusText.Text = "Radius : "
RadiusText.TextColor3 = Color3.fromRGB(255, 255, 255)
RadiusText.TextScaled = true
RadiusText.TextSize = 14.000
RadiusText.TextWrapped = true

MaxDisText.Name = "MaxDisText"
MaxDisText.Parent = BackFrame
MaxDisText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MaxDisText.BackgroundTransparency = 1.000
MaxDisText.BorderColor3 = Color3.fromRGB(0, 0, 0)
MaxDisText.BorderSizePixel = 0
MaxDisText.Position = UDim2.new(0.545145273, 0, 0.438275665, 0)
MaxDisText.Size = UDim2.new(0.304178268, 0, 0.0859999955, 0)
MaxDisText.Font = Enum.Font.Unknown
MaxDisText.Text = "Max Distance : "
MaxDisText.TextColor3 = Color3.fromRGB(255, 255, 255)
MaxDisText.TextScaled = true
MaxDisText.TextSize = 14.000
MaxDisText.TextWrapped = true

Radius.Name = "Radius"
Radius.Parent = BackFrame
Radius.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Radius.BorderColor3 = Color3.fromRGB(0, 0, 0)
Radius.BorderSizePixel = 0
Radius.Position = UDim2.new(0.8616364, 0, 0.318244994, 0)
Radius.Size = UDim2.new(0.0780770779, 0, 0.0863309354, 0)
Radius.Font = Enum.Font.SourceSansSemibold
Radius.Text = "100"
Radius.TextColor3 = Color3.fromRGB(255, 255, 255)
Radius.TextScaled = true
Radius.TextSize = 14.000
Radius.TextWrapped = true
Radius.FocusLost:Connect(function()
	RadiusSize = tonumber(Radius.Text) or 100
end)

local ControlDown = false
local EnableDown = false
local ToOpenDown = false
local ToDrag = false


local MouseIsOnGUI = false
local PlayerMouse =  Players.LocalPlayer:GetMouse()
local IntXMouse, IntYMouse, IntXYPosTopbar

local Topbar = BackFrame
Topbar.MouseEnter:Connect(function()
	MouseIsOnGUI = true
end)

Topbar.MouseLeave:Connect(function()
	MouseIsOnGUI = false
end)

UserInputSer.InputBegan:Connect(function(inoutObj, IsTyping)
	if inoutObj.KeyCode == Enum.KeyCode.LeftAlt then
		ControlDown = true
	end
	if inoutObj.KeyCode == Enum.KeyCode.E then
		EnableDown = true
	end
	if inoutObj.KeyCode == Enum.KeyCode.Q then
		ToOpenDown = true
	end
	if inoutObj.UserInputType == Enum.UserInputType.MouseButton1 then
		ToDrag = true
	end
	
	
	if ControlDown and EnableDown then
		ToEnable()
		EnableDown = false
	end
	if ControlDown and ToOpenDown then
		Topbar.Visible = not Topbar.Visible
		ToOpenDown = false
	end
	if ControlDown and ToDrag then
		if Topbar.Visible and MouseIsOnGUI then
			IntXMouse, IntYMouse = PlayerMouse.X, PlayerMouse.Y
			IntXYPosTopbar = Topbar.Position
			repeat
				Topbar.Position = IntXYPosTopbar - UDim2.new(0, IntXMouse - PlayerMouse.X, 0, IntYMouse - PlayerMouse.Y)
				RunService.RenderStepped:Wait()
			until not ToDrag or not Topbar.Visible
			ToDrag = false
		end
	end
	
end)

UserInputSer.InputEnded:Connect(function(inoutObj, IsTyping)
	if inoutObj.KeyCode == Enum.KeyCode.LeftAlt then
		ControlDown = false
	end
	if inoutObj.KeyCode == Enum.KeyCode.E then
		EnableDown = false
	end
	if inoutObj.KeyCode == Enum.KeyCode.Q then
		ToOpenDown = false
	end
	if inoutObj.UserInputType == Enum.UserInputType.MouseButton1 then
		ToDrag = false
	end
end)
