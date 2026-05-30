local verison = "V1.0.17"

local cloneref = cloneref or function(o) return o end

local RunService = cloneref(game:GetService("RunService"))
local httpService = cloneref(game:GetService("HttpService"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local TS = cloneref(game:GetService('TweenService'))
local PathFindingService = cloneref(game:GetService('PathfindingService'))
local TweenService = TS
local ReplicatedStorage = cloneref(game:GetService('ReplicatedStorage'))
Lighting = cloneref(game:GetService("Lighting"))
local Players = cloneref(game:GetService("Players"))
local LocalizationService = cloneref(game:GetService("LocalizationService"))
local PhysicsService = cloneref(game:GetService("PhysicsService"))
local LPCamera = game.Workspace.CurrentCamera
local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)


local CCcode = ""
local success, code = pcall(LocalizationService.GetCountryRegionForPlayerAsync, LocalizationService, Players.LocalPlayer)
if success and code then
	CCcode = code
else
	CCcode = "[REDACTED]"
end

local Library 
local suc, err = xpcall(function()
	Library = loadstring(game:HttpGet(('https://pastebin.com/raw/sCTgCNCd')))()
end,function()
	error("Can't get Library data!")
end)

if Library == nil then
	Library = loadstring(game:HttpGet(('https://pastebin.com/raw/sCTgCNCd')))()
end

Library.Settings(true)

local Mobile = false
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
	Mobile = true
elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
	Mobile = false
end

local EHDATA1 = ""
local EHDATA2 = ""
local EHDATA3 = ""

local players = cloneref(game:GetService('Players'))
local lplr = players.LocalPlayer
local LocalPlayer = lplr

local HB = RunService.Heartbeat
local RS = RunService.RenderStepped

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

local function ClearTable(arr)
	for eee in pairs(arr) do
		arr[eee] = nil
	end
end

--[[
local WorkspaceDescendantsAltArray = workspace:GetDescendants()

function Arrayremove(array, value): any?
    local index = table.find(array, value)
    if index then
        return table.remove(array, index)
    end
end


local function descendantAddedForWorkspaceDescendantsAltArray(instance)
    table.insert(WorkspaceDescendantsAltArray, instance)
end
 
local function descendantRemovingForWorkspaceDescendantsAltArray(instance)
    Arrayremove(WorkspaceDescendantsAltArray, instance)
end
 
workspace.DescendantAdded:Connect(descendantAddedForWorkspaceDescendantsAltArray)
workspace.DescendantRemoving:Connect(descendantRemovingForWorkspaceDescendantsAltArray)
]]

everyClipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
FireProxi = fireproximityprompt
FireTouch = firetouchinterest
httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
GetExecutorFunc = identifyexecutor
PlaceId, JobId = game.PlaceId, game.JobId

function toClipboard(txt)
	if everyClipboard then
		everyClipboard(tostring(txt))
		Library.CreateNotification("Clippy","Clipped to clipboard.")
	else
		Library.CreateNotification("Clippy","Your executor do not support allow Clipboard for roblox!")
	end
end

function Chat(Message)
	Message = tostring(Message)
	local suc, err = pcall(function()
		if game:GetService("ReplicatedStorage"):FindFirstChild('DefaultChatSystemChatEvents') then
			local args = {
				[1] = Message,
				[2] = "All"
			}

			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
		else
			local textchannel = game:GetService("TextChatService"):WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
			textchannel:SendAsync(Message)
		end
	end)
	if not suc then
		warn("Chat message has an error! [0x009]"..err)
	end
end

function GetExecutor()
	if GetExecutorFunc then
		return GetExecutorFunc()
	else
		return "[REDACTED]"
	end
end

function FireProximityPrompt(Prox)
	if FireProxi then
		xpcall(function()
			FireProxi(Prox)
			return true
		end, function()
			warn("an unexpected error has occured while trying to fire proximity!")
			return false
		end)
	else
		warn("Can't use fireproximityprompt on "..GetExecutor())
		return false
	end
end

function FireTouchedInterest(Base,ToTouch,Toggle)
	if FireTouch then
		xpcall(function()
			FireTouch(Base,ToTouch,Toggle)
			return true
		end, function()
			warn("an unexpected error has occured while trying to fire touchinterest!")
			return false
		end)
	else
		warn("Can't use firetouchinterest on "..GetExecutor())
		return false
	end
end

local canwritefiletestStr = "FALSE"
function writefileTest()
	if writefile then
		canwritefiletestStr = "TRUE"
		return true
	end
end

local GameID = game.PlaceId

local IsTPingRN

function Notification(Title,Body, Cooldown)
	Cooldown = tonumber(Cooldown) or 3
	Library.CreateNotification(Title,Body, Cooldown)
end

TeleportService = cloneref(game:GetService("TeleportService"))
HttpService = cloneref(game:GetService("HttpService"))

local hwid = "[REDACTED]"
xpcall(function()
	hwid = game:GetService("RbxAnalyticsService"):GetClientId()
end, function()
	error("An error has occured while trying to get HWID!")
end)

local function GETFILEDATA()
	local suc, err = pcall(function()
		if writefileTest() then

			pcall(function()
				if readfile('ECLIPSE HUB SCRIPT DATA.json') then
					local data = readfile('ECLIPSE HUB SCRIPT DATA.json')
					local datasplit = string.split(data,"???")
					if datasplit[1] and datasplit[2] and datasplit[3] then
						EHDATA1 = datasplit[1]
						EHDATA2 = datasplit[2]
						EHDATA3 = datasplit[3]
					end
					delfile('ECLIPSE HUB SCRIPT DATA.json')
					writefile('ICRAUS-Data.json',EHDATA1.."???"..EHDATA2.."???"..EHDATA3)
				end
			end)

			if readfile('ICRAUS-Data.json') then
				local data = readfile('ICRAUS-Data.json')
				local datasplit = string.split(data,"???")
				if datasplit[1] and datasplit[2] and datasplit[3] then
					EHDATA1 = datasplit[1]
					EHDATA2 = datasplit[2]
					EHDATA3 = datasplit[3]
				end
				writefile('ICRAUS-Data.json',EHDATA1.."???"..EHDATA2.."???"..EHDATA3)
			elseif readfile('ICRAUS-Data.json') == nil then
				writefile('ICRAUS-Data.json',"-???-???-")
			end
		else
			Library.CreateNotification('hey!','This Executor does not support writefile!')
		end
	end)
	return suc, err
end

local suc, err = pcall(function()
	local SUCFILE,ERRFILE = GETFILEDATA()
	if not SUCFILE then
		warn("an error has occured while getting eclipse (icarus) hub data [0x001] : "..ERRFILE.." | Debug : writefiletest : "..canwritefiletestStr)
		warn("trying alternate method...")
		writefile('ICRAUS-Data.json',"-???-???-")
		local SUCFILE2,ERRFILE2 = GETFILEDATA()
		if not SUCFILE2 then
			warn("an error has occured while getting eclipse (icarus) hub data [0x002] : "..ERRFILE2.." | Debug : writefiletest : "..canwritefiletestStr)
			warn("Failed... Please report this bug to the discord server!")
		else
			warn("Successfully resolved file issue! [2x001]")
		end
	end
end)

if not suc then
	warn("an error has occured while getting eclipse (icarus) hub data [0x000] : "..err.." | Debug : writefiletest : "..canwritefiletestStr)
end

--Real code below, misc code above...

Library.ChangeTitle("ICARUS "..verison)

Library.SetInformationText("1.0.17 Update :\nRemoved a few outdated scripts\nOpened source Icarus hub!\nadded more scripts for W@APP")

Players.LocalPlayer.OnTeleport:Connect(function(State)
	if queueteleport and not IsTPingRN then
		IsTPingRN = true
		queueteleport("loadstring(game:HttpGet(('https://raw.githubusercontent.com/Lookatit7626/Project-R/refs/heads/main/ICARUSHUB.lua')))()")
	end
end)

local scripts = Library.CreateScriptPage("Scripts","Universal Scripts")

Library.CreateScriptPageScript("RSpy","Remote Spy / RSPY","Remote Spy is the best tool to manipulate RemoteEvents in roblox games!",scripts,function()
	if Mobile then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Lookatit7626/Project-R/refs/heads/main/RSPY4MOBILE.lua"))()
		Library.CreateNotification("ICARUS","Executed RSPY for Mobile!")
	else
		loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
		Library.CreateNotification("ICARUS","Executed RSPY!")
	end
end)

Library.CreateScriptPageScript("Dex","Dex Explorer","Dex Explorer is a powerful tool that allows players to explore and manipulate the data within Roblox games.",scripts,function()
	if Mobile then
		getgenv().Key = "Bash"
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Lookatit7626/Project-R/main/MOBILEDEX"))()
		Library.CreateNotification("ICARUS","Executed Dex Explorer for Mobile!")
	else
		loadstring(game:HttpGet('https://raw.githubusercontent.com/infyiff/backup/main/dex.lua'))()
		Library.CreateNotification("ICARUS","Executed Dex Explorer!")
	end
end)

Library.CreateScriptPageScript("Antiafk","Anti afk","Anti afk allows you to stay in game without getting kicked by roblox for being afk..",scripts,function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/luca5432/Roblox-ANTI-AFK-SCRIPT/main/Script"))()
	Library.CreateNotification("ICARUS","Executed Anti afk!")
end)

Library.CreateScriptPageScript("InfYie","Infinite Yield","Infinite Yield is one of the best scripts to use! With over 100+ commands to execute from a command bar.",scripts,function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	Library.CreateNotification("ICARUS","Executed Infinite Yield!")
end)

Library.CreateScriptPageScript("Fly","Mobile Fly","Mobile Fly allows you to fly in games as a mobile user!",scripts,function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Lookatit7626/Project-R/main/Mobile%20Fly%20Script%20R6%20Fixed"))()
	Library.CreateNotification("ICARUS","Executed Mobile Fly!")
end)

Library.CreateScriptPageScript("Fling","Fling GUI", "This Fling GUI is made by us! used to fling people off the map!",scripts,function()
	loadstring(game:HttpGet("https://pastebin.com/raw/WnJwFXgR"))()
	Library.CreateNotification("ICARUS","Executed Fling GUI!")
end)

Library.CreateScriptPageScript("Aimbot","Aimbot GUI", "This aimbot is made by us! with features like Team check, team whitelist, etc...",scripts,function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Lookatit7626/Project-R/refs/heads/main/Aimbot.lua"))()
	Library.CreateNotification("ICARUS","Executed Aimbot")
end)

Library.CreateScriptPageScript("NPC Aimbot","NPC Aimbot GUI", "This aimbot is made by us! with features like Wallcheck, Autoshoot etc...",scripts,function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Lookatit7626/Project-R/refs/heads/main/NPC_Aimbot.lua"))()
	Library.CreateNotification("ICARUS","Executed NPC Aimbot")
end)

Library.CreateScriptPageScript("MilitaryCounter","Military Counter", "This Counter is made by us! Used for military Roleplay games, instead of getting carpal tunnel syndrome from tpying, you could just use this!",scripts,function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Lookatit7626/LAT/refs/heads/main/Counter.lua"))()
	Library.CreateNotification("ICARUS","Executed Military Counter")
end)

Library.CreateScriptPageScript("BAB","Build a Boat Autofarm", "This is a script made by one of our developer.",scripts,function()
	loadstring(game:HttpGet("https://pastebin.com/raw/h9AnD9d1"))()
	Library.CreateNotification("ICARUS","Executed Build a boat GUI!")
end)

Library.CreateScriptPageScript("Project Auto","Project Auto", "Project auto is a jailbreak autofarm that is very effective!",scripts,function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxsta72/ProjectAuto/main/AutoRobV4Release"))()
	Library.CreateNotification("ICARUS","Executed Project Auto GUI!")
end)

Library.CreateScriptPageScript("Chaos Hub","Chaos Hub", "Chaos Hub supports over 30+ games, and its very powerful!",scripts,function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/xChaoticVoid/Chaos-Hub-v1/main/ChaosHub.lua"))()
	Library.CreateNotification("ICARUS","Executed Chao Hub GUI!")
end)

Library.CreateScriptPageScript("LuaWare","LuaWare", "LuaWare suports over 10+ games, including lumber tycoon!",scripts,function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/frencaliber/LuaWareLoader.lw/main/luawareloader.wtf",true))()
	Library.CreateNotification("ICARUS","Executed LuaWare GUI!")
end)

Library.CreateScriptPageScript("KronHub","Kron Hub", "Kron Hub support games like lumber tycoon, Bee Swarm simulator and Natural Disasters!",scripts,function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/DevKron/Kron_Hub/refs/heads/main/version_1.0'))("")
	Library.CreateNotification("ICARUS","Executed Kron Hub GUI!")
end)

Library.CreateScriptPageScript("Keyboard","Mobile Keyboard", "Evey mobile user needs it because we don't have keyboard :(",scripts,function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
	Library.CreateNotification("ICARUS","Executed Keyboard GUI!")
end)

Library.CreateScriptPageScript("MobileShiftlock","Mobile Shift Lock","Most roblox games do not have shiftlock, so we decided to add it ourselves!",scripts,function()
	loadstring(game:HttpGet("https://pastebin.com/raw/WQ9NPeDS"))()
end)

Library.CreateScriptPageScript("VapeV4","Vape V4 Bedwars","One of the most powerful Bedwars script on roblox!",scripts,function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
end)

Library.CreateScriptPageScript("Anti lag","Anti Lag", "To improve performance, You should use Anti Lag to remove lags in-game and remove textures and decals!",scripts,function()
	local function ANTILAG()
		pcall(function()
			local Terrain = workspace:FindFirstChildOfClass('Terrain')
			Terrain.WaterWaveSize = 0
			Terrain.WaterWaveSpeed = 0
			Terrain.WaterReflectance = 0
			Terrain.WaterTransparency = 0
			Lighting.GlobalShadows = false
			Lighting.FogEnd = 9e9
			settings().Rendering.QualityLevel = 1
			for i,v in pairs(game:GetDescendants()) do
				if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
					v.Material = "Plastic"
					v.Reflectance = 0
				elseif v:IsA("Decal") then
					v.Transparency = 1
				elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
					v.Lifetime = NumberRange.new(0)
				elseif v:IsA("Explosion") then
					v.BlastPressure = 1
					v.BlastRadius = 1
				end
			end
			for i,v in pairs(Lighting:GetDescendants()) do
				if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
					v.Enabled = false
				end
			end
			workspace.DescendantAdded:Connect(function(child)
				task.spawn(function()
					if child:IsA('ForceField') then
						RunService.Heartbeat:Wait()
						child:Destroy()
					elseif child:IsA('Sparkles') then
						RunService.Heartbeat:Wait()
						child:Destroy()
					elseif child:IsA('Smoke') or child:IsA('Fire') then
						RunService.Heartbeat:Wait()
						child:Destroy()
					end
				end)
			end)
		end)
	end
	ANTILAG()
	Library.CreateNotification("ICARUS","Executed Anti lag!")
end)

local PLRSCR = Library.CreateCustomPage("PLRSCR","Player Scripts")

local EnabledAF = false
local lastpos = nil
local AntiFlingLibraryButton
AntiFlingLibraryButton = Library.CreateCustomPageButton("AntiFling","Antifling : Disabled",PLRSCR,function()
	EnabledAF = not EnabledAF
	if EnabledAF then
		Library.ChangeCustomPageButtonTitle(AntiFlingLibraryButton,"Antifling : Enabled")
	else
		Library.ChangeCustomPageButtonTitle(AntiFlingLibraryButton,"Antifling : Disabled")
	end
	while EnabledAF do
		local humanoidroot = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
		local primary = humanoidroot
		if primary.AssemblyLinearVelocity.Magnitude > 250 or primary.AssemblyAngularVelocity.Magnitude > 250  then
			primary.AssemblyLinearVelocity = Vector3.new(0,0,0)
			primary.AssemblyAngularVelocity = Vector3.new(0,0,0)
			primary.CFrame = lastpos 
			Library.CreateNotification('Fling alert!','We detected that you got flung and neuturalised your velocity')
		end
		lastpos = primary.CFrame
		wait(0.01)
	end
end)

local Enabled = false
local WFcool = false
local RSWFConnection
local walkflingLibraryButton
walkflingLibraryButton = Library.CreateCustomPageButton("Walkfling","Walk Fling : Disabled",PLRSCR,function()
	if not WFcool then
		WFcool = true
		Enabled = not Enabled
		if Enabled then
			Library.ChangeCustomPageButtonTitle(walkflingLibraryButton,"Walk Fling : Enabled")
		else
			Library.ChangeCustomPageButtonTitle(walkflingLibraryButton,"Walk Fling : Disabled")
		end
		coroutine.wrap(function()
			if Enabled then
				local plr = game:GetService('Players').LocalPlayer
				Library.CreateNotification("Walkfling","WalkFling connected!")
				local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
				local dir = 0.1
				while Enabled do
					while not plr.Character do
						wait(0.001)
					end
					while not plr.Character:FindFirstChild('Humanoid') do
						wait(0.001)
					end
					if (not rootPart or rootPart == nil or not rootPart.Parent or rootPart.Parent == nil or plr.Character:WaitForChild('Humanoid').Health == 0) then
						Library.CreateNotification("Walkfling","WalkFling Player died, trying to reconnect...")
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
						HB:Wait()
						local velocity = rootPart.Velocity
						rootPart.Velocity = ((velocity * 10000) + Vector3.new(0, 10000, 0))
						RS:Wait()
						rootPart.Velocity = velocity
						RS:Wait()
						rootPart.Velocity = velocity + Vector3.new(0, dir, 0)
						dir *= -1
					end)
				end
				Library.CreateNotification("Walkfling","WalkFling Disconnect")
			end
		end)()
		wait(0.1)
		WFcool = false
	end
end)

Library.CreateCustomPageTextButton("Teleport", "Teleport to player", PLRSCR, function(Playername)
	local foundName = nil
	local Players = game:GetService('Players'):GetPlayers()
	for i = 1, #Players do
		local PossiblePlayer = Players[i]
		if string.find(string.lower(PossiblePlayer.Name), string.lower(Playername)) then
			foundName = PossiblePlayer.Name
		end
	end

	if foundName then
		xpcall(function()
			game:GetService('Players').LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = game:GetService("Players"):FindFirstChild(foundName).Character:FindFirstChild("HumanoidRootPart").CFrame
		end,function()
			pcall(function()
				game:GetService('Players').LocalPlayer.Character:PivotTo(game:GetService("Players"):FindFirstChild(foundName).Character:FindFirstChild("HumanoidRootPart").CFrame)
			end)
		end)	
	else
		Library.CreateNotification("Alert!", "Can't find the player you want to teleport!")
	end
end)

while not game:GetService('Players').LocalPlayer.Character do
	wait(0.1)
	warn("Finding Player...")
end

local PreviousSpeed = 0
local PlayerDefaultSpeed = game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid').WalkSpeed
Library.CreateCustomPageTextButton("Speed",'Speed',PLRSCR,function(Speed)
	if Speed == PreviousSpeed then
		Speed = PlayerDefaultSpeed
	end
	PreviousSpeed = Speed
	game:GetService('Players').LocalPlayer.Character.Humanoid.WalkSpeed = Speed
end, 30)

Library.CreateCustomPageTextButton("Jump",'Jump',PLRSCR,function(JP)
	game:GetService('Players').LocalPlayer.Character.Humanoid.JumpPower = JP
end, 150)

local INFJUMP
local IJenabled = false
INFJUMP = Library.CreateCustomPageButton("InfJump", "Inf Jump : Disabled", PLRSCR,function()
	IJenabled = not IJenabled
	if IJenabled then
		Library.ChangeCustomPageButtonTitle(INFJUMP,"Inf Jump : Enabled")
		while IJenabled do
			local Test0 = math.random(1,99999999)
			local AA0 = Test0
			local Set = nil
			if not Set then
				Set = game:GetService('UserInputService').JumpRequest:Connect(function()
					game:GetService('Players').LocalPlayer.Character.Humanoid:ChangeState('Jumping')
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
			wait(0.01)
		end
	else
		Library.ChangeCustomPageButtonTitle(INFJUMP,"Inf Jump : Disabled")
	end
end)

function isNumber(str)
	if tonumber(str) ~= nil or str == 'inf' then
		return true
	end
end

local TPWalk
local TWenabled = false
local PreviousSpeed = 0
TPWalk = Library.CreateCustomPageTextButton("TPWalk", "TP Walk : ", PLRSCR,function(speed)
	if tonumber(speed) then
		if tonumber(speed) == PreviousSpeed and TWenabled then
			TWenabled = false
		else
			TWenabled = true
		end
	end
	PreviousSpeed = tonumber(speed)
	if TWenabled then
		Library.CreateNotification("Hey","TP Walk Enabled")
		local hum
		local delta
		local chr
		while TWenabled do
			while not game:GetService('Players').LocalPlayer.Character do
				RunService.Heartbeat:Wait()
			end
			delta = RunService.Heartbeat:Wait()
			pcall(function()
				hum = game:GetService('Players').LocalPlayer.Character.Humanoid
				chr = game:GetService('Players').LocalPlayer.Character
				if hum.MoveDirection.Magnitude > 0 then
					if speed and isNumber(speed) then
						chr:TranslateBy(hum.MoveDirection * tonumber(speed) * delta * 10)
					else
						chr:TranslateBy(hum.MoveDirection * delta * 10)
					end
				end
			end)
		end
	else
		Library.CreateNotification("Hey","TP Walk Disabled")
	end
end,10)

local tpwalking = false
local speeds = 1
local heartbeat = game:GetService("RunService").Heartbeat
local function updatespeed(char, hum)
	tpwalking = false
	heartbeat:Wait()
	task.wait(.1)
	heartbeat:Wait() -- Make sure old threads are stopped, noot sure if its works... 

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
local ENABLEDIF= false
local oldgrav = workspace.Gravity
local InvisibleFlingButton 
InvisibleFlingButton = Library.CreateCustomPageButton("InvisibleFling","Invisible Fling [Trial Phase]",PLRSCR,function()
	if not WFcool then
		WFcool = true

		ENABLEDIF = not ENABLEDIF
		coroutine.wrap(function()
			local bg
			local bv
			local invisflingStepped
			if ENABLEDIF then
				local rs = game:GetService("RunService")
				local plr = game:GetService('Players').LocalPlayer
				local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
				local dir = 0.1
				local Humanoid = plr.Character:WaitForChild('Humanoid').Health

				while ENABLEDIF do

					while not plr.Character do
						wait(0.01)
					end

					while not plr.Character:FindFirstChild('Humanoid') do
						wait(0.01)
					end

					plr = game:GetService('Players').LocalPlayer

					if (not rootPart or rootPart == nil or not rootPart.Parent or rootPart.Parent == nil or plr.Character:WaitForChild('Humanoid').Health == 0) then
						Library.CreateNotification("Invisible Fling","Player died, trying to reconnect...")
						Library.ChangeCustomPageButtonTitle(InvisibleFlingButton,"Invisible Fling [Reconnecting...]")

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
						Notification("Invisible Fling","Starting up Invisible Fling...")
						wait(3)

						Library.CreateNotification("Invisible Fling","Invisible Fling Connecting...")
						Library.ChangeCustomPageButtonTitle(InvisibleFlingButton,"Invisible Fling [Connecting...]")

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
									while ENABLEDIF and not Died do
										local delta = hb:Wait()
										if hum.MoveDirection.Magnitude > 0 then
											chr:TranslateBy(hum.MoveDirection * 3 * delta * 10)
										end
									end
								end)()


								while not Died and ENABLEDIF do
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
						plr.Character=ch
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
						Library.ChangeCustomPageButtonTitle(InvisibleFlingButton,"Invisible Fling [Connected!]")

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
				Library.ChangeCustomPageButtonTitle(InvisibleFlingButton,"Invisible Fling [Disconnected.]")
			else 
				Library.CreateNotification("Invisible Fling","Invisible Fling Attempting to disconnect...")
				Library.ChangeCustomPageButtonTitle(InvisibleFlingButton,"Invisible Fling [Disconnecting...]")

				coroutine.wrap(function()
					pcall(function()
						game:GetService('Players').LocalPlayer.Character.Humanoid.Health = 0
					end)
				end)()

				local plr = game:GetService('Players').LocalPlayer
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

local HRPAnchoredButton
local HRPAnchoredBool = false
HRPAnchoredButton = Library.CreateCustomPageButton("HRPAnchoredButton","HumanoidRootPart anchored : Disabled",PLRSCR,function()
	HRPAnchoredBool = not game:GetService('Players').LocalPlayer.Character:WaitForChild("HumanoidRootPart").Anchored
	if HRPAnchoredBool then
		Library.ChangeCustomPageButtonTitle(HRPAnchoredButton,"HumanoidRootPart anchored : Enabled")
	else
		Library.ChangeCustomPageButtonTitle(HRPAnchoredButton,"HumanoidRootPart anchored : Disabled")
	end
	game:GetService('Players').LocalPlayer.Character:WaitForChild("HumanoidRootPart").Anchored = HRPAnchoredBool
end)

game:GetService('Players').LocalPlayer.CharacterAdded:Connect(function()
	game:GetService('Players').LocalPlayer.Character:WaitForChild("HumanoidRootPart").Anchored = HRPAnchoredBool
end)

local oriSpinSPeed = 0
local SpinEnabled = false
Library.CreateCustomPageTextButton("Spin",'Spin around',PLRSCR,function(SpinSpeed)
	SpinSpeed = tonumber(SpinSpeed) or 20
	if oriSpinSPeed ~= SpinSpeed or not SpinEnabled then
		SpinEnabled = true
	else
		SpinEnabled = false
	end
	oriSpinSPeed = SpinSpeed
	for i,v in pairs(getRoot(lplr.Character):GetChildren()) do
		if v.Name == "Spinning" then
			v:Destroy()
		end
	end

	while SpinEnabled do
		repeat task.wait(0.01) until not lplr.Character:FindFirstChild("SpinnyThing")
		if SpinEnabled then
			local Spin = Instance.new("BodyAngularVelocity")
			Spin.Name = "SpinnyThing"
			Spin.Parent = getRoot(lplr.Character)
			Spin.MaxTorque = Vector3.new(0, math.huge, 0)
			Spin.AngularVelocity = Vector3.new(0,SpinSpeed,0)
			repeat task.wait(0.01) until not SpinEnabled or lplr.Character.Humanoid.Health == 0
			if Spin then
				Spin:Destroy()
			end
		end
	end
end, 20)

Library.CreateCustomPageButton("resetGravity", "Reset Gravity to 196.2 ( Default )",PLRSCR, function()
	game.Workspace.Gravity = 196.2
end)

Library.CreateCustomPageTextButton("Gravity",'Gravity',PLRSCR,function(Speed)
	game.Workspace.Gravity = Speed
end, 100)

local ESPenabled = false
COREGUI = cloneref(game:GetService("CoreGui"))
function ESP(plr)
	task.spawn(function()
		if not ESPenabled then
			return
		end
		for i,v in pairs(COREGUI:GetChildren()) do
			if v.Name == plr.Name..'_ESP' then
				v:Destroy()
			end
		end

		wait()

		while plr.Character == nil do
			wait(0.01)
		end

		if plr.Character and plr.Name ~= game:GetService('Players').LocalPlayer.Name and not COREGUI:FindFirstChild(plr.Name..'_ESP') then
			local ESPholder = Instance.new("Folder")
			ESPholder.Name = plr.Name..'_ESP'
			ESPholder.Parent = COREGUI
			repeat wait(1) until plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
			for b,n in pairs (plr.Character:GetChildren()) do
				if (n:IsA("BasePart")) then
					local a = Instance.new("BoxHandleAdornment")
					a.Name = plr.Name.."_"..n.Name
					a.Parent = ESPholder
					a.Adornee = n
					a.AlwaysOnTop = true
					a.ZIndex = 10
					a.Size = n.Size
					a.Transparency = 0.4
					a.Color = plr.TeamColor
					n:GetPropertyChangedSignal('Size'):Connect(function()
						a.Size = n.Size
					end)
					n.Destroying:Connect(function()
						a:Destroy()
					end)
				end
			end
			local BillboardGui
			if plr.Character and plr.Character:FindFirstChild('Head') then
				BillboardGui = Instance.new("BillboardGui")
				local TextLabel = Instance.new("TextLabel")
				BillboardGui.Adornee = plr.Character.Head
				BillboardGui.Name = plr.Name.."_Text"
				BillboardGui.Parent = ESPholder
				BillboardGui.Size = UDim2.new(0, 100, 0, 150)
				BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
				BillboardGui.AlwaysOnTop = true
				TextLabel.Parent = BillboardGui
				TextLabel.BackgroundTransparency = 1
				TextLabel.Position = UDim2.new(0, 0, 0, -50)
				TextLabel.Size = UDim2.new(0, 100, 0, 100)
				TextLabel.Font = Enum.Font.SourceSansSemibold
				TextLabel.TextSize = 15
				TextLabel.TextColor3 = Color3.new(1, 1, 1)
				TextLabel.TextStrokeTransparency = 0
				TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
				TextLabel.Text = 'nil'
				TextLabel.ZIndex = 10
				local espLoopFunc
				local teamChange
				local addedFunc

				--[[
				
				teamChange:Disconnect()
								addedFunc:Disconnect()
								espLoopFunc:Disconnect()
								pcall(function()
									ESPholder:Destroy()
								end)
				
				]]

				local function KILLESP()
					pcall(function()
						teamChange:Disconnect()
						addedFunc:Disconnect()
						espLoopFunc:Disconnect()
					end)
					pcall(function()
						ESPholder:Destroy()
					end)
					pcall(function()
						BillboardGui:Destroy()
					end)
				end

				addedFunc = plr.CharacterAdded:Connect(function()
					local suc, err = pcall(function()
						if ESPenabled then
							KILLESP()
							repeat wait(0.1) until getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
						else
							KILLESP()
						end
					end)

					if not suc then
						if ESPenabled then
							KILLESP()
						end
					end
				end)

				local TeamSuc, err = pcall(function()
					teamChange = plr:GetPropertyChangedSignal("TeamColor"):Connect(function()
						if ESPenabled then
							KILLESP()
							repeat wait(0.1) until getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
						else
							KILLESP()
						end
					end)
				end)

				if not TeamSuc then
					if ESPenabled then
						KILLESP()
					end
				end

				local function espLoop()
					local espLoopsuc, err = pcall(function()
						if COREGUI:FindFirstChild(plr.Name..'_ESP') then
							if plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid") and game:GetService('Players').LocalPlayer.Character and getRoot(game:GetService('Players').LocalPlayer.Character) and game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
								local pos = math.floor((getRoot(game:GetService('Players').LocalPlayer.Character).Position - getRoot(plr.Character).Position).magnitude)
								if game:GetService('Players').LocalPlayer:IsFriendsWith(plr.UserId) then
									TextLabel.Text = '[ FRIEND ] Name: '..plr.Name..' | Health: '..round(plr.Character:FindFirstChildOfClass('Humanoid').Health, 1)..' | Studs: '..pos
								else
									TextLabel.Text = 'Name: '..plr.Name..' | Health: '..round(plr.Character:FindFirstChildOfClass('Humanoid').Health, 1)..' | Studs: '..pos
								end
								if getRoot(plr.Character).Position == Vector3.new(0,0,0) then
									KILLESP()
								end
							else
								if not plr.Character then
									KILLESP()
								end
							end

							if not game:GetService('Players'):FindFirstChild(plr.Name) then
								KILLESP()
							end

							local pcallsuc, _ = pcall(function()
								getRoot(plr.Character)
								local _ = plr.Character.Humanoid
								_ = plr.Character.Humanoid.Health
								if plr.Character.Humanoid.Health <= 0 then
									KILLESP()
								end
							end)

							if not pcallsuc then
								KILLESP()
							end

							if BillboardGui.Adornee ~= plr.Character.Head then
								KILLESP()
							end
						else
							if not game:GetService('Players'):FindFirstChild(plr.Name) then
								KILLESP()
							end
							if game:GetService('Players'):FindFirstChild(plr.Name) and ESPenabled then
								KILLESP()
							end
						end
					end)
					if not espLoopsuc then
						if ESPenabled then
							KILLESP()
						end
					end

					if TextLabel.Text == 'nil' then
						if ESPenabled then
							KILLESP()
						end
					end
				end
				espLoopFunc = RunService.RenderStepped:Connect(espLoop)
			end
		end
	end)
end


local PLAYERRBXESP
Library.CreateCustomPageButton("ESP","ESP (Name and Health)",PLRSCR,function()
	ESPenabled = not ESPenabled
	if ESPenabled then
		Library.CreateNotification("Hey!","Player ESP is on!")
	else
		Library.CreateNotification("Hey!","Player ESP is off!")
	end

	if ESPenabled then
		for i,v in pairs(game:GetService('Players'):GetPlayers()) do
			if v.Name ~= game:GetService('Players').LocalPlayer.Name then
				v.CharacterAdded:Connect(function()
					ESP(v)
				end)
			end
		end

		coroutine.wrap(function()
			PLAYERRBXESP = game:GetService('Players').PlayerAdded:Connect(function(play)
				play.CharacterAdded:Connect(function()
					ESP(play)
				end)
			end)
		end)()

		while ESPenabled do

			for i,v in pairs(game:GetService('Players'):GetPlayers()) do
				if not COREGUI:FindFirstChild(v.Name..'_ESP') then
					ESP(v)	
				end
				if COREGUI:FindFirstChild(v.Name..'_ESP') then
					if not COREGUI:FindFirstChild(v.Name..'_ESP'):FindFirstChildOfClass('BillboardGui') or not COREGUI:FindFirstChild(v.Name..'_ESP'):FindFirstChildOfClass('BoxHandleAdornment') then
						COREGUI:FindFirstChild(v.Name..'_ESP'):Destroy()
						ESP(v)
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
end)

local PreSize = 0
local HitboxEnabled = false
local didit = false

local PreSizeA = 0
local HitboxEnabledA = false
local diditA = false

local PreSizeE = 0
local HitboxEnabledE = false
local diditE = false

local PreSizeN = 0
local HitboxEnabledN = false
local diditN = false




coroutine.wrap(function()
	while true do
		wait(1)
		if HitboxEnabled then
			didit = true
			local players = game:GetService('Players'):GetPlayers()
			for i,v in pairs(players) do
				coroutine.wrap(function()
					pcall(function()
						while not v.Character do
							wait(0.1)
						end
						while not v.Character:FindFirstChild('HumanoidRootPart') do
							wait(0.1)
						end
						if v ~= game:GetService('Players').LocalPlayer and v.Character:FindFirstChild('HumanoidRootPart') then
							local sizeArg = tonumber(PreSize)
							local Size = Vector3.new(sizeArg,sizeArg,sizeArg)
							local Root = v.Character:FindFirstChild('HumanoidRootPart')
							if Root:IsA("BasePart") then
								if Root.Size ~= Size and PreSize ~= 0 then
									Root.Size = Size
									Root.Transparency = 0.4
								end
							end
						end
					end)
				end)()
			end
		else
			if didit then
				didit = false
				local players = game:GetService('Players'):GetPlayers()
				for i,v in pairs(players) do
					coroutine.wrap(function()
						pcall(function()
							while not v.Character do
								wait(0.1)
							end
							while not v.Character:FindFirstChild('HumanoidRootPart') do
								wait(0.1)
							end
							if v ~= game:GetService('Players').LocalPlayer and v.Character:FindFirstChild('HumanoidRootPart') then
								local sizeArg = tonumber(PreSize)
								local Size = Vector3.new(sizeArg,sizeArg,sizeArg)
								local Root = v.Character:FindFirstChild('HumanoidRootPart')
								if Root:IsA("BasePart") and not HitboxEnabled and not HitboxEnabledE then
									if Root.Size ~= Vector3.new(2,1,1) then
										Root.Size = Vector3.new(2,1,1)
										Root.Transparency = 0.4
									end
								end
							end
						end)
					end)()
				end
			end
		end
	end
end)()

Library.CreateCustomPageTextButton("Hitbox",'Hitbox Expander',PLRSCR,function(size)
	if HitboxEnabledE then
		return Notification("Hey!","Enemy Hitbox is on, please disable it first!")
	end
	size = tonumber(size) or 0
	if PreSize == size or size == 0 then
		HitboxEnabled = false
		size = 0
		Notification('Hey!',"Hitbox is disabled!")
	else
		HitboxEnabled = true
		Notification('Hey!',"Hitbox is enabled!")
	end
	PreSize = size
end, 30)

coroutine.wrap(function()
	while true do
		wait(1)
		if HitboxEnabledE then
			diditE = true
			local players = game:GetService('Players'):GetPlayers()
			for i,v in pairs(players) do
				coroutine.wrap(function()
					while not v.Character do
						wait(0.1)
					end
					while not v.Character:FindFirstChild('HumanoidRootPart') do
						wait(0.1)
					end
					if v ~= game:GetService('Players').LocalPlayer and v.Character:FindFirstChild('HumanoidRootPart') and game:GetService('Players').LocalPlayer.Team ~= v.Team then
						local sizeArg = tonumber(PreSizeE)
						local Size = Vector3.new(sizeArg,sizeArg,sizeArg)
						local Root = v.Character:FindFirstChild('HumanoidRootPart')
						if Root:IsA("BasePart") then
							if Root.Size ~= Size and PreSizeE ~= 0 then
								Root.Size = Size
								Root.Transparency = 0.4
							end
						end
					end
				end)()
			end
		else
			if diditE then
				diditE = false
				local players = game:GetService('Players'):GetPlayers()
				for i,v in pairs(players) do
					coroutine.wrap(function()
						while not v.Character do
							wait(0.1)
						end
						while not v.Character:FindFirstChild('HumanoidRootPart') do
							wait(0.1)
						end
						if v ~= game:GetService('Players').LocalPlayer and v.Character:FindFirstChild('HumanoidRootPart') then
							local sizeArg = tonumber(PreSizeE)
							local Size = Vector3.new(sizeArg,sizeArg,sizeArg)
							local Root = v.Character:FindFirstChild('HumanoidRootPart')
							if Root:IsA("BasePart") and not HitboxEnabled and not HitboxEnabledE  then
								if Root.Size ~= Vector3.new(2,1,1) then
									Root.Size = Vector3.new(2,1,1)
									Root.Transparency = 0.9
								end
							end
						end
					end)()
				end
			end
		end
	end
end)()

Library.CreateCustomPageTextButton("Enemy Hitbox",'Enemy Hitbox Expander',PLRSCR,function(size)
	if HitboxEnabled then
		return Library.CreateNotification("Hey!","Regular Hitbox is on, please disable it first!")
	end
	size = tonumber(size) or 0
	if PreSizeE == size or size == 0 then
		HitboxEnabledE = false
		size = 0
		Library.CreateNotification('Hey!',"Enemy hitbox is disabled!")
	else
		HitboxEnabledE = true
		Library.CreateNotification('Hey!',"Enemy hitbox is enabled!")
	end
	PreSizeE = size
end,30)

local RedactNamesButton
local RedactNamesBool = false
local RedactNamesRBXSig
RedactNamesButton = Library.CreateCustomPageButton("RedactNamesButton", "Redact player names : disabled",PLRSCR, function()
	RedactNamesBool = not RedactNamesBool
	if RedactNamesBool then

		Library.ChangeCustomPageButtonTitle(RedactNamesButton,"Redact player names : enabled")

		local function ChangeName(playerIns)
			coroutine.wrap(function()

				local function REDACT()
					if playerIns ~= lplr then
						local playerInstanceName = "[ REDACTED ] - "..math.round((playerIns.userId * string.len(playerIns.Name) * string.len(playerIns.DisplayName) - playerIns.userId) / 100)
						local OrigName = playerIns.Name
						local OrigDName = playerIns.DisplayName
						playerIns.Name = playerInstanceName
						playerIns.DisplayName = playerInstanceName
						playerIns.Character.Name = playerInstanceName
						playerIns.Character.Humanoid.DisplayName = playerInstanceName
						repeat task.wait(0.01) until RedactNamesBool == false

						playerIns.Name = OrigName
						playerIns.DisplayName = OrigDName
						playerIns.Character.Name = OrigDName
						playerIns.Character.Humanoid.DisplayName = OrigDName
					end
				end

				local suc, err = false, nil

				repeat 
					suc, err = pcall(function()
						REDACT()
					end);
					task.wait(1);
				until suc == true

				--end)
			end)()
		end

		for _, playerInstance in pairs(game:GetService("Players"):GetPlayers()) do
			ChangeName(playerInstance)
		end

		RedactNamesRBXSig = game:GetService("Players").PlayerAdded:Connect(ChangeName)

	else
		Library.ChangeCustomPageButtonTitle(RedactNamesButton,"Redact player names : disabled")
		if RedactNamesRBXSig then
			RedactNamesRBXSig:Disconnect()
		end
	end 
end)


local TROLLINGSCR = Library.CreateCustomPage("TROLLINGSCR","Troll Scripts")

local EPICAnimation
local EPICAnimationBool = false
EPICAnimation = Library.CreateCustomPageButton("TPUA1", "Jork off : disabled",TROLLINGSCR, function()
	EPICAnimationBool = not EPICAnimationBool
	if EPICAnimationBool then
		Library.CreateNotification('Alert!',"Press J to jork off, use keyboard if needed.")
		Library.ChangeCustomPageButtonTitle(EPICAnimation,"Jork off : enabled")
	else
		Library.ChangeCustomPageButtonTitle(EPICAnimation,"Jork off : disabled")
	end 
end)

local humanoid = lplr.Character.Humanoid
local track

local ToDo = false
UserInputService.InputBegan:Connect(function(InputObj, Chatted)
	if Chatted then
		return
	end
	if InputObj.KeyCode == Enum.KeyCode.J then
		ToDo = true
	end
end)
UserInputService.InputEnded:Connect(function(InputObj, Chatted)
	if InputObj.KeyCode == Enum.KeyCode.J then
		ToDo = false
	end
end)

coroutine.wrap(function()
	while true do
		task.wait()
		if (not ToDo) or (not EPICAnimationBool) then continue end

		local isR15 = lplr.Character:FindFirstChildOfClass('Humanoid').RigType == Enum.HumanoidRigType.R15
		if not track or humanoid == nil or humanoid ~= lplr.Character.Humanoid then
			humanoid = lplr.Character.Humanoid
			local anim = Instance.new("Animation")
			anim.AnimationId = not isR15 and "rbxassetid://72042024" or "rbxassetid://698251653"
			track = humanoid:LoadAnimation(anim)
			track.Priority = Enum.AnimationPriority.Action4
		end
		track:Play()
		track:AdjustSpeed(isR15 and 0.7 or 0.65)
		track.TimePosition = 0.6
		task.wait(0.025)
		while track and track.TimePosition < (not isR15 and 0.65 or 0.7) do task.wait(0.025) end
		if track then
			track:Stop()
			track = nil
		end
	end
end)()

local TrollSCRUniVerSet1
local NetworkchangePerimission = false
TrollSCRUniVerSet1 = Library.CreateCustomPageButton("TPUA1", "Allow Network change : disabled",TROLLINGSCR, function()
	print("On")
	NetworkchangePerimission = true
	if NetworkchangePerimission then
		Library.CreateNotification('Alert!',"Once the network change is on, you can't turn it off!")
		Library.ChangeCustomPageButtonTitle(TrollSCRUniVerSet1,"Allow Network change : enabled")

		coroutine.resume(Network["PartOwnership"]["Enable"])
	end 
end)

local TPUASettings2
local AllowTpAllPartsRegardlessofHumanoid = false
TPUASettings2 = Library.CreateCustomPageButton("TPUA2", "Allow parts with humanoid names : disabled",TROLLINGSCR, function()
	AllowTpAllPartsRegardlessofHumanoid = not AllowTpAllPartsRegardlessofHumanoid
	if AllowTpAllPartsRegardlessofHumanoid then
		Library.ChangeCustomPageButtonTitle(TPUASettings2,"Allow parts with humanoid names : enabled")
	else
		Library.ChangeCustomPageButtonTitle(TPUASettings2,"Allow parts with humanoid names : disabled")
	end 
end)

local TPUASettings3
local AllowUseMaxForce = true
TPUASettings3 = Library.CreateCustomPageButton("TPUA3", "Allow use of max force : enabled",TROLLINGSCR, function()
	AllowUseMaxForce = not AllowUseMaxForce
	if AllowUseMaxForce then
		Library.ChangeCustomPageButtonTitle(TPUASettings3,"Allow use of max force : enabled")
		MaxForceUsed = math.huge
		MaxVeloUsed = math.huge
	else
		Library.ChangeCustomPageButtonTitle(TPUASettings3,"Allow use of max force : disabled")
		MaxForceUsed = 500000
		MaxVeloUsed = 100
	end 
end)

local TPUASettings4
local AllowAnchoredRegradless = false
TPUASettings4 = Library.CreateCustomPageButton("TPUA4", "Tag anchored parts : disabled",TROLLINGSCR, function()
	AllowAnchoredRegradless = not AllowAnchoredRegradless
	if AllowAnchoredRegradless then
		Library.ChangeCustomPageButtonTitle(TPUASettings4,"Tag anchored parts : enabled")
	else
		Library.ChangeCustomPageButtonTitle(TPUASettings4,"Tag anchored parts : disabled")
	end 
end)

local TPUASettings5
local AllowPartToNotCollide = false
TPUASettings5 = Library.CreateCustomPageButton("TPUA5", "No collide parts : disabled",TROLLINGSCR, function()
	AllowPartToNotCollide = not AllowPartToNotCollide
	if AllowPartToNotCollide then
		Library.ChangeCustomPageButtonTitle(TPUASettings5,"No collide parts : enabled")
	else
		Library.ChangeCustomPageButtonTitle(TPUASettings5,"No collide parts : disabled")
	end 
end)

local TPUASettings5

local PartsGun = false
local OrbitTPUA = false -- LOL
TPUASettings5 = Library.CreateCustomPageButton("TPUA5", "Allow orbit : disabled",TROLLINGSCR, function()
	if PartsGun then
		Library.CreateNotification('Alert!',"You can't use it while Parts gun is on!")
		return 
	end

	OrbitTPUA = not OrbitTPUA
	if OrbitTPUA then
		Library.ChangeCustomPageButtonTitle(TPUASettings5,"Allow orbit : enabled")
	else
		Library.ChangeCustomPageButtonTitle(TPUASettings5,"Allow orbit : disabled")
	end 
end)


local GunAllUAButton
GunAllUAButton = Library.CreateCustomPageButton("GunAllUAButton", "TP all parts : disabled",TROLLINGSCR, function()
	if OrbitTPUA then
		Library.CreateNotification('Alert!',"You can't use it while Orbit is on!")
		return 
	end

	PartsGun = not PartsGun
	if PartsGun then
		Library.ChangeCustomPageButtonTitle(GunAllUAButton,"TP all parts : enabled")
	else
		Library.ChangeCustomPageButtonTitle(GunAllUAButton,"TP all parts : disabled")
	end 
end)

local TPUAA

local TPUABool = false
local FreezeAllUABool = false

local DistanceForForce = 25
local ForceForForce = 100000
local MaxForceUsed = math.huge
local MaxVeloUsed = math.huge

local DescendantAddedConnection

local ChangedValue = false
local WasChanged = false
TPUAA = Library.CreateCustomPageTextButton("TPUA", "Teleport Unanchored Parts : disabled",TROLLINGSCR, function(Distance, ForcePower)
	if FreezeAllUABool then
		Library.CreateNotification('Alert!',"You can't use it while Freeze All unanchored part is on!")
		return 
	end


	if tonumber(Distance) ~= nil then
		if tonumber(Distance) >= 0 then
			if tonumber(Distance) ~= DistanceForForce then
				ChangedValue = true
				Library.CreateNotification('Hey!',"Distance Value has changed from "..DistanceForForce.." to "..Distance)
				DistanceForForce = tonumber(Distance)
			end
		else
			Library.CreateNotification('Alert!',"Distance Value is too small! must be 3 or bigger")
		end
	end
	if tonumber(ForcePower) ~= nil then
		if tonumber(ForcePower) >= 100 then
			if tonumber(ForcePower) ~= ForceForForce then
				ChangedValue = true
				Library.CreateNotification('Hey!',"ForcePower Value has changed from "..ForceForForce.." to "..ForcePower)
				ForceForForce = tonumber(ForcePower)
			end
		else
			Library.CreateNotification('Alert!',"ForcePower Value is too small! must be 100 or bigger")
		end
	end

	if not ChangedValue or not TPUABool then
		TPUABool = not TPUABool
		WasChanged = true
		if TPUABool then
			Library.ChangeCustomPageButtonTitle(TPUAA,"Teleport Unanchored Parts : enabled")
		else
			Library.ChangeCustomPageButtonTitle(TPUAA,"Teleport Unanchored Parts : disabled")
		end 
	end
	ChangedValue = false
end,25,nil,2)

local Forces = {}
local AttachementsArr = {}
local ListOfForceAttached = {}

local AlreadyOnAttachmentForce = false

local AlreadyOnAttachmentForceDesAdd
local AlreadyOnAttachmentForceDesRe

local PreSetFOrTrollingTPUACheck = false
local RotForOrbitalTPUA = 0

local MCtau = 2*math.pi -- mathematical constant
local IncrementForOrbit = MCtau / 360

local MousePos = CFrame.new(0,0,0)
lplr:GetMouse().Button1Down:Connect(function()
	if lplr:GetMouse().Hit then
		MousePos = lplr:GetMouse().Hit
	end
end)

coroutine.wrap(function()

	local PartToBringItTo
	local Attachment1

	while task.wait(0.1) do
		if TPUABool then

			repeat
				task.wait()
			until game:GetService('Players').LocalPlayer.Character

			repeat
				task.wait()
			until game:GetService('Players').LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

			if PartToBringItTo == nil then
				PartToBringItTo = Instance.new("Part")
				PartToBringItTo.Parent = game:GetService("Workspace")
				PartToBringItTo.Name = "WassupBro"
				PartToBringItTo.Anchored = true
				PartToBringItTo.Transparency = 1
				PartToBringItTo.CanCollide = false
				Attachment1 = Instance.new("Attachment", PartToBringItTo)
				Attachment1.WorldCFrame = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-DistanceForForce)
			end
			if Attachment1 == nil then
				Attachment1 = Instance.new("Attachment", PartToBringItTo)
				Attachment1.WorldCFrame = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-DistanceForForce)
			end
			if WasChanged then
				Attachment1.WorldCFrame = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-DistanceForForce)
			end
			WasChanged = false
			pcall(function()
				if OrbitTPUA then

					for i = 0, MCtau, IncrementForOrbit do -- main for loop like in the example
						Attachment1.WorldCFrame = CFrame.new(game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position + (Vector3.new(math.cos(i), 0, math.sin(i)) * DistanceForForce), game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position)
						if not TPUABool or not OrbitTPUA then
							break
						else
							task.wait()
						end
					end
				elseif PartsGun then
					Attachment1.WorldCFrame = MousePos
				else
					TS:Create(Attachment1,TweenInfo.new((game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position-Attachment1.WorldCFrame.Position).magnitude/30),{WorldCFrame = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-DistanceForForce)}):Play()
				end

			end)

			pcall(function()
				if not AlreadyOn then
					AlreadyOn = true
					local continueAllowTpAllPartsRegardlessofHumanoid = true

					local function AddPartToListOfForceUses(part)
						pcall(function()
							continueAllowTpAllPartsRegardlessofHumanoid = true
							if not AllowTpAllPartsRegardlessofHumanoid then
								if part:IsA("BasePart" or "UnionOperation" or "Model") and ( (not part.Anchored) or AllowAnchoredRegradless) and not part:IsDescendantOf(game:GetService('Players').LocalPlayer.Character) and part.Name ~= "Torso" and part.Name ~= "Head" and part.Name ~= "Right Arm" and part.Name ~= "Left Arm" and part.Name ~= "Right Leg" and part.Name ~= "Left Leg" and part.Name ~= "HumanoidRootPart" then
								else
									continueAllowTpAllPartsRegardlessofHumanoid = false
								end
							end
							if part.Parent == nil then
								return
							end
							if TPUABool and table.find(ListOfForceAttached,part) == nil and part:IsA("BasePart" or "UnionOperation" or "Model") and ( (not part.Anchored) or AllowAnchoredRegradless) and not part:IsDescendantOf(game:GetService('Players').LocalPlayer.Character) and continueAllowTpAllPartsRegardlessofHumanoid then
								table.insert(ListOfForceAttached,part)
								for i,c in pairs(part:GetChildren()) do
									if c:IsA("BodyPosition") or c:IsA("BodyGyro") or c:IsA("AlignPosition") or c.Name == "FIByAttaching" then
										c:Destroy()
									end
								end
								local AlignPosition = Instance.new("AlignPosition", part)
								AlignPosition.Name = "FIByMovement"
								local Attachment2 = Instance.new("Attachment", part)
								Attachment2.Name = "FIByAttaching"
								AlignPosition.MaxForce = MaxForceUsed
								AlignPosition.MaxVelocity = MaxVeloUsed
								AlignPosition.Responsiveness = ForceForForce
								AlignPosition.Attachment0 = Attachment2
								AlignPosition.Attachment1 = Attachment1
								
								coroutine.wrap(function()
									if AllowPartToNotCollide then
										local PreviousColSettings = part.CanCollide
										repeat
											if not AllowPartToNotCollide then
												part.CanCollide = PreviousColSettings
												break
											end
											task.wait(1)
											if part == nil then
												break
											end

											if part:IsGrounded() then
												part.CanCollide = PreviousColSettings
											else
												part.CanCollide = false
											end
										until not AlreadyOn or part == nil
										part.CanCollide = PreviousColSettings
									end
								end)()

								part.Destroying:Connect(function()
									if table.find(ListOfForceAttached, part) then
										table.remove(ListOfForceAttached, table.find(ListOfForceAttached, part))
									end
								end)
							end
						end)
					end

					coroutine.wrap(function()
						local TimeOutCorner = 0
						for _,part in pairs(workspace:GetDescendants()) do
							if not TPUABool then
								break
							end
							TimeOutCorner += 1
							if TimeOutCorner > 123 then
								TimeOutCorner = 0
								task.wait()
							end
							AddPartToListOfForceUses(part)
						end
					end)()

					AlreadyOnAttachmentForceDesAdd = workspace.DescendantAdded:Connect(AddPartToListOfForceUses)
				end
			end)

			task.wait(0.1)
		else
			if AlreadyOn and not TPUABool then
				WasChanged = false
				AlreadyOn = false
				AlreadyOnAttachmentForceDesAdd:Disconnect()

				local CheckPauseToPreventLag = 0
				local TaskWait = 0
				for _, part in pairs(ListOfForceAttached) do
					CheckPauseToPreventLag += 1
					if CheckPauseToPreventLag > 67 then
						task.wait()
						CheckPauseToPreventLag = 0
					end
					
					--table.remove(ListOfForceAttached, table.find(ListOfForceAttached, part))
					
					if not part:FindFirstChild("FIByMovement") and not part:FindFirstChild("FIByAttaching") then
						continue
					end

					coroutine.wrap(function()
						local MyLocalTaskWait = tick()
						TaskWait = MyLocalTaskWait
						
						local SUCC, ERR = pcall(function()
							local AlignPosition = part:FindFirstChild("FIByMovement")
							local Attachment2 = part:FindFirstChild("FIByAttaching")

							if Attachment2 == nil or AlignPosition == nil then
								if Attachment2 then
									Attachment2:Destroy()
								end
								if AlignPosition then
									AlignPosition:Destroy()
								end
								return
							end

							local OrigP = AlignPosition.Responsiveness
							local Cap = 50
							for i = Cap, 0, -1 do
								AlignPosition.Responsiveness = OrigP * i/Cap
								task.wait(1/50)
							end

							OrigP = nil
							TimeToTake = nil
							Cap = nil
							AlignPosition:Destroy()
							Attachment2:Destroy()
						end)
						if not SUCC then
							warn("ERROR HAD OCCURED : ",ERR)
						end
						if MyLocalTaskWait == TaskWait then
							TaskWait = -1
						end
					end)()
				end
				
				repeat
					task.wait(0.01)
				until TaskWait == -1
				ClearTable(ListOfForceAttached)
			end
		end
	end
end)()

local HaveAlreadyDone = false
local FreezeAllUAButton
FreezeAllUAButton = Library.CreateCustomPageButton("FreezeAllUAButton", "Freeze All unanchored parts : disabled",TROLLINGSCR, function()
	if TPUABool then
		Library.CreateNotification('Alert!',"You can't use it while Teleport all unanchored part is on!")
		return 
	end

	FreezeAllUABool = not FreezeAllUABool
	HaveAlreadyDone = false
	if FreezeAllUABool then
		Library.ChangeCustomPageButtonTitle(FreezeAllUAButton,"Freeze All unanchored parts : enabled")
	else
		Library.ChangeCustomPageButtonTitle(FreezeAllUAButton,"Freeze All unanchored parts : disabled")
	end 
end)

-- AllowTpAllPartsRegardlessofHumanoid
local FreezeAllUAPartsRBXSIG
local FreezePartsTbl = {}
local PauseS = 0
local PauseE = 0
coroutine.wrap(function()
	while task.wait(0.1) do
		pcall(function()
			if FreezeAllUABool and not HaveAlreadyDone then
				HaveAlreadyDone = true

				local function FreezeParts(v)
					local Part = v
					pcall(function()
						--print("B")
						if table.find(FreezePartsTbl, Part) then
							print("FOUND?")
						end
						if v:IsA("BasePart" or "UnionOperation" or "Model") and table.find(FreezePartsTbl, Part) == nil and ((not v.Anchored) or AllowAnchoredRegradless) then
							--print("OK")
							local DONOTUSETPON = false
							if lplr.Character and v:IsDescendantOf(lplr.Character) then
								DONOTUSETPON = true
							end
							if not AllowTpAllPartsRegardlessofHumanoid then
								if not AllowTpAllPartsRegardlessofHumanoid then
									if v:IsA("BasePart" or "UnionOperation" or "Model") and ((not v.Anchored) or AllowAnchoredRegradless) and not v:IsDescendantOf(game:GetService('Players').LocalPlayer.Character) and v.Name == "Torso" == false and v.Name == "Head" == false and v.Name == "Right Arm" == false and v.Name == "Left Arm" == false and v.Name == "Right Leg" == false and v.Name == "Left Leg" == false and v.Name == "HumanoidRootPart" == false then

									else
										DONOTUSETPON = true
									end
								end
							end
							if not DONOTUSETPON then
								for i,c in pairs(v:GetChildren()) do
									if c:IsA("BodyPosition") or c:IsA("BodyGyro") or c:IsA("AlignPosition") or c.Name == "FIByAttaching" then
										c:Destroy()
									end
								end
								--print("BOOM")
								table.insert(FreezePartsTbl, Part)

								local bodypos = Instance.new("BodyPosition")
								bodypos.Name = "FREEZEPARTSBP"
								bodypos.Parent = v
								bodypos.Position = Part.Position
								bodypos.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
								local bodygyro = Instance.new("BodyGyro")
								bodygyro.Name = "FREEZEPARTSBG"
								bodygyro.Parent = v
								bodygyro.CFrame = Part.CFrame
								bodygyro.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)

							end
						end
					end)
				end

				coroutine.wrap(function()
					for i,v in pairs(workspace:GetDescendants()) do
						if PauseS > 69 then
							PauseS= 0
							task.wait()
						end
						PauseS += 1
						FreezeParts(v)
					end
				end)()
				FreezeAllUAPartsRBXSIG = workspace.DescendantAdded:Connect(FreezeParts)

			else
				if not FreezeAllUABool and not HaveAlreadyDone then
					HaveAlreadyDone = true
					if FreezeAllUAPartsRBXSIG then
						FreezeAllUAPartsRBXSIG:Disconnect()
						FreezeAllUAPartsRBXSIG = nil
					end

					for i,part in pairs(FreezePartsTbl) do
						if PauseE > 69 then
							task.wait()
							PauseE = 0
						end
						PauseE += 1
						pcall(function()
							local AlignPosition = part:FindFirstChild("FREEZEPARTSBP")
							local Attachment2 = part:FindFirstChild("FREEZEPARTSBG")
							if Attachment2 then
								Attachment2:Destroy()
							end
							if AlignPosition then
								AlignPosition:Destroy()
							end
						end)
					end
					ClearTable(FreezePartsTbl)
				end
			end
		end)
	end
end)()

local function ClosestPointOnPart(Part, Point)
	local Transform = Part.CFrame:pointToObjectSpace(Point) -- Transform into local space
	local HalfSize = Part.Size * 0.5
	return Part.CFrame * Vector3.new( -- Clamp & transform into world space
		math.clamp(Transform.x, -HalfSize.x, HalfSize.x),
		math.clamp(Transform.y, -HalfSize.y, HalfSize.y),
		math.clamp(Transform.z, -HalfSize.z, HalfSize.z)
	)
end

local function CheckForOb(TheMainPart, PosToCheck)
	local raycastParams = RaycastParams.new()
	raycastParams.FilterType = Enum.RaycastFilterType.Exclude
	raycastParams.FilterDescendantsInstances = {TheMainPart.Parent.Parent, PosToCheck.Parent.Parent}
	raycastParams.IgnoreWater = true
	raycastParams.RespectCanCollide = true

	local raycastResult = workspace:Raycast(TheMainPart.CFrame.Position, (PosToCheck.CFrame.Position - TheMainPart.CFrame.Position), raycastParams)

	return not (raycastResult == nil)
end

local simForGames = Library.CreateCustomPage('Simulators',"Specific scripts")

if GameID == 0 then
elseif GameID == 192800 then --Work at pizza place
	Library.CreateCustomPageButton("WAAPP","Work at a pizza place auto farm",simForGames,function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Lookatit7626/Project-R/refs/heads/main/WAAPPAutofarm.lua"))()
		Library.CreateNotification("ICARUS","Executed Work at a pizza place auto farm")
	end)
	local ToggleRainbowCars = false
	local RainbowCarsButton
	RainbowCarsButton = Library.CreateCustomPageButton("RainbowCarsButton","Rainbow cars : Disabled",simForGames,function()
		ToggleRainbowCars = not ToggleRainbowCars
		if ToggleRainbowCars then
			Library.ChangeCustomPageButtonTitle(RainbowCarsButton, "Rainbow cars : Enabled")
		else
			Library.ChangeCustomPageButtonTitle(RainbowCarsButton, "Rainbow cars : Disabled")
		end
	end)

	Library.CreateCustomPageTextButton("Disappear", "disappear a player", simForGames, function(Playername)
		local foundName = nil
		local Players = game:GetService('Players'):GetPlayers()
		for i = 1, #Players do
			local PossiblePlayer = Players[i]
			if string.find(string.lower(PossiblePlayer.Name), string.lower(Playername)) then
				foundName = PossiblePlayer.Name
			end
		end

		if foundName then
			local Cars = workspace.Cars

			local function GetAFreeCar()
				for i,v in pairs(Cars:GetChildren()) do
					if v:FindFirstChild("Driver") and v:FindFirstChild("HoodSeat") then
						if v:FindFirstChild("Driver").Occupant == nil and v:FindFirstChild("HoodSeat") then
							return v
						end
					end
				end
			end

			local function SetCollide(Car,ToCollide)
				for i,v in pairs(Car:GetChildren()) do
					if v:IsA("BasePart")  then
						v.CanCollide = ToCollide
					end
				end
			end

			local Target = Players:FindFirstChild(foundName)
			if Target == nil then
				return error("NO PEOPLE")
			end
			local Car = GetAFreeCar()
			if Car == nil then
				return error("NO CAR FOR YOU")
			end

			local OriginalSpot = lplr.Character.HumanoidRootPart.CFrame

			local CarSeat = Car.Driver
			local TargetSeat = Car.HoodSeat
			local TargetHRT = Target.Character.HumanoidRootPart
			SetCollide(Car,false)

			fireproximityprompt(CarSeat.ProximityPrompt)
			repeat
				task.wait()
			until CarSeat.Occupant == lplr.Character.Humanoid

			repeat
				RunService.RenderStepped:Wait()
				lplr.Character.HumanoidRootPart.CFrame = TargetHRT.CFrame * CFrame.new(0,1,3)
			until TargetSeat.Occupant ~= nil or CarSeat.Occupant == nil or lplr.Character.Humanoid.Health <= 0


			lplr.Character.HumanoidRootPart.CFrame = CFrame.new(500, 5000, 500)

			CarSeat.Disabled = true
			repeat
				task.wait()
				CarSeat.Disabled = true
			until CarSeat.Occupant == nil or CarSeat.Occupant == nil or lplr.Character.Humanoid.Health <= 0

			lplr.Character.HumanoidRootPart.CFrame = OriginalSpot	
		else
			Library.CreateNotification("Alert!", "Can't find the player you want to disappear!")
		end
	end)

	local function ToBeRainbow(car)
		local colour = Color3.fromHSV(tick() % timer/timer, 1, 1)
		if car:FindFirstChild("Hood1") then
			local args = {
				"PaintVehicle",
				car.Hood1,
				"None",
				colour,
				false
			}
			game:GetService("ReplicatedStorage"):WaitForChild("VehicleChannel"):FireServer(unpack(args))
		end
		local args = {
			"PaintVehicle",
			car:FindFirstChild("Paint") or car:FindFirstChild("Body"),
			"None",
			colour,
			false
		}
		game:GetService("ReplicatedStorage"):WaitForChild("VehicleChannel"):FireServer(unpack(args))
	end



	coroutine.wrap(function()
		while true do
			if not ToggleRainbowCars then
				task.wait(0.1)
			end
			if ToggleRainbowCars then
				local timer = 7.5
				for i,v in pairs(workspace.Cars:GetChildren()) do
					coroutine.wrap(function()
						pcall(function()
							ToBeRainbow(v)
						end)
					end)()
				end
			end
		end
	end)()
elseif GameID == 119048529960596 then --Restarant tycoon 3
	local TYCOON = game:GetService("Players").LocalPlayer.Tycoon.Value

	local AutoSetTable
	local AutoSetTableBool = false

	local TableArrangements = {}
	TableArrangements = {}

	local Furniture
	local Surface

	AutoSetTable = Library.CreateCustomPageButton("AutoSetTable","Auto set tables : disabled",simForGames,function()
		AutoSetTableBool = not AutoSetTableBool
		if AutoSetTableBool then
			Library.ChangeCustomPageButtonTitle(AutoSetTable,"Auto set tables : enabled")

			if TYCOON ~= game:GetService("Players").LocalPlayer.Tycoon.Value then
				TYCOON = game:GetService("Players").LocalPlayer.Tycoon.Value
			end

			if TYCOON == nil then return end

			TableArrangements = {}
			Furniture = TYCOON.Items.Furniture
			Surface = TYCOON.Items.Surface

			for i,Table in pairs(Surface:GetChildren()) do
				if string.sub(Table.Name,1,1) =="T" then
					for j, Chairs in pairs(Furniture:GetChildren()) do
						if string.sub(Chairs.Name,1,1) =="C" then
							local CPOP = ClosestPointOnPart(Chairs.PrimaryPart , Table.WorldPivot.Position)

							if ( CPOP - Table.WorldPivot.Position ).Magnitude <= 4 and not CheckForOb(Chairs.PrimaryPart, Table.PrimaryPart) then

								if TableArrangements[Table] == nil then
									TableArrangements[Table] = { ["Table"] = Table, ["Chairs"] = {} }
								end
								table.insert(TableArrangements[Table]["Chairs"], Chairs)
							end
						end
					end
				end
			end

		else
			Library.ChangeCustomPageButtonTitle(AutoSetTable,"Auto set tables : disabled")
		end
	end)


	local AutoTakeOrder
	local AutoTakeOrderBool = false

	AutoTakeOrder = Library.CreateCustomPageButton("AutoTakeOrder","Auto take order : disabled",simForGames,function()
		AutoTakeOrderBool = not AutoTakeOrderBool
		if AutoTakeOrderBool then
			Library.ChangeCustomPageButtonTitle(AutoTakeOrder,"Auto take order : enabled")
		else
			Library.ChangeCustomPageButtonTitle(AutoTakeOrder,"Auto take order : disabled")
		end
	end)

	local AutoCook
	local AutoCookBool = false

	AutoCook = Library.CreateCustomPageButton("AutoCook","Auto Cook : disabled",simForGames,function()
		AutoCookBool = not AutoCookBool
		if AutoCookBool then
			Library.ChangeCustomPageButtonTitle(AutoCook,"Auto Cook : enabled")
		else
			Library.ChangeCustomPageButtonTitle(AutoCook,"Auto Cook : disabled")
		end
	end)

	local AutoServeFood
	local AutoServeFoodBool = false

	AutoServeFood = Library.CreateCustomPageButton("AutoServeFood","Auto serve food : disabled",simForGames,function()
		AutoServeFoodBool = not AutoServeFoodBool
		if AutoServeFoodBool then
			Library.ChangeCustomPageButtonTitle(AutoServeFood,"Auto serve food : enabled")
		else
			Library.ChangeCustomPageButtonTitle(AutoServeFood,"Auto serve food : disabled")
		end
	end)

	local AutoClearTable
	local AutoClearTableBool = false

	AutoClearTable = Library.CreateCustomPageButton("AutoClearTable","Auto Clear tables : disabled",simForGames,function()
		AutoClearTableBool = not AutoClearTableBool
		if AutoClearTableBool then
			Library.ChangeCustomPageButtonTitle(AutoClearTable,"Auto Clear order : enabled")
		else
			Library.ChangeCustomPageButtonTitle(AutoClearTable,"Auto Clear order : disabled")
		end
	end)


	local listOfFarm = {
		"Berries",
		"Tomato",
		"Milk",
		"Apple",
		"Carrot",
		"Potato",
		"Onion",
		"Lettuce",
		"Cheese",
		"Sugar",
		"Mushroom",
		"Pepper",
		"Flour",
		"Egg",
		"Chocolate",
		"Bread",
		"Pork",
		"Fish",
		"Chicken",
		"Beef",
		"Pasta",
		"Lamb",
		"Banana",
	}

	table.sort(listOfFarm)
	Library.CreateCustomPageButton("Buy","--- SHOPS ---",simForGames,function()
	end)
	for i,itemToBuy in pairs(listOfFarm) do
		Library.CreateCustomPageButton("Buy "..itemToBuy,"Buy "..itemToBuy,simForGames,function()
			local args = {
				TYCOON,
				itemToBuy,
			}
			game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Food"):WaitForChild("PurchaseIngredientRequested"):FireServer(unpack(args))

		end)
	end



	local CookGUITimeout = 0
	local Events = game:GetService("ReplicatedStorage"):WaitForChild("Events")
	local BestFitTable
	local suc, err
	coroutine.wrap(function()
		while task.wait(.1) do
			suc, err = pcall(function()
				if TYCOON ~= game:GetService("Players").LocalPlayer.Tycoon.Value then
					TYCOON = game:GetService("Players").LocalPlayer.Tycoon.Value
				end
				if AutoSetTableBool then

					for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
						if v:FindFirstChild("Bubble") and v.Name == "CustomerSpeechUI"  then
							if v.Bubble.ImageColor3 ~= Color3.fromRGB(128, 128, 128) then
								local Text = v.Bubble.Content.Header.Text
								local changedText = table.concat(string.split(Text," "), " ",4)
								changedText = string.sub(changedText,1, #changedText-1)
								local SplitedText = string.split(changedText," ")
								if (SplitedText[2] ~= nil and SplitedText[2] == "please" and tonumber(string.sub(SplitedText[1],1,1)) ~= nil) or ( tonumber(string.split(Text," ")[3]) ~= nil ) then

									BestFitTable = nil
									local NumOfCustomers = tonumber(string.sub(SplitedText[1],1,1)) or tonumber(string.split(Text," ")[3])
									--print(NumOfCustomers)

									for q,TableToCheck in pairs(TableArrangements) do
										if BestFitTable == nil and (TableToCheck["Table"]:GetAttribute("InUse") ~= true) and #TableToCheck["Chairs"] >= NumOfCustomers then
											BestFitTable = TableToCheck
											--print("Found seat")
										elseif BestFitTable ~= nil and TableToCheck["Table"]:GetAttribute("InUse") ~= true and #BestFitTable["Chairs"] > #TableToCheck["Chairs"] and #TableToCheck["Chairs"] >= NumOfCustomers then
											BestFitTable = TableToCheck
											--print("Found another seat")
										end

									end
									if BestFitTable and v.Adornee ~= nil then
										local args = {
											{
												GroupId = tostring(v.Adornee.Parent.Parent.Name),
												Tycoon = TYCOON,
												Name = "SendToTable",
												FurnitureModel = BestFitTable["Table"]
											}
										}
										game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Restaurant"):WaitForChild("TaskCompleted"):FireServer(unpack(args))

									end
								end
							end
						end
					end
				end

				if AutoTakeOrderBool then
					for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
						if v:FindFirstChild("Bubble") and v.Name == "CustomerSpeechUI"  then
							local Text = v.Bubble.Content.Header.Text
							local changedText = table.concat(string.split(Text," "), " ",4)
							changedText = string.sub(changedText,1, #changedText-1)
							--print(changedText)

							if v.Bubble.ImageColor3 ~= Color3.fromRGB(128, 128, 128) and v.Adornee ~= nil then
								local args = {
									{
										GroupId = tostring(v.Adornee.Parent.Parent.Name),
										Tycoon = TYCOON,
										Name = "TakeOrder",
										CustomerId = tostring(v.Adornee.Parent.Name)
									}
								}
								game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Restaurant"):WaitForChild("TaskCompleted"):FireServer(unpack(args))

							end
						end
					end
				end

				if AutoCookBool then
					for i,v in pairs(workspace.Temp:GetChildren()) do
						if v:FindFirstChildOfClass("ProximityPrompt") then
							fireproximityprompt(v:FindFirstChildOfClass("ProximityPrompt"))
							CookGUITimeout = 0
							repeat
								task.wait(0.025)
								CookGUITimeout += 1
							until lplr.PlayerGui.Cooking.Frame.Visible == true or CookGUITimeout > 25
							if CookGUITimeout >= 25 then
								error("TIMEOUT - COOKING TIMEOUT [1], FORCE STOP")
							end
							task.wait(0.05)
							CookGUITimeout = 0
							repeat
								Events.Cook.CookInputRequested:FireServer("CompleteTask", nil, "Kitchen")
								CookGUITimeout += 1
								task.wait(0.025)
							until lplr.PlayerGui.Cooking.Frame.Visible == false or CookGUITimeout > 75
							if CookGUITimeout >= 25 then
								warn("TIMEOUT - COOKING TIMEOUT [2], CONTINUE WITH ORDER OF OPERATION")
							end
							task.wait(0.125)
						end
					end
				end

				if AutoServeFoodBool then
					for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
						if v:FindFirstChild("Bubble") and v.Name == "CustomerSpeechUI"  then
							if v.Bubble.ImageColor3 == Color3.fromRGB(128, 128, 128) then
								local Text = v.Bubble.Content.Header.Text
								local changedText = table.concat(string.split(Text," "), " ",4)
								changedText = string.sub(changedText,1, #changedText-1)
								--print(changedText)

								for j,k in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
									if k:FindFirstChild("TextLabel") and k.Name == "BillboardGui"  then
										if (k:FindFirstChild("TextLabel").Text == changedText or string.lower(k:FindFirstChild("TextLabel").Text) == string.lower(Text)) and v.Adornee ~= nil then
											local args = {
												{
													Name = "Serve",
													GroupId = tostring(v.Adornee.Parent.Parent.Name),
													Tycoon = TYCOON,
													FoodModel = k.Adornee.Parent.Parent,
													CustomerId = tostring(v.Adornee.Parent.Name)
												}
											}
											game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Restaurant"):WaitForChild("TaskCompleted"):FireServer(unpack(args))

										end
									end
								end

							end

						end
					end
				end

				if AutoClearTableBool then
					for i,v in pairs(TYCOON.Items.Surface:GetChildren()) do
						--print( string.sub(v.Name,1,1) )
						if string.sub(v.Name,1,1) =="T" then

							if v:FindFirstChild("Bill") then
								local args = {
									{
										Tycoon = TYCOON,
										Name = "CollectBill",
										FurnitureModel = v
									}
								}
								game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Restaurant"):WaitForChild("TaskCompleted"):FireServer(unpack(args))
							end
							if v:FindFirstChild("Trash") then
								local args = {
									{
										Tycoon = TYCOON,
										Name = "CollectDishes",
										FurnitureModel = v
									}
								}
								game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Restaurant"):WaitForChild("TaskCompleted"):FireServer(unpack(args))
							end
						end
					end
				end
			end)
			if not suc then
				print(err)
			end
		end
	end)()



elseif GameID == 2210085102 then -- Naval Warfare
	local SpamCaptureFlags
	local SpamCaptureFlagsBool = false

	SpamCaptureFlags = Library.CreateCustomPageButton("SpamCaptureFlags","Spam capture flags : disabled",simForGames,function()
		SpamCaptureFlagsBool = not SpamCaptureFlagsBool
		if SpamCaptureFlagsBool then
			Library.ChangeCustomPageButtonTitle(SpamCaptureFlags,"Spam capture flags : enabled")
		else
			Library.ChangeCustomPageButtonTitle(SpamCaptureFlags,"Spam capture flags : disabled")
		end
	end)

	coroutine.wrap(function()
		local IslandsArr = {}
		local IslandsPosArr = {}
		local Suc324, Err324
		while true do
			Suc324, Err324 = pcall(function()
				for i,v in pairs(game.Workspace:GetChildren()) do
					if v.Name == "Island" then
						if v:FindFirstChild("Flag") then
							if v:FindFirstChild("Flag"):FindFirstChild("FlagPad")  then
								v = v:FindFirstChild("Flag"):FindFirstChild("FlagPad")
								if not table.find(IslandsArr, v) then
									table.insert(IslandsArr, v)
									IslandsPosArr[v] = v.Position
								end
							end
						end
					end
				end

				if SpamCaptureFlagsBool and lplr.Character.Humanoid.Health > 0 then
					for i ,v in pairs(IslandsArr) do
						coroutine.wrap(function()
							v.CanCollide = false
							v.Transparency = 1
							v.Position = lplr.Character:FindFirstChild("HumanoidRootPart").Position
							task.wait(0.05)
							v.Position = Vector3.new(0,0,0)
							lplr.PlayerGui.ScreenGui.AttackedPrompt.Position = UDim2.new(11,0,11,0)
						end)()
					end
					task.wait(0.1)
				else
					for i ,v in pairs(IslandsArr) do
						coroutine.wrap(function()
							v.CanCollide = true
							v.Transparency = 0
							v.Position = IslandsPosArr[v]
							v.Name = "FlagPad"
						end)()
					end
				end
			end)
			task.wait(0.1)
		end
	end)()
elseif GameID == 3398014311 then --R.S. 2
	local ACMSIM339Bool = false
	local ACMSIM339BUTTON
	ACMSIM339BUTTON = Library.CreateCustomPageButton("AutoCollectMoney","Auto collect money : False", simForGames, function()
		ACMSIM339Bool = not ACMSIM339Bool
		if ACMSIM339Bool then
			Library.ChangeCustomPageButtonTitle(ACMSIM339BUTTON,"Auto collect money : True")
		else
			Library.ChangeCustomPageButtonTitle(ACMSIM339BUTTON,"Auto collect money : False")
		end
		local plrTyc =  game:GetService("Players").LocalPlayer:FindFirstChild("Tycoon").Value
		local GCCC
		while ACMSIM339Bool do
			wait(1)
			pcall(function()
				GCCC = plrTyc.Items.OftenFiltered.Surface:GetChildren()
				for i = 1, #GCCC do
					if GCCC[i]:FindFirstChild("Bill") then
						local args = {
							[1] = plrTyc,
							[2] = {
								["name"] = "CollectBill",
								["model"] = GCCC[i]
							}
						}

						game:GetService("ReplicatedStorage").Events.ClientTycoonInput:FireServer(unpack(args))

						wait(0.3)
					end
				end
			end)
		end
	end)

	local ACMSIM3392Bool = false
	local ACMSIM3392BUTTON
	ACMSIM3392BUTTON = Library.CreateCustomPageButton("AutoDishwash","Auto Dishwasher : False", simForGames, function()
		ACMSIM3392Bool = not ACMSIM3392Bool
		if ACMSIM3392Bool then
			Library.ChangeCustomPageButtonTitle(ACMSIM3392BUTTON,"Auto Dishwasher : True")
		else
			Library.ChangeCustomPageButtonTitle(ACMSIM3392BUTTON,"Auto Dishwasher : False")
		end
		local plrTyc =  game:GetService("Players").LocalPlayer:FindFirstChild("Tycoon").Value
		local GCCC
		local Temp
		local FireProxiSuc
		while ACMSIM3392Bool do
			wait(1)
			pcall(function()
				Temp = game.Workspace:FindFirstChild('Temp'):GetChildren()
				for i = 1,#Temp do
					if Temp[i]:FindFirstChildOfClass('ProximityPrompt') then
						if Temp[i]:FindFirstChildOfClass('ProximityPrompt').Name:find("Dishwasher"..game:GetService('Players').LocalPlayer.Name) then
							FireProxiSuc = FireProximityPrompt(Temp[i]:FindFirstChildOfClass('ProximityPrompt'))
						end
					end
				end
			end)
		end
	end)

	local ACMSIM33923Bool = false
	local ACMSIM33923BUTTON
	ACMSIM33923BUTTON = Library.CreateCustomPageButton("AutoCollectDelivery","Auto Collect Delivery : False", simForGames, function()
		ACMSIM33923Bool = not ACMSIM33923Bool
		if ACMSIM33923Bool then
			Library.ChangeCustomPageButtonTitle(ACMSIM33923BUTTON,"Auto Collect Delivery : True")
		else
			Library.ChangeCustomPageButtonTitle(ACMSIM33923BUTTON,"Auto Collect Delivery : False")
		end
		local plrTyc =  game:GetService("Players").LocalPlayer:FindFirstChild("Tycoon").Value
		local GCCC
		local Temp
		local FireProxiSuc
		while ACMSIM33923Bool do
			wait(1)
			pcall(function()
				Temp = game.Workspace:FindFirstChild('Temp'):GetChildren()
				for i = 1,#Temp do
					if Temp[i]:FindFirstChildOfClass('ProximityPrompt') then
						if Temp[i]:FindFirstChildOfClass('ProximityPrompt').Name == "CollectDeliveryCash" then
							FireProxiSuc = FireProximityPrompt(Temp[i]:FindFirstChildOfClass('ProximityPrompt'))
						end
					end
				end
			end)
		end
	end)

	local ACMSIM339233Bool = false
	local ACMSIM339233BUTTON
	ACMSIM339233BUTTON = Library.CreateCustomPageButton("AutoCollectLoot","Auto Collect Loot : False", simForGames, function()
		ACMSIM339233Bool = not ACMSIM339233Bool
		if ACMSIM339233Bool then
			Library.ChangeCustomPageButtonTitle(ACMSIM339233BUTTON,"Auto Collect Loot : True")
		else
			Library.ChangeCustomPageButtonTitle(ACMSIM339233BUTTON,"Auto Collect Loot : False")
		end
		local plrTyc =  game:GetService("Players").LocalPlayer:FindFirstChild("Tycoon").Value
		local GCCC
		local DropFolder
		local FireProxiSuc
		while ACMSIM339233Bool do
			wait(1)
			DropFolder = game.Workspace:FindFirstChild('DropFolder'):GetChildren()
			for i = 1,#DropFolder do
				pcall(function()
					if DropFolder[i]:FindFirstChildOfClass('TouchTransmitter') then
						FireTouch(lplr.Character:FindFirstChild('Head'),DropFolder[i],0)
						wait(0.01)
						FireTouch(lplr.Character:FindFirstChild('Head'),DropFolder[i],1)
					end
				end)
			end
		end
	end)

	local ACMSIM3392333Bool = false
	local ACMSIM3392333BUTTON
	ACMSIM3392333BUTTON = Library.CreateCustomPageButton("AutoCollectPlates","Auto Collect Plates : False", simForGames, function()
		ACMSIM3392333Bool = not ACMSIM3392333Bool
		if ACMSIM3392333Bool then
			Library.ChangeCustomPageButtonTitle(ACMSIM3392333BUTTON,"Auto Collect Plates : True")
		else
			Library.ChangeCustomPageButtonTitle(ACMSIM3392333BUTTON,"Auto Collect Plates : False")
		end
		local plrTyc =  game:GetService("Players").LocalPlayer:FindFirstChild("Tycoon").Value
		local GCCC
		while ACMSIM3392333Bool do
			wait(1)
			pcall(function()
				GCCC = plrTyc.Items.OftenFiltered.Surface:GetChildren()
				for i = 1, #GCCC do
					if GCCC[i]:FindFirstChild("Trash") then
						local args = {
							[1] = plrTyc,
							[2] = {
								["name"] = "ClearTrash",
								["model"] = GCCC[i]
							}
						}

						game:GetService("ReplicatedStorage").Events.ClientTycoonInput:FireServer(unpack(args))

						wait(0.3)
					end
				end
			end)
		end
	end)

	local ACHJBSJKHDBSBOOL = false
	local ACHJBSJKHDBSBUTTON
	ACHJBSJKHDBSBUTTON = Library.CreateCustomPageButton("Teleport to people","Teleport to people : False", simForGames, function()
		ACHJBSJKHDBSBOOL = not ACHJBSJKHDBSBOOL
		if ACHJBSJKHDBSBOOL then
			Library.ChangeCustomPageButtonTitle(ACHJBSJKHDBSBUTTON,"Teleport to people : True")
		else
			Library.ChangeCustomPageButtonTitle(ACHJBSJKHDBSBUTTON,"Teleport to people : False")
		end
		local players
		while ACHJBSJKHDBSBOOL do
			players = game:GetService('Players'):GetPlayers()
			for i = 1, #players do
				pcall(function()
					game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position = players[i].Character.HumanoidRootPart.Position
				end)
				wait(5)
			end
			wait(1)
		end
	end)

	local ACMSIM33911Bool = false
	local ACMSIM33911BUTTON
	ACMSIM33911BUTTON = Library.CreateCustomPageButton("AutoCollectMoneyAll","Auto collect money All Tycoon : False", simForGames, function()
		ACMSIM33911Bool = not ACMSIM33911Bool
		if ACMSIM33911Bool then
			Library.ChangeCustomPageButtonTitle(ACMSIM33911BUTTON,"Auto collect money All Tycoon : True")
		else
			Library.ChangeCustomPageButtonTitle(ACMSIM33911BUTTON,"Auto collect money All Tycoon : False")
		end

		local Tycoons
		local plrTyc
		local GCCC
		local succccc09304930, err3435392953152

		coroutine.wrap(function()
			while ACMSIM33911Bool do
				Chat("Hey! Allow me to be manager and i will auto collect your cash! This will continue for 10 mins...")
				wait(600)
			end
		end)()

		while ACMSIM33911Bool do
			wait(0.1)
			Tycoons = game.Workspace:FindFirstChild('Tycoons'):GetChildren()
			for i = 1, #Tycoons do
				local plrTyc = Tycoons[i]
				wait(.1)
				succccc09304930, err3435392953152 = pcall(function()
					GCCC = plrTyc.Items.OftenFiltered.Surface:GetChildren()
					for i = 1, #GCCC do
						if GCCC[i]:FindFirstChild("Bill") then
							local args = {
								[1] = plrTyc,
								[2] = {
									["name"] = "CollectBill",
									["model"] = GCCC[i]
								}
							}

							game:GetService("ReplicatedStorage").Events.ClientTycoonInput:FireServer(unpack(args))

							wait(0.1)
						end
					end
				end)
				if not succccc09304930 then
					warn(err3435392953152)
				end
			end
		end
	end)
else
	Library.CreateCustomPageButton("None","There is no script supported for your game!",simForGames,function()
	end)
end

if not getgenv().Network or true then
	getgenv().Network = {
		BaseParts = {};
		FakeConnections = {};
		Connections = {};
		Output = {
			Enabled = false;
			Prefix = "[NETWORK] ";
			Send = function(Type,Output,BypassOutput)
				if typeof(Type) == "function" and (Type == print or Type == warn or Type == error) and typeof(Output) == "string" and (typeof(BypassOutput) == "nil" or typeof(BypassOutput) == "boolean") then
					if Network["Output"].Enabled or BypassOutput then
						Type(Network["Output"].Prefix..Output);
					end;
				elseif Network["Output"].Enabled then
					error(Network["Output"].Prefix.."Output Send Error : Invalid syntax.");
				end;
			end;
		};
		LostParts = {};
		CharacterRelative = true;
		LastCharacter = nil;
		TryKeep = true; --loop attempts to
		PartOwnership = {
			PreMethodSettings = {};
			Enabled = false;
		};
	}

	Network["Output"].Send(print,": Loading.")

	Network["RetainPart"] = function(Part,Silent,ReturnFakePart) --function for retaining ownership of unanchored parts
		assert(Network["PartOwnership"]["Enabled"], Network["Output"].Prefix.." RetainPart Error : PartOwnership is Disabled.")
		--assert(typeof(Part) == "Instance" and Part:IsA("BasePart") and not Part:IsGrounded(),Network["Output"].Prefix.."RetainPart Error : Invalid syntax: Arg1 (Part) must be an ungrounded BasePart which is a descendant of workspace.")
		if not Part:IsDescendantOf(workspace) then
			--Network["Output"].Send(error,"RetainPart Error : Invalid syntax: Arg1 (Part) must be an ungrounded BasePart which is a descendant of workspace.")
			local Index = table.find(Network["LostParts"],Part)
			if Index then
				table.remove(Network["LostParts"],Index)
			end
			return false
		end
		assert(typeof(Silent) == "boolean" or typeof(Silent) == "nil",Network["Output"].Prefix.."RetainPart Error : Invalid syntax: Arg2 (Silent) must be a boolean or nil.")
		assert(typeof(ReturnFakePart) == "boolean" or typeof(ReturnFakePart) == "nil",Network["Output"].Prefix.."RetainPart Error : Invalid syntax: Arg3 (ReturnFakePart) must be a boolean or nil.")
		if not table.find(Network["BaseParts"],Part) and not table.find(Network["LostParts"],Part) then
			table.insert(Network["BaseParts"],Part)
			local Item1Pos = table.find(Network["BaseParts"],Part)
			local Item2Pos = table.find(Network["LostParts"],Part)
			pcall(function()
				Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
			end)
			if not Silent then
				Network["Output"].Send(print,"PartOwnership Output : PartOwnership applied to BasePart "..Part:GetFullName()..".")
			end
			Part.Destroying:Connect(function()
				table.remove(Network["BaseParts"],Item1Pos)
				table.remove(Network["LostParts"],Item2Pos)

				--print("removed it")
			end)
			if ReturnFakePart then
				local workspaceParts = {}
				return FakePart
			end
		else
			Network["Output"].Send(warn,"RetainPart Warning : PartOwnership not applied to BasePart "..Part:GetFullName()..", as it already active.")
			return false
		end
	end

	Network["RemovePart"] = function(Part,Silent) --function for removing ownership of unanchored part
		assert(typeof(Part) == "Instance" and Part:IsA("BasePart"),Network["Output"].Prefix.."RemovePart Error : Invalid syntax: Arg1 (Part) must be a BasePart.")
		if table.find(Network["BaseParts"],Part) then
			table.remove(Network["BaseParts"],table.find(Network["BaseParts"],Part))
		else
			if not Silent then
				Network["Output"].Send(warn,"RemovePart Warning : BasePart "..Part:GetFullName().." not found in BaseParts table.")
			end
			return
		end
		if table.find(Network["LostParts"],Part) then
			table.remove(Network["LostParts"],table.find(Network["LostParts"],Part))
		end
		if not Silent then
			Network["Output"].Send(print,"RemovePart Output: PartOwnership removed from BasePart "..Part:GetFullName()..".")
		end
	end

	Network["PartOwnership"]["PartCoroutine"] = coroutine.create(function(Part)
		if Part:IsDescendantOf(workspace) then
			if Network.CharacterRelative then
				local Character = Network["LastCharacter"];
				if not Character.PrimaryPart then
					for _,Inst in pairs(Character:GetDescendants()) do
						if Inst:IsA("BasePart") then
							Character.PrimaryPart = Inst
							break
						end
					end
				end
				if Character and Character.PrimaryPart then
					local Distance = (Character.PrimaryPart.Position - Part.Position).Magnitude
					if Distance > gethiddenproperty(LocalPlayer,"MaximumSimulationRadius") and not isnetworkowner(Part) then
						Network["Output"].Send(warn,"PartOwnership Warning : PartOwnership not applied to BasePart "..Part:GetFullName()..", as it is more than "..gethiddenproperty(LocalPlayer,"MaximumSimulationRadius").." studs away.")
						Network["RemovePart"](Part)
						if not Part:IsGrounded() then
							table.insert(Network["LostParts"],Part)
						else
							--Network["Output"].Send(warn,"PartOwnership Warning : PartOwnership not applied to BasePart "..Part:GetFullName()..", as it is grounded.")
						end
					end
				else
					Network["Output"].Send(warn,"PartOwnership Warning : PartOwnership not applied to BasePart "..Part:GetFullName()..", as the LocalPlayer Character's PrimaryPart does not exist.")
				end
			end
			Part.AssemblyLinearVelocity = (Part.AssemblyLinearVelocity.Unit+Vector3.new(.01,.01,.01))*(50+math.cos(tick()*10))
		else
			Network["RemovePart"](Part)
		end
	end)

	Network["PartOwnership"]["Enable"] = coroutine.create(function() --creating a thread for network stuff
		if not Network["PartOwnership"]["Enabled"] then
			Network["PartOwnership"]["Enabled"] = true
			Network["PartOwnership"]["PreMethodSettings"].ReplicationFocus = LocalPlayer.ReplicationFocus
			LocalPlayer.ReplicationFocus = workspace
			Network["PartOwnership"]["PreMethodSettings"].SimulationRadius = gethiddenproperty(LocalPlayer,"SimulationRadius")
			Network["PartOwnership"]["Connection"] = RunService.Stepped:Connect(function()
				Network["LastCharacter"] = pcall(function() return LocalPlayer.Character end) or Network["LastCharacter"]
				sethiddenproperty(LocalPlayer,"SimulationRadius",1/0)

				local NumberToPause = 0

				coroutine.wrap(function()
					--print("Base parts  ",#Network["BaseParts"])
					for ind,Part in pairs(Network["BaseParts"]) do --loop through parts and do network stuff
						NumberToPause += 1
						if NumberToPause > 35 then
							task.wait()
							NumberToPause = 0
						end
						if Part.Parent == nil or Part:IsDescendantOf(workspace) == false then
							table.remove(Network["BaseParts"],ind)
							continue
						end
						coroutine.resume(Network["PartOwnership"]["PartCoroutine"],Part)
						--[==[ [[by 4eyes btw]] ]==]--
					end
				end)()
				coroutine.wrap(function()
					--print("Lost parts  ",#Network["LostParts"])
					for ind,Part in pairs(Network["LostParts"]) do
						if Part.Parent == nil or Part:IsDescendantOf(workspace) == false then
							table.remove(Network["LostParts"],ind)
							continue
						end
						Network.RetainPart(Part,true)
					end
				end)()
			end)
			Network["Output"].Send(print,"PartOwnership Output : PartOwnership enabled.")
		else
			Network["Output"].Send(warn,"PartOwnership Output : PartOwnership already enabled.")
		end
	end)

	Network["PartOwnership"]["Disable"] = coroutine.create(function()
		if Network["PartOwnership"]["Connection"] then
			Network["PartOwnership"]["Connection"]:Disconnect()
			LocalPlayer.ReplicationFocus = Network["PartOwnership"]["PreMethodSettings"].ReplicationFocus
			sethiddenproperty(LocalPlayer,"SimulationRadius",Network["PartOwnership"]["PreMethodSettings"].SimulationRadius)
			Network["PartOwnership"]["PreMethodSettings"] = {}
			for _,Part in pairs(Network["BaseParts"]) do
				Network["RemovePart"](Part)
			end
			for Index,Part in pairs(Network["LostParts"]) do
				table.remove(Network["LostParts"],Index)
			end
			Network["PartOwnership"]["Enabled"] = false
			Network["Output"].Send(print,"PartOwnership Output : PartOwnership disabled.")
		else
			Network["Output"].Send(warn,"PartOwnership Output : PartOwnership already disabled.")
		end
	end)

	Network["Output"].Send(print,": Loaded.")
end
