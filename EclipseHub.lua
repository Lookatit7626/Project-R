local RunService = game:GetService("RunService")

local Library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Lookatit7626/Project-R/main/GUI%20Library.lua')))()
local Words = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Lookatit7626/Project-R/main/HateSpeechs.lua')))()

local GUI = Library.CreateGUI("Eclipse's HUB","rbxassetid://14497104058")

local Section = Library.CreateSection(GUI,"Home")

Library.CreateButton(Section,"Name","Hello! "..game.Players.LocalPlayer.Name)

Library.CreateButton(Section," ","")

Library.CreateButton(Section,"Motto","Gaming with ease")

Library.CreateButton(Section,"Credits","Engineered by ECLIPSE and Look At It | Tested by Look At It")
Library.CreateButton(Section,"NameGroup","Eclipse Software")

Library.CreateButton(Section," ","")

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

Library.CreateButton(Section2,"Bedwars","Bedwars",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AlSploit/AlSploit/main/Bedwars"))() end)

Library.CreateButton(Section2,"Dex","IY Mobile Dex",function()
	getgenv().Key = "Bash"
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3AIY%20Dex",true))() 
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
	pcall(function()
		local plr = game.Players.LocalPlayer
		local char = plr.Character
		if char.Humanoid.Health > 0 then
			if not char:FindFirstChildOfClass("Tool") then 
				local BackPackGC = plr.Backpack:GetChildren()
				for i = 1,#BackPackGC do
					if BackPackGC[i]:IsA('Tool') then
						char.Humanoid:EquipTool(BackPackGC[i])
						return
					end
				end
			end
		end
	end)
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
						coroutine.wrap(function()
							while Kill do
								game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UseItem"):FireServer()
								wait(.5)
							end
						end)()
						local Running
						Running = RunService.Heartbeat:Connect(function()
							local suc, err = pcall(function()
								if HumanoidInstance.Health > 0 then
									PlrHRP.CFrame = enemy.Head.CFrame * CFrame.new(-1.2,4,4.5) * CFrame.Angles(math.rad(-130),0,0)
									HumanoidInstance.Died:Connect(function()
										Kill = false
										Running:Disconnect()
									end)
								end
							end)
							PlrHRP.Parent.Humanoid.Died:Connect(function()
								Kill = false
								Running:Disconnect()
							end)
							if not suc then
								Kill = false
								Running:Disconnect()
							end
						end)
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

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Life Keeper","Autofarm Life Keeper LVL 8k",function()
	killLoop({'Life Keeper',"Life Keeper Boss"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Light","Autofarm Light LVL 15k",function()
	killLoop({'Light Knight',"Keeper of all Light"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Spirit","Autofarm Spirit LVL 25K",function()
	killLoop({'Spirit',"Spiritual Wisp"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Pumpkins","Autofarm Pumpkins LVL 27.5K",function()
	killLoop({'Pumpkin Minion',"Horseless Headman"})
end,1)

Library.CreateLoopButton(RPGSim,"RPGSim Autofarm Heaven","Autofarm Heaven LVL 37.5K",function()
	killLoop({'Angel',"God"})
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

local PS99 = Library.CreateSection(GUI,"Pet Sim 99")

Library.CreateLoopButton(PS99,"Auto Collect","Auto Collect",function()
	local suc, err = pcall(function()
		local OrbsFolder = game.Workspace['__THINGS'].Orbs:GetChildren()
		for i = 1, #OrbsFolder do
			local Part = nil

			local Model = OrbsFolder[i]:GetDescendants()
			for j = 1, #Model do
				if Model[j]:IsA('Part') then
					Part = Model[j]
					break
				end
			end
			local plrPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
			local pos : Vector3 = Part.Position
			local mag = Vector3.new(plrPos - pos).Magnitude

			if mag < 75 then
				local args = {
					[1] = {
						[1] = OrbsFolder[i].Name
					}
				}
				game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Orbs: Collect"):FireServer(unpack(args))
			end
		end
	end)
	local suc1, err1 = pcall(function()
		local LootbagsFolder = game.Workspace['__THINGS'].Lootbags:GetChildren()
		for i = 1, #LootbagsFolder do

			local Part = nil

			local Model = LootbagsFolder[i]:GetDescendants()
			for j = 1, #Model do
				if Model[j]:IsA('Part') then
					Part = Model[j]
					break
				end
			end
			local plrPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
			local pos : Vector3 = Part.Position
			local mag = Vector3.new(plrPos - pos).Magnitude

			if mag < 75 then
				local args = {
					[1] = {
						[1] = LootbagsFolder[i].Name
					}
				}
				game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Lootbags_Claim"):FireServer(unpack(args))
			end
		end
	end)

	if not suc1 then
		print('Lootbag err: '..err1)
	end
	if not suc then
		print('Orbs err: '..err)
	end
end,1)

Library.CreateLoopButton(PS99,"Auto Farm","Auto Farm",function()
	local suc, err = pcall(function()
		local BreakablesFolder = game.Workspace['__THINGS'].Breakables:GetChildren()
		for i = 1, #BreakablesFolder do
			local Hitbox = nil

			local Model = BreakablesFolder[i]:GetDescendants()
			for j = 1, #Model do
				print(Model[j].Name)
				if Model[j]:IsA('Part') then
					print('found')
					Hitbox = Model[j]
					break
				end
			end

			if Hitbox ~= nil then
				local plrPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
				local pos : Vector3 = Hitbox.Position
				local mag = Vector3.new(plrPos - pos).Magnitude

				if mag < 65 then
					local args = {
						[1] = BreakablesFolder[i].Name
					}
					game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Breakables_PlayerDealDamage"):FireServer(unpack(args))
				end
			else
				print('Err : Cant find hixbox for coin!')
			end
		end
	end)
	if not suc then
		print('Farm err: '..err)
	end
end,.2)

--Library.CreateNotification('Fling alert!','We detected that you got flung and neuturalised your velocity')
