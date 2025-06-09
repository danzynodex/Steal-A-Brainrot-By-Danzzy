local ScreenGui = Instance.new("ScreenGui")    
local Frame = Instance.new("Frame")    
local Button = Instance.new("TextButton")    
local Label = Instance.new("TextLabel")    
local UICorner_Frame = Instance.new("UICorner")    
local UICorner_Button = Instance.new("UICorner")    
local UICorner_Label = Instance.new("UICorner")    

local isReady = true -- Status toggle

ScreenGui.Name = "DeliveryTouchGUI"    
ScreenGui.Parent = game.CoreGui    
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling    

-- Frame utama    
Frame.Parent = ScreenGui    
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)    
Frame.Position = UDim2.new(0, 20, 0, 100)    
Frame.Size = UDim2.new(0, 140, 0, 90)    
Frame.Active = true    
Frame.Draggable = true    
UICorner_Frame.CornerRadius = UDim.new(0, 10)    
UICorner_Frame.Parent = Frame    

-- Tombol    
Button.Parent = Frame    
Button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)    
Button.Position = UDim2.new(0, 10, 0, 45)    
Button.Size = UDim2.new(0, 120, 0, 30)    
Button.Font = Enum.Font.GothamBold    
Button.Text = "Click To Steal"    
Button.TextColor3 = Color3.fromRGB(255, 255, 255)    
Button.TextSize = 12    
Button.TextWrapped = true    
UICorner_Button.CornerRadius = UDim.new(0, 8)    
UICorner_Button.Parent = Button    

-- Label tunggal (ready / error / working)
Label.Parent = Frame    
Label.BackgroundColor3 = Color3.fromRGB(40, 40, 40)    
Label.Position = UDim2.new(0, 10, 0, 10)    
Label.Size = UDim2.new(0, 120, 0, 25)    
Label.Font = Enum.Font.GothamBold    
Label.Text = "Hold A Brainrot First"    
Label.TextColor3 = Color3.fromRGB(255, 255, 255)    
Label.TextSize = 14    
Label.Visible = true    
UICorner_Label.CornerRadius = UDim.new(0, 6)    
UICorner_Label.Parent = Label    

-- Fungsi utama
local function fireTouch()
	local player = game.Players.LocalPlayer
	local char = player.Character or player.CharacterAdded:Wait()
	local toucher = char:FindFirstChild("HumanoidRootPart")
	if not toucher then
		Label.Text = "Tidak ada HRP"
		return
	end

	-- Countdown working
	for i = 1, 19 do
		local timeLeft = math.floor((1.9 - (i - 1) * 0.1) * 10) / 10
		Label.Text = "working " .. tostring(timeLeft) .. "s"
		wait(0.1)
	end

	local touched = 0
	for i = 1, 2 do
		for _, obj in ipairs(workspace:GetDescendants()) do
			if obj:IsA("BasePart") and obj.Name == "DeliveryHitbox" then
				firetouchinterest(toucher, obj, 0)
				wait(0.13)
				firetouchinterest(toucher, obj, 1)
				touched += 1
			end
		end
	end

	-- Tampilkan status akhir sesuai toggle
	if isReady then
		Label.Text = "ready"
	else
		Label.Text = "ready"
	end
end

-- Saat tombol diklik
Button.MouseButton1Click:Connect(function()
	-- Toggle status
	if isReady then
		Label.Text = "ready"
	else
		Label.Text = "ready"
	end
	isReady = not isReady

	-- Jalankan proses
	fireTouch()
end)
