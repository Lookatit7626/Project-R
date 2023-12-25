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

local HeavenSword = Library.CreateSection(GUI,"Heaven Sword")

local button = Library.CreateButton(HeavenSword,"Kill All","Kill All (NPCS)",function()
	while true do local args = {
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

		wait(.05)
	end
end)
local button = Library.CreateButton(HeavenSword,"InfHP","Inf HP all",function()
	while true do

		local args = {
			[1] = "InvA10",
			[2] = 1000,
			[3] = "HP",
			[4] = "Potion"
		}

		game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("UseItem"):FireServer(unpack(args))

		wait(.5)

	end

end)
local button = Library.CreateButton(HeavenSword,"HealAll","Heal All",function()
	while true do local args = {
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

		wait(.05)
	end
end)
local button = Library.CreateButton(HeavenSword,"Immunity","Immunity",function()
	while true do local args = {
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

		wait(.05)
	end
end)
local button = Library.CreateButton(HeavenSword,"Fireball","Fireball",function()
	while true do

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

		wait(.1)
	end
end)
