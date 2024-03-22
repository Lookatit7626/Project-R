-- Welcome to Hydrogen MacOS!
local Library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Lookatit7626/Project-R/main/GUI%20Library.lua')))()
local Words = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Lookatit7626/Project-R/main/HateSpeechs.lua')))()

local GUI = Library.CreateGUI("Eclipse's HUB","rbxassetid://14497104058")

local Section = Library.CreateSection(GUI,"Home")

Library.CreateButton(Section,"Name","Enforcing State Security GameWide")

Library.CreateButton(Section,"Delete","Delete Hub",function()
	Library.CreateNotification("Deleting","Deleting HUB...")
	wait(2)
	GUI:Destroy() 
end)

local Section2 = Library.CreateSection(GUI,"UniversalScript")

Library.CreateButton(Section2,"Build A Boat","Build a Boat Farm",function() loadstring(game:HttpGet("https://pastebin.com/raw/h9AnD9d1"))() end)

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
	if not Set then
		Set = true
		if not Event then
			Event = game.Players.PlayerChatted:Connect(function(chatType, plr, msg)
				msg = string.lower(msg)
				if chatType ~= Enum.PlayerChatType.Whisper and plr ~= game.Players.LocalPlayer then
					for i, v in next, Words do
						if string.find(msg, i) then
							local suc, er = pcall(function()
								game.Players:ReportAbuse(game.Players:FindFirstChild(plr.name), v, 'using hate speech and making me feel very shamed!')
							end)
							if not suc then
								Library.CreateNotification('Reporting issue!',"Couldn't report due to the reason: " .. er .. ' | AR')
								return warn("Couldn't report due to the reason: " .. er .. ' | AR')
							else
								Library.CreateNotification('Reported',"Reported a person for : "..v..", Person: "..plr.Name..".")
							end
						end
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
	local args = {
    		[1] = 10000
	}

	game:GetService("ReplicatedStorage"):WaitForChild("GTycoonClient"):WaitForChild("Remotes"):WaitForChild("GrabDrops"):FireServer(unpack(args))

end,0.001)

Library.CreateLoopButton(MonkeySim,"MonkeySim+100k","100k Bananas",function()
	local args = {
    		[1] = 100000
	}

	game:GetService("ReplicatedStorage"):WaitForChild("GTycoonClient"):WaitForChild("Remotes"):WaitForChild("GrabDrops"):FireServer(unpack(args))

end,0.001)

Library.CreateLoopButton(MonkeySim,"MonkeySim+Rank","Randomised (1,~100000) Bananas",function()
	local args = {
    		[1] = math.random(1,100000)
	}

	game:GetService("ReplicatedStorage"):WaitForChild("GTycoonClient"):WaitForChild("Remotes"):WaitForChild("GrabDrops"):FireServer(unpack(args))

end,0.0001)

Library.CreateLoopButton(MonkeySim,"MonkeySimDesposit","Despoit",function()
	game:GetService("ReplicatedStorage"):WaitForChild("GTycoonClient"):WaitForChild("Remotes"):WaitForChild("DepositDrops"):FireServer()
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
