local player = game.Players.LocalPlayer

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ToggleMenuGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- GUI Frame (menu utama)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 180, 0, 170)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0, 0.5, 0) -- posisi tengah layar
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Visible = false
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

-- Tambahkan UICorner
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

-- Tambahkan UIStroke
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(   47, 229, 255) -- warna garis putih
stroke.Thickness = 1.7 -- ketebalan garis
stroke.Parent = frame
-- Layout dan padding
local layout = Instance.new("UIListLayout", frame)
layout.Padding = UDim.new(0, 8)
layout.VerticalAlignment = Enum.VerticalAlignment.Top
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local padding = Instance.new("UIPadding", frame)
padding.PaddingTop = UDim.new(0, 12)

-- Fungsi Tambah Toggle
local function AddToggle(data)
	local toggleState = data.Default or false

	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0.9, 0, 0, 32)
	button.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
	button.Font = Enum.Font.GothamBold
	button.TextSize = 18
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Text = data.Name
	button.TextXAlignment = Enum.TextXAlignment.Left
	button.BorderSizePixel = 0
	button.Parent = frame
	Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

	local icon = Instance.new("Frame")
	icon.Size = UDim2.new(0, 18, 0, 18)
	icon.Position = UDim2.new(1, -26, 0.5, -9)
	icon.BackgroundColor3 = toggleState and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(150, 150, 150)
	icon.BorderSizePixel = 0
	icon.Parent = button
	Instance.new("UICorner", icon).CornerRadius = UDim.new(1, 0)

	button.MouseButton1Click:Connect(function()
		toggleState = not toggleState
		icon.BackgroundColor3 = toggleState and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(150, 150, 150)
		if data.Callback then
			data.Callback(toggleState)
		end
	end)
end

-- Tambahkan beberapa toggle



local InstanToggleAktif = false

local function SetAllPromptsInstant(active)
	for _, prompt in ipairs(game:GetDescendants()) do
		if prompt:IsA("ProximityPrompt") then
			prompt.HoldDuration = active and 0 or 1
		end
	end
end

-- Atur ulang prompt baru yang ditambahkan ke game
game.DescendantAdded:Connect(function(desc)
	if desc:IsA("ProximityPrompt") and InstanToggleAktif then
		desc.HoldDuration = 0
	end
end)


AddToggle({
	Name = "Bypass Steal (OP)",
	Default = false,
	Callback = function(v)
		if v then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/danzynodex/Steal-A-Brainrot-By-Danzzy/refs/heads/main/NewUpdated.lua"))()
		end
	end
})




AddToggle({
	Name = "Instant Take",
	Default = false,
	Callback = function(v)
		InstanToggleAktif = v
		SetAllPromptsInstant(v)
	end
})



local infJumpEnabled = false

-- Infinite Jump Function
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local humanoid = nil

-- Saat tombol spasi ditekan
UserInputService.JumpRequest:Connect(function()
	if infJumpEnabled and humanoid then
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

-- Toggle UI
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local humanoid
local infJumpEnabled = false

-- Fungsi untuk set humanoid saat karakter muncul
local function onCharacterAdded(character)
	if infJumpEnabled then
		humanoid = character:WaitForChild("Humanoid")
	end
end

-- Sambungkan ke saat karakter respawn
player.CharacterAdded:Connect(onCharacterAdded)

-- Saat tombol jump ditekan
UserInputService.JumpRequest:Connect(function()
	if infJumpEnabled and humanoid then
		-- Force jump
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

-- Toggle dari UI
AddToggle({
	Name = "inf jump",
	Default = false,
	Callback = function(v)
		infJumpEnabled = v

		-- Update humanoid jika toggle diaktifkan
		if v then
			local character = player.Character or player.CharacterAdded:Wait()
			humanoid = character:WaitForChild("Humanoid")
		else
			humanoid = nil
		end
	end
})




-- Tombol Open/Close pakai gambar baru
local toggleButton = Instance.new("ImageButton")  
toggleButton.Name = "OpenCloseButton"  
toggleButton.Size = UDim2.new(0, 50, 0, 50)  
toggleButton.Position = UDim2.new(0, 50, 0.2, 0)  
toggleButton.Image = "rbxassetid://98474276570349" -- gambar barumu  
toggleButton.BackgroundTransparency = 1  
toggleButton.Parent = screenGui  
toggleButton.Active = true  
toggleButton.Draggable = true

-- Tambahkan UICorner
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 12) -- ubah angka ini jika ingin sudut lebih tajam atau lebih bulat
uiCorner.Parent = toggleButton

-- Fungsi buka/tutup GUI  
local isOpen = false  
toggleButton.MouseButton1Click:Connect(function()  
	isOpen = not isOpen  
	frame.Visible = isOpen  
end)






game.StarterGui:SetCore("SendNotification", {
    Title = "succeed executed ";
    Text = "Created By D4nzy";
    Icon = "rbxthumb://type=AvatarHeadShot&id=8610162287&w=150&h=150";
    Duration = 5;
})
