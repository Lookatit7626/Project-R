local RunService = game:GetService("RunService")

local Library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Lookatit7626/Project-R/main/GUI%20Library.lua')))()
local Words = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Lookatit7626/Project-R/main/HateSpeechs.lua')))()

local GUI = Library.CreateGUI("Eclipse's HUB","rbxassetid://14943920709")


--GLOBAL FUNCTIONS

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end


local Section = Library.CreateSection(GUI,"Home")

Library.CreateButton(Section,"Name","Hello! "..game.Players.LocalPlayer.Name)

Library.CreateButton(Section,"CreditsSec","-----Credits-----")

Library.CreateButton(Section,"Credits","Engineered by ECLIPSE and [Redacted] | Tested by Twilight")
Library.CreateButton(Section,"NameGroup","Eclipse Software - V43.5D")

Library.CreateButton(Section,"CreditsSec","-----Settings-----")

Library.CreateButton(Section,"Refresh","Refresh Hub",function()
	Library.CreateNotification("Refreshing","Refreshing HUB...")
	wait(2)
	loadstring(game:HttpGet(('https://github.com/Lookatit7626/Project-R/raw/main/EclipseHub.lua')))()
	GUI:Destroy() 
end)

Library.CreateButton(Section,"Delete","Delete Hub",function()
	Library.CreateNotification("Deleting","Deleting HUB...")
	wait(2)
	GUI:Destroy() 
end)


local Section2 = Library.CreateSection(GUI,"UniversalScript")

Library.CreateButton(Section2,"Build A Boat","Build a Boat Farm",function()
	loadstring(game:HttpGet("https://pastebin.com/raw/h9AnD9d1"))()
end)

Library.CreateButton(Section2,"Jailbreak Auto V4","Jailbreak Auto V4",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxsta72/ProjectAuto/main/AutoRobV4Release"))()
end)

Library.CreateButton(Section2,"Chaos Hub","Chaos Hub",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/xChaoticVoid/Chaos-Hub-v1/main/ChaosHub.lua"))()
end)

Library.CreateButton(Section2,"Rspy","RSPY",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
end)

Library.CreateButton(Section2,"Bedwars","Bedwars",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AlSploit/AlSploit/main/Bedwars"))() end)

Library.CreateButton(Section2,"Dex","Dex",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
end)

Library.CreateButton(Section2,"IY","IY",function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end)

Library.CreateButton(Section2,"Fly","Fly script",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Lookatit7626/Project-R/main/Mobile%20Fly%20Script%20R6%20Fixed"))() end)

Library.CreateButton(Section2,"Fling","Custom Fling Script",function() loadstring(game:HttpGet("https://pastebin.com/raw/WnJwFXgR"))() end)

local PlayerScript = Library.CreateSection(GUI,"Player Script")

Library.CreateSlider(PlayerScript,"Speed",'Speed',500,function(Speed)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed
end)

Library.CreateSlider(PlayerScript,"Jump",'Jump',1000,function(Speed)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = Speed
end)

Library.CreateLoopButton(PlayerScript,"InfJump", "Inf Jump", function()
	local Test0 = math.random(1,99999999)
	local AA0 = Test0
	local Set = nil
	if not Set then
		Set = game:GetService('UserInputService').JumpRequest:Connect(function()
			game.Players.LocalPlayer.Character.Humanoid:ChangeState('Jumping')
		end)
	end
	coroutine.wrap(function()
		wait(1)
		if AA0 == Test0 then
			pcall(function()
				Set:Disconnect()
			end)
		end
	end)()
end,0.1)

local lastpos = nil
Library.CreateLoopButton(PlayerScript,"AntiFling", "AntiFling", function()
	local humanoidroot = game.Players.LocalPlayer.Character.HumanoidRootPart
	local primary = humanoidroot
	if primary.AssemblyLinearVelocity.Magnitude > 250 or primary.AssemblyAngularVelocity.Magnitude > 250  then
		primary.AssemblyLinearVelocity = Vector3.new(0,0,0)
		primary.AssemblyAngularVelocity = Vector3.new(0,0,0)
		primary.CFrame = lastpos 
		Library.CreateNotification('Fling alert!','We detected that you got flung and neuturalised your velocity')
	end
	lastpos = primary.CFrame
end,0.01)

local Enabled = false
local WFcool = false
local RSWFConnection

Library.CreateButton(PlayerScript,"Walkfling","Walkfling Player [V1.10]",function()
	if not WFcool then
		WFcool = true

		Enabled = not Enabled

		coroutine.wrap(function()
			if Enabled then
				local rs = game:GetService("RunService")
				local plr = game.Players.LocalPlayer
				Library.CreateNotification("Walkfling","WalkFling connected!")
				local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
				local dir = 0.1

				while Enabled do

					while not plr.Character do
						wait(0.01)
					end

					while not plr.Character:FindFirstChild('Humanoid') do
						wait(0.01)
					end
					if (not rootPart or rootPart == nil or not rootPart.Parent or rootPart.Parent == nil or plr.Character:WaitForChild('Humanoid').Health == 0) then
						Library.CreateNotification("Walkfling","Player died, trying to reconnect...")
						while plr.Character:WaitForChild('Humanoid').Health == 0 do
							wait(0.001)
						end
						while not plr.Character:FindFirstChild("HumanoidRootPart") do
							wait(0.001)
						end
						rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
						Library.CreateNotification("Walkfling","WalkFling Reconnected")
					end
					local suc, err = pcall(function()
						while not plr.Character:FindFirstChild('Humanoid') do
							wait(0.001)
						end
						while plr.Character:WaitForChild('Humanoid').Health == 0 do
							wait(0.001)
						end
						while not plr.Character:FindFirstChild("HumanoidRootPart") do
							wait(0.001)
						end
						rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
						rs.Heartbeat:Wait()
						local velocity = rootPart.Velocity
						rootPart.Velocity = ((velocity * 10000) + Vector3.new(0, 10000, 0))
						rs.RenderStepped:Wait()
						rootPart.Velocity = velocity
						rs.RenderStepped:Wait()
						rootPart.Velocity = velocity + Vector3.new(0, dir, 0)
						dir *= -1
					end)
				end

				print('Disconnected')
				Library.CreateNotification("Walkfling","WalkFling Disconnect")
			end
		end)()
		wait(0.1)
		WFcool = false
	end
end)

local tpwalking = false
local speeds = 1
local heartbeat = game:GetService("RunService").Heartbeat
local function updatespeed(char, hum)
	tpwalking = false
	heartbeat:Wait()
	task.wait(.1)
	heartbeat:Wait() -- Make sure old threads are terminated

	for i = 1, speeds do
		spawn(function()
			tpwalking = true

			while tpwalking and heartbeat:Wait() and char and hum and hum.Parent do
				if hum.MoveDirection.Magnitude > 0 then
					char:TranslateBy(hum.MoveDirection)
				end
			end
		end)
	end
end

function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

local swimbeat
local oldgrav = workspace.Gravity
Library.CreateButton(PlayerScript,"InvisibleFling","Invisible Fling [Testing Phase]",function()
	if not WFcool then
		WFcool = true

		Enabled = not Enabled

		coroutine.wrap(function()
			local bg
			local bv
			local invisflingStepped
			if Enabled then
				local rs = game:GetService("RunService")
				local plr = game.Players.LocalPlayer
				local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
				local dir = 0.1
				local Humanoid = plr.Character:WaitForChild('Humanoid').Health

				while Enabled do

					while not plr.Character do
						wait(0.01)
					end

					while not plr.Character:FindFirstChild('Humanoid') do
						wait(0.01)
					end

					plr = game.Players.LocalPlayer

					if (not rootPart or rootPart == nil or not rootPart.Parent or rootPart.Parent == nil or plr.Character:WaitForChild('Humanoid').Health == 0) then
						Library.CreateNotification("Invisible Fling","Player died, trying to reconnect...")

						game.Workspace.Gravity = oldgrav

						while plr.Character:WaitForChild('Humanoid').Health == 0 do
							wait(0.001)
						end
						while not plr.Character:FindFirstChild("HumanoidRootPart") do
							wait(0.001)
						end
						rootPart = plr.Character:FindFirstChild("HumanoidRootPart")

						Humanoid = plr.Character:WaitForChild('Humanoid')
					end

					local suc, err = pcall(function()
						Library.CreateNotification("Invisible Fling","Invisible Fling Connecting...")

						while not plr.Character:FindFirstChild('Humanoid') do
							wait(0.001)
						end
						while plr.Character:WaitForChild('Humanoid').Health == 0 do
							wait(0.001)
						end
						while not plr.Character:FindFirstChild("HumanoidRootPart") do
							wait(0.001)
						end

						rootPart = plr.Character:FindFirstChild("HumanoidRootPart")

						Humanoid = plr.Character:WaitForChild('Humanoid')

						local Died = false
						local function fly()
							local loaded = false
							coroutine.wrap(function()
								if plr.Character:FindFirstChild('Animate') then
									plr.Character:FindFirstChild('Animate').Disabled = true
								end

								for i,v in next, Humanoid:GetPlayingAnimationTracks() do
									v:AdjustSpeed(0)
								end

								Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
								Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
								Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
								Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
								Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
								Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
								Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
								Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
								Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
								Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
								Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
								Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
								Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
								Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
								Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
								Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)

								updatespeed(plr.Character, Humanoid)

								local UpperTorso
								if plr.Character:FindFirstChild('LowerTorso') then
									UpperTorso = plr.Character.LowerTorso
								elseif plr.Character:FindFirstChild('Torso') then
									UpperTorso = plr.Character.Torso
								else
									UpperTorso = plr.Character.HumanoidRootPart
								end

								local flying = true
								local deb = true
								local ctrl = {f = 0, b = 0, l = 0, r = 0}
								local lastctrl = {f = 0, b = 0, l = 0, r = 0}
								local maxspeed = 50
								local speed = 0

								bg = Instance.new("BodyGyro", UpperTorso)
								bg.P = 9e4
								bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
								bg.cframe = UpperTorso.CFrame

								bv = Instance.new("BodyVelocity", UpperTorso)
								bv.velocity = Vector3.new(0,0.1,0)
								bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

								Humanoid.PlatformStand = true

								loaded = true
								
								coroutine.wrap(function()
									while not Died and Enabled do
										task.wait()

										if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
											speed = speed+.5+(speed/maxspeed)
											if speed > maxspeed then
												speed = maxspeed
											end
										elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
											speed = speed-1
											if speed < 0 then
												speed = 0
											end
										end
										if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
											bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).Position) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
											lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
										elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
											bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).Position) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
										else
											bv.velocity = Vector3.new(0,0,0)
										end

										bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
									end
								end)()

								
								coroutine.wrap(function()
									local hb = RunService.Heartbeat
									local chr = plr.Character
									local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
									while Enabled and not Died do
										local delta = hb:Wait()
										if hum.MoveDirection.Magnitude > 0 then
											chr:TranslateBy(hum.MoveDirection * 3 * delta * 10)
										end
									end
								end)()


								while not Died and Enabled do
									wait(0.01)
								end

								if plr.Character:FindFirstChild('Animate') then
									plr.Character:FindFirstChild('Animate').Disabled = false
								end

								ctrl = {f = 0, b = 0, l = 0, r = 0}
								lastctrl = {f = 0, b = 0, l = 0, r = 0}
								speed = 0
								bg:Destroy()
								bv:Destroy()	
							end)()	

							while not loaded do
								wait(0.01)
							end
							
						end

						local enums = Enum.HumanoidStateType:GetEnumItems()
						table.remove(enums, table.find(enums, Enum.HumanoidStateType.None))
						for i, v in pairs(enums) do
							Humanoid:SetStateEnabled(v, false)
						end

						Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
						swimbeat = RunService.Heartbeat:Connect(function()
							pcall(function()
								plr.Character.HumanoidRootPart.Velocity = ((Humanoid.MoveDirection ~= Vector3.new() or game:GetService('UserInputService'):IsKeyDown(Enum.KeyCode.Space)) and plr.Character.HumanoidRootPart.Velocity or Vector3.new())
							end)
						end)

						--FLING -> FLY BELOW, SWIM ABOVE
						local coord = Vector3.new(math.random(10000),math.random(10000),math.random(10000))
						local ch = plr.Character
						local prt=Instance.new("Model")
						prt.Parent = plr.Character
						local z1 = Instance.new("Part")
						z1.Name="Torso"
						z1.CanCollide = false
						z1.Anchored = true
						z1.Position = coord
						local z2 = Instance.new("Part")
						z2.Name="Head"
						z2.Parent = prt
						z2.Anchored = true
						z2.CanCollide = false
						z1.Position = coord
						local z3 =Instance.new("Humanoid")
						z3.Name="Humanoid"
						z3.Parent = prt
						z1.Position = Vector3.new(0,9999,0)
						plr.Character=prt
						wait(3)
						plr.Character=ch
						wait(3)
						local Hum = Instance.new("Humanoid")
						z2:Clone()
						Hum.Parent = plr.Character
						local root =  getRoot(plr.Character)
						for i,v in pairs(plr.Character:GetChildren()) do
							if v ~= root and  v.Name ~= "Humanoid" then
								v:Destroy()
							end
						end

						root.Transparency = 0
						root.Color = Color3.new(1, 0.0784619, 0)
						invisflingStepped = RunService.Stepped:Connect(function()
							if plr.Character and getRoot(plr.Character) then
								getRoot(plr.Character).CanCollide = false
							else
								invisflingStepped:Disconnect()
							end
						end)


						--- FLING (Continued) BELOW

						fly()

						workspace.CurrentCamera.CameraSubject = root
						local bambam = Instance.new("BodyThrust")
						bambam.Parent = getRoot(plr.Character)
						bambam.Force = Vector3.new(99999,99999*10,99999)
						bambam.Location = getRoot(plr.Character).Position

						Library.CreateNotification("Invisible Fling","Invisible Fling Connected! if you can't move on mobile, please use the Arceus X v3 Mobile fly!")
						
						Humanoid.Died:Connect(function()
							Died = true
						end)
						
						root.Destroying:Connect(function()
							Died = true
						end)
						
						while not Died do
							if not plr.Character or not plr.Character:FindFirstChild('Humanoid') or root == nil then
								Died = true
							else
								if plr.Character:FindFirstChild('Humanoid').Health == 0 then
									Died = true
								end
							end
							wait(0.1)
						end
						
						if bv ~= nil then
							bv:Destroy()
						end
						if bg ~= nil then
							bg:Destroy()
						end

						pcall(function()
							invisflingStepped:Disconnect()
						end)

						pcall(function()
							swimbeat:Disconnect()
						end)
						game.Workspace.Gravity = oldgrav
						
						pcall(function()
							plr.Character.HumanoidRootPart.CFrame = CFrame.new(0,-999999999999,0)
						end)
					end)
					


					if not suc then
						warn(err)
					end

					wait(0.001)
				end
				Library.CreateNotification("Invisible Fling","Invisible Fling Disconnect")

			else 
				Library.CreateNotification("Invisible Fling","Invisible Fling Attempting to disconnect...")
				
				coroutine.wrap(function()
					pcall(function()
						game.Players.LocalPlayer.Character.Humanoid.Health = 0
					end)
				end)()
				
				local plr = game.Players.LocalPlayer
				local hum = plr.Character:WaitForChild('Humanoid')
				hum:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
				hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
				hum:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
				hum:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
				hum:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
				hum:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
				hum:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
				hum:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
				hum:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
				hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
				hum:SetStateEnabled(Enum.HumanoidStateType.Running,true)
				hum:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
				hum:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
				hum:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
				hum:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
				hum:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)

				plr.Character.Humanoid.Health = 0
				if bv ~= nil then
					bv:Destroy()
				end
				if bg ~= nil then
					bg:Destroy()
				end

				pcall(function()
					invisflingStepped:Disconnect()
				end)
				
				pcall(function()
					swimbeat:Disconnect()
				end)
				
				game.Workspace.Gravity = oldgrav

				pcall(function()
					plr.Character.HumanoidRootPart.CFrame = CFrame.new(0,-999999999999,0)
				end)
			end
		end)()
		wait(0.1)
		WFcool = false
	end
end)

Library.CreateButton(PlayerScript,"resetGravity", "Reset Gravity to 196.2 ( Default )", function()
	game.Workspace.Gravity = 196.2
end)

Library.CreateSlider(PlayerScript,"Gravity",'Gravity',250,function(Speed)
	game.Workspace.Gravity = Speed
end)

Library.CreateTextBoxButton(PlayerScript,"Teleport",'Teleport',function(Playername)
	local foundName = nil
	local Players = game.Players:GetPlayers()
	for i = 1, #Players do
		local PossiblePlayer = Players[i]
		if string.find(string.lower(PossiblePlayer.Name), string.lower(Playername)) then
			foundName = PossiblePlayer.Name
		end
	end

	if foundName then
		game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = game.Workspace:FindFirstChild(foundName):FindFirstChild("HumanoidRootPart").CFrame
	else
		Library.CreateNotification("Alert!", "Can't find the player you want to teleport!")
	end

end,"Player name")

local Set = false
local Test = math.random(1,99999999)
local AA = Test
Library.CreateLoopButton(PlayerScript,"AutoReport", "AutoReport", function()
	local Event = nil
	coroutine.wrap(function()
		Test = math.random(1,99999999)
		wait(0.6)
		AA = Test
	end)()
	local Reported = false
	local reson = ""
	local succuess = true
	local error = ""
	if not Set then
		Set = true
		if not Event then
			Event = game.Players.PlayerChatted:Connect(function(chatType, plr, msg)
				msg = string.lower(msg)
				if chatType ~= Enum.PlayerChatType.Whisper and plr ~= game.Players.LocalPlayer then
					for i, v in next, Words do
						if string.find(msg, i) then
							local suc, er = pcall(function()
								Reported = true
								reson = v
								game.Players:ReportAbuse(game.Players:FindFirstChild(plr.name), v, 'using hate speech and making me feel very shamed!')
							end)
							if not suc then
								Library.CreateNotification('Reporting issue!',"Couldn't report due to the reason: " .. er .. ' | AR')
								succuess = false
								error = er
								return warn("Couldn't report due to the reason: " .. er .. ' | AR')

							end
						end
					end
				end

				if Reported then
					if succuess then
						Library.CreateNotification('Reported',"Reported a person for : "..reson..", Person: "..plr.Name..".")
					else
						Library.CreateNotification('Reporting issue!',"Couldn't report due to the reason: " .. error .. ' | AR')
					end
				end
			end)
		end
	end

	coroutine.wrap(function()
		wait(1)
		if AA == Test then
			Set = false
			pcall(function()
				Event:Disconnect()
			end)
		end
	end)()
end,0.1)

local ESPenabled = false
local cloneref = cloneref or function(o) return o end
COREGUI = cloneref(game:GetService("CoreGui"))
function ESP(plr)
	task.spawn(function()
		for i,v in pairs(COREGUI:GetChildren()) do
			if v.Name == plr.Name..'_ESP' then
				v:Destroy()
			end
		end
		
		wait()
		
		while plr.Character == nil do
			wait(0.01)
		end
		if plr.Character and plr.Name ~= game.Players.LocalPlayer.Name and not COREGUI:FindFirstChild(plr.Name..'_ESP') then
			local ESPholder = Instance.new("Folder")
			ESPholder.Name = plr.Name..'_ESP'
			ESPholder.Parent = COREGUI
			repeat wait(1) until plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
			for b,n in pairs (plr.Character:GetChildren()) do
				if (n:IsA("BasePart")) then
					local a = Instance.new("BoxHandleAdornment")
					a.Name = plr.Name
					a.Parent = ESPholder
					a.Adornee = n
					a.AlwaysOnTop = true
					a.ZIndex = 10
					a.Size = n.Size
					a.Transparency = 0.4
					a.Color = plr.TeamColor
				end
			end
			if plr.Character and plr.Character:FindFirstChild('Head') then
				local BillboardGui = Instance.new("BillboardGui")
				local TextLabel = Instance.new("TextLabel")
				BillboardGui.Adornee = plr.Character.Head
				BillboardGui.Name = plr.Name
				BillboardGui.Parent = ESPholder
				BillboardGui.Size = UDim2.new(0, 100, 0, 150)
				BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
				BillboardGui.AlwaysOnTop = true
				TextLabel.Parent = BillboardGui
				TextLabel.BackgroundTransparency = 1
				TextLabel.Position = UDim2.new(0, 0, 0, -50)
				TextLabel.Size = UDim2.new(0, 100, 0, 100)
				TextLabel.Font = Enum.Font.SourceSansSemibold
				TextLabel.TextSize = 20
				TextLabel.TextColor3 = Color3.new(1, 1, 1)
				TextLabel.TextStrokeTransparency = 0
				TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
				TextLabel.Text = 'Name: '..plr.Name
				TextLabel.ZIndex = 10
				local espLoopFunc
				local teamChange
				local addedFunc
				addedFunc = plr.CharacterAdded:Connect(function()
					if ESPenabled then
						espLoopFunc:Disconnect()
						teamChange:Disconnect()
						ESPholder:Destroy()
						repeat wait(1) until getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
						while not plr.Character do
							wait(0.01)
						end
						if ESPholder then
							ESPholder:Destroy()
						end
						ESP(plr)
						addedFunc:Disconnect()
					else
						teamChange:Disconnect()
						addedFunc:Disconnect()
					end
				end)
				
				local Foundone = false
				for i,v in pairs(COREGUI:GetChildren()) do
					if v.Name == plr.Name..'_ESP' then
						if not Foundone then
							Foundone = true
						else
							v:Destroy()
						end
					end
				end
				
				teamChange = plr:GetPropertyChangedSignal("TeamColor"):Connect(function()
					if ESPenabled then
						espLoopFunc:Disconnect()
						addedFunc:Disconnect()
						ESPholder:Destroy()
						repeat wait(1) until getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
						ESP(plr)
						teamChange:Disconnect()
					else
						teamChange:Disconnect()
					end
				end)
				
				
				local function espLoop()
					if COREGUI:FindFirstChild(plr.Name..'_ESP') then
						if plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character and getRoot(game.Players.LocalPlayer.Character) and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
							local pos = math.floor((getRoot(game.Players.LocalPlayer.Character).Position - getRoot(plr.Character).Position).magnitude)
							if game.Players.LocalPlayer:IsFriendsWith(plr.UserId) then
								TextLabel.Text = '[ FRIEND ] Name: '..plr.Name..' | Health: '..round(plr.Character:FindFirstChildOfClass('Humanoid').Health, 1)..' | Studs: '..pos
							else
								TextLabel.Text = 'Name: '..plr.Name..' | Health: '..round(plr.Character:FindFirstChildOfClass('Humanoid').Health, 1)..' | Studs: '..pos
							end
						else
							if not plr.Character then
								pcall(function()
									ESPholder:Destroy()
								end)
								teamChange:Disconnect()
								addedFunc:Disconnect()
								espLoopFunc:Disconnect()
							end
						end
						
						if not game.Players:FindFirstChild(plr.Name) then
							pcall(function()
								ESPholder:Destroy()
							end)
							teamChange:Disconnect()
							addedFunc:Disconnect()
							espLoopFunc:Disconnect()
						end
						
						local suc, _ = pcall(function()
							getRoot(plr.Character)
							local _ = plr.Character.Humanoid
							_ = plr.Character.Humanoid.Health
						end)
						
						if not suc then
							pcall(function()
								ESPholder:Destroy()
							end)
							teamChange:Disconnect()
							addedFunc:Disconnect()
							espLoopFunc:Disconnect()
						end
						
						if BillboardGui.Adornee ~= plr.Character.Head then
							teamChange:Disconnect()
							addedFunc:Disconnect()
							espLoopFunc:Disconnect()
							pcall(function()
								ESPholder:Destroy()
							end)

							ESP(plr)
						end
					else
						if not game.Players:FindFirstChild(plr.Name) then
							teamChange:Disconnect()
							addedFunc:Disconnect()
							espLoopFunc:Disconnect()
							pcall(function()
								ESPholder:Destroy()
							end)
						end
						if game.Players:FindFirstChild(plr.Name) and ESPenabled then
							teamChange:Disconnect()
							addedFunc:Disconnect()
							espLoopFunc:Disconnect()
							pcall(function()
								ESPholder:Destroy()
							end)
							
							ESP(plr)
						end
					end
				end
				espLoopFunc = RunService.RenderStepped:Connect(espLoop)
			end
		end
	end)
end
local PLAYERRBXESP
Library.CreateButton(PlayerScript,"ESP","ESP (Name and Health)",function()
	ESPenabled = not ESPenabled
	if ESPenabled then
		
		coroutine.wrap(function()
			PLAYERRBXESP = game.Players.PlayerAdded:Connect(function(play)
				play.CharacterAdded:Wait()
				ESP(play)
			end)
		end)()
		
		for i,v in pairs(game.Players:GetPlayers()) do
			if v.Name ~= game.Players.LocalPlayer.Name then
				ESP(v)
			end
		end
		
		while ESPenabled do
			for i,v in pairs(game.Players:GetPlayers()) do
				local notFound = true
				local FoundESP = nil
				
				for _,k in pairs(COREGUI:GetChildren()) do
					if k.Name == v.Name..'_ESP' then
						notFound = false
						FoundESP = k
						break
					end
				end
				if notFound then
					coroutine.wrap(function()
						while not v.Character do
							wait(0.01)
						end
						ESP(v)
					end)()
				else
					if FoundESP == nil then
						ESP(v)
					end
					if not FoundESP:FindFirstChild(v.Name) then
						FoundESP:Destroy()
						ESP(v)
					end
					
					local check1 = false
					local check2 = false
					local ESPGC = FoundESP:GetChildren()
					for i = 1, #ESPGC do
						if ESPGC[i]:IsA('BillboardGui') then
							check1 = true
						elseif ESPGC[i]:IsA('BoxHandleAdornment') then
							check2 = true
						end
					end
					
					if check1 and check2 then
					else
						FoundESP:Destroy()
						ESP()
					end
				end
				
			end
			wait(5)
		end
		
	else
		for i,c in pairs(COREGUI:GetChildren()) do
			if string.sub(c.Name, -4) == '_ESP' then
				c:Destroy()
			end
		end
		
		PLAYERRBXESP:Disconnect()
	end
end, 10000000000)

local WSS = Library.CreateSection(GUI,"Simulators")

Library.CreateButton(WSS,"Name1","Block breaking simulator by Block Breaking Sim")

Library.CreateLoopButton(WSS,"FarmStrengths","Farm Strengths",function()
	local args = {
		[1] = math.huge
	}

	game:GetService("ReplicatedStorage"):WaitForChild("Game"):WaitForChild("RemoteEvents"):WaitForChild("GiveStrength"):FireServer(unpack(args))
end,0.001)

Library.CreateLoopButton(WSS,"FarmWins","Farm Wins",function()
	local args = {
		[1] = {
			["GiftType"] = "Stat",
			["StatName"] = "Win",
			["Time"] =  math.huge,
			["Amount"] =  math.huge
		}
	}
	game:GetService("ReplicatedStorage"):WaitForChild("Game"):WaitForChild("RemoteEvents"):WaitForChild("FreeGift"):FireServer(unpack(args))
end,0.05)

Library.CreateLoopButton(WSS,"FarmWins","Farm Wins",function()
	local args = {
		[1] = {
			["GiftType"] = "Stat",
			["StatName"] = "Rebirth",
			["Time"] =  math.huge,
			["Amount"] =  math.huge
		}
	}
	game:GetService("ReplicatedStorage"):WaitForChild("Game"):WaitForChild("RemoteEvents"):WaitForChild("FreeGift"):FireServer(unpack(args))
end,0.05)

Library.CreateTextBoxButton(WSS,"GetPet",'Steal pet',function(pet)
	local args = {
		[1] = 1809,
		[2] = 1800,
		[3] = pet
	}

	game:GetService("ReplicatedStorage"):WaitForChild("Game"):WaitForChild("RemoteFunctions"):WaitForChild("ClaimLimitedTimePet"):InvokeServer(unpack(args))
	Library.CreateNotification('Stealed Pet','Successfully stealed pet! '..pet.." (if you spelt correctly)")
end,"en")

Library.CreateButton(WSS,"Name2","Weight Lifting Sim by Top Games")

Library.CreateLoopButton(WSS,"FarmWin","Farm win (must beat one person first)",function()
	local args = {
		[1] = "Player",
		[2] = 30
	}

	game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BattleEvent"):FireServer(unpack(args))
end,0.001)

Library.CreateLoopButton(WSS,"FarmMuscle","Farm Muscles",function()
	game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AddMuscle"):FireServer()
end,0.001)

local MonkeySim = Library.CreateSection(GUI,"Monkey Sim")

Library.CreateLoopButton(MonkeySim,"MonkeySim+10k","10k Bananas",function()
	pcall(function()
		local plrHRP = game.Players.LocalPlayer.Character:FindFirstChild('RightLowerLeg')
		local Drops = workspace.Drops:GetChildren()

		local originPos = plrHRP.Position
		for i = 1, #Drops do
			Drops[i].Position = plrHRP.Position
			wait(0.001)
		end
	end)

	local args = {
		[1] = 10000
	}

	game:GetService("ReplicatedStorage"):WaitForChild("GTycoonClient"):WaitForChild("Remotes"):WaitForChild("GrabDrops"):FireServer(unpack(args))

end,0.001)

Library.CreateLoopButton(MonkeySim,"MonkeySim+1m","1mil Bananas",function()
	pcall(function()
		local plrHRP = game.Players.LocalPlayer.Character:FindFirstChild('RightLowerLeg')
		local Drops = workspace.Drops:GetChildren()

		local originPos = plrHRP.Position
		for i = 1, #Drops do
			Drops[i].Position = plrHRP.Position
			wait(0.001)
		end
	end)

	local args = {
		[1] = 1000000
	}

	game:GetService("ReplicatedStorage"):WaitForChild("GTycoonClient"):WaitForChild("Remotes"):WaitForChild("GrabDrops"):FireServer(unpack(args))

end,0.001)

Library.CreateLoopButton(MonkeySim,"MonkeySim+100m","100mil Bananas",function()
	pcall(function()
		local plrHRP = game.Players.LocalPlayer.Character:FindFirstChild('RightLowerLeg')
		local Drops = workspace.Drops:GetChildren()

		local originPos = plrHRP.Position
		for i = 1, #Drops do
			Drops[i].Position = plrHRP.Position
			wait(0.001)
		end
	end)

	local args = {
		[1] = 100000000
	}

	game:GetService("ReplicatedStorage"):WaitForChild("GTycoonClient"):WaitForChild("Remotes"):WaitForChild("GrabDrops"):FireServer(unpack(args))

end,0.001)

Library.CreateLoopButton(MonkeySim,"MonkeySim+1b","1bil Bananas",function()
	pcall(function()
		local plrHRP = game.Players.LocalPlayer.Character:FindFirstChild('RightLowerLeg')
		local Drops = workspace.Drops:GetChildren()

		local originPos = plrHRP.Position
		for i = 1, #Drops do
			Drops[i].Position = plrHRP.Position
			wait(0.001)
		end
	end)

	local args = {
		[1] = 1000000000
	}

	game:GetService("ReplicatedStorage"):WaitForChild("GTycoonClient"):WaitForChild("Remotes"):WaitForChild("GrabDrops"):FireServer(unpack(args))

end,0.001)

Library.CreateLoopButton(MonkeySim,"MonkeySim+Rank","Randomised (1,~100000) Bananas",function()
	pcall(function()
		local plrHRP = game.Players.LocalPlayer.Character:FindFirstChild('RightLowerLeg')
		local Drops = workspace.Drops:GetChildren()

		local originPos = plrHRP.Position
		for i = 1, #Drops do
			Drops[i].Position = plrHRP.Position
			wait(0.001)
		end
	end)

	local args = {
		[1] = math.random(1,100000)
	}

	game:GetService("ReplicatedStorage"):WaitForChild("GTycoonClient"):WaitForChild("Remotes"):WaitForChild("GrabDrops"):FireServer(unpack(args))

end,0.0001)

Library.CreateButton(MonkeySim,"MonkeySimX3","X3 boost",function()
	game:GetService("ReplicatedStorage"):WaitForChild("GTycoonClient"):WaitForChild("Remotes"):WaitForChild("ApplyCode"):FireServer("Boostmeup")
end)

Library.CreateButton(MonkeySim,"MonkeySimHot","Fire on character",function()
	game:GetService("ReplicatedStorage"):WaitForChild("GTycoonClient"):WaitForChild("Remotes"):WaitForChild("ApplyCode"):FireServer("Hot")
end)

Library.CreateButton(MonkeySim,"MonkeySimBalls","Balls",function()
	game:GetService("ReplicatedStorage"):WaitForChild("GTycoonClient"):WaitForChild("Remotes"):WaitForChild("ApplyCode"):FireServer("Balls")
end)

Library.CreateButton(MonkeySim,"MonkeySimRedeemallcodes","Redeem all code!",function()
	local codes = {
		"/codelist";
		"Arboreal";
		"Baboon";
		"Gorilla";
		"Orangutan";
		"Primate";
		"Simian";
		"bugfixing";
		"Nevergonnagiveyouup";
		"Nevergonnaletyoudown";
		"Nevergonnarunaroundanddesertyou";
		"Nevergonnamakeyoucry";
		"Nevergonnasaygoodbye";
		"Nevergonnatellalieandhurtyou";
		"Thanks";
		"Ape";
		"Bakery";
		"Plantain";
		"Tarantula";
		"September";
		"Medusa";
		"BloodForTheBloodGod";
		"boogers";
		"bottle";
		"statues";
		"Asteroid";
		"RollTheDice";
		"142496";
		"Hot";
		"Nothing";
		"Freeslimemonkey";
		"Cipher";
		"RIGVSQERGIV";
		"MonkeyTycoonForever";
		"Asteroid";
		"MichaelsaJoestar";
		"ELSEP03M";
		"Boostmeup";
		"Murder";
		"GOOBLESTHEALIEN";
		"Nirvana";
		"Monkey Backwards";
		"Radiation";
		"Balls";
		"LotsOfMonkeys";
	}

	for i ,v in pairs(codes) do
		game:GetService("ReplicatedStorage"):WaitForChild("GTycoonClient"):WaitForChild("Remotes"):WaitForChild("ApplyCode"):FireServer(v)
		wait(2)
	end
end)

Library.CreateLoopButton(MonkeySim,"MonkeySimDesposit","Auto Despoit",function()
	game:GetService("ReplicatedStorage"):WaitForChild("GTycoonClient"):WaitForChild("Remotes"):WaitForChild("DepositDrops"):FireServer()
end,0.001)

Library.CreateLoopButton(MonkeySim,"MonkeySimRebirth","Auto Rebirth",function()
	game:GetService("ReplicatedStorage"):WaitForChild("GTycoonClient"):WaitForChild("Remotes"):WaitForChild("DoSacrifice"):FireServer()
end,0.001)

Library.CreateLoopButton(MonkeySim,"MonkeySimRate","Auto Increase Rate",function()
	local args = {
		[1] = 1
	}

	game:GetService("ReplicatedStorage"):WaitForChild("GTycoonClient"):WaitForChild("Remotes"):WaitForChild("BuySpeed"):FireServer(unpack(args))

end,0.001)

Library.CreateLoopButton(MonkeySim,"MonkeySimMax","Auto buy max",function()
	game:GetService("ReplicatedStorage"):WaitForChild("GTycoonClient"):WaitForChild("Remotes"):WaitForChild("BuyDropperMax"):FireServer()
end,0.001)

Library.CreateLoopButton(MonkeySim,"MonkeySimMerge","Auto Merge",function()
	game:GetService("ReplicatedStorage"):WaitForChild("GTycoonClient"):WaitForChild("Remotes"):WaitForChild("MergeDroppers"):FireServer()
end,0.001)

local RPGSim = Library.CreateSection(GUI,"Legend Bone Sword RPG Farms")

local Running = false

local function CheckTools()
	local HighVal = 0
	local HighTool
	local suc, err =pcall(function()
		local plr = game.Players.LocalPlayer
		local char = plr.Character
		if char.Humanoid.Health > 0 then
			if not char:FindFirstChildOfClass("Tool") then
				local BackPackGC = plr.Backpack:GetChildren()
				for i = 1,#BackPackGC do
					if BackPackGC[i]:IsA('Tool') then
						local currentVal = 0
						local currentTool = BackPackGC[i]
						if currentTool:FindFirstChild('MaxDmg') then
							currentVal = currentTool:FindFirstChild('MaxDmg').Value
						end
						if currentVal >= HighVal then
							HighVal = currentVal
							HighTool = currentTool
						end
					end
				end
			end
		end
		char.Humanoid:EquipTool(HighTool)
		return
	end)
	if not suc then
		print(err)
	end
end

--Doing this to prevent memory leaks! as this is always function

local OriginGravity
local PlrHRP
local PreviousPos
local EnemiesPathGC
local Char
local CharGC
local EnemyList

local function killLoop(list)
	local suc, err = pcall(function()

		EnemyList = list
		if not Running then
			Running = true
			CheckTools()
			OriginGravity = game.Workspace.Gravity
			PlrHRP = game.Players.LocalPlayer.Character.HumanoidRootPart
			PreviousPos = PlrHRP.CFrame
			EnemiesPathGC = game:GetService("Workspace").Enemies:GetChildren()
			Char = PlrHRP.Parent
			CharGC = Char:GetChildren()

			game.Workspace.Gravity = 0

			for i = 1,#EnemiesPathGC do
				for j ,v in pairs(EnemyList) do
					if EnemiesPathGC[i].Name == v then
						local HumanoidInstance
						local enemy = EnemiesPathGC[i]
						local enemyGC = enemy:GetChildren()

						for i = 1,#enemyGC do
							if enemyGC[i]:IsA("Humanoid") then
								HumanoidInstance = enemyGC[i]
								break
							end
						end
						if HumanoidInstance then
							local Kill = true
							local Running
							Running = RunService.Heartbeat:Connect(function()
								local suc, err = pcall(function()
									if HumanoidInstance.Health > 0 and PlrHRP.Parent.Humanoid.Health > 0 then
										PlrHRP.CFrame = enemy.Head.CFrame * CFrame.new(-1.2,4,4) * CFrame.Angles(math.rad(-130),0,0)
									else
										Kill = false
										Running:Disconnect()
									end
								end)
								if not suc then
									Kill = false
									Running:Disconnect()
								end
							end)
							local suc, err = pcall(function()
								PlrHRP.Parent.Humanoid.Died:Connect(function()
									Kill = false
									Running:Disconnect()
								end)
								HumanoidInstance.Died:Connect(function()
									Kill = false
									Running:Disconnect()
								end)
							end)

							if not suc then
								Kill = false
								Running:Disconnect()
							end

							while Kill do
								if HumanoidInstance.Health > 0 and PlrHRP.Parent.Humanoid.Health > 0 then
									game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UseItem"):FireServer()
								else
									Kill = false
									Running:Disconnect()
								end
								wait(.25)
							end
						end
					end
				end
			end

			wait(0.1)
			game.Workspace.Gravity = OriginGravity
			PlrHRP.CFrame = PreviousPos
			wait(0.5)
			Running = false
		end
	end)

	if not suc then
		Running = false
	end
end

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Goblin","Autofarm Goblin LVL 0",function()
	killLoop({'Goblin',"Goblin Leader"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Mummies","Autofarm Mummies LVL10",function()
	killLoop({'Sandman',"Mummy"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Ice","Autofarm Ice Guardians LVL 15",function()
	killLoop({'Ice Guardian',"Frostbite Ice Knight"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Skeletons","Autofarm Skeletons LVL 20",function()
	killLoop({'Skeleton',"Skeleton King"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Magmas","Autofarm Magmas LVL 30",function()
	killLoop({'Magma Minion',"Magma Thrasher"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Swamp","Autofarm Swamp LVL 40",function()
	killLoop({'Swamp Monster',"Swamp Guardian"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Swamp","Autofarm ORC LVL 50",function()
	killLoop({'Orc',"Orc Leader"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Swamp","Autofarm Cloud LVL 60",function()
	killLoop({'Cloud Lurker',"Cloud Lord"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Swamp","Autofarm Zombies LVL 70",function()
	killLoop({'Ghost',"Zombie"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Robot","Autofarm Robot LVL 80",function()
	killLoop({'Robot',"Malfunctioning Robot"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Vapmire","Autofarm Vapmire LVL 90",function()
	killLoop({'Vapmire',"Vapmire King"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Korblox","Autofarm Korblox LVL 200",function()
	killLoop({'Korblox Apprentice',"Wrath of Korblox","Korblox Deathspeaker"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Flame","Autofarm Flame LVL 500",function()
	killLoop({'Flame Minion',"Flame Master"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Flare","Autofarm Flare LVL 12.5k",function()
	killLoop({'Flare',"The Sun"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Pumpkins","Autofarm Pumpkins LVL 20K",function()
	killLoop({'Pumpkin Minion',"Horseless Headman"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Maze","Autofarm Maze LVL 25K",function()
	killLoop({'The Mazemaster'})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Aliens","Autofarm Aliens LVL 27.5K",function()
	killLoop({'Alien Follower',"Alien Monarch"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Demons","Autofarm Demons LVL 30K",function()
	killLoop({'Demon',"Devil"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Heaven","Autofarm Heaven LVL 32.5K",function()
	killLoop({'Angel',"God"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Radioactive","Autofarm Radioactive LVL 35K",function()
	killLoop({'Radioactive Beast',"Braen, the Corrupt"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Knight of Light","Autofarm Knight of Light LVL 37.5K",function()
	killLoop({'Knight of Light',"Helge, the Heavenly", "N00b"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Neons","Autofarm Neon LVL 40K",function()
	killLoop({"Ultimate Neon Boss", "Neon Warrior"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Salt","Autofarm Salts LVL 42.5K",function()
	killLoop({'Salt Crystalt',"AshedIce, the Saltiest"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Ball of Gold","Autofarm Ball of Gold LVL 45K",function()
	killLoop({'Ball of Gold',"QuiteFox9496244, the Loyal"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Pomeranian","Autofarm Pomeranian LVL 47.5K",function()
	killLoop({'Pomeranian',"Rory968, the Pomeranian Ruler"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Skeleton","Autofarm Skeleton LVL 50K",function()
	killLoop({'Skeleton',"The Bone Lord"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Life Keeper","Autofarm Life Keeper LVL 8k [Event]",function()
	killLoop({'Life Keeper',"Life Keeper Boss"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Light","Autofarm Light LVL 15k [Event]",function()
	killLoop({'Light Knight',"Keeper of all Light"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Spirit","Autofarm Spirit LVL 25K [Event]",function()
	killLoop({'Spirit',"Spiritual Wisp"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Dark Skeleton","Autofarm Dark Skeleton LVL 57.5K [Event]",function()
	killLoop({'Dark Skeleton',"The Currupted  Bone Lord [FINAL BOSS]"})
end,1)

local RPGBossSim = Library.CreateSection(GUI,"Legend Bone Sword RPG Bosses") --BOSSES

Library.CreateLoopButton(RPGBossSim,"RPGSim Autofarm Bone Lord Son","Autofarm Bone lord Son LVL 100",function()
	killLoop({"The Bone Lord's Son"})
end,1)

Library.CreateLoopButton(RPGBossSim,"RPGSim Autofarm ChrythmVienyx","Autofarm Chrythm and Vienyx",function()
	killLoop({"Vienyx", "Chrythm"})
end,1)

Library.CreateLoopButton(RPGBossSim,"RPGSim Autofarm BoldsGold","Autofarm BoldsGold",function()
	killLoop({"BoldsGold"})
end,1)

Library.CreateLoopButton(RPGBossSim,"RPGSim Autofarm Spate","Autofarm Spate",function()
	killLoop({"Spate"})
end,1)

Library.CreateLoopButton(RPGBossSim,"RPGSim Autofarm elijah1113456","Autofarm elijah1113456",function()
	killLoop({"elijah1113456"})
end,1)

Library.CreateLoopButton(RPGBossSim,"RPGSim Autofarm Builderman","Autofarm Builderman",function()
	killLoop({"Builderman"})
end,1)

Library.CreateLoopButton(RPGBossSim,"RPGSim Autofarm Giancarlo","Autofarm Giancarlo",function()
	killLoop({"Giancarlo"})
end,1)

Library.CreateLoopButton(RPGBossSim,"RPGSim Autofarm Scrub","Autofarm Scrub",function()
	killLoop({"Scrub"})
end,1)

Library.CreateLoopButton(RPGBossSim,"RPGSim Autofarm MoonMan","Autofarm MoonMan",function()
	killLoop({"MoonMan"})
end,1)

Library.CreateLoopButton(RPGBossSim,"RPGSim Autofarm Ajax","Autofarm Ajax",function()
	killLoop({"Ajax"})
end,1)

Library.CreateLoopButton(RPGBossSim,"RPGSim Autofarm Togarmah","Autofarm Togarmah",function()
	killLoop({"Togarmah"})
end,1)

Library.CreateLoopButton(RPGBossSim,"RPGSim Autofarm I Bone Lord","Autofarm I Bone Lord",function()
	killLoop({"I Bone Lord"})
end,1)

local HeavenSword = Library.CreateSection(GUI,"Heaven Sword")

button = Library.CreateLoopButton(HeavenSword,"Kill All","Kill All (NPCS)",function()
	local args = {
		[1] = "A7"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Force"):FireServer(unpack(args))

	local args = {
		[1] = "InvA10",
		[2] = 1000,
		[3] = "MP",
		[4] = "Potion"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("UseItem"):FireServer(unpack(args))
end,0.05)
Library.CreateLoopButton(HeavenSword,"InfHP","Inf HP all",function()

	local args = {
		[1] = "InvA10",
		[2] = 1000,
		[3] = "HP",
		[4] = "Potion"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("UseItem"):FireServer(unpack(args))
end,0.05)
Library.CreateLoopButton(HeavenSword,"HealAll","Heal All",function()

	local args = {
		[1] = "A7"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Cure"):FireServer(unpack(args))

	local args = {
		[1] = "InvA10",
		[2] = 1000,
		[3] = "MP",
		[4] = "Potion"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("UseItem"):FireServer(unpack(args))

end,.05)
Library.CreateLoopButton(HeavenSword,"Immunity","Immunity",function()

	local args = {
		[1] = "A7"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Barrier"):FireServer(unpack(args))

	local args = {
		[1] = "InvA10",
		[2] = 1000,
		[3] = "MP",
		[4] = "Potion"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("UseItem"):FireServer(unpack(args))

end,.05)
Library.CreateLoopButton(HeavenSword,"Fireball","Fireball",function()

	local args = {
		[1] = "C2"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Fireball"):FireServer(unpack(args))

	local args = {
		[1] = "InvA10",
		[2] = 1000,
		[3] = "MP",
		[4] = "Potion"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("UseItem"):FireServer(unpack(args))

end,.05)

local HS = RunService.RenderStepped
local BAndS = Library.CreateSection(GUI,"Build and Survive")

local function CreateBlock(Len,hei,wid, ma)
	pcall(function()
		local args = {
			[1] = {
				[1] = CFrame.new(Len, hei, wid, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				[2] = ma,
				[3] = workspace:WaitForChild("__THINGS"):WaitForChild("BuildArea")
			}
		}

		workspace:WaitForChild("__THINGS"):WaitForChild("__REMOTES"):WaitForChild("placeblock"):FireServer(unpack(args))
	end)
end

local function fortress(Material)
	local Material = Material -- Wood / Brick / Metal / Obsidian / Firebrick
	local DONOTBUILDLIST = {
		{l = -68,h = 8 , w = 52};
		{l = -60,h = 8 , w = 52};
		{l = -64,h = 8 , w = 52};

		{l = -72,h = 4 , w = 52};
		{l = -68,h = 4 , w = 52};
		{l = -64,h = 4 , w = 52};
		{l = -60,h = 4 , w = 52};
		{l = -56,h = 4 , w = 52};

		{l = -72,h = 0 , w = 52};
		{l = -68,h = 0 , w = 52};
		{l = -64,h = 0 , w = 52};
		{l = -60,h = 0 , w = 52};
		{l = -56,h = 0 , w = 52};

		{l = -72,h = -4 , w = 52};
		{l = -68,h = -4 , w = 52};
		{l = -64,h = -4 , w = 52};
		{l = -60,h = -4 , w = 52};
		{l = -56,h = -4 , w = 52};

		{l = -72,h = -8 , w = 52};
		{l = -68,h = -8 , w = 52};
		{l = -64,h = -8 , w = 52};
		{l = -60,h = -8 , w = 52};
		{l = -56,h = -8 , w = 52};

		--SECOND

		{l = -68,h = 8 , w = 56};
		{l = -60,h = 8 , w = 56};
		{l = -64,h = 8 , w = 56};

		{l = -72,h = 4 , w = 56};
		{l = -68,h = 4 , w = 56};
		{l = -64,h = 4 , w = 56};
		{l = -60,h = 4 , w = 56};
		{l = -56,h = 4 , w = 56};

		{l = -72,h = 0 , w = 56};
		{l = -68,h = 0 , w = 56};
		{l = -64,h = 0 , w = 56};
		{l = -60,h = 0 , w = 56};
		{l = -56,h = 0 , w = 56};

		{l = -72,h = -4 , w = 56};
		{l = -68,h = -4 , w = 56};
		{l = -64,h = -4 , w = 56};
		{l = -60,h = -4 , w = 56};
		{l = -56,h = -4 , w = 56};

		{l = -72,h = -8 , w = 56};
		{l = -68,h = -8 , w = 56};
		{l = -64,h = -8 , w = 56};
		{l = -60,h = -8 , w = 56};
		{l = -56,h = -8 , w = 56};

		--THIRD

		{l = -68,h = 8 , w = 60};
		{l = -60,h = 8 , w = 60};
		{l = -64,h = 8 , w = 60};

		{l = -72,h = 4 , w = 60};
		{l = -68,h = 4 , w = 60};
		{l = -64,h = 4 , w = 60};
		{l = -60,h = 4 , w = 60};
		{l = -56,h = 4 , w = 60};

		{l = -72,h = 0 , w = 60};
		{l = -68,h = 0 , w = 60};
		{l = -64,h = 0 , w = 60};
		{l = -60,h = 0 , w = 60};
		{l = -56,h = 0 , w = 60};

		{l = -72,h = -4 , w = 60};
		{l = -68,h = -4 , w = 60};
		{l = -64,h = -4 , w = 60};
		{l = -60,h = -4 , w = 60};
		{l = -56,h = -4 , w = 60};

		{l = -72,h = -8 , w = 60};
		{l = -68,h = -8 , w = 60};
		{l = -64,h = -8 , w = 60};
		{l = -60,h = -8 , w = 60};
		{l = -56,h = -8 , w = 60};
	}

	--Area
	local Length = 91 -- * 4, 364
	local Width = 79 -- * 4, 316

	--Constant
	local GroundLevel = -8
	local StartLength = -252
	local StartWidth = 52

	--Change
	local changedHeight = 6
	local BlockLength = 0
	local BlockHeight = 0
	local BlockWidth = 0
	local Build = true

	for Height = 0, changedHeight do

		for LengthNumber = 0, Length do

			BlockLength = StartLength + (LengthNumber * 4)
			BlockHeight = GroundLevel + (Height * 4)
			BlockWidth = StartWidth

			Build = true
			for _, D in pairs(DONOTBUILDLIST) do
				if D.l == BlockLength and D.w == BlockWidth and D.h == BlockHeight then
					Build = false
					break
				end
			end

			if Build then
				CreateBlock(BlockLength,BlockHeight,BlockWidth,Material)
			end

		end
	end

	for Height = 0, changedHeight do

		for LengthNumber = 0, Length do

			BlockLength = StartLength + (LengthNumber * 4)
			BlockHeight = GroundLevel + (Height * 4)
			BlockWidth = StartWidth + 4

			Build = true
			for _, D in pairs(DONOTBUILDLIST) do
				if D.l == BlockLength and D.w == BlockWidth and D.h == BlockHeight then
					Build = false
					break
				end
			end

			if Build then
				CreateBlock(BlockLength,BlockHeight,BlockWidth,Material)
			end

		end
	end

	for Height = 0, changedHeight do

		for LengthNumber = 0, Length do

			BlockLength = StartLength + (LengthNumber * 4)
			BlockHeight = GroundLevel + (Height * 4)
			BlockWidth = StartWidth + 8

			Build = true
			for _, D in pairs(DONOTBUILDLIST) do
				if D.l == BlockLength and D.w == BlockWidth and D.h == BlockHeight then
					Build = false
					break
				end
			end

			if Build then
				CreateBlock(BlockLength,BlockHeight,BlockWidth,Material)
			end

		end
	end

	for Height = 0, changedHeight do

		for LengthNumber = 0, Length do

			BlockLength = StartLength + (LengthNumber * 4)
			BlockHeight = GroundLevel + (Height * 4)
			BlockWidth = StartWidth + (Width * 4)

			Build = true
			for _, D in pairs(DONOTBUILDLIST) do
				if D.l == BlockLength and D.w == BlockWidth and D.h == BlockHeight then
					Build = false
					break
				end
			end

			if Build then
				CreateBlock(BlockLength,BlockHeight,BlockWidth,Material)
			end

		end
	end

	for Height = 0, changedHeight do

		for WidthNumber = 0, Length do

			BlockLength = StartLength
			BlockHeight = GroundLevel + (Height * 4)
			BlockWidth = StartWidth  + (WidthNumber * 4)

			Build = true
			for _, D in pairs(DONOTBUILDLIST) do
				if D.l == BlockLength and D.w == BlockWidth and D.h == BlockHeight then
					Build = false
					break
				end
			end

			if Build then
				CreateBlock(BlockLength,BlockHeight,BlockWidth,Material)
			end

		end
	end

	for Height = 0, changedHeight do

		for WidthNumber = 0, Length do

			BlockLength = StartLength + (Length * 4)
			BlockHeight = GroundLevel + (Height * 4)
			BlockWidth = StartWidth  + (WidthNumber * 4)

			Build = true
			for _, D in pairs(DONOTBUILDLIST) do
				if D.l == BlockLength and D.w == BlockWidth and D.h == BlockHeight then
					Build = false
					break
				end
			end

			if Build then
				CreateBlock(BlockLength,BlockHeight,BlockWidth,Material)
			end

		end
	end

	local center = {
		{x = -212,y = -8,z = 100};
		{x = 44,y = -8,z = 100};
	}

	local function pillar(X,DeHeight,Z,Restrict, Gold)
		if Restrict == nil then
			Restrict = {}
		end

		if Gold == nil then
			Gold = false
		end

		local CusBlockHeight
		local blockedPill = false

		for Height = 0, DeHeight do
			CusBlockHeight = GroundLevel + (Height * 4)

			blockedPill = false
			for j,k in pairs(Restrict) do
				if k == CusBlockHeight then
					blockedPill = true
				end
			end

			if not blockedPill then
				if Gold then
					CreateBlock(X,CusBlockHeight,Z,"Firebrick")
				else
					CreateBlock(X,CusBlockHeight,Z,Material)
				end
			end
		end
	end

	local function floor(DeLength, Y, DeWidth, StartLength, StartWidth ,Restrict)
		if Restrict == nil then
			Restrict = {
				{x=1000 , z=1000}
			}
		end

		local CusBlockLength
		local CusBlockWidth
		local CusBlockHeight
		local blockedFloor = false

		for Width = 0, DeWidth do
			for Length = 0, DeLength do

				CusBlockLength = StartLength + (Length * 4)
				CusBlockWidth = StartWidth + (Width * 4)
				CusBlockHeight = GroundLevel + (Y * 4)

				blockedFloor = false
				for _,k in pairs(Restrict) do
					if k.x == CusBlockLength and k.z == CusBlockWidth then
						blockedFloor = true
					end
				end

				if not blockedFloor then
					CreateBlock(CusBlockLength,CusBlockHeight,CusBlockWidth,Material)
				end

			end
		end
	end

	for _, Coord in pairs(center) do
		pillar(Coord.x+12,10,Coord.z+12)
		pillar(Coord.x+12,10,Coord.z+8)
		pillar(Coord.x+12,10,Coord.z+4)
		pillar(Coord.x+12,10,Coord.z)
		pillar(Coord.x+12,10,Coord.z-4)
		pillar(Coord.x+12,10,Coord.z-8)
		pillar(Coord.x+12,10,Coord.z-12)

		pillar(Coord.x-12,10,Coord.z+12)
		pillar(Coord.x-12,10,Coord.z+8)
		pillar(Coord.x-12,10,Coord.z+4)
		pillar(Coord.x-12,10,Coord.z)
		pillar(Coord.x-12,10,Coord.z-4)
		pillar(Coord.x-12,10,Coord.z-8)
		pillar(Coord.x-12,10,Coord.z-12)

		pillar(Coord.x+12,10,Coord.z+12)
		pillar(Coord.x+8,10,Coord.z+12)
		pillar(Coord.x+4,10,Coord.z+12)
		pillar(Coord.x,10,Coord.z+12, {-8,-4})
		pillar(Coord.x-4,10,Coord.z+12)
		pillar(Coord.x-8,10,Coord.z+12)
		pillar(Coord.x-12,10,Coord.z+12)

		pillar(Coord.x+12,10,Coord.z-12)
		pillar(Coord.x+8,10,Coord.z-12)
		pillar(Coord.x+4,10,Coord.z-12)
		pillar(Coord.x,10,Coord.z-12)
		pillar(Coord.x-4,10,Coord.z-12)
		pillar(Coord.x-8,10,Coord.z-12)
		pillar(Coord.x-12,10,Coord.z-12)

		--INSIDE

		pillar(Coord.x+8,9,Coord.z-8)
		pillar(Coord.x+4,9,Coord.z-8)
		pillar(Coord.x,9,Coord.z-8)
		pillar(Coord.x-4,9,Coord.z-8)
		pillar(Coord.x-8,9,Coord.z-8)

		pillar(Coord.x+8,9,Coord.z+8)
		pillar(Coord.x+4,9,Coord.z+8)
		pillar(Coord.x,9,Coord.z+8, {-8,-4})
		pillar(Coord.x-4,9,Coord.z+8)
		pillar(Coord.x-8,9,Coord.z+8)

		pillar(Coord.x-8,9,Coord.z+8)
		pillar(Coord.x-8,9,Coord.z+4)
		pillar(Coord.x-8,9,Coord.z)
		pillar(Coord.x-8,9,Coord.z-4)
		pillar(Coord.x-8,9,Coord.z-8)

		pillar(Coord.x+8,9,Coord.z+8)
		pillar(Coord.x+8,9,Coord.z+4)
		pillar(Coord.x+8,9,Coord.z)
		pillar(Coord.x+8,9,Coord.z-4)
		pillar(Coord.x+8,9,Coord.z-8)
	end

	for BlockNumber = 0, 20 do
		pillar(-160,9,184+(BlockNumber*4))
	end
	for BlockNumber = 0, 20 do
		pillar(20,9,184+(BlockNumber*4))
	end

	for BlockNumber = 0, 45 do
		pillar(-160+(BlockNumber*4),9,268)
	end

	for BlockNumber = 0, 21 do
		pillar(-160+(BlockNumber*4),9,184)
	end

	for BlockNumber = 0,17 do
		pillar(-52+(BlockNumber*4),9,184)
	end

	pillar(-72,9,184,{-8,-4,0,4})
	pillar(-68,9,184,{-8,-4,0,4,8})
	pillar(-64,9,184,{-8,-4,0,4,8})
	pillar(-60,9,184,{-8,-4,0,4,8})
	pillar(-56,9,184,{-8,-4,0,4})

	floor(44,8,20,-160,184)

	pillar(-60,4,252,nil,true)
	pillar(-64,4,252,nil,true)
	pillar(-68,4,252,nil,true)

	pillar(-68,1,248,nil,true)
	pillar(-68,1,244,nil,true)

	pillar(-60,1,248,nil,true)
	pillar(-60,1,244,nil,true)

	pillar(-64,0,248,nil,true)
	pillar(-64,0,244,nil,true)
end

local function Block(Material)
	--Area
	local Length = 91 -- * 4, 364
	local Width = 79 -- * 4, 316

	--Constant
	local GroundLevel = -8
	local StartLength = -252
	local StartWidth = 52
	
	local function pillar(X,DeHeight,Z,Restrict, Gold)
		if Restrict == nil then
			Restrict = {}
		end

		if Gold == nil then
			Gold = false
		end

		local CusBlockHeight
		local blockedPill = false

		for Height = 0, DeHeight do
			CusBlockHeight = GroundLevel + (Height * 4)

			blockedPill = false
			for j,k in pairs(Restrict) do
				if k == CusBlockHeight then
					blockedPill = true
				end
			end

			if not blockedPill then
				if Gold then
					CreateBlock(X,CusBlockHeight,Z,"Firebrick")
				else
					CreateBlock(X,CusBlockHeight,Z,Material)
				end
			end
		end
	end
	
	for i = 1 , Length do
		for j = 1, Width do
			local ActualLength = StartLength + (i*4)
			local ActualWidth = StartWidth + (j*4)
			
			pillar(ActualLength, 5, ActualWidth)
		end
	end
end

-- Wood / Brick / Metal / Obsidian / Firebrick

Library.CreateButton(BAndS,"Build Towers","Build a Fortress in Wood",function()
	fortress("Wood")
end)
Library.CreateButton(BAndS,"Build Towers","Build a Fortress in Brick",function()
	fortress("Brick")
end)
Library.CreateButton(BAndS,"Build Towers","Build a Fortress in Metal",function()
	fortress("Metal")
end)
Library.CreateButton(BAndS,"Build Towers","Build a Fortress in Obsidian",function()
	fortress("Obsidian")
end)
Library.CreateButton(BAndS,"Build Towers","Build a Fortress in Firebrick",function()
	fortress("Firebrick")
end)

Library.CreateButton(BAndS,"Build Towers","Build a Block in Wood",function()
	Block("Wood")
end)
Library.CreateButton(BAndS,"Build Towers","Build a Block in Brick",function()
	Block("Brick")
end)
Library.CreateButton(BAndS,"Build Towers","Build a Block in Metal",function()
	Block("Metal")
end)
Library.CreateButton(BAndS,"Build Towers","Build a Block in Obsidian",function()
	Block("Obsidian")
end)
Library.CreateButton(BAndS,"Build Towers","Build a Block in Firebrick",function()
	Block("Firebrick")
end)


--Library.CreateNotification('Fling alert!','We detected that you got flung and neuturalised your velocity')wwa
