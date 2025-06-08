debugX = true

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Steal A Brainrot / New 2.1",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Rayfield Interactive",
   LoadingSubtitle = "By D4nzy_nzy",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big On 2025"
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
      Key = {"SupportD4nzy"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("None", 4483362458) -- Title, Image

local Section = Tab:CreateSection("lll")

local Button = Tab:CreateButton({
   Name = "No Clips",
   Callback = function(value)
        if value then
            -- Saat toggle AKTIF
            loadstring(game:HttpGet("https://raw.githubusercontent.com/danzynodex/Steal-A-Brainrot-By-Danzzy/refs/heads/main/NoClip.lua"))()
        else
            -- Saat toggle NONAKTIF
            -- Tambahkan perintah untuk stop script jika ada
            print("Toggle dimatikan, stop script jika perlu di sini.")
        end
    end
})



local Button = Tab:CreateButton({
   Name = "Coming Soon",
   Callback = function()
 
   end,
})


local MainTab = Window:CreateTab("Main")




MainTab:CreateToggle({
    Name = "Steal a Brainrot (OP!)",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(value)
        if value then
            -- Saat toggle AKTIF
            loadstring(game:HttpGet("https://raw.githubusercontent.com/danzynodex/Steal-A-Brainrot-By-Danzzy/refs/heads/main/BrainRotAutoStole.lua"))()
        else
            -- Saat toggle NONAKTIF
            -- Tambahkan perintah untuk stop script jika ada
            print("Toggle dimatikan, stop script jika perlu di sini.")
        end
    end
})



MainTab:CreateToggle({
    Name = "Lock Base",
    CurrentValue = false,
    Flag = "Toggle_LockBase",
    Callback = function(value)
        getgenv().autoTouchLockBaseEnabled = value

        if value then
            -- Saat toggle AKTIF
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
        else
            -- Saat toggle NONAKTIF
            print("Lock Base dimatikan.")
        end
    end
})



MainTab:CreateToggle({
    Name = "Auto Collect",
    CurrentValue = false,
    Flag = "Toggle_AutoCollect",
    Callback = function(value)
        getgenv().autoTouchAutoCollectEnabled = value

        if value then
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
        else
            print("Auto Collect dimatikan.")
        end
    end
})



MainTab:CreateToggle({
    Name = "Instant Take",
    CurrentValue = false,
    Flag = "Toggle_InstantTake",
    Callback = function(value)
        local function setPromptInstant(enabled)
            for _, v in pairs(game:GetDescendants()) do
                if v:IsA("ProximityPrompt") then
                    v.HoldDuration = enabled and 0 or 1
                end
            end
        end

        if value then
            -- Saat toggle AKTIF
            setPromptInstant(true)

            _G.instantPromptConnection = game.DescendantAdded:Connect(function(v)
                if v:IsA("ProximityPrompt") then
                    v.HoldDuration = 0
                end
            end)
        else
            -- Saat toggle NONAKTIF
            setPromptInstant(false)

            if _G.instantPromptConnection then
                _G.instantPromptConnection:Disconnect()
                _G.instantPromptConnection = nil
            end
        end
    end
})




MainTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "Toggle_InfJump",
    Callback = function(value)
        _G.infiniteJump = value
        local Player = game:GetService("Players").LocalPlayer
        local UIS = game:GetService("UserInputService")

        if value then
            -- ON: Aktifkan Infinite Jump
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
        else
            -- OFF: Nonaktifkan Infinite Jump
            if _G.InfJumpConnection then
                _G.InfJumpConnection:Disconnect()
                _G.InfJumpConnection = nil
            end
        end
    end
})



Rayfield:LoadConfiguration()

