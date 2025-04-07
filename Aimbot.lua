--ECLIPSE HUB Aimbot
--OPEN SOURCED FOR SKIDS
--PLEASE GIVE CREDIT

local TeamsTable = {}

local LPCamera = game.Workspace.CurrentCamera
local Players = game:GetService('Players')
local RunService = game:GetService('RunService')

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
local function getClosestPlayerInRing(trg_part)
	--SettingsToggleMode = "None" -- Both/Friendly/Enemy


	nearest = nil
	ToProceed = true
	playerMousePos = LPCamera.ViewportSize / 2
	lastAB = math.huge
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= Players.LocalPlayer then
			pcall(function()
			
  			part = player.Character and player.Character:FindFirstChild(trg_part)
  			if part then
  				HaveConfigured = false
  				ToProceed = true
  				ePos, isVisible = LPCamera:WorldToViewportPoint(part.Position)
  				distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude
  				PlayerDis = (Players.LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
  
  				--TeamCheck
  				PlayerTeam = player.Team
  				
  				if UseFriendlySettings and not HaveConfigured and PlayerTeam then
  				  if PlayerTeam == Players.LocalPlayer.Team then
  					  HaveConfigured = true
  				    ToProceed = false
  				  end
  				  
  					if TeamsTable[player.Team.Name] then
  						if TeamsTable[player.Team.Name].FRIENDLY then
  							ToProceed = false
  							HaveConfigured = true
  						end
  					end
  				end
  
  				if UseEnemySettings and not HaveConfigured and PlayerTeam then
  					if TeamsTable[player.Team.Name] then
  						if TeamsTable[player.Team.Name].ENEMY then
  							ToProceed = true
  							HaveConfigured = true
  						else
  							ToProceed = false
  							HaveConfigured = true
  						end
  					end
  				end
  				
  				if TeamCheckSettings then
  				  local BlacklistSearchWC = player.Character:GetDescendants()
  				  for _, Value in pairs(Players.LocalPlayer.Character:GetDescendants()) do
  						BlacklistSearchWC[#BlacklistSearchWC + 1] = Value
  					end
  				  
  				  
  				  if #(LPCamera:GetPartsObscuringTarget({player.Character.Head.Position}, BlacklistSearchWC )) > 0 then
  				    ToProceed = false
  				  end
  				end
  
  				if distance < lastAB and isVisible and distance < RadiusSize and PlayerDis < MaxDistance and player.Character.Humanoid.Health > 0 and ToProceed then
  					lastAB = distance
  					nearest = player
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
RunService.RenderStepped:Connect(function()
	if EnabledAimbotMode then
		ABBB, AEEEERRR = pcall(function()
			updateDrawings()
			closest = getClosestPlayerInRing("Head")
			if closest == nil then
			  closest = getClosestPlayerInRing("HumanoidRootPart")
			end
			if closest and closest.Character:FindFirstChild("Head") then
			  
				if PlayerVeloOffset then
				  playerMousePos = LPCamera.ViewportSize / 2
				  PVDis = (Players.LocalPlayer.Character.HumanoidRootPart.Position - closest.Character.HumanoidRootPart.Position).Magnitude
				  PVOffSetVe = closest.Character.Head.Velocity
				  TimeImpact = PVDis/PlayerVeloOffsetTime
				  
				  ePosForCheck, isVisibleCheck = LPCamera:WorldToViewportPoint(closest.Character.Head.Position + PVOffSetVe * TimeImpact)
				  PlayerMousePosFromCharacter = (Vector2.new(ePosForCheck.x, ePosForCheck.y) - playerMousePos).Magnitude
				  
				  if PlayerMousePosFromCharacter > (RadiusSize * 5/6) or not isVisibleCheck then
				    lookAt(closest.Character.Head.Position + ( RadiusSize * 5/6 / PVOffSetVe ) )
				  else
				    lookAt(closest.Character.Head.Position + PVOffSetVe * TimeImpact)
				  end
				  
				else
				  lookAt(closest.Character.Head.Position)
				end
				FOVring.Color = Color3.fromRGB(0, 200, 0)
				Health.Color = Color3.fromRGB(0, 200, 0)
				Health.Visible = true
				Health.Text = "Health : "..closest.Character:FindFirstChild("Humanoid").Health
				
				if AutoShootBool then
				  --keypress("0x01")
				  keypress(Enum.KeyCode["F"])
				  --keypress("0x01")
				  --mousemoveabs(playerMousePos.x, playerMousePos.y)  
				  --mouse1click()
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

local Aimbot = Instance.new("ScreenGui");
local Topbar = Instance.new("Frame");
local Background = Instance.new("Frame");
local FriendlyScroll = Instance.new("ScrollingFrame");
local MaxDisText = Instance.new("TextLabel");
local EnableAB = Instance.new("TextButton");
local EnemyScroll = Instance.new("ScrollingFrame");
local UseFriendly = Instance.new("TextButton");
local UseEnemy = Instance.new("TextButton");
local TeamCheck = Instance.new("TextButton");
local TeamCheck2 = Instance.new("TextButton");
local AutoShoot = Instance.new("TextButton");
local MaxDis_2 = Instance.new("TextBox");
local TeamCheck2TextBox = Instance.new("TextBox");
local RadiusText = Instance.new("TextLabel");
local Radius_2 = Instance.new("TextBox");
local FrameLine = Instance.new("Frame");
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint");
local Title = Instance.new("TextLabel");

local UILISTLO = Instance.new("UIListLayout");
local UILISTLO2 = Instance.new("UIListLayout");

Aimbot.Name = "Aimbot";

xpcall(function()
	Aimbot.Parent = game:GetService("CoreGui");
end, function()
	Aimbot.Parent = game:GetService('Players').LocalPlayer.PlayerGui;
end)

Topbar.Name = "Topbar";
Topbar.Size = UDim2.new(0, 338, 0, 80);
Topbar.BorderColor3 = Color3.new(0, 0, 0);
Topbar.BorderSizePixel = 0;
Topbar.Position = UDim2.new(0.279540062, 0, 0.286302388, 0);
Topbar.BackgroundColor3 = Color3.new(0, 0, 0);
Topbar.Parent = Aimbot;
Topbar.Active = true
Topbar.Draggable = true

Background.Name = "Background";
Background.Size = UDim2.new(1, 0, 5.36000013, 0);
Background.BorderColor3 = Color3.new(0, 0, 0);
Background.BorderSizePixel = 0;
Background.Position = UDim2.new(0, 0, 0.973083496, 0);
Background.BackgroundColor3 = Color3.new(0, 0, 0);
Background.Parent = Topbar;

FriendlyScroll.Name = "FriendlyScroll";
FriendlyScroll.Active = true;
FriendlyScroll.Size = UDim2.new(0, 126, 0, 71);
FriendlyScroll.BorderColor3 = Color3.new(0, 0, 0);
FriendlyScroll.BorderSizePixel = 0;
FriendlyScroll.BackgroundTransparency = 0.949999988079071;
FriendlyScroll.Position = UDim2.new(0.0591715984, 0, 0.568533182, 0);
FriendlyScroll.BackgroundColor3 = Color3.new(1, 1, 1);
FriendlyScroll.CanvasSize = UDim2.new(0, 0, 0, 0);
FriendlyScroll.ScrollBarImageColor3 = Color3.new(0, 0, 0);
FriendlyScroll.ScrollBarThickness = 1;
FriendlyScroll.Parent = Background;
FriendlyScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
UILISTLO2.Parent = FriendlyScroll

MaxDisText.Name = "MaxDisText";
MaxDisText.Size = UDim2.new(0, 99, 0, 15);
MaxDisText.BorderColor3 = Color3.new(0, 0, 0);
MaxDisText.BorderSizePixel = 0;
MaxDisText.BackgroundTransparency = 0.800000011920929;
MaxDisText.Position = UDim2.new(0.565088749, 0, 0.300467281, 0);
MaxDisText.BackgroundColor3 = Color3.new(1, 1, 1);
MaxDisText.TextColor3 = Color3.new(1, 1, 1);
MaxDisText.Text = "Max Distance : ";
MaxDisText.TextWrapped = true;
MaxDisText.TextScaled = true;
MaxDisText.Parent = Background;

EnableAB.Name = "EnableAB";
EnableAB.AutoButtonColor = true;
EnableAB.Size = UDim2.new(0, 126, 0, 15);
EnableAB.BorderColor3 = Color3.new(0, 0, 0);
EnableAB.BorderSizePixel = 0;
EnableAB.BackgroundTransparency = 0.8500000238418579;
EnableAB.Position = UDim2.new(0.0591715984, 0, 0.05, 0);
EnableAB.BackgroundColor3 = Color3.new(1, 1, 1);
EnableAB.TextColor3 = Color3.new(1, 1, 1);
EnableAB.Text = "Aimbot : Disabled";
EnableAB.TextWrapped = true;
EnableAB.TextScaled = true;
EnableAB.Parent = Background;
EnableAB.MouseButton1Click:Connect(function()
	EnabledAimbotMode = not EnabledAimbotMode
	if EnabledAimbotMode then
		FOVring.Visible = true
		EnableAB.Text = "Aimbot : Enabled";
	else
		FOVring.Visible = false
		EnableAB.Text = "Aimbot : Disabled";
	end
end)

EnemyScroll.Name = "EnemyScroll";
EnemyScroll.Active = true;
EnemyScroll.Size = UDim2.new(0, 126, 0, 71);
EnemyScroll.BorderColor3 = Color3.new(0, 0, 0);
EnemyScroll.BorderSizePixel = 0;
EnemyScroll.BackgroundTransparency = 0.949999988079071;
EnemyScroll.Position = UDim2.new(0.565088749, 0, 0.568533182, 0);
EnemyScroll.BackgroundColor3 = Color3.new(1, 1, 1);
EnemyScroll.CanvasSize = UDim2.new(0, 0, 0, 0);
EnemyScroll.ScrollBarImageColor3 = Color3.new(0, 0, 0);
EnemyScroll.ScrollBarThickness = 1;
EnemyScroll.Parent = Background;
EnemyScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
UILISTLO.Parent = EnemyScroll

UseFriendly.Name = "UseFriendly";
UseFriendly.AutoButtonColor = true;
UseFriendly.Size = UDim2.new(0, 126, 0, 15);
UseFriendly.BorderColor3 = Color3.new(0, 0, 0);
UseFriendly.BorderSizePixel = 0;
UseFriendly.BackgroundTransparency = 0.8500000238418579;
UseFriendly.Position = UDim2.new(0.0591715984, 0, 0.432940989, 0);
UseFriendly.BackgroundColor3 = Color3.new(1, 1, 1);
UseFriendly.TextColor3 = Color3.new(1, 1, 1);
UseFriendly.Text = "Disabled Friendly";
UseFriendly.TextWrapped = true;
UseFriendly.TextScaled = true;
UseFriendly.Parent = Background;
UseFriendly.MouseButton1Click:Connect(function()
	UseFriendlySettings = not UseFriendlySettings
	if UseFriendlySettings then
		UseFriendly.Text = "Enabled Friendly";
	else
		UseFriendly.Text = "Disabled Friendly";
	end
end)


UseEnemy.Name = "UseEnemy";
UseEnemy.AutoButtonColor = true;
UseEnemy.Size = UDim2.new(0, 126, 0, 15);
UseEnemy.BorderColor3 = Color3.new(0, 0, 0);
UseEnemy.BorderSizePixel = 0;
UseEnemy.BackgroundTransparency = 0.8500000238418579;
UseEnemy.Position = UDim2.new(0.565088749, 0, 0.432940989, 0);
UseEnemy.BackgroundColor3 = Color3.new(1, 1, 1);
UseEnemy.TextColor3 = Color3.new(1, 1, 1);
UseEnemy.Text = "Disabled Enemy";
UseEnemy.TextWrapped = true;
UseEnemy.TextScaled = true;
UseEnemy.Parent = Background;
UseEnemy.MouseButton1Click:Connect(function()
	UseEnemySettings = not UseEnemySettings
	if UseEnemySettings then
		UseEnemy.Text = "Enabled Enemy";
	else
		UseEnemy.Text = "Disabled Enemy";
	end
end)


TeamCheck.Name = "WallCheck";
TeamCheck.AutoButtonColor = true;
TeamCheck.Size = UDim2.new(0, 126, 0, 15);
TeamCheck.BorderColor3 = Color3.new(0, 0, 0);
TeamCheck.BorderSizePixel = 0;
TeamCheck.BackgroundTransparency = 0.8500000238418579;
TeamCheck.Position = UDim2.new(0.0591715984, 0, 0.30598694, 0);
TeamCheck.BackgroundColor3 = Color3.new(1, 1, 1);
TeamCheck.TextColor3 = Color3.new(1, 1, 1);
TeamCheck.Text = "Wall check : Disabled";
TeamCheck.TextWrapped = true;
TeamCheck.TextScaled = true;
TeamCheck.Parent = Background;
TeamCheck.MouseButton1Click:Connect(function()
	TeamCheckSettings = not TeamCheckSettings
	if TeamCheckSettings then
		TeamCheck.Text = "Wall check : Enabled";
	else
		TeamCheck.Text = "Wall check : Disabled";
	end
end)

TeamCheck2.Name = "VeloCheck";
TeamCheck2.Size = UDim2.new(0, 99, 0, 15);
TeamCheck2.AutoButtonColor = true;
TeamCheck2.BorderColor3 = Color3.new(0, 0, 0);
TeamCheck2.BorderSizePixel = 0;
TeamCheck2.BackgroundTransparency = 0.8500000238418579;
TeamCheck2.Position = UDim2.new(0.565088749, 0, 0.17598694, 0); --30598694
TeamCheck2.BackgroundColor3 = Color3.new(1, 1, 1);
TeamCheck2.TextColor3 = Color3.new(1, 1, 1);
TeamCheck2.Text = "Velocity offset : Disabled";
TeamCheck2.TextWrapped = true;
TeamCheck2.TextScaled = true;
TeamCheck2.Parent = Background;
TeamCheck2.MouseButton1Click:Connect(function()
	PlayerVeloOffset = not PlayerVeloOffset
	if PlayerVeloOffset then
		TeamCheck2.Text = "Velocity offset : Enabled";
	else
		TeamCheck2.Text = "Velocity offset : Disabled";
	end
end)

AutoShoot.Name = "AutoShoot";
AutoShoot.Size = UDim2.new(0, 126, 0, 15);
AutoShoot.AutoButtonColor = true;
AutoShoot.BorderColor3 = Color3.new(0, 0, 0);
AutoShoot.BorderSizePixel = 0;
AutoShoot.BackgroundTransparency = 0.8500000238418579;
AutoShoot.Position = UDim2.new(0.0591715984, 0, 0.17598694, 0); --30598694
AutoShoot.BackgroundColor3 = Color3.new(1, 1, 1);
AutoShoot.TextColor3 = Color3.new(1, 1, 1);
AutoShoot.Text = "AutoShoot : False";
AutoShoot.TextWrapped = true;
AutoShoot.TextScaled = true;
AutoShoot.Visible = false;
AutoShoot.Parent = Background;
AutoShoot.MouseButton1Click:Connect(function()
	AutoShootBool = not AutoShootBool
	if AutoShootBool then
		AutoShoot.Text = "AutoShoot : Enabled";
	else
		AutoShoot.Text = "AutoShoot : Disabled";
	end
end)

if game.PlaceId == 2210085102 then
  AutoShoot.Visible = true
end

TeamCheck2TextBox.Name = "OffSetTime";
TeamCheck2TextBox.Size = UDim2.new(0, 27, 0, 15);
TeamCheck2TextBox.BorderColor3 = Color3.new(0, 0, 0);
TeamCheck2TextBox.BorderSizePixel = 0;
TeamCheck2TextBox.BackgroundTransparency = 0.800000011920929;
TeamCheck2TextBox.Position = UDim2.new(0.857988179, 0, 0.17598694, 0);
TeamCheck2TextBox.BackgroundColor3 = Color3.new(1, 1, 1);
TeamCheck2TextBox.CursorPosition = -1;
TeamCheck2TextBox.TextColor3 = Color3.new(1, 1, 1);
TeamCheck2TextBox.Text = "800";
TeamCheck2TextBox.Parent = Background;
TeamCheck2TextBox.FocusLost:Connect(function()
	PlayerVeloOffsetTime = tonumber(TeamCheck2TextBox.Text) or 100
end)


--TeamCheck2TextBox

MaxDis_2.Name = "MaxDis";
MaxDis_2.Size = UDim2.new(0, 27, 0, 15);
MaxDis_2.BorderColor3 = Color3.new(0, 0, 0);
MaxDis_2.BorderSizePixel = 0;
MaxDis_2.BackgroundTransparency = 0.800000011920929;
MaxDis_2.Position = UDim2.new(0.857988179, 0, 0.300467281, 0);
MaxDis_2.BackgroundColor3 = Color3.new(1, 1, 1);
MaxDis_2.CursorPosition = -1;
MaxDis_2.TextColor3 = Color3.new(1, 1, 1);
MaxDis_2.Text = "";
MaxDis_2.Parent = Background;
MaxDis_2.FocusLost:Connect(function()
	MaxDistance = tonumber(MaxDis_2.Text) or math.huge
end)

RadiusText.Name = "RadiusText";
RadiusText.Size = UDim2.new(0, 99, 0, 15);
RadiusText.BorderColor3 = Color3.new(0, 0, 0);
RadiusText.BorderSizePixel = 0;
RadiusText.BackgroundTransparency = 0.800000011920929;
RadiusText.Position = UDim2.new(0.565088749, 0, 0.05, 0);
RadiusText.BackgroundColor3 = Color3.new(1, 1, 1);
RadiusText.TextColor3 = Color3.new(1, 1, 1);
RadiusText.Text = "Radius : ";
RadiusText.TextWrapped = true;
RadiusText.TextScaled = true;
RadiusText.Parent = Background;

Radius_2.Name = "Radius";
Radius_2.Size = UDim2.new(0, 27, 0, 15);
Radius_2.BorderColor3 = Color3.new(0, 0, 0);
Radius_2.BorderSizePixel = 0;
Radius_2.BackgroundTransparency = 0.800000011920929;
Radius_2.Position = UDim2.new(0.857988179, 0, 0.05, 0);
Radius_2.BackgroundColor3 = Color3.new(1, 1, 1);
Radius_2.CursorPosition = -1;
Radius_2.TextColor3 = Color3.new(1, 1, 1);
Radius_2.Text = "";
Radius_2.Parent = Background;
Radius_2.FocusLost:Connect(function()
	RadiusSize = tonumber(Radius_2.Text) or 100
end)

FrameLine.Name = "FrameLine";
FrameLine.Active = true;
FrameLine.Size = UDim2.new(0, 338, 0, -4);
FrameLine.BorderColor3 = Color3.new(0, 0, 0);
FrameLine.BorderSizePixel = 0;
FrameLine.Position = UDim2.new(0, 0, 0.215269893, 0);
FrameLine.BackgroundColor3 = Color3.new(0, 0, 0);
FrameLine.Parent = Background;
FrameLine.Visible = false

UIAspectRatioConstraint.Name = "UIAspectRatioConstraint";
UIAspectRatioConstraint.AspectRatio = 10;
UIAspectRatioConstraint.Parent = Topbar;

Title.Name = "Title";
Title.Size = UDim2.new(0, 200, 0, 15);
Title.BorderColor3 = Color3.new(0, 0, 0);
Title.BorderSizePixel = 0;
Title.BackgroundTransparency = 1;
Title.Position = UDim2.new(0.204142019, 0, 0.266272187, 0);
Title.BackgroundColor3 = Color3.new(1, 1, 1);
Title.TextColor3 = Color3.new(1, 1, 1);
Title.Text = "ECLIPSE'S AIMBOT";
Title.TextWrapped = true;
Title.TextScaled = true;
Title.Parent = Topbar;

for _ ,Team in pairs(game:GetService('Teams'):GetChildren()) do
	TeamsTable[Team.Name] = {
		['FRIENDLY'] = false;
		['ENEMY'] = false;
	}
	
	local EnemyScrollButton = Instance.new("TextButton");
	EnemyScrollButton.Name = "Team_"..Team.Name;
	EnemyScrollButton.AutoButtonColor = true;
	EnemyScrollButton.Size = UDim2.new(0, 126, 0, 15);
	EnemyScrollButton.BorderColor3 = Color3.new(0, 0, 0);
	EnemyScrollButton.BorderSizePixel = 0;
	EnemyScrollButton.BackgroundTransparency = 0.8500000238418579;
	EnemyScrollButton.Position = UDim2.new(0.0591715984, 0, 0.05, 0);
	EnemyScrollButton.BackgroundColor3 = Color3.new(1, 1, 1);
	EnemyScrollButton.TextColor3 = Color3.new(1, 1, 1);
	EnemyScrollButton.Text = Team.Name;
	EnemyScrollButton.TextWrapped = true;
	EnemyScrollButton.TextScaled = true;
	EnemyScrollButton.Parent = EnemyScroll;
	EnemyScrollButton.MouseButton1Click:Connect(function()
		TeamsTable[Team.Name].ENEMY = not TeamsTable[Team.Name].ENEMY
		if TeamsTable[Team.Name].ENEMY then
			EnemyScrollButton.TextColor3 = Color3.new(1, 0.294118, 0.294118)
		else
			EnemyScrollButton.TextColor3 = Color3.new(1,1,1)
		end
	end)
	
	local FriendlyScrollButton = Instance.new("TextButton");
	FriendlyScrollButton.Name = "Team_"..Team.Name;
	FriendlyScrollButton.AutoButtonColor = true;
	FriendlyScrollButton.Size = UDim2.new(0, 126, 0, 15);
	FriendlyScrollButton.BorderColor3 = Color3.new(0, 0, 0);
	FriendlyScrollButton.BorderSizePixel = 0;
	FriendlyScrollButton.BackgroundTransparency = 0.8500000238418579;
	FriendlyScrollButton.Position = UDim2.new(0.0591715984, 0, 0.05, 0);
	FriendlyScrollButton.BackgroundColor3 = Color3.new(1, 1, 1);
	FriendlyScrollButton.TextColor3 = Color3.new(1, 1, 1);
	FriendlyScrollButton.Text = Team.Name;
	FriendlyScrollButton.TextWrapped = true;
	FriendlyScrollButton.TextScaled = true;
	FriendlyScrollButton.Parent = FriendlyScroll;
	FriendlyScrollButton.MouseButton1Click:Connect(function()
		TeamsTable[Team.Name].FRIENDLY = not TeamsTable[Team.Name].FRIENDLY
		if TeamsTable[Team.Name].FRIENDLY then
			FriendlyScrollButton.TextColor3 = Color3.new(0, 1, 0.14902)
		else
			FriendlyScrollButton.TextColor3 = Color3.new(1,1,1)
		end
	end)
	
end
