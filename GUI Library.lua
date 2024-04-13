

local systemShield = "rbxassetid://11322093465"
local TweenService = game:GetService('TweenService')

--System Varibles ^^^

local G_TitleBarColour = nil
local G_PrimaryColour = nil
local G_SecondaryColour = nil
local G_MainButtonColour= nil
local G_MainButtonTextColour = nil
local G_SideButtonColour = nil
local G_SideButtonTextcolour = nil

local G_ImageID = nil

--Notification Script Below--

local Notification = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

--Properties:

Notification.Name = "Notification"
Notification.Parent = game.CoreGui
Notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Notification.ResetOnSpawn = false

Background.Name = "Background"
Background.Parent = Notification
Background.AnchorPoint = Vector2.new(0.5, 0.5)
Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Background.BackgroundTransparency = 1.000
Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderSizePixel = 0
Background.LayoutOrder = -7
Background.Position = UDim2.new(0.87419188, 0, 0.730000019, 0)
Background.Size = UDim2.new(0.25, 0, 0.53540957, 0)
Background.ZIndex = -7

UIListLayout.Parent = Background
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
UIListLayout.Padding = UDim.new(0,2)


local Mod = {
	['CreateNotification'] = function(TitleStr,BodyStr ,IconStr )

		IconStr = IconStr or ""
		local Notification_2 = Instance.new("Frame")
		local Title = Instance.new("TextLabel")
		local Body = Instance.new("TextLabel")
		local Close = Instance.new("TextButton")
		local Icon = Instance.new("ImageLabel")

		Notification_2.Name = "Notification"
		Notification_2.Parent = Background
		Notification_2.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
		Notification_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Notification_2.BorderSizePixel = 0
		Notification_2.LayoutOrder = -6
		Notification_2.Position = UDim2.new(-0.0406901017, 0, 0.799999952, 0)
		Notification_2.Size = UDim2.new(1, 0, 0.200000003, 0)
		Notification_2.Visible = true
		Notification_2.ZIndex = -7

		Title.Name = "Title"
		Title.Parent = Notification_2
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title.BorderSizePixel = 0
		Title.Position = UDim2.new(0.0500000007, 0, 0.0500000007, 0)
		Title.Size = UDim2.new(0.800000012, 0, 0.349999994, 0)
		Title.ZIndex = -7
		Title.Font = Enum.Font.SourceSans
		Title.Text = TitleStr
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextScaled = true
		Title.TextSize = 14.000
		Title.TextWrapped = true
		Title.TextXAlignment = Enum.TextXAlignment.Left

		Body.Name = "Body"
		Body.Parent = Notification_2
		Body.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Body.BackgroundTransparency = 1.000
		Body.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Body.BorderSizePixel = 0
		Body.Position = UDim2.new(0.0500000007, 0, 0.400000006, 0)
		Body.Size = UDim2.new(0.899999976, 0, 0.600000024, 0)
		Body.ZIndex = -7
		Body.Font = Enum.Font.SourceSans
		Body.Text = BodyStr
		Body.TextColor3 = Color3.fromRGB(255, 255, 255)
		Body.TextScaled = true
		Body.TextSize = 14.000
		Body.TextWrapped = true
		Body.TextXAlignment = Enum.TextXAlignment.Left

		Close.Name = "Close"
		Close.Parent = Notification_2
		Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Close.BackgroundTransparency = 1.000
		Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Close.BorderSizePixel = 0
		Close.Size = UDim2.new(1, 0, 1, 0)
		Close.ZIndex = -6
		Close.Font = Enum.Font.SourceSans
		Close.Text = ""
		Close.TextColor3 = Color3.fromRGB(0, 0, 0)
		Close.TextSize = 14.000

		Icon.Name = "Icon"
		Icon.Parent = Notification_2
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon.BorderSizePixel = 0
		Icon.Position = UDim2.new(0.850000024, 0, 0.0500000007, 0)
		Icon.Size = UDim2.new(0.0900000036, 0, 0.349999994, 0)
		Icon.Image = IconStr
		Icon.ScaleType = Enum.ScaleType.Fit

		-- Scripts:

		local closing = false
		local function FRFCW_fake_script() -- Close.LocalScript 
			local script = Instance.new('LocalScript', Close)

			coroutine.wrap(function()
				wait(9)
				if not closing then
					closing = true
					pcall(function()
						
						local goal = {}
						goal.Transparency = 1

						local goal2 = {}
						goal2.ImageTransparency = 1

						local goal3 = {}
						goal3.TextTransparency = 1

						local tweenInfo = TweenInfo.new(1)

						local tween = TweenService:Create(Notification_2, tweenInfo, goal)
						tween:Play()

						local tween2 = TweenService:Create(Icon, tweenInfo, goal2)
						tween2:Play()

						local tween3 = TweenService:Create(Body, tweenInfo, goal3)
						tween3:Play()

						local tween4 = TweenService:Create(Title, tweenInfo, goal3)
						tween4:Play()

						tween.Completed:Wait()
						
						script.Parent.Parent:Destroy()
					end)
					
					
				end
			end)()

			script.Parent.MouseButton1Down:Connect(function()
				if not closing then
					closing = true
					pcall(function()

						local goal = {}
						goal.Transparency = 1

						local goal2 = {}
						goal2.ImageTransparency = 1

						local goal3 = {}
						goal3.TextTransparency = 1

						local tweenInfo = TweenInfo.new(1)

						local tween = TweenService:Create(Notification_2, tweenInfo, goal)
						tween:Play()

						local tween2 = TweenService:Create(Icon, tweenInfo, goal2)
						tween2:Play()

						local tween3 = TweenService:Create(Body, tweenInfo, goal3)
						tween3:Play()

						local tween4 = TweenService:Create(Title, tweenInfo, goal3)
						tween4:Play()

						tween.Completed:Wait()

						script.Parent.Parent:Destroy()
					end)
				end
			end)
		end
		coroutine.wrap(FRFCW_fake_script)()
	end,
}

--Main Script Below--

local module = {
	['CreateGUI'] = function(TitleStr,IconID ,TitleBarColour ,PrimaryColour,SecondaryColour ,MainButtonColour ,SideButtonColour ,MainButtonTextColour ,SideButtonTextColour)

		G_TitleBarColour = TitleBarColour or Color3.fromRGB(40, 40, 40)
		G_PrimaryColour = PrimaryColour or Color3.fromRGB(66, 66, 66)
		G_SecondaryColour = SecondaryColour or Color3.fromRGB(47, 47, 47)
		G_MainButtonColour = MainButtonColour or Color3.fromRGB(255, 255, 255)
		G_MainButtonTextColour = MainButtonTextColour or Color3.fromRGB(0,0,0)
		G_SideButtonColour = SideButtonColour or Color3.fromRGB(255, 255, 255)
		G_SideButtonTextcolour = SideButtonTextColour or Color3.fromRGB(0,0,0)

		G_ImageID = IconID or "rbxassetid://11207341665"

		local ScreenGui = Instance.new("ScreenGui")
		local MenuButton = Instance.new("ImageButton")
		local DragTop = Instance.new("Frame")
		local BackgroundFrame = Instance.new("Frame")
		local TopBar = Instance.new("Frame")
		local Corner = Instance.new("UICorner")
		local Decoration = Instance.new("Folder")
		local Body = Instance.new("Frame")
		local TopBar = Instance.new("Frame")
		local Corner_2 = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")
		local Close = Instance.new("TextButton")
		local BottomBar = Instance.new("Frame")
		local Corner_3 = Instance.new("UICorner")
		local SideBar = Instance.new("Folder")
		local SideBottomBar = Instance.new("Frame")
		local Corner_4 = Instance.new("UICorner")
		local SideBody = Instance.new("Frame")
		local SideBody2 = Instance.new("Frame")
		local SectionChoser = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		local Sections = Instance.new("Folder")

		--Properties:

		ScreenGui.Name = TitleStr
		--ScreenGui.Parent = game.CoreGui
		ScreenGui.Parent = game.CoreGui
		ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		ScreenGui.ResetOnSpawn = false

		DragTop.Name = "DragTop"
		DragTop.Parent = ScreenGui
		DragTop.AnchorPoint = Vector2.new(0.5, 0)
		DragTop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		DragTop.BackgroundTransparency = 1.000
		DragTop.BorderColor3 = Color3.fromRGB(0, 0, 0)
		DragTop.BorderSizePixel = 0
		DragTop.Position = UDim2.new(0.388679415, 0, 0.249505162, 0)
		DragTop.Size = UDim2.new(0, 346, 0, 24)
		DragTop.Transparency = 1

		MenuButton.Name = "MenuButton"
		MenuButton.Parent = ScreenGui
		MenuButton.AnchorPoint = Vector2.new(0.5, 0.5)
		MenuButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		MenuButton.BackgroundTransparency = 1.000
		MenuButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		MenuButton.BorderSizePixel = 0
		MenuButton.Position = UDim2.new(0.5, 0, 0.118686005, 0)
		MenuButton.Size = UDim2.new(0, 50, 0, 50)
		MenuButton.Image = G_ImageID
		MenuButton.Visible = false

		BackgroundFrame.Name = "BackgroundFrame"
		BackgroundFrame.Parent = DragTop
		BackgroundFrame.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
		BackgroundFrame.BackgroundTransparency = 1.000
		BackgroundFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BackgroundFrame.BorderSizePixel = 0
		BackgroundFrame.Position = UDim2.new(0, 0, 0, 0)
		BackgroundFrame.Size = UDim2.new(0, 346, 0, 200)

		Corner.CornerRadius = UDim.new(0, 10)
		Corner.Name = "Corner"
		Corner.Parent = BackgroundFrame

		Decoration.Name = "Decoration"
		Decoration.Parent = BackgroundFrame

		Body.Name = "Body"
		Body.Parent = Decoration
		Body.BackgroundColor3 = G_PrimaryColour
		Body.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Body.BorderSizePixel = 0
		Body.Position = UDim2.new(0, 0, 0.104999997, 0)
		Body.Size = UDim2.new(0, 346, 0, 162)

		TopBar.Name = "TopBar"
		TopBar.Parent = Decoration
		TopBar.BackgroundColor3 = G_TitleBarColour
		TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TopBar.BorderSizePixel = 0
		TopBar.Position = UDim2.new(0, 0, -0.0149999997, 0)
		TopBar.Size = UDim2.new(0, 346, 0, 32)
		TopBar.ZIndex = 0

		Corner_2.CornerRadius = UDim.new(0, 10)
		Corner_2.Name = "Corner"
		Corner_2.Parent = TopBar

		Title.Name = "Title"
		Title.Parent = TopBar
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title.BorderSizePixel = 0
		Title.Position = UDim2.new(0.0433526002, 0, 0, 0)
		Title.Size = UDim2.new(0, 185, 0, 24)
		Title.Font = Enum.Font.SourceSans
		Title.Text = TitleStr
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextScaled = true
		Title.TextSize = 14.000
		Title.TextWrapped = true
		Title.TextXAlignment = Enum.TextXAlignment.Left

		Close.Name = "Close"
		Close.Parent = TopBar
		Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Close.BackgroundTransparency = 1.000
		Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Close.BorderSizePixel = 0
		Close.Position = UDim2.new(0.910404623, 0, 0, 0)
		Close.Size = UDim2.new(0, 24, 0, 24)
		Close.Font = Enum.Font.SourceSans
		Close.Text = "X"
		Close.TextColor3 = Color3.fromRGB(255, 255, 255)
		Close.TextScaled = true
		Close.TextSize = 14.000
		Close.TextWrapped = true

		BottomBar.Name = "BottomBar"
		BottomBar.Parent = Decoration
		BottomBar.BackgroundColor3 = G_PrimaryColour
		BottomBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BottomBar.BorderSizePixel = 0
		BottomBar.Position = UDim2.new(0, 0, 0.855000019, 0)
		BottomBar.Size = UDim2.new(0, 346, 0, 29)
		BottomBar.ZIndex = 0

		Corner_3.CornerRadius = UDim.new(0, 10)
		Corner_3.Name = "Corner"
		Corner_3.Parent = BottomBar

		SideBar.Name = "SideBar"
		SideBar.Parent = Decoration

		SideBottomBar.Name = "SideBottomBar"
		SideBottomBar.Parent = SideBar
		SideBottomBar.BackgroundColor3 = G_SecondaryColour
		SideBottomBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SideBottomBar.BorderSizePixel = 0
		SideBottomBar.Position = UDim2.new(0, 0, 0.855000019, 0)
		SideBottomBar.Size = UDim2.new(0, 86, 0, 29)
		SideBottomBar.ZIndex = 2

		Corner_4.CornerRadius = UDim.new(0, 10)
		Corner_4.Name = "Corner"
		Corner_4.Parent = SideBottomBar

		SideBody.Name = "SideBody"
		SideBody.Parent = SideBar
		SideBody.BackgroundColor3 = G_SecondaryColour
		SideBody.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SideBody.BorderSizePixel = 0
		SideBody.Position = UDim2.new(0, 0, 0.104999997, 0)
		SideBody.Size = UDim2.new(0, 86, 0, 162)
		SideBody.ZIndex = 2

		SideBody2.Name = "SideBody2"
		SideBody2.Parent = SideBar
		SideBody2.BackgroundColor3 = G_SecondaryColour
		SideBody2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SideBody2.BorderSizePixel = 0
		SideBody2.Position = UDim2.new(0.219653174, 0, 0.104999997, 0)
		SideBody2.Size = UDim2.new(0, 10, 0, 179)
		SideBody2.ZIndex = 2

		SectionChoser.Name = "SectionChoser"
		SectionChoser.Parent = BackgroundFrame
		SectionChoser.Active = true
		SectionChoser.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SectionChoser.BackgroundTransparency = 1.000
		SectionChoser.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SectionChoser.BorderSizePixel = 0
		SectionChoser.Position = UDim2.new(0.0173410401, 0, 0.144999996, 0)
		SectionChoser.Size = UDim2.new(0, 70, 0, 165)
		SectionChoser.ZIndex = 3
		SectionChoser.CanvasSize = UDim2.new(0, 0, 0, 0)
		SectionChoser.ScrollBarThickness = 0
		SectionChoser.AutomaticCanvasSize = Enum.AutomaticSize.Y

		UIListLayout.Parent = SectionChoser
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 1)

		Sections.Name = "Sections"
		Sections.Parent = BackgroundFrame

		local function ADFD_fake_script() -- SliderButton_2.DragScript 
			local script = Instance.new('LocalScript', DragTop)

			script.Parent.Active = true
			script.Parent.Draggable = true
		end
		coroutine.wrap(ADFD_fake_script)()

		local function TDSX_fake_script() -- SliderButton_2.DragScript 
			local script = Instance.new('LocalScript', Close)
			script.Parent.MouseButton1Down:Connect(function()
				DragTop.Visible = false
				MenuButton.Visible = true
			end)
		end
		coroutine.wrap(TDSX_fake_script)()

		local function YTFD_fake_script() -- SliderButton_2.DragScript 
			local script = Instance.new('LocalScript', MenuButton)

			script.Parent.MouseButton1Down:Connect(function()
				DragTop.Visible = true
				MenuButton.Visible = false
			end)
		end
		coroutine.wrap(YTFD_fake_script)()

		return ScreenGui
	end,

	['CreateSection'] = function(GUI,Name,BackgroundColourOptional)

		--The Buttons: 

		local SectionButton = Instance.new("TextButton")
		local Corner_5 = Instance.new("UICorner")

		SectionButton.Name = Name
		SectionButton.Parent = GUI.DragTop.BackgroundFrame.SectionChoser
		SectionButton.BackgroundColor3 = G_SideButtonColour
		SectionButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SectionButton.BorderSizePixel = 0
		SectionButton.Size = UDim2.new(1, 0, 0, 15)
		SectionButton.Visible = true
		SectionButton.Font = Enum.Font.SourceSans
		SectionButton.Text = Name
		SectionButton.TextColor3 = G_SideButtonTextcolour
		SectionButton.TextScaled = true
		SectionButton.TextSize = 14.000
		SectionButton.TextWrapped = true

		Corner_5.CornerRadius = UDim.new(0, 5)
		Corner_5.Name = "Corner"
		Corner_5.Parent = SectionButton

		local function FSFS_fake_script() -- SliderButton_2.DragScript 
			local script = Instance.new('LocalScript', SectionButton)

			script.Parent.MouseButton1Down:Connect(function()
				local SECTIONS = script.Parent.Parent.Parent.Sections:GetChildren()
				for i = 1, #SECTIONS do
					if SECTIONS[i].Name ~= script.Parent.Name then
						SECTIONS[i].Visible = false
					else
						SECTIONS[i].Visible = true
					end
				end
			end)
		end
		coroutine.wrap(FSFS_fake_script)()

		--The Section HUB:

		local Sections001 = Instance.new("ScrollingFrame")
		local UIListLayout_2 = Instance.new("UIListLayout")

		Sections001.Name = Name
		Sections001.Parent = GUI.DragTop.BackgroundFrame.Sections
		Sections001.Active = true
		Sections001.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Sections001.BackgroundTransparency = 1.000
		Sections001.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Sections001.BorderSizePixel = 0
		Sections001.Position = UDim2.new(0.271676302, 0, 0.144999996, 0)
		Sections001.Size = UDim2.new(0, 245, 0, 165)
		Sections001.ZIndex = 3
		Sections001.CanvasSize = UDim2.new(0, 0, 0, 0)
		Sections001.ScrollBarThickness = 0.6
		Sections001.Visible = false
		Sections001.AutomaticCanvasSize = Enum.AutomaticSize.Y

		UIListLayout_2.Parent = Sections001
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 2)

		return Sections001
	end,

	['CreateNotification'] = function(Title,Body)
		Mod.CreateNotification(Title,Body,G_ImageID)
	end,

	['CreateButton'] = function(Section,Name,Text,callback)
		local Button = Instance.new("Frame")
		local Button_2 = Instance.new("TextButton")

		Button.Name = "Button"
		Button.Parent = Section
		Button.BackgroundColor3 = G_MainButtonColour
		Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button.BorderSizePixel = 0
		Button.Size = UDim2.new(1, 0, 0, 20)
		Button.Visible = true

		Button_2.Name = "Name"
		Button_2.Parent = Button
		Button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button_2.BorderSizePixel = 0
		Button_2.Size = UDim2.new(1, 0, 1, 0)
		Button_2.Font = Enum.Font.SourceSans
		Button_2.Text = Text
		Button_2.TextColor3 = Color3.fromRGB(0, 0, 0)
		Button_2.TextScaled = true
		Button_2.TextSize = 14.000
		Button_2.TextWrapped = true
		Button_2.BackgroundTransparency = 1

		callback = callback or function() end;

		local function REWS_fake_script() -- SliderButton_2.DragScript 
			local script = Instance.new('LocalScript', Button_2)
			pcall(function()
				local suc, err = pcall(function()
					script.Parent.MouseButton1Down:Connect(callback)
				end)
			end)
		end

		coroutine.wrap(REWS_fake_script)()
	end,

	['CreateLoopButton'] = function(Section,Name,Text,callback,Cooldown, ProtectedSystem)
		local Looping = false
		local errs = 0
		Cooldown = Cooldown or 1
		ProtectedSystem = ProtectedSystem or true
		if Cooldown <= 0.00001 and ProtectedSystem then
			Cooldown = 1
			Mod.CreateNotification('Invalid Cooldown arugment #5',"You can't set the cooldown lower then 0.0001, this is set by the script developer and can be disabled by disabling ProtectedSystem",systemShield)
		end

		local LoopButton = Instance.new("Frame")
		local Button_3 = Instance.new("TextButton")
		local Status = Instance.new("Frame")

		LoopButton.Name = Name
		LoopButton.Parent = Section
		LoopButton.BackgroundColor3 = G_MainButtonColour
		LoopButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LoopButton.BorderSizePixel = 0
		LoopButton.Size = UDim2.new(1, 0, 0, 20)
		LoopButton.Visible = true

		Button_3.Name = "Button"
		Button_3.Parent = LoopButton
		Button_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button_3.BorderSizePixel = 0
		Button_3.Size = UDim2.new(0.899999976, 0, 1, 0)
		Button_3.Font = Enum.Font.SourceSans
		Button_3.TextColor3 = Color3.fromRGB(0, 0, 0)
		Button_3.Text = Text
		Button_3.TextScaled = true
		Button_3.TextSize = 14.000
		Button_3.TextWrapped = true
		Button_3.BackgroundTransparency = 1

		Status.Name = "Status"
		Status.Parent = LoopButton
		Status.BackgroundColor3 = Color3.fromRGB(93, 0, 2)
		Status.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Status.BorderSizePixel = 0
		Status.Position = UDim2.new(0.899999976, 0, 0, 0)
		Status.Size = UDim2.new(0.100000001, 0, 1, 0)

		callback = callback or function() end;

		local function REWS_fake_script() -- SliderButton_2.DragScript 
			local script = Instance.new('LocalScript', Button_3)
			local suc, err = pcall(function()
				coroutine.wrap(function()
					while true do
						if script.Parent.Parent.Status.BackgroundColor3 == Color3.fromRGB(70, 162, 0) then
							local suc, err = pcall(function()
								callback()
							end)

							if not suc then
								if errs <= 5 then
									Mod.CreateNotification('An Script error has occured!', 'An error has occured while running this loop, if this occurs more then 5 times, the loop function will be disabled manually. error message: '..err,systemShield)
									errs = err + 1
								else
									Mod.CreateNotification('Script Disabled', 'The script you runned have errored more then 5 times and have now been disabled still the error is resolved, error message: '..err,systemShield)
									script.Parent.Parent.Status.BackgroundColor3 = Color3.fromRGB(93, 0, 2)
								end
								if not ProtectedSystem then
									errs = 0
								end
							else
								if errs ~= 0 then
									errs = 0
								end
							end

						end
						wait(Cooldown)
					end
				end)()

				script.Parent.MouseButton1Down:Connect(function()
					if script.Parent.Parent.Status.BackgroundColor3 == Color3.fromRGB(93, 0, 2) then
						script.Parent.Parent.Status.BackgroundColor3 = Color3.fromRGB(70, 162, 0)
					else
						script.Parent.Parent.Status.BackgroundColor3 = Color3.fromRGB(93, 0, 2)
					end
				end)
			end)
		end

		coroutine.wrap(REWS_fake_script)()
	end,

	['CreateTextBoxButton'] = function(Section,Name,Text,callback,TextBoxDefault)
		local TextBoxButton = Instance.new("Frame")
		local Button_4 = Instance.new("TextButton")
		local TextBox = Instance.new("TextBox")

		TextBoxDefault = TextBoxDefault or "-"

		TextBoxButton.Name = Name
		TextBoxButton.Parent = Section
		TextBoxButton.BackgroundColor3 = G_MainButtonColour
		TextBoxButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextBoxButton.BorderSizePixel = 0
		TextBoxButton.Size = UDim2.new(1, 0, 0, 20)
		TextBoxButton.Visible = true

		Button_4.Name = "Button"
		Button_4.Parent = TextBoxButton
		Button_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button_4.BorderSizePixel = 0
		Button_4.Size = UDim2.new(0.800000012, 0, 1, 0)
		Button_4.Font = Enum.Font.SourceSans
		Button_4.TextColor3 = Color3.fromRGB(0, 0, 0)
		Button_4.Text = Text
		Button_4.TextScaled = true
		Button_4.TextSize = 14.000
		Button_4.TextWrapped = true
		Button_4.BackgroundTransparency = 1

		TextBox.Parent = TextBoxButton
		TextBox.BackgroundColor3 = G_MainButtonColour
		TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextBox.BorderSizePixel = 0
		TextBox.Position = UDim2.new(0.800000012, 0, 0, 0)
		TextBox.Size = UDim2.new(0.200000003, 0, 1, 0)
		TextBox.Font = Enum.Font.SourceSansBold
		TextBox.Text = TextBoxDefault
		TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextBox.TextScaled = true
		TextBox.TextSize = 14.000
		TextBox.TextWrapped = true
		TextBox.BackgroundTransparency = 1

		callback = callback or function() end;

		local function REWS_fake_script()
			local script = Instance.new('LocalScript', Button_4)
			pcall(function()
				local suc, err = pcall(function()
					script.Parent.MouseButton1Down:Connect(function()
						callback(TextBox.Text)	
					end)
				end)
			end)
		end

		coroutine.wrap(REWS_fake_script)()
	end,

	['CreateSlider'] = function(Section,Name,Text,maxValue,callback)
		local SliderButton = Instance.new("Frame")
		local Button_5 = Instance.new("TextButton")
		local Slider = Instance.new("Frame")
		local Line = Instance.new("Frame")
		local SliderButton_2 = Instance.new("Frame")
		local SliderValue = Instance.new("TextLabel")
		maxValue = maxValue or 1

		SliderButton.Name = Name
		SliderButton.Parent = Section
		SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SliderButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SliderButton.BorderSizePixel = 0
		SliderButton.Size = UDim2.new(1, 0, 0, 20)
		SliderButton.Visible = true

		Button_5.Name = "Button"
		Button_5.Parent = SliderButton
		Button_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button_5.BorderSizePixel = 0
		Button_5.Size = UDim2.new(0.300000012, 0, 1, 0)
		Button_5.Font = Enum.Font.SourceSans
		Button_5.TextColor3 = Color3.fromRGB(0, 0, 0)
		Button_5.TextScaled = true
		Button_5.TextSize = 14.000
		Button_5.Text = Text
		Button_5.TextWrapped = true
		Button_5.BackgroundTransparency = 1

		Slider.Name = "Slider"
		Slider.Parent = SliderButton
		Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Slider.BorderSizePixel = 0
		Slider.Position = UDim2.new(0.324999988, 0, 0, 0)
		Slider.Size = UDim2.new(0.550000012, 0, 1, 0)
		Slider.BackgroundTransparency = 1

		Line.Name = "Line"
		Line.Parent = Slider
		Line.Active = true
		Line.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
		Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Line.BorderSizePixel = 0
		Line.Position = UDim2.new(0, 0, 0.400000006, 0)
		Line.Size = UDim2.new(1, 0, 0.200000003, 0)

		SliderButton_2.Name = "SliderButton"
		SliderButton_2.Parent = Slider
		SliderButton_2.AnchorPoint = Vector2.new(0.5, 0)
		SliderButton_2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		SliderButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SliderButton_2.BorderSizePixel = 0
		SliderButton_2.Size = UDim2.new(0.0500000007, 0, 1, 0)
		SliderButton_2.BackgroundTransparency = 0

		SliderValue.Name = "SliderValue"
		SliderValue.Parent = SliderButton
		SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SliderValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SliderValue.BorderSizePixel = 0
		SliderValue.Position = UDim2.new(0.899999976, 0, 0, 0)
		SliderValue.Size = UDim2.new(0.0900000036, 0, 1, 0)
		SliderValue.Font = Enum.Font.SourceSans
		SliderValue.Text = "0"
		SliderValue.TextColor3 = Color3.fromRGB(0, 0, 0)
		SliderValue.TextScaled = true
		SliderValue.TextSize = 14.000
		SliderValue.TextWrapped = true
		SliderValue.BackgroundTransparency = 1

		-- Scripts:

		local function HVYD_fake_script() -- SliderButton_2.DragScript 
			local script = Instance.new('LocalScript', SliderButton_2)

			script.Parent.Active = true
			script.Parent.Draggable = true

			coroutine.wrap(function()
				pcall(function()
					game:GetService('RunService').RenderStepped:Connect(function()
						SliderButton_2.Position = UDim2.new(SliderButton_2.Position.X.Scale,SliderButton_2.Position.X.Offset,0,0)
						if SliderButton_2.Position.X.Offset > 130 then
							SliderButton_2.Position = UDim2.new(0,130,0,0)
						end
						if SliderButton_2.Position.X.Offset < 0 then
							SliderButton_2.Position = UDim2.new(0,0,0,0)
						end
						SliderValue.Text = math.round(SliderButton_2.Position.X.Offset/130 * maxValue)
					end)
				end)
			end)()
		end
		coroutine.wrap(HVYD_fake_script)()

		callback = callback or function() end;

		local function REWS_fake_script()
			local script = Instance.new('LocalScript', Button_5)
			pcall(function()
				local suc, err = pcall(function()
					script.Parent.MouseButton1Down:Connect(function()
						callback(math.round(SliderButton_2.Position.X.Offset/130 * maxValue))	
					end)
				end)
			end)
		end
		coroutine.wrap(REWS_fake_script)()
	end,
}

return module
