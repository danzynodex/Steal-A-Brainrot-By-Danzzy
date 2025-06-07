local ScreenGui = Instance.new("ScreenGui")  
local Frame = Instance.new("Frame")  
local Button = Instance.new("TextButton")  
local Label = Instance.new("TextLabel")  
local UICorner_Frame = Instance.new("UICorner")  
local UICorner_Button = Instance.new("UICorner")  
local UICorner_Label = Instance.new("UICorner")  
  
ScreenGui.Name = "DeliveryTouchGUI"  
ScreenGui.Parent = game.CoreGui  
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling  
  
-- Frame utama yang bisa digeser  
Frame.Parent = ScreenGui  
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)  
Frame.Position = UDim2.new(0, 20, 0, 100)  
Frame.Size = UDim2.new(0, 140, 0, 90)  
Frame.Active = true  
Frame.Draggable = true  
UICorner_Frame.CornerRadius = UDim.new(0, 10)  
UICorner_Frame.Parent = Frame  
  
-- Tombol "Touch this if you steal"  
Button.Parent = Frame  
Button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)  
Button.Position = UDim2.new(0, 10, 0, 45)  
Button.Size = UDim2.new(0, 120, 0, 30)  
Button.Font = Enum.Font.GothamBold  
Button.Text = "click"  
Button.TextColor3 = Color3.fromRGB(255, 255, 255)  
Button.TextSize = 12  
Button.TextWrapped = true  
UICorner_Button.CornerRadius = UDim.new(0, 8)  
UICorner_Button.Parent = Button  
  
-- Label countdown (di atas tombol)  
Label.Parent = Frame  
Label.BackgroundColor3 = Color3.fromRGB(40, 40, 40)  
Label.Position = UDim2.new(0, 10, 0, 10)  
Label.Size = UDim2.new(0, 120, 0, 25)  
Label.Font = Enum.Font.GothamBold  
Label.Text = "Steal And Press The Button"  
Label.TextColor3 = Color3.fromRGB(255, 255, 255)  
Label.TextSize = 14  
Label.Visible = true  
UICorner_Label.CornerRadius = UDim.new(0, 6)  
UICorner_Label.Parent = Label  
  
-- Fungsi menyentuh semua DeliveryHitbox  
local function fireTouch()  
	local player = game.Players.LocalPlayer  
	local char = player.Character or player.CharacterAdded:Wait()  
	local toucher = char:FindFirstChild("HumanoidRootPart")  
	if not toucher then  
		Label.Text = "Tidak ada HRP"  
		return  
	end  
  
	-- Countdown 0.5 detik update di label (19 langkah 0.1 detik)  
	for i = 1, 20 do  
		local timeLeft = math.floor((2.0 - (i - 1) * 0.1) * 10) / 10  
		Label.Text = "bypassing : " .. tostring(timeLeft) .. "s"  
		wait(0.1)  
	end  
  
	-- Sentuh semua DeliveryHitbox  
	local touched = 0  
	for _, obj in ipairs(workspace:GetDescendants()) do  
		if obj:IsA("BasePart") and obj.Name == "DeliveryHitbox" then  
			firetouchinterest(toucher, obj, 0)  
			touched += 1  
		end  
	end  
  
	wait(1)  
  
	for _, obj in ipairs(workspace:GetDescendants()) do  
		if obj:IsA("BasePart") and obj.Name == "DeliveryHitbox" then  
			firetouchinterest(toucher, obj, 1)  
		end  
	end  
  
	Label.Text = "Succeed Bypassing : " .. touched  
	wait(1.5)  
	Label.Text = "Steal And Press The Button"  
end  
  
-- Saat tombol diklik  
Button.MouseButton1Click:Connect(fireTouch)
