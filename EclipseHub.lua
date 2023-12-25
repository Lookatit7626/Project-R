local Library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Lookatit7626/Project-R/main/GUI%20Library.lua')))()

local GUI = Library.CreateGUI("Eclipse's HUB","rbxassetid://14497104058")

local Section = Library.CreateSection(GUI,"Home")

local button = Library.CreateButton(Section,"Name","Enforcing State Security GameWide")

local button = mod.CreateButton(section,"Delete","Delete Hub",function()
	mod.CreateNotification("Deleting","Deleting HUB...")
	wait(2)
	GUI:Destroy() 
end)

local Section2 = mod.CreateSection(GUI,"UniversalScript")

local Loop = mod.CreateLoopButton(section2,"LoopPrint",'Loop',function()
	workspace.PPPS:Destroy()
	mod.CreateNotification('Title',"Hi")
end,0.000000001)

local textBox = mod.CreateTextBoxButton(section2,"Print",'Print','Hello world',function(text)
	print(text)
end)

local slider = mod.CreateSlider(section2,"Slide","SlideMe",60,function(text)
	mod.CreateNotification('Slider',text)
end)
