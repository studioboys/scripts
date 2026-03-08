local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local KEY = "S1GMA-Q2!Vx@9#LmP7aR8kT4Zy"

local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,520,0,320)
main.Position = UDim2.new(0.5,-260,0.5,-160)
main.BackgroundColor3 = Color3.fromRGB(8,8,8)

Instance.new("UICorner", main).CornerRadius = UDim.new(0,12)

local rgb = Instance.new("Frame", main)
rgb.Size = UDim2.new(1,0,0,4)
rgb.BackgroundColor3 = Color3.new(1,0,0)

task.spawn(function()
	while true do
		for i=0,1,0.01 do
			rgb.BackgroundColor3 = Color3.fromHSV(i,1,1)
			task.wait()
		end
	end
end)

local header = Instance.new("TextLabel", main)
header.Size = UDim2.new(1,0,0,60)
header.BackgroundTransparency = 1
header.Text = "Case Paradise Key"
header.Font = Enum.Font.GothamBold
header.TextScaled = true
header.TextColor3 = Color3.fromRGB(255,255,255)

local panel = Instance.new("Frame", main)
panel.Size = UDim2.new(0.85,0,0.55,0)
panel.Position = UDim2.new(0.075,0,0.25,0)
panel.BackgroundColor3 = Color3.fromRGB(18,18,18)

Instance.new("UICorner", panel).CornerRadius = UDim.new(0,10)

local box = Instance.new("TextBox", panel)
box.Size = UDim2.new(0.7,0,0,50)
box.Position = UDim2.new(0.15,0,0.2,0)
box.BackgroundColor3 = Color3.fromRGB(30,30,30)
box.PlaceholderText = "Enter key here..."
box.TextColor3 = Color3.new(1,1,1)
box.TextScaled = true
box.Font = Enum.Font.Gotham

Instance.new("UICorner", box).CornerRadius = UDim.new(0,8)

local confirm = Instance.new("TextButton", panel)
confirm.Size = UDim2.new(0.35,0,0,45)
confirm.Position = UDim2.new(0.1,0,0.65,0)
confirm.BackgroundColor3 = Color3.fromRGB(40,40,40)
confirm.Text = "CONFIRM"
confirm.TextScaled = true
confirm.Font = Enum.Font.GothamBold
confirm.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner", confirm).CornerRadius = UDim.new(0,8)

local discord = Instance.new("TextButton", panel)
discord.Size = UDim2.new(0.35,0,0,45)
discord.Position = UDim2.new(0.55,0,0.65,0)
discord.BackgroundColor3 = Color3.fromRGB(40,40,40)
discord.Text = "DISCORD"
discord.TextScaled = true
discord.Font = Enum.Font.GothamBold
discord.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner", discord).CornerRadius = UDim.new(0,8)

local info = Instance.new("TextLabel", main)
info.Size = UDim2.new(1,0,0,30)
info.Position = UDim2.new(0,0,0.9,0)
info.BackgroundTransparency = 1
info.Text = "Join our Discord server to get the key."
info.Font = Enum.Font.Gotham
info.TextColor3 = Color3.fromRGB(150,150,150)
info.TextScaled = true

main.Size = UDim2.new(0,0,0,0)

TweenService:Create(
	main,
	TweenInfo.new(0.45,Enum.EasingStyle.Back),
	{Size = UDim2.new(0,520,0,320)}
):Play()

local function hover(btn)
	btn.MouseEnter:Connect(function()
		TweenService:Create(btn,TweenInfo.new(0.15),{
			BackgroundColor3 = Color3.fromRGB(70,70,70)
		}):Play()
	end)

	btn.MouseLeave:Connect(function()
		TweenService:Create(btn,TweenInfo.new(0.15),{
			BackgroundColor3 = Color3.fromRGB(40,40,40)
		}):Play()
	end)
end

hover(confirm)
hover(discord)

confirm.MouseButton1Click:Connect(function()
	if box.Text == KEY then
		box.Text = "Access Granted"
		wait(0.5)
		main:Destroy()
	else
		box.Text = "Invalid Key"
	end
end)

discord.MouseButton1Click:Connect(function()
	setclipboard("https://discord.gg/wtwskdjnQR")
	box.Text = "Discord Link Copied"
end)

local drag
local start
local startPos

main.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		drag = true
		start = input.Position
		startPos = main.Position
	end
end)

main.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		drag = false
	end
end)

UIS.InputChanged:Connect(function(input)
	if drag and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - start
		main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)
