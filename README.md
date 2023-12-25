Hi, Here is the function for the GUI library, if you somehow managed to get the source..

Functions:

CreateGUI - Creates GUI
(TitleStr : string ,IconID : string ,TitleBarColour : Color3 ,PrimaryColour : Color3 ,SecondaryColour : Color3 ,MainButtonColour : Color3 ,SideButtonColour : Color3 ,MainButtonTextColour : Color3 ,SideButtonTextColour : Color3)

CreateSection - Will Create a Section for you to insert your Script
(GUI : GUI ,Name : String ,BackgroundColourOptional : Color3)

CreateNotification - Notifies player
-(Title:string,Body:string)

-CreateButton - Creates a Button
(Section: Frame,Name : String,Text : String,callback : Function)

-CreateLoopButton - Loops a Function
(Section,Name,Text,callback,Cooldown, ProtectedSystem: boolean)

-CreateTextBoxButton - Creates a Button with a textbox on it
(Section,Name,Text,TextBoxDefault,callback)

-CreateSlider - Creates a Slider with a button
(Section,Name,Text,maxValue,callback)
