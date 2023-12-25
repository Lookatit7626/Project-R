local Library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Lookatit7626/Project-R/main/GUI%20Library.lua')))()

local GUI = Library.CreateGUI("Eclipse's HUB","rbxassetid://14497104058")

local Section = Library.CreateSection(GUI,"Home")

local button1 = Library.CreateButton(Section,"Name","Enforcing State Security GameWide")

local button2 = Library.CreateButton(Section,"Delete","Delete Hub",function()
	Library.CreateNotification("Deleting","Deleting HUB...")
	wait(2)
	GUI:Destroy() 
end)

local Section2 = Library.CreateSection(GUI,"UniversalScript")

local button3 = Library.CreateButton(Section2,"Build A Boat","Build a Boat Farm",function() loadstring(game:HttpGet("https://pastebin.com/raw/h9AnD9d1"))() end)

local button3 = Library.CreateButton(Section2,"Vape V4","Vape V4",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))() end)

local button4 = Library.CreateButton(Section2,"Dex","IY Mobile Dex",function()
	getgenv().Key = "Bash"
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3AIY%20Dex",true))() 
end)

local button5 = Library.CreateButton(Section2,"IY","IY",function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end)

local button6 = Library.CreateButton(Section2,"Fling","Custom Fling Script",function() loadstring(game:HttpGet("https://pastebin.com/raw/WnJwFXgR"))() end)

local PlayerScript = Library.CreateSection(GUI,"Player Script")

Library.CreateSlider(PlayerScript,"Speed",'Speed',500,function(Speed)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed
end)

Library.CreateSlider(PlayerScript,"Jump",'Jump',1000,function(Speed)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = Speed
end)

Library.CreateLoopButton(PlayerScript,"InfJump", "Inf Jump", function()
	local Test = math.random(1,99999999)
	local AA = Test
	local Set = nil
	if not Set then
		Set = game:GetService('UserInputService').JumpRequest:Connect(function()
			script.Parent.Humanoid:ChangeState('Jumping')
		end)
	end
	coroutine.wrap(function()
		wait(1)
		if AA == Test then
			
		end
	end)()
end,0.1)

local lastpos = nil
Library.CreateLoopButton(PlayerScript,"AntiFling", "AntiFling", function()
	local humanoidroot = script.Parent.HumanoidRootPart
	local primary = humanoidroot
	if primary.AssemblyLinearVelocity.Magnitude > 250 or primary.AssemblyAngularVelocity.Magnitude > 250  then
		primary.AssemblyLinearVelocity = Vector3.new(0,0,0)
		primary.AssemblyAngularVelocity = Vector3.new(0,0,0)
		primary.CFrame = lastpos 
	end
	lastpos = primary.CFrame
end,0.01)

Library.CreateButton(PlayerScript,"resetGravity", "Reset Gravity to 196.2 ( Default )", function()
	game.Workspace.Gravity = 196.2
end)

Library.CreateSlider(PlayerScript,"Gravity",'Gravity',250,function(Speed)
	game.Workspace.Gravity = Speed
end)

local HeavenSword = Library.CreateSection(GUI,"Heaven Sword")

local button = Library.CreateLoopButton(HeavenSword,"Kill All","Kill All (NPCS)",function()
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
local button = Library.CreateLoopButton(HeavenSword,"InfHP","Inf HP all",function()

		local args = {
			[1] = "InvA10",
			[2] = 1000,
			[3] = "HP",
			[4] = "Potion"
		}

		game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("UseItem"):FireServer(unpack(args))
end,0.05)
local button = Library.CreateLoopButton(HeavenSword,"HealAll","Heal All",function()

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
local button = Library.CreateLoopButton(HeavenSword,"Immunity","Immunity",function()

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
local button = Library.CreateLoopButton(HeavenSword,"Fireball","Fireball",function()

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
