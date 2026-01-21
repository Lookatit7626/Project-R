-- Gui to Lua
-- Version: 3.2

-- Instances:
local lplr = game:GetService("Players").LocalPlayer
local PathFindingService = game:GetService("PathfindingService")
local TweenService = game:GetService("TweenService")
local UserInputSer = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

local GUI = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Cashier = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local Cook = Instance.new("Frame")
local TextButton_2 = Instance.new("TextButton")
local Boxer = Instance.new("Frame")
local TextButton_3 = Instance.new("TextButton")
local Delivery = Instance.new("Frame")
local TextButton_4 = Instance.new("TextButton")
local Supplier = Instance.new("Frame")
local TextButton_5 = Instance.new("TextButton")
local SlowDown = Instance.new("Frame")
local TextButton_6 = Instance.new("TextButton")
local SlowWalk = Instance.new("Frame")
local TextButton_7 = Instance.new("TextButton")
local AutoPay = Instance.new("Frame")
local TextButton_8 = Instance.new("TextButton")

function writefileTest()
	if writefile then
		return true
	end
end
local Data = {
	["SlowDownBool"] = false;
	["TeleportOrWalkBool"] = false;
	["AutoPayBool"] = false;
}


local function SAVEFILE()
	if not writefileTest() then
		return warn("writefileTest() FAILED")
	end
	local suc, err = pcall(function()
		if readfile('WORKATPIZZAPLACESSAVE.json') == nil then
			writefile('WORKATPIZZAPLACESSAVE.json',"")
			task.wait(1)
		end
		writefile('WORKATPIZZAPLACESSAVE.json',HttpService:JSONEncode(Data))
	end)
	return suc, err
end

local Count = 0
if writefileTest() then
	local PrivateSuc, PrivateErr
	repeat
		Count += 1
		if Count > 2 then
			task.wait(1)
		end
		PrivateSuc, PrivateErr = pcall(function()
			if readfile('WORKATPIZZAPLACESSAVE.json') ~= nil then
				Data = HttpService:JSONDecode(readfile('WORKATPIZZAPLACESSAVE.json'))
			else
				writefile('WORKATPIZZAPLACESSAVE.json',"{}")
				task.wait(0.1)
				Data = HttpService:JSONDecode(readfile('WORKATPIZZAPLACESSAVE.json'))
			end
		end)
		if not PrivateSuc then
			print(PrivateErr)
			print("CREATING FILE")
			writefile('WORKATPIZZAPLACESSAVE.json',"{}")
			task.wait(1)
		end
		warn("TRYING ", Count)
	until PrivateSuc == true or Count > 10
end

if Data == nil or Data == {} or Data == "" then
	print("NULL")
	Data = {
		["SlowDownBool"] = false;
		["TeleportOrWalkBool"] = false;
		["AutoPayBool"] = false;
	}
end


--Properties:

GUI.Parent = game.CoreGui
GUI.Enabled = true
GUI.ResetOnSpawn = false
GUI.DisplayOrder = 1000000


Main.Name = "Main"
Main.Parent = GUI
Main.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.51065892, 0, 0.441527426, 0)
Main.Size = UDim2.new(0.302325577, 0, 0.275954634, 0)
Main.Visible = false
Main.Active = true
Main.Draggable = true

local DraggingButtonDown = false

local MouseIsOnGUI = false
local PlayerMouse =  lplr:GetMouse()
local IntXMouse, IntYMouse, IntXYPosTopbar

Main.MouseEnter:Connect(function()
	MouseIsOnGUI = true
end)

Main.MouseLeave:Connect(function()
	MouseIsOnGUI = false
end)

UserInputSer.InputBegan:Connect(function(inputobj,istyping)

	if inputobj.UserInputType == Enum.UserInputType.MouseButton1 and MouseIsOnGUI then
		DraggingButtonDown = true
	end

	if DraggingButtonDown then
		if Main.Visible and MouseIsOnGUI then
			IntXMouse, IntYMouse = PlayerMouse.X, PlayerMouse.Y
			IntXYPosTopbar = Main.Position
			repeat
				Main.Position = IntXYPosTopbar - UDim2.new(0, IntXMouse - PlayerMouse.X, 0, IntYMouse - PlayerMouse.Y)
				RunService.RenderStepped:Wait()
			until not DraggingButtonDown or not Main.Visible
			DraggingButtonDown = false
		end
	end
end)

UserInputSer.InputEnded:Connect(function(inputobj)
	if inputobj.UserInputType == Enum.UserInputType.MouseButton1  then
		--print("DONE")
		DraggingButtonDown = false
	end
end)

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0, 0, 0.0409356728, 0)
Title.Size = UDim2.new(1, 0, 0.118918911, 0)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Work at a pizza place [BY ICARUS]"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

Cashier.Name = "Cashier"
Cashier.Parent = Main
Cashier.BackgroundColor3 = Color3.fromRGB(121, 35, 35)
Cashier.BorderColor3 = Color3.fromRGB(0, 0, 0)
Cashier.BorderSizePixel = 0
Cashier.Position = UDim2.new(0.0351758115, 0, 0.223550007, 0)
Cashier.Size = UDim2.new(0.480511606, 0, 0.106148221, 0)

TextButton.Parent = Cashier
TextButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Size = UDim2.new(0.852287531, 0, 1, 0)
TextButton.Font = Enum.Font.SourceSansBold
TextButton.Text = "Cashier :"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

Cook.Name = "Cook"
Cook.Parent = Main
Cook.BackgroundColor3 = Color3.fromRGB(121, 35, 35)
Cook.BorderColor3 = Color3.fromRGB(0, 0, 0)
Cook.BorderSizePixel = 0
Cook.Position = UDim2.new(0.0351758115, 0, 0.369495958, 0)
Cook.Size = UDim2.new(0.480511606, 0, 0.106148221, 0)

TextButton_2.Parent = Cook
TextButton_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BorderSizePixel = 0
TextButton_2.Size = UDim2.new(0.852287531, 0, 1, 0)
TextButton_2.Font = Enum.Font.SourceSansBold
TextButton_2.Text = "Cook :"
TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.TextScaled = true
TextButton_2.TextSize = 14.000
TextButton_2.TextWrapped = true

Boxer.Name = "Boxer"
Boxer.Parent = Main
Boxer.BackgroundColor3 = Color3.fromRGB(121, 35, 35)
Boxer.BorderColor3 = Color3.fromRGB(0, 0, 0)
Boxer.BorderSizePixel = 0
Boxer.Position = UDim2.new(0.0351758115, 0, 0.510036469, 0)
Boxer.Size = UDim2.new(0.480511606, 0, 0.106148221, 0)

TextButton_3.Parent = Boxer
TextButton_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_3.BorderSizePixel = 0
TextButton_3.Size = UDim2.new(0.852287531, 0, 1, 0)
TextButton_3.Font = Enum.Font.SourceSansBold
TextButton_3.Text = "Boxer :"
TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_3.TextScaled = true
TextButton_3.TextSize = 14.000
TextButton_3.TextWrapped = true

Delivery.Name = "Delivery"
Delivery.Parent = Main
Delivery.BackgroundColor3 = Color3.fromRGB(121, 35, 35)
Delivery.BorderColor3 = Color3.fromRGB(0, 0, 0)
Delivery.BorderSizePixel = 0
Delivery.Position = UDim2.new(0.0351758115, 0, 0.655982435, 0)
Delivery.Size = UDim2.new(0.480511606, 0, 0.106148221, 0)

TextButton_4.Parent = Delivery
TextButton_4.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_4.BorderSizePixel = 0
TextButton_4.Size = UDim2.new(0.852287531, 0, 1, 0)
TextButton_4.Font = Enum.Font.SourceSansBold
TextButton_4.Text = "Delivery :"
TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_4.TextScaled = true
TextButton_4.TextSize = 14.000
TextButton_4.TextWrapped = true

Supplier.Name = "Supplier"
Supplier.Parent = Main
Supplier.BackgroundColor3 = Color3.fromRGB(121, 35, 35)
Supplier.BorderColor3 = Color3.fromRGB(0, 0, 0)
Supplier.BorderSizePixel = 0
Supplier.Position = UDim2.new(0.0351758115, 0, 0.807333767, 0)
Supplier.Size = UDim2.new(0.480511606, 0, 0.106148221, 0)

TextButton_5.Parent = Supplier
TextButton_5.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_5.BorderSizePixel = 0
TextButton_5.Size = UDim2.new(0.852287531, 0, 1, 0)
TextButton_5.Font = Enum.Font.SourceSansBold
TextButton_5.Text = "Supplier :"
TextButton_5.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_5.TextScaled = true
TextButton_5.TextSize = 14.000
TextButton_5.TextWrapped = true

SlowDown.Name = "SlowDown"
SlowDown.Parent = Main
SlowDown.BackgroundColor3 = Color3.fromRGB(121, 35, 35)
SlowDown.BorderColor3 = Color3.fromRGB(0, 0, 0)
SlowDown.BorderSizePixel = 0
SlowDown.Position = UDim2.new(0.564022183, 0, 0.218144596, 0)
SlowDown.Size = UDim2.new(0.413203865, 0, 0.106148221, 0)

TextButton_6.Parent = SlowDown
TextButton_6.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_6.BorderSizePixel = 0
TextButton_6.Size = UDim2.new(0.852287531, 0, 1, 0)
TextButton_6.Font = Enum.Font.SourceSansBold
TextButton_6.Text = "Slow mode :"
TextButton_6.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_6.TextScaled = true
TextButton_6.TextSize = 14.000
TextButton_6.TextWrapped = true

SlowWalk.Name = "SlowWalk"
SlowWalk.Parent = Main
SlowWalk.BackgroundColor3 = Color3.fromRGB(121, 35, 35)
SlowWalk.BorderColor3 = Color3.fromRGB(0, 0, 0)
SlowWalk.BorderSizePixel = 0
SlowWalk.Position = UDim2.new(0.564022183, 0, 0.364090532, 0)
SlowWalk.Size = UDim2.new(0.413203865, 0, 0.106148221, 0)

TextButton_7.Parent = SlowWalk
TextButton_7.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_7.BorderSizePixel = 0
TextButton_7.Size = UDim2.new(0.852287531, 0, 1, 0)
TextButton_7.Font = Enum.Font.SourceSansBold
TextButton_7.Text = "Only walk :"
TextButton_7.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_7.TextScaled = true
TextButton_7.TextSize = 14.000
TextButton_7.TextWrapped = true

AutoPay.Name = "AutoPay"
AutoPay.Parent = Main
AutoPay.BackgroundColor3 = Color3.fromRGB(121, 35, 35)
AutoPay.BorderColor3 = Color3.fromRGB(0, 0, 0)
AutoPay.BorderSizePixel = 0
AutoPay.Position = UDim2.new(0.564022183, 0, 0.504631102, 0)
AutoPay.Size = UDim2.new(0.413203865, 0, 0.106148221, 0)

TextButton_8.Parent = AutoPay
TextButton_8.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_8.BorderSizePixel = 0
TextButton_8.Size = UDim2.new(0.852287531, 0, 1, 0)
TextButton_8.Font = Enum.Font.SourceSansBold
TextButton_8.Text = "Autopay :"
TextButton_8.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_8.TextScaled = true
TextButton_8.TextSize = 14.000
TextButton_8.TextWrapped = true


--MAIN SCRIPT

local Red = Color3.fromRGB(121, 35, 35)
local Green = Color3.fromRGB(35, 121, 45)

local AutoCashierBool = false
local AutoCookBool = false
local AutoBoxBool = false
local AutoDeliverBool = false
local AutoSupplyBool = false

local AutoPayBool = false
local SlowDownBool = false
local TeleportOrWalkBool = false

local CurrentWalkPosition = ""

local TeleportOrWalk
local TimeToWaitBeforeNextTask = 2

for i,Frame in pairs(Main:GetChildren()) do
	coroutine.wrap(function()
		local ButtonSuc, ButtonErr = pcall(function()
			if Frame:FindFirstChildOfClass("TextButton") then
				local Button = Frame:FindFirstChildOfClass("TextButton")

				Button.MouseButton1Up:Connect(function()
					local ON = Frame.BackgroundColor3 == Color3.fromRGB(35, 121, 45)
					Frame.BackgroundColor3 = not ON and Color3.fromRGB(35, 121, 45) or Color3.fromRGB(121, 35, 35)

					if Frame == Cashier then
						AutoCashierBool = not ON

					elseif Frame == Cook then
						AutoCookBool = not ON

					elseif Frame == Boxer then
						AutoBoxBool = not ON

					elseif Frame == Delivery then
						AutoDeliverBool = not ON

					elseif Frame == Supplier then
						AutoSupplyBool = not ON

					elseif Frame == SlowDown then
						SlowDownBool = not ON

						if SlowDownBool then
							if SlowWalk then
								TimeToWaitBeforeNextTask = 3
							else
								TimeToWaitBeforeNextTask = 10
							end
						else
							TimeToWaitBeforeNextTask = 2
						end

						Data["SlowDownBool"] = not ON
						SAVEFILE()

					elseif Frame == SlowWalk then
						TeleportOrWalkBool = not ON

						if TeleportOrWalkBool then
							if SlowWalk then
								TimeToWaitBeforeNextTask = 3
							end
						else
							if SlowWalk then
								TimeToWaitBeforeNextTask = 10
							end
						end

						Data["TeleportOrWalkBool"] = not ON
						SAVEFILE()

					elseif Frame == AutoPay then
						AutoPayBool = not ON

						Data["AutoPayBool"] = not ON
						SAVEFILE()
					end
				end)
			end
		end)
		if not ButtonSuc then
			warn(Frame.Name, "HAS AN ERROR", ButtonErr)
		end
	end)()
end

local bb = game:GetService('VirtualUser')
game:GetService("Players").LocalPlayer.Idled:connect(function()
	bb:CaptureController()
	bb:ClickButton2(Vector2.new())
	print("tried to get kicked!")
end)


local FireServerEvent = loadstring(game:HttpGet("https://raw.githubusercontent.com/Lookatit7626/Project-R/refs/heads/main/WorkAtAPizzaPlaceInternal.lua"))()
if FireServerEvent == nil then
	warn("THIS IS NIL")
	GUI:Destroy()
	error("ERROR : NIL")
else
	Main.Visible = true
end

local function CheckForWhich(id)
	if id == "rbxassetid://3540530535" then
		return "SausagePizza"
	elseif id == "rbxassetid://3540529917" then
		return "PepperoniPizza"
	elseif id == "rbxassetid://2512571151" or id == "rbxassetid://2512441325" or id == "http://www.roblox.com/Thumbs/Asset.ashx?Width=110&Height=110&AssetID=2512441325" then
		return "MountainDew"
	elseif id == "rbxassetid://3540529228" then
		return "CheesePizza"
	else
		return nil
	end
end

local PC = game:GetService("Players").LocalPlayer.PlayerGui.GuiTop.Paycheck
PC:GetPropertyChangedSignal("Visible"):Connect(function()
	coroutine.wrap(function()
		if PC.Visible and AutoPayBool then
			PC.Visible = false
			local args = {
				PC.Title.Text
			}	
			repeat
				game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Menu.Backpack.Visible = true
				game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Menu.ChatWindow.Visible = true
				game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Menu.PlayerList.Visible = true
				task.wait(.1)
			until game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Menu.PlayerList.Visible == true

			workspace:WaitForChild("Main"):WaitForChild("GivePaycheck"):FireServer(unpack(args))
			print("NO MORE GUI BOYS")
		end
	end)()
end)

local OriginalCFrame

local CashierTickCheck
local CashierMayContinue = true
local CashierCFramePos = CFrame.new(20.8422127, 4.77383709, 80.847641, 0.634090424, -9.10912235e-09, 0.773258924, 5.84979354e-09, 1, 6.98320335e-09, -0.773258924, 9.54225102e-11, 0.634090424)
local CashierMayContinueRATELIMIT = 0

local CookTickCheck
local CookMayContinue = true
local MayProceedWithNextOperation = true
local CookCFrameToHide = CFrame.new(57.9154587, 3.80013371, 46.2564087, 0.0372269899, -5.44392726e-08, 0.999306858, -3.53651046e-08, 1, 5.57944837e-08, -0.999306858, -3.7417653e-08, 0.0372269899)
local CookPartToHide = workspace.WallPizzaPlaceRemove or game:GetService("ReplicatedStorage").WallPizzaPlaceRemove
local FOUNDOVENRateLimit = 0
local WaitingValue = 0
local AmountToLoop = 0
local COOKSUC, COOKERR

local BoxerToHideCFrame = CFrame.new(56.8154678, 3.79999995, -1.35138249, 0.801086068, -1.09952879e-07, -0.598549128, 9.44286711e-08, 1, -5.73175747e-08, 0.598549128, -1.06038902e-08, 0.801086068)
local BOXINGACT_RATELIMIT = 0

local DeliveryHideCFrame = CFrame.new(86.2345657, -6.63160801, -175.006973, -0.988380313, -3.51493412e-09, 0.152001053, -8.91564778e-09, 1, -3.4849208e-08, -0.152001053, -3.57994594e-08, -0.988380313)
local DeliveryPSuc, DeliveryPErr
local ENSUREHEISTHERE_RateLimit = 0
local FinishedDelivery = false
local FinishDeliveryRateLimit = 0

--Supplier Big Stuff
local Display = workspace.SupplyCounters.Model

local ToHideCFrame = CFrame.new(6.14360142, 6, -1046.64453)
local RightSideCFrame = CFrame.new(14.14360142, 6, -1046.64453)
local LeftSideCFrame = CFrame.new(-2, 6, -1046.64453)


--ToWalkPos

local function PlusMinus(Distribution)
	return ( math.random(Distribution*10) - math.round(Distribution*10/2) ) / 10
end

local CashierToWalk = Vector3.new(49.8 + PlusMinus(2), 3.799, 83 + PlusMinus(2))
local CookToWalk = Vector3.new(37.8, 3.799, 54.5)
local BoxerToWalk = Vector3.new(60+ PlusMinus(2), 3.799, 12.36+ PlusMinus(2))
local LayoutOrder = 18
--local LayoutOrderTimeout = 0

local DefaultToHide = CFrame.new(46.2959862, 3.39802527, -18.3784046, 0.999943018, 3.89492563e-08, -0.0106764864, -3.94884836e-08, 1, -5.02952844e-08, 0.0106764864, 5.07140179e-08, 0.999943018)

local SpeedToGo = 45
local GoRateLimit = 0


--local DeliveryToWalk = Vector3.new()
--local SupplierToWalk = Vector3.new()

local LimitAmount = 30
local LetsGo = false

local Values = nil
local Images = {}
local OriginalPos = {}
local Buttons = {}

local SlotOrders = {}

local ChosenPizza = {}

for i,v in pairs(workspace.Orders:GetChildren()) do
	--SlotOrders[math.abs(v.LayoutOrder.Value-19)] = v
	SlotOrders[v.LayoutOrder.Value] = v
end

local ToProtectPart = Instance.new("Part")
ToProtectPart.Parent = workspace
ToProtectPart.Anchored = true
ToProtectPart.Name = "ToProtectFromFalling"
ToProtectPart.Position = Vector3.new(0,-30,0)
ToProtectPart.Size = Vector3.new(2048, 10, 2048)

local SUC, ERR = pcall(function()
	if Data then
		if Data["SlowDownBool"] then
			SlowDown.BackgroundColor3 = Color3.fromRGB(35, 121, 45)
			SlowDownBool = true
		end
		if Data["TeleportOrWalkBool"] then
			SlowWalk.BackgroundColor3 = Color3.fromRGB(35, 121, 45)
			TeleportOrWalkBool = true
		end
		if Data["AutoPayBool"] then
			AutoPay.BackgroundColor3 = Color3.fromRGB(35, 121, 45)
			AutoPayBool = true
		end
	end
end)

if not SUC then
	warn("ERROR WHEN LOADING SAVE : ", ERR)
end

local function ToAnchorOrNot(Part,bool)
    pcall(function()
        game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Events"):WaitForChild(""):FireServer(unpack({
            Part,
            "Anchored",
            bool
        }))
    end)
end

local ALLSUC, ALLERR

coroutine.wrap(function()
	while task.wait(60) do
		if AutoPayBool then
			local args = {
				PC.Title.Text
			}
			workspace:WaitForChild("Main"):WaitForChild("GivePaycheck"):FireServer(unpack(args))
		end
	end
end)()

local customersServed = 0
while task.wait(0.1) do
	task.wait(1)
	--print("DEBUG : REMOVE BEFORE GOING #0")
	local ALLSUC, ALLERR = pcall(function()
		--print("DEBUG : REMOVE BEFORE GOING #1")
		if AutoCashierBool or AutoCookBool or AutoBoxBool or AutoDeliverBool or AutoSupplyBool then
			if OriginalCFrame == nil then
				print("DEBUG : SAVED SPOT")
				OriginalCFrame = lplr.Character.HumanoidRootPart.CFrame
			end
		else
			if OriginalCFrame then
				CookPartToHide.CanCollide = true
				lplr.Character.HumanoidRootPart.CFrame = OriginalCFrame
				OriginalCFrame = nil
			end
			return
		end
		--print("DEBUG : REMOVE BEFORE GOING #2")
		--print("RAN")


		if AutoCashierBool then
            customersServed = 0
			if TeleportOrWalkBool and CurrentWalkPosition ~= "Cashier" then
				if CurrentWalkPosition == "Delivery" or CurrentWalkPosition == "Supplier" then
					lplr.Character.HumanoidRootPart.CFrame = DefaultToHide
					task.wait(0.5)
				end
				if (lplr.Character.HumanoidRootPart.Position - DeliveryHideCFrame.Position).Magnitude < 5 then
					lplr.Character.HumanoidRootPart.CFrame = DefaultToHide
					task.wait(0.5)
				end
				local NewPath1 = PathFindingService:CreatePath()
				NewPath1:ComputeAsync(lplr.Character.HumanoidRootPart.Position, CashierToWalk)
				--print(CashierCFramePos.Position)
				--print(#NewPath:GetWaypoints())

				coroutine.wrap(function()
					for _, WP in pairs(NewPath1:GetWaypoints()) do
						if lplr.Character.Humanoid.Sit then
							lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						end
						lplr.Character.Humanoid:MoveTo(WP.Position)
						lplr.Character.Humanoid.MoveToFinished:Wait()
					end
					CurrentWalkPosition = "Cashier"
				end)()

				GoRateLimit = 0
				repeat
					task.wait(1)
					GoRateLimit += 1
				until GoRateLimit> 35 or CurrentWalkPosition == "Cashier"
				if CurrentWalkPosition ~= "Cashier" then
					error("DEBUG : Cashier FAILED TO WALK")
				end

				print("DEBUG : Finsihed walking!")
			end
			CashierMayContinueRATELIMIT = 0
			CashierMayContinue = true

			repeat
                for i,v in pairs(workspace.Customers:GetChildren()) do
                    task.wait(.15)

                    if SlowDownBool then
                        repeat
                            task.wait(0.1)
                            CashierMayContinueRATELIMIT += 1
                        until CashierMayContinue or CashierMayContinueRATELIMIT > 60
                        if CashierMayContinueRATELIMIT > 60 then
                            CashierMayContinue = true
                            return warn("DEBUG : CASHIER RATE LIMIT")
                        end
                    end

                    if not AutoCashierBool then
                        error("forced to error to halt program")
                    end

                    if customersServed > 10 then
                        return warn("Served more than 10 people!!!")
                    end

                    local Head = v.Head
                    if (Vector3.new(55, 4, 84) - v.HumanoidRootPart.Position).Magnitude > 31 then
                        --print(v.HumanoidRootPart.AssemblyLinearVelocity.Magnitude)
                        error("Too far boy")
                    end

                    local CashierTickCheckLocal = tick()
                    CashierTickCheck = CashierTickCheckLocal
                    CashierMayContinue = false
                    
                    coroutine.wrap(function()
                        local suc,err = pcall(function()
                            print("OK")
                            if not TeleportOrWalkBool then
                                lplr.Character.HumanoidRootPart.CFrame = CashierCFramePos
                            end

                            if Head:FindFirstChild("Dialog") and Head.InUse.Value ~= true and CheckForWhich(Head.SimpleDialogBillboard.FoodOrder.Image) == nil then
                                if SlowDownBool then
                                    task.wait(2)
                                end
                                if CheckForWhich(Head.SimpleDialogBillboard.FoodOrder.Image) == nil then
                                    local args = {
                                        "ResponseSelected",
                                        Head:WaitForChild("DialogSimple"):WaitForChild("Correct"),
                                        Head
                                    }
                                    workspace:WaitForChild("Dialog"):FireServer(unpack(args))
                                end

                                repeat
                                    task.wait(.1)
                                until CheckForWhich(Head.SimpleDialogBillboard.FoodOrder.Image) ~= nil
                                task.wait(.25)

                            end

                            if CheckForWhich(Head.SimpleDialogBillboard.FoodOrder.Image) ~= nil then
                                FireServerEvent(nil,"OrderComplete", v, CheckForWhich(Head.SimpleDialogBillboard.FoodOrder.Image),workspace:WaitForChild("Register1"))
                                customersServed += 1
                            end

                            if CashierTickCheck == CashierTickCheckLocal then
                                print("Proceed!")
                                CashierMayContinue = true
                            end
                        end)
                    end)()
                end
                repeat
                    task.wait()
                until CashierMayContinue
            until customersServed > 10
			task.wait(TimeToWaitBeforeNextTask)
		end


		if AutoCookBool then
			print("NEW ORDERS")
			--for i,v in pairs(SlotOrders) do
			COOKSUC, COOKERR = pcall(function()
				if not CookMayContinue then
					error("WAIT!")
				end
				--print("S. DEBUG : FOUND ONE")
				--print(CheckForWhich(v.SG.ImageLabel.Image),  v.SG.ImageLabel.Image )

				CookPartToHide.CanCollide = false
				--lplr.Character.HumanoidRootPart.CFrame = CookCFrameToHide
				if TeleportOrWalkBool and CurrentWalkPosition ~= "Cook" then
					if CurrentWalkPosition == "Delivery" or CurrentWalkPosition == "Supplier" then
						lplr.Character.HumanoidRootPart.CFrame = DefaultToHide
						task.wait(0.5)
					end
					if (lplr.Character.HumanoidRootPart.Position - DeliveryHideCFrame.Position).Magnitude < 5 then
						lplr.Character.HumanoidRootPart.CFrame = DefaultToHide
						task.wait(0.5)
					end
					local NewPath = PathFindingService:CreatePath()
					NewPath:ComputeAsync(lplr.Character.HumanoidRootPart.Position, CookToWalk)

					coroutine.wrap(function()
						for _, WP in pairs(NewPath:GetWaypoints()) do
							if lplr.Character.Humanoid.Sit then
								lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
							end
							lplr.Character.Humanoid:MoveTo(WP.Position)
							lplr.Character.Humanoid.MoveToFinished:Wait()
						end
						CurrentWalkPosition = "Cook"
					end)()

					GoRateLimit = 0
					repeat
						task.wait(1)
						GoRateLimit += 1
					until GoRateLimit> 35 or CurrentWalkPosition == "Cook"
					if CurrentWalkPosition ~= "Cook" then
						error("DEBUG : Cook FAILED TO WALK")
					end

				elseif not TeleportOrWalkBool then
					lplr.Character.HumanoidRootPart.CFrame = CookCFrameToHide
				end

				local function TOCOOK(v)
					if not AutoCookBool then
						return warn("Force Stop")
					end
					if v.SG.ImageLabel.Image == "" or v.SG.ImageLabel.Image == nil or CheckForWhich(v.SG.ImageLabel.Image) == nil then
						--print("S. DEBUG : Nothing")
						return warn("Nil")
					end
					if CheckForWhich(v.SG.ImageLabel.Image) == "MountainDew" then
						if workspace.AllMountainDew:FindFirstChild("MountainDew") then
							FireServerEvent(nil,"UpdateProperty",workspace.AllMountainDew:FindFirstChild("MountainDew"),"CFrame",CFrame.new(55, 4, 37.5, 1, 0, 0, 0, 1, 0, 0, 0, 1))
							task.wait(3)
						end
					elseif CheckForWhich(v.SG.ImageLabel.Image) ~= nil then
						local MayProceedWithNextOperationRL = 0
						repeat
							task.wait(1)
							print("DEBUG : COOK WAITING TO PROCEED")
							MayProceedWithNextOperationRL += 1
						until MayProceedWithNextOperation or MayProceedWithNextOperationRL > 130
						if MayProceedWithNextOperationRL > 120 then
							MayProceedWithNextOperation = true
							CookMayContinue = true
							return warn("DEBUG : COOK took too long!")
						end
						print("OK NEXT")

						local Dough
						repeat
							Dough = workspace.AllDough:GetChildren()[math.random(#workspace.AllDough:GetChildren())]
							if Dough.HasBugs.Value or Dough.Cold.Value or Dough.IsBurned.Value then
								print("THROW THAT AWAY")
								local args = {
									Dough,
									"CFrame",
									CFrame.new(47.90007781982422, 7.000152111053467, 72.49983978271484, 1, 0, -0, 0, 0, 1, 0, -1, 0)
								}
								FireServerEvent(nil,"UpdateProperty",unpack(args))
								continue
							end
							if math.round(Dough.Size.X) == 3 and Dough.Color == Color3.fromRGB(215, 197, 154) then
								local OriginalPosForDough = Vector3.new(22.1, 9.7, 54)
								local args = {
									workspace:WaitForChild("AllDough"):WaitForChild("Dough"),
									"CFrame",
									CFrame.new(22.1, 9.7, 54, 1, 0, 0, 0, 1, 0, 0, 0, 1)

								}
								FireServerEvent(nil,"UpdateProperty",unpack(args))
								--task.wait(0.1)
								FireServerEvent(nil,"SquishDough",Dough)
								Dough = nil

								task.wait(0.2)

								for __, Dough in pairs(workspace.AllDough:GetChildren()) do
									--print( (Dough.Position - OriginalPosForDough).Magnitude )
									if math.round(Dough.Size.X) == 5 and (Dough.Position - OriginalPosForDough).Magnitude < 2 then
										--print("FOUND OUR DOUGH!")
										break
									end
								end
							end
							task.wait()
						until Dough ~= nil and math.round(Dough.Size.X) == 5 and not Dough.IsBurned.Value and ChosenPizza[Dough] == nil and Dough.Color == Color3.fromRGB(215, 197, 154) and ( (#Dough.SG.Frame:GetChildren() == 0) or (#Dough.SG.Frame:GetChildren() == 1 and (Dough.SG.Frame:FindFirstChild("Cheese") or Dough.SG.Frame:FindFirstChild("TomatoSauce"))) or (#Dough.SG.Frame:GetChildren() == 2 and (Dough.SG.Frame:FindFirstChild("Cheese") and Dough.SG.Frame:FindFirstChild("TomatoSauce"))) )

						if Dough ~= nil then
							CookMayContinue = false
							MayProceedWithNextOperation = false

							ChosenPizza[Dough] = true
							FireServerEvent(nil,"UpdateProperty",Dough,"CFrame",CFrame.new(36.60036849975586, 3.700181245803833, 45.499725341796875, 1, 0, 0, 0, 1, 0, 0, 0, 1))
							task.wait(0.015)
							--FireServerEvent(nil,"SquishDough",Dough)
							--task.wait(0.1)
							FireServerEvent(nil,"AddIngredientToPizza",Dough,"TomatoSauce")
							task.wait(0.2)
							FireServerEvent(nil,"AddIngredientToPizza",Dough,"Cheese")
							task.wait(0.2)


							if CheckForWhich(v.SG.ImageLabel.Image) == "PepperoniPizza" then
								FireServerEvent(nil,"AddIngredientToPizza",Dough,"Pepperoni") 
							elseif CheckForWhich(v.SG.ImageLabel.Image) == "SausagePizza" then
								FireServerEvent(nil,"AddIngredientToPizza",Dough,"Sausage")
							end


							coroutine.wrap(function()
								local CookTickCheckLocal = tick()
								CookTickCheck = CookTickCheckLocal
								FOUNDOVENRateLimit = 0
								local FoundOven = false

								local function ErrFinishTask()
									if CookTickCheckLocal == CookTickCheck then
										CookMayContinue = true
										--error("An error has occured")
									end
									MayProceedWithNextOperation = true
									CookMayContinue = true
								end

								repeat
									task.wait()

									if FoundOven then
										continue
									end

									for _ ,Oven in pairs(workspace.Ovens:GetChildren()) do
										if not FoundOven and not Oven.IsCooking.Value then
											if Dough == nil then
												ErrFinishTask()
												warn("Something has gone wrong")
											end
											FoundOven = true
											print("DEBUG : FOUND OVEN")
											FOUNDOVENRateLimit += 1
											if FOUNDOVENRateLimit > 7 then
												warn("DEBUG : FOUND OVEN RATELIMITED!")
												FireServerEvent(nil,"UpdateProperty",Dough,"CFrame",CFrame.new(36.60036849975586, 3.700181245803833, 45.499725341796875, 1, 0, 0, 0, 1, 0, 0, 0, 1))
												ErrFinishTask()
												return 
											end

											if not Oven.IsOpen.Value then
												Oven.Door.ClickDetector.Detector:FireServer()
												task.wait(2)
											end
                                            ToAnchorOrNot(Dough,true)
                                            task.wait()
											FireServerEvent(nil,"UpdateProperty",Dough,"CFrame",Oven.Bottom.CFrame * CFrame.new(0,.5,0))
                                            task.wait()
                                            ToAnchorOrNot(Dough,false)

											local ResettedValue = false
											local WaitingForFoodTimeOut = 0

											repeat
												if Oven.IsOpen.Value then
													Oven.Door.ClickDetector.Detector:FireServer()
													task.wait(3)
												end

												task.wait(.1)
												if not ResettedValue and Oven.Door.Meter.SurfaceGui.ProgressBar.Visible and not Oven.IsOpen.Value then
													print("DEBUG : IS CLOSED AND WORKING")
													task.wait(.1)
													--CookMayContinue = true
													ResettedValue = true
													MayProceedWithNextOperation = true
												end

												if WaitingForFoodTimeOut > 150 and not ResettedValue then
													ErrFinishTask()
													return warn("DEBUG : ResettedValueTimeout > 20 [TIMEOUT]")
												end
												WaitingForFoodTimeOut +=1

											until WaitingForFoodTimeOut > 200 or Dough == nil or not Oven:FindFirstChild("Door") or Oven.Door.Meter.SurfaceGui.ProgressBar.Bar.ImageColor3 ~= Color3.fromRGB(222, 132, 57)

											if WaitingForFoodTimeOut > 200 then
												ErrFinishTask()
												return warn("DEBUG : WaitingForFoodTimeOut > 200 [TIMEOUT]")
											end
											if Dough == nil then
												ErrFinishTask()
												return warn("DEBUG : DOUGH IS GONE")
											end
											if not Oven:FindFirstChild("Door") then
												FireServerEvent(nil,"UpdateProperty",Dough,"CFrame",CFrame.new(36.60036849975586, 3.700181245803833, 45.499725341796875, 1, 0, 0, 0, 1, 0, 0, 0, 1))
												ErrFinishTask()

												return warn("DEBUG : OVEN DOOR IS NOT FOUND!")
											end

											print("FINISHED")
											task.wait(.5)
											if not Oven.IsOpen.Value then
												Oven.Door.ClickDetector.Detector:FireServer()
											end
											task.wait(.25)
											if Dough.Color ~= Color3.fromRGB(218, 133, 65) then
												FoundOven = false
											else
												if CookTickCheckLocal == CookTickCheck then
													CookMayContinue = true
												end
											end

										end
									end
								until Dough == nil or ChosenPizza[Dough] == nil or Dough.Color == Color3.fromRGB(218, 133, 65)
								task.wait(0.25)
                                ToAnchorOrNot(Dough,true)
                                task.wait()
								FireServerEvent(nil,"UpdateProperty",Dough,"CFrame", CFrame.new(53, 4.2, 37.5, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                                task.wait()
								ToAnchorOrNot(Dough,false)
                                task.wait(2)
							end)()
						end
					end
				end
				WaitingValue = 0
				AmountToLoop = 0
				if CheckForWhich(SlotOrders[1].SG.ImageLabel.Image) ~= nil or CheckForWhich(SlotOrders[2].SG.ImageLabel.Image) ~= nil then
					repeat 
						AmountToLoop += 1
						print("DEBUG : GETTING ORDERS!")
						TOCOOK(SlotOrders[1])
						task.wait()
						TOCOOK(SlotOrders[2])
						task.wait()
						TOCOOK(SlotOrders[3])
						task.wait()
						TOCOOK(SlotOrders[4])
						task.wait()
						TOCOOK(SlotOrders[5])
						task.wait()

						WaitingValue = 0
						repeat
							task.wait(1)
							WaitingValue += 1
							if WaitingValue > 150 then
								CookMayContinue = true
								MayProceedWithNextOperation = true
								error("DEBUG : COOK WAITED FOR TOO LONG")
							end
						until CookMayContinue

						task.wait(.5)
						print("DEBUG : R. PROCEED")
					until not AutoCookBool or AmountToLoop > 4 or( CheckForWhich(SlotOrders[1].SG.ImageLabel.Image) == nil and CheckForWhich(SlotOrders[2].SG.ImageLabel.Image) == nil)
				end

			end)
			if not COOKSUC then
				if COOKERR ~= "Nil" then
					warn(COOKERR)
				end
			end
			--end
			local WaitingValue = 0
			repeat
				task.wait(1)
				WaitingValue += 1
				if WaitingValue > 250 or (WaitingValue > 150 and CheckForWhich(SlotOrders[1].SG.ImageLabel.Image) == nil and CheckForWhich(SlotOrders[2].SG.ImageLabel.Image) == nil) then
					CookMayContinue = true
					MayProceedWithNextOperation = true
					error("DEBUG : THE FIRST COOK WAITED FOR TOO LONG")
				end
			until CookMayContinue
			task.wait(2)
			print("DEBUG : COOK CONTINUE")
			ChosenPizza = {}
			task.wait(TimeToWaitBeforeNextTask)
		end


		if AutoBoxBool then
			task.wait(1)

			if TeleportOrWalkBool and CurrentWalkPosition ~= "Boxer" then
				if CurrentWalkPosition == "Delivery" or CurrentWalkPosition == "Supplier" then
					lplr.Character.HumanoidRootPart.CFrame = DefaultToHide
					task.wait(0.5)
				end
				if (lplr.Character.HumanoidRootPart.Position - DeliveryHideCFrame.Position).Magnitude < 5 then
					lplr.Character.HumanoidRootPart.CFrame = DefaultToHide
					task.wait(0.5)
				end

				local NewPath = PathFindingService:CreatePath()
				NewPath:ComputeAsync(lplr.Character.HumanoidRootPart.Position, BoxerToWalk)

				coroutine.wrap(function()
					for _, WP in pairs(NewPath:GetWaypoints()) do

						if lplr.Character.Humanoid.Sit then
							lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						end

						lplr.Character.Humanoid:MoveTo(WP.Position)
						lplr.Character.Humanoid.MoveToFinished:Wait()
					end
					CurrentWalkPosition = "Boxer"
				end)()

				GoRateLimit = 0
				repeat
					task.wait(1)
					GoRateLimit += 1
				until GoRateLimit> 35 or CurrentWalkPosition == "Boxer"
				if CurrentWalkPosition ~= "Boxer" then
					error("DEBUG : Boxer FAILED TO WALK")
				end
			elseif not TeleportOrWalkBool then
				lplr.Character.HumanoidRootPart.CFrame = BoxerToHideCFrame
			end

			task.wait(2)
			for i,Item in pairs(workspace.BoxingRoom:GetChildren()) do
				print("DEBUG : ",Item)
				if Item then
					-- IF DRINKS
					if Item.name == "Dew" then
						local args = {
							Item,
							"CFrame",
							CFrame.new(62.79999923706055, 4.899999618530273, 2.700000762939453, 0, 0, 1, 0, 1, -0, -1, 0, 0)
						}
						FireServerEvent(nil, "UpdateProperty", unpack(args))
						task.wait(0.5)
						continue
					end

					print("DEBUG : I SEE YOU")
					local HasBox = false
					local ratelimitedPizzaBoxer_FindingBoxes = 0
                    repeat
                        for j, Boxes in pairs(workspace.AllBox:GetChildren()) do
                            if HasBox == false and Boxes.Name == "BoxClosed" and Boxes.HasPizzaInside.Value == false then
                                print("DEBUG : PLACING BOX")
                                local args = {
                                    Boxes,
                                    "CFrame",
                                    CFrame.new(67.99999237060547, 4.000000476837158, 21.500001907348633, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                                }
                                FireServerEvent(nil, "UpdateProperty", unpack(args))
                                task.wait(0.15)
                                FireServerEvent(nil, "OpenBox", Boxes)
                                task.wait(0.15)
                                HasBox = true
                                break
                            end
                        end
                        task.wait(0.1)
                        ratelimitedPizzaBoxer_FindingBoxes += 1
                    until HasBox or ratelimitedPizzaBoxer_FindingBoxes > 5
					task.wait(0.1)

					for j, Boxes in pairs(workspace.AllBox:GetChildren()) do
						if Boxes.Name == "BoxOpen" and Boxes.Pizza.Value == nil and Item ~= nil then
							print("DEBUG : PLACING PIZZA AND SLICING IT")
							local args = {
								Boxes,
								Item
							}
							task.wait(0.25)
							FireServerEvent(nil, "AssignPizzaToBox", unpack(args))
							task.wait(.5)
							FireServerEvent(nil, "SlicePizza", Boxes)
							task.wait(0.25)
							FireServerEvent(nil, "CloseBox", Boxes)
							task.wait(0.25)
							break
						end
					end
					task.wait(0.2)

                    for j, Boxes in pairs(workspace.AllBox:GetChildren()) do
                        if Boxes.Name == "BoxClosed" and Boxes.HasPizzaInside.Value == true then
                            local args = {
                                Boxes,
                                "CFrame",
                                CFrame.new(68.1999740600586, 4.40000057220459, 4.900001525878906, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                            }
                            FireServerEvent(nil, "UpdateProperty", unpack(args))
                            task.wait(.5)
                        end
                    end

                    task.wait(0.2)
				end
			end
			for j, Boxes in pairs(workspace.AllBox:GetChildren()) do
				if Boxes.Name == "BoxOpen" and Boxes.Pizza.Value == true then
					FireServerEvent(nil, "CloseBox", Boxes)
					task.wait(.5)
				end
			end

			--Ensures all goes out
			for j, Boxes in pairs(workspace.AllBox:GetChildren()) do
				if Boxes.Name == "BoxClosed" and Boxes.HasPizzaInside.Value == true then
					local args = {
						Boxes,
						"CFrame",
						CFrame.new(68.1999740600586, 4.40000057220459, 4.900001525878906, 0, 0, 1, 0, 1, -0, -1, 0, 0)
					}
					FireServerEvent(nil, "UpdateProperty", unpack(args))
					task.wait(.5)
				end
			end

			task.wait(TimeToWaitBeforeNextTask)
		end

		if AutoDeliverBool then
			CurrentWalkPosition = "Delivery"
			task.wait(1)
			for i,ToDeliver in pairs(workspace:GetChildren()) do
				if ToDeliver:IsA("Tool") and ToDeliver:FindFirstChild("Order") then
					DeliveryPSuc, DeliveryPErr = pcall(function()
						lplr.Character.HumanoidRootPart.CFrame = DeliveryHideCFrame
						task.wait(0.1)
						firetouchinterest(ToDeliver.Handle, lplr.Character.HumanoidRootPart,0)
						task.wait(.1)
						firetouchinterest(ToDeliver.Handle, lplr.Character.HumanoidRootPart,1)
					end)

					if not DeliveryPSuc then
						warn(DeliveryPErr)
					end
				end
			end
			task.wait(1)

			if lplr.Character:FindFirstChildOfClass("Tool") then
				lplr.Character.Humanoid:UnequipTools()
				task.wait(1)
			end

			for i,BPPizzas in pairs(lplr.Backpack:GetChildren()) do
				if BPPizzas and BPPizzas:FindFirstChild("Order") then
					local Address = BPPizzas.Name
					DeliveryPSuc, DeliveryPErr = pcall(function()

						for k, House in pairs(workspace.Houses:GetChildren()) do
							if House.Address.Value == Address then
								for l, ToFindPart in pairs(House:GetChildren()) do
									FinishedDelivery = false
									FinishDeliveryRateLimit = 0

									if ToFindPart:FindFirstChild("GivePizza") then
										local GivePizza =  ToFindPart:FindFirstChild("GivePizza")
										local CollectorGuy
										for _, Person in pairs(House:GetChildren()) do
											if Person:FindFirstChild("Humanoid") and Person:FindFirstChild("HumanoidRootPart") and Person:FindFirstChild("HumanoidRootPart").CFrame.Y > 500 then
												CollectorGuy = Person
												break
											end
										end

										if TeleportOrWalkBool then
											lplr.Character.HumanoidRootPart.CFrame = DeliveryHideCFrame
											task.wait(0.1)
											local ToGo = CFrame.new(GivePizza.Position.X ,lplr.Character.HumanoidRootPart.Position.Y, GivePizza.Position.Z)
											local ToGoUp = CFrame.new(GivePizza.Position) * CFrame.new(0,2,0)
											local Distance = (lplr.Character.HumanoidRootPart.CFrame.Position - ToGo.Position).Magnitude


											local TSMove = TweenService:Create(lplr.Character.HumanoidRootPart, TweenInfo.new(Distance/SpeedToGo, Enum.EasingStyle.Linear), {CFrame = ToGo})
											TSMove:Play()
											TSMove.Completed:Wait()

											TSMove = TweenService:Create(lplr.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear), {CFrame = ToGoUp})
											TSMove:Play()
											TSMove.Completed:Wait()
										else
											lplr.Character.HumanoidRootPart.CFrame = GivePizza.CFrame
										end

										task.wait(.1)
										if SlowDownBool and not TeleportOrWalkBool then
											task.wait(5)
										end
										if TeleportOrWalkBool then
											task.wait(2)
										end
										print("DEBUGGING : ENSURE HE IS THERE")
										ENSUREHEISTHERE_RateLimit = 0
										repeat
											task.wait(.1)
											ENSUREHEISTHERE_RateLimit += 1
											if ENSUREHEISTHERE_RateLimit > 25 then
												error("Reject this delivery")
											end
										until CollectorGuy and CollectorGuy:FindFirstChild("HumanoidRootPart")
										print("DEBUGGING : HE IS HERE")
										FinishDeliveryRateLimit = 0

										repeat
											task.wait(0.1)
											if not lplr.Character:FindFirstChild(Address) and lplr.Backpack:FindFirstChild(Address) then
												lplr.Character.Humanoid:EquipTool(lplr.Backpack:FindFirstChild(Address))
												--print("EQUIPPP")
												task.wait(0.1)
											end
											if not lplr.Character:FindFirstChild(Address) and not lplr.Backpack:FindFirstChild(Address) then
												error("Pizza is gone before he has even arrived?")
											end
											firetouchinterest(GivePizza, lplr.Character.HumanoidRootPart,0)
											task.wait()
											firetouchinterest(GivePizza, lplr.Character.HumanoidRootPart,1)
											FinishDeliveryRateLimit += 1
										until FinishDeliveryRateLimit > 200 or not CollectorGuy or not CollectorGuy:FindFirstChild("HumanoidRootPart") or CollectorGuy:FindFirstChild("HumanoidRootPart").CFrame.Y < 500

										if FinishDeliveryRateLimit > 200 then
											FinishDeliveryRateLimit = 0
											error("Reject delivery!")
										end

										task.wait(0.5)

										--lplr.Character.HumanoidRootPart.CFrame = DeliveryHideCFrame
										local AtDesignedArea = false

										coroutine.wrap(function()
											if TeleportOrWalkBool then
												local ToGoDown = CFrame.new(lplr.Character.HumanoidRootPart.Position.X, DeliveryHideCFrame.Position.Y, lplr.Character.HumanoidRootPart.Position.Z) * CFrame.new(0,-5,0)
												local ToGo = DeliveryHideCFrame
												local Distance = (lplr.Character.HumanoidRootPart.Position - ToGo.Position).Magnitude

												local TSMove = TweenService:Create(lplr.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear), {CFrame = ToGoDown})
												TSMove:Play()
												TSMove.Completed:Wait()

												TSMove = TweenService:Create(lplr.Character.HumanoidRootPart, TweenInfo.new((Distance/SpeedToGo)/2, Enum.EasingStyle.Linear), {CFrame = ToGo})
												TSMove:Play()
												TSMove.Completed:Wait()
											else
												lplr.Character.HumanoidRootPart.CFrame = DeliveryHideCFrame
											end
											AtDesignedArea = true
										end)()

										FinishDeliveryRateLimit = 0
										repeat
											task.wait(.1)
											if not lplr.Character:FindFirstChild(Address) and lplr.Backpack:FindFirstChild(Address) then
												lplr.Character.Humanoid:EquipTool(lplr.Backpack:FindFirstChild(Address))
											end
											FinishDeliveryRateLimit += 1
										until not lplr.Character:FindFirstChild(Address) or FinishDeliveryRateLimit > 200

										FinishDeliveryRateLimit = 0
										repeat
											task.wait(0.1)
											FinishDeliveryRateLimit += 1
										until AtDesignedArea or FinishDeliveryRateLimit > 200

										FinishedDelivery = true

										task.wait(1)
										if SlowDownBool and not TeleportOrWalkBool then
											task.wait(3)
										end
										if TeleportOrWalkBool then
											task.wait(2)
										end
										--print("DEBUG : FINISHED DELIVERY")
										break
									end
								end
								break
							end
						end
					end)
					if not DeliveryPSuc then
						warn(DeliveryPErr)
					end
				end
			end
			if SlowDownBool then
				task.wait(5)
			else
				task.wait(2)
			end
			--print("DEBUG : DELIVERY EXIT")
		end
		--print("OK LTS MOVE ON")
		if AutoSupplyBool then
			LetsGo = false
			--print("AHHH")
			if Values == {} or Values == nil then
				--print("LOOK")
				Values = {}
				Images = {}
				OriginalPos = {}
				Buttons = {}

				for i, DisplayValue in pairs(Display:GetChildren()) do
					local Name = string.sub(DisplayValue.Name, 8)
					if Values[Name] == nil then
						coroutine.wrap(function()
							Images[Name] = DisplayValue.Image.Decal.Texture
							Values[Name] = tonumber(DisplayValue.a.SG.Counter.Text) or 0
							DisplayValue.a.SG.Counter:GetPropertyChangedSignal("Text"):Connect(function()
								Values[Name] = tonumber(DisplayValue.a.SG.Counter.Text) or 0
							end)
						end)()
					end
				end

				for i, Button in pairs(workspace.SupplyButtons:GetChildren()) do
					for Name, Image in pairs(Images) do
						if Button.Unpressed.Decal.Texture == Image then
							Buttons[Name] = Button.Unpressed
							OriginalPos[Name] = Button.Unpressed.CFrame
						end
					end
				end
			end

			task.wait(1)
			for Name, Value in pairs(Values) do
				if Value < LimitAmount then
					LetsGo = true
					--print("LETS GO BOYS")
					break
				end
			end
			if LetsGo then
				--print("GRRR")
				workspace.SupplyStationMainBlock.CanCollide = false
				local PreviousCFrame = lplr.Character.HumanoidRootPart.CFrame
				task.wait(0.1)
				if SlowDownBool and not TeleportOrWalkBool then
					task.wait(5)
				end
				if TeleportOrWalkBool then
					task.wait(2)
				end
				CurrentWalkPosition = "Supplier"
				--lplr.Character.HumanoidRootPart.CFrame = ToHideCFrame
				if TeleportOrWalkBool then
					lplr.Character.HumanoidRootPart.CFrame = DeliveryHideCFrame

					task.wait(.1)

					local ToGo = CFrame.new(ToHideCFrame.Position.X, DeliveryHideCFrame.Position.Y,ToHideCFrame.Position.Z)
					local ToGoUp = ToHideCFrame
					local Distance = (lplr.Character.HumanoidRootPart.Position - ToGo.Position).Magnitude

					local TSMove = TweenService:Create(lplr.Character.HumanoidRootPart, TweenInfo.new((Distance/SpeedToGo) + 3.5, Enum.EasingStyle.Linear), {CFrame = ToGo})
					TSMove:Play()
					TSMove.Completed:Wait()

					TSMove = TweenService:Create(lplr.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear), {CFrame = ToGoUp})
					TSMove:Play()
					TSMove.Completed:Wait()
				end
				for Name, Value in pairs(Values) do
					if Value < LimitAmount then
						print(Name)
						OriginalPos[Name] = Buttons[Name].Parent.WorldPivot
						task.wait(0.1)

						if Name == "TomatoSauce" or Name == "Box" then
							lplr.Character.HumanoidRootPart.CFrame = RightSideCFrame
						elseif Name == "MountainDew" or Name == "Sausage" then
							lplr.Character.HumanoidRootPart.CFrame = LeftSideCFrame
						else
							lplr.Character.HumanoidRootPart.CFrame = ToHideCFrame
						end

						Buttons[Name].Parent.WorldPivot = lplr.Character.HumanoidRootPart.CFrame

						for i = 1, 30 do
							firetouchinterest(Buttons[Name], lplr.Character.HumanoidRootPart,0)
							task.wait(.075)
							firetouchinterest(Buttons[Name], lplr.Character.HumanoidRootPart,1)
							task.wait(.25)
						end
					end
				end

				for i, SBox in pairs(workspace.AllSupplyBoxes:GetChildren()) do
					local args = {
						SBox,
						"CFrame",
						CFrame.new(7, 10.8, -9.2, 1, 0, 0, 0, 1, 0, 0, 0, 1)
					}
					FireServerEvent(nil, "UpdateProperty", unpack(args))
					task.wait(0.1)
				end

				for ButtonToChange, PreCFrame in pairs(OriginalPos) do
					if Buttons[ButtonToChange] then
						Buttons[ButtonToChange].Parent.WorldPivot = PreCFrame
					end
				end

				task.wait(1)


				if TeleportOrWalkBool then
					--print("DEBUG : VROOM VROOM")
					local ToGoDown = CFrame.new(ToHideCFrame.Position.X, DeliveryHideCFrame.Position.Y,ToHideCFrame.Position.Z)
					local ToGo = DeliveryHideCFrame
					local Distance = (lplr.Character.HumanoidRootPart.Position - ToGo.Position).Magnitude
					local TP_WKTimeout = 0

					coroutine.wrap(function()	
						local TSMove = TweenService:Create(lplr.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear), {CFrame = ToGoDown})
						TSMove:Play()
						TSMove.Completed:Wait()

						TSMove = TweenService:Create(lplr.Character.HumanoidRootPart, TweenInfo.new((Distance/SpeedToGo) +3.5, Enum.EasingStyle.Linear), {CFrame = ToGo})
						TSMove:Play()
						TSMove.Completed:Wait()
						TP_WKTimeout = 999
					end)()

					repeat
						task.wait(.1)
						TP_WKTimeout += 1
					until TP_WKTimeout > 350
				else
					lplr.Character.HumanoidRootPart.CFrame = PreviousCFrame
				end

				task.wait(.5)
				workspace.SupplyStationMainBlock.CanCollide = false
			end
			task.wait(TimeToWaitBeforeNextTask)
		end
	end)
	if not ALLSUC then
		warn("AN ERROR HAS OCCURED : ", ALLERR)
	end
end
