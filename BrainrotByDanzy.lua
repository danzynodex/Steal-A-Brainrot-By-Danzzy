loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/UI-Library/refs/heads/main/Ghost%20Gui'))()
game.CoreGui.GhostGui.MainFrame.Title.Text = "Danzy Hub"
---


AddContent("Switch", "Fast Steal (OP)", [[
-- Saat Switch AKTIF
loadstring(game:HttpGet("https://raw.githubusercontent.com/danzynodex/Steal-A-Brainrot-By-Danzzy/refs/heads/main/MainBrainrot.lua"))()
]], [[
-- Saat Switch NONAKTIF
-- Tidak melakukan apapun atau bisa kamu tambahkan stop script di sini jika perlu
]])


AddContent("Switch", "Lock Base", [[
getgenv().autoTouchLockBaseEnabled = true

local player = game.Players.LocalPlayer

local function getHRP()
	local char = player.Character or player.CharacterAdded:Wait()
	return char:WaitForChild("HumanoidRootPart")
end

local function triggerAllTouchInterests()
	local hrp = getHRP()
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj:IsA("Folder") and obj.Name == "Purchases" then
			for _, part in ipairs(obj:GetDescendants()) do
				if part:IsA("BasePart") and part:FindFirstChildWhichIsA("TouchTransmitter") then
					firetouchinterest(hrp, part, 0)
					firetouchinterest(hrp, part, 1)
					wait(0.1)
				end
			end
		end
	end
end

task.spawn(function()
	while getgenv().autoTouchLockBaseEnabled do
		pcall(triggerAllTouchInterests)
		wait(0.5)
	end
end)
]], [[
getgenv().autoTouchLockBaseEnabled = false
]])





AddContent("Switch", "Instant Take ", [[
-- Saat aktif
_G.instantPromptConnection = nil

local function setPromptInstant(enabled)
	for _, v in pairs(game:GetDescendants()) do
		if v:IsA("ProximityPrompt") then
			v.HoldDuration = enabled and 0 or 1
		end
	end
end

setPromptInstant(true)

_G.instantPromptConnection = game.DescendantAdded:Connect(function(v)
	if v:IsA("ProximityPrompt") then
		v.HoldDuration = 0
	end
end)
]], [[
-- Saat nonaktif
local function setPromptInstant(enabled)
	for _, v in pairs(game:GetDescendants()) do
		if v:IsA("ProximityPrompt") then
			v.HoldDuration = enabled and 0 or 1
		end
	end
end

setPromptInstant(false)

if _G.instantPromptConnection then
	_G.instantPromptConnection:Disconnect()
	_G.instantPromptConnection = nil
end
]])





AddContent("Switch", "Auto Collect", [[
getgenv().autoTouchAutoCollectEnabled = true

local player = game.Players.LocalPlayer

local function getHRP()
	local char = player.Character or player.CharacterAdded:Wait()
	return char:WaitForChild("HumanoidRootPart")
end

local function triggerAllTouchInterests()
	local hrp = getHRP()
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj:IsA("Folder") and obj.Name == "AnimalPodiums" then
			for _, part in ipairs(obj:GetDescendants()) do
				if part:IsA("BasePart") and part:FindFirstChildWhichIsA("TouchTransmitter") then
					firetouchinterest(hrp, part, 0)
					firetouchinterest(hrp, part, 1)
					wait(0.1)
				end
			end
		end
	end
end

task.spawn(function()
	while getgenv().autoTouchAutoCollectEnabled do
		pcall(triggerAllTouchInterests)
		wait(3)
	end
end)
]], [[
getgenv().autoTouchAutoCollectEnabled = false
]])





AddContent("Switch", "Inf Jump", [[
-- ON: Aktifkan Infinite Jump
_G.infiniteJump = true
local Player = game:GetService("Players").LocalPlayer
local UIS = game:GetService("UserInputService")

if _G.InfJumpConnection then
    _G.InfJumpConnection:Disconnect()
end

_G.InfJumpConnection = UIS.JumpRequest:Connect(function()
    if _G.infiniteJump then
        local Humanoid = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)
]], [[
-- OFF: Nonaktifkan Infinite Jump
_G.infiniteJump = false
if _G.InfJumpConnection then
    _G.InfJumpConnection:Disconnect()
    _G.InfJumpConnection = nil
end
]])


