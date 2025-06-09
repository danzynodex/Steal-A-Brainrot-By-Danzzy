debugX = true

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Bananini Condomini",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "By D4nzy",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Script Maybe"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"HelloGuys"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("None", 4483362458) -- Title, Image

local Section = Tab:CreateSection("lll")

local Button = Tab:CreateButton({
   Name = "I'm still working on fixing the lock base",
   Callback = function()
  
   end,
})



local Button = Tab:CreateButton({
   Name = "empty",
   Callback = function()
 
   end,
})


local MainTab = Window:CreateTab("Main")


getgenv().BrainRotActive = false

MainTab:CreateToggle({
    Name = "Steal a Brainrot (OP)",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(value)
        getgenv().BrainRotActive = value
        if value then
            -- Saat toggle AKTIF
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/BrainRot%20Sell%20Gamers"))()
        else
            -- Saat toggle NONAKTIF
            print("Toggle dimatikan. Script harus cek getgenv().BrainRotActive.")
        end
    end
})






local ProximityService = game:GetService("ProximityPromptService")

local instantPromptEnabled = false

MainTab:CreateToggle({
    Name = "Instant ProximityPrompt",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(value)
        instantPromptEnabled = value
        print("Instant ProximityPrompt is now:", value)

        -- Atur semua ProximityPrompt yang ada saat ini
        for _, prompt in ipairs(workspace:GetDescendants()) do
            if prompt:IsA("ProximityPrompt") then
                prompt.HoldDuration = value and 0 or 1 -- 0 = instan, 1 = default tahan
            end
        end
    end
})

-- Atur juga jika ada ProximityPrompt baru ditambahkan ke game
workspace.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("ProximityPrompt") and instantPromptEnabled then
        descendant.HoldDuration = 0
    end
end)




local RunService = game:GetService("RunService")

local enabled = false -- toggle awal

local function triggerPrompt(prompt)
	if prompt:IsA("ProximityPrompt") and prompt.Enabled and prompt.Parent then
		prompt.HoldDuration = 0
		prompt.RequiresLineOfSight = false
		prompt:InputHoldBegin(Enum.UserInputType.Keyboard)
		prompt:InputHoldEnd(Enum.UserInputType.Keyboard)
	end
end

-- Auto trigger jika ada prompt baru muncul
workspace.DescendantAdded:Connect(function(descendant)
	if enabled and descendant:IsA("ProximityPrompt") then
		task.wait(0.1)
		triggerPrompt(descendant)
	end
end)

-- Loop untuk trigger prompt jika aktif
RunService.RenderStepped:Connect(function()
	if enabled then
		for _, prompt in pairs(workspace:GetDescendants()) do
			if prompt:IsA("ProximityPrompt") then
				triggerPrompt(prompt)
			end
		end
	end
end)

-- Toggle GUI
MainTab:CreateToggle({
	Name = "Auto ProximityPrompt",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(value)
		enabled = value
		print("Toggle is now:", value)
	end
})



local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local infJumpEnabled = false

MainTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(value)
        infJumpEnabled = value
        print("Infinite Jump is now:", value)
    end
})

-- Fungsi Infinite Jump
UIS.JumpRequest:Connect(function()
    if infJumpEnabled and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)
