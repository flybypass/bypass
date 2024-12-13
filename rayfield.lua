--[[
    Made with rayfield!
]]

-- Variables --

if not game:IsLoaded() then
    game.IsLoaded:Wait()
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/AnthonyIsntHere/anthonysrepository/main/scripts/AntiChatLogger.lua", true))()

-- Window --

local Window = Rayfield:CreateWindow({
    Name = "FlyBypasser",
    LoadingTitle = "Loading..",
    LoadingSubtitle = "by exrand",
    DisableRayfieldPrompts = false,
    Theme = "Default",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Big Hub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Hub Key",
        Subtitle = "Key System",
        Note = "bestscriptever",
        FileName = "Key",
        SaveKey = false,
        GrabKeyFromSite = false,
        Key = {"bestscriptever"}
    }
})

-- Tabs --

local MTab = Window:CreateTab("Main", 4483362458)
local WTab = Window:CreateTab("Words", 128524919468826)
local CTab = Window:CreateTab("Casual", 98024420627507)
local RTab = Window:CreateTab("Rage", 91249043019184)
local RPTab = Window:CreateTab("Roleplay", 98611662328767)
local STab = Window:CreateTab("Sex", 84509091997176)
local WBTab = Window:CreateTab("Websites", 96700668017516)
local SNTab = Window:CreateTab("Settings", 80983262444378)

-- Content --

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local bypassText = ""
local safeBool = false
local chatBool = true
local autoBool = false

local gameIds = {
    [6708206173] = "Rate My Avatar"
}

local WelcomeParagraph = MTab:CreateParagraph({
    Title = "Welcome, " .. player.Name,
    Content = "Welcome to FlyBypasser, the top tool for advanced chat filter bypassing. Say what you want, when you want, without limits. Enjoy, " .. player.Name .. "."
})

local SafeMode = SNTab:CreateToggle({
    Name = "Safe Mode",
    CurrentValue = false,
    Flag = "SafeToggle",
    Callback = function(Value)
        safeBool = Value
    end
})

local UnloadGUI = SNTab:CreateButton({
    Name = "Unload GUI",
    Callback = function()
        if not safeBool then
            Rayfield:Destroy()
        else
            Rayfield:Notify({
                Title = "Safe Mode",
                Content = "Safe Mode is on, to unload the GUI, please disable.",
                Duration = 6.5,
                Image = 4483362458,
                Actions = {
                    Ignore = {
                        Name = "Okay!",
                        Callback = function()
                            warn("Safe Mode is on, to unload the GUI, please disable.")
                        end
                    }
                }
            })
        end
    end
})

local changeTheme = SNTab:CreateDropdown({
    Name = "Change Theme",
    Options = {"Default", "Light", "Green", "DarkBlue"},
    CurrentOption = {"Default"},
    Flag = "ThemesDropdown",
    Callback = function(CurrentOption)
        Window.Theme = CurrentOption
    end
})

local EnglishMapping = {
    a = "a󠀈", b = "󠀈b", c = "c󠀈", d = "󠀈d", e = "e󠀈", f = "󠀈f", g = "g󠀈", h = "󠀈h",
    i = "i󠀈", j = "j󠀈", k = "󠀈k", l = "l󠀈", m = "󠀈m", n = "n󠀈", o = "o󠀈", p = "󠀈p",
    q = "󠀈q", r = "󠀈r", s = "s󠀈", t = "󠀈t", u = "u󠀈", v = "v󠀈", w = "󠀈w", x = "x",
    y = "y", z = "z", A = "A", B = "B", C = "󠀈C", D = "󠀈D", E = "E", F = "󠀈F󠀈󠀈",
    G = "󠀈G", H = "H", I = "I", J = "J", K = "󠀈K", L = "L", M = "M", N = "N",
    O = "O󠀈", P = "󠀈P", Q = "Q", R = "R", S = "S", T = "T", U = "U󠀈", V = "V",
    W = "W", X = "X", Y = "Y", Z = "Z"
}

local LanguageMapping = {
    a = "󠀂а", b = "b󠀗", c = "󠀈c", d = "󠀒d󠀗", e = "е", f = "󠀂f󠀗", g = "g", h = "󠀈һ󠀈",
    i = "і󠀈", j = "ј", k = "󠀗k", l = "l", m = "m", n = "n󠀇", o = "о󠀇", p = "󠀄p",
    q = "ԛ", r = "r󠀇󠀇", s = "󠀈ѕ", t = "󠀗t", u = "u󠀗", v = "v", w = "w", x = "х",
    y = "󠀈у󠀈", z = "z", A = "󠀈А󠀈", B = "󠀈В󠀈", C = "󠀈С󠀈", D = "D󠀈", E = "Е", F = "󠀒F󠀈",
    G = "󠀈G󠀈", H = "Н󠀈", I = "I󠀈", J = "Ј", K = "К󠀒", L = "L", M = "М", N = "󠀒N",
    O = "O", P = "Р", Q = "Ԛ", R = "R", S = "Ѕ󠀈󠀈", T = "󠀈Т", U = "U", V = "V",
    W = "W", X = "Х", Y = "Y", Z = "Z"
}

local CircleMapping = {
    a = "🅐", b = "🅑", c = "🅒", d = "🅓", e = "🅔", f = "🅕", g = "🅖", h = "🅗",
    i = "🅘", j = "🅙", k = "🅚", l = "🅛", m = "🅜", n = "🅝", o = "🅞", p = "🅟",
    q = "🅠", r = "🅡", s = "🅢", t = "🅣", u = "🅤", v = "🅥", w = "🅦", x = "🅧",
    y = "🅨", z = "🅩", A = "🅐", B = "🅑", C = "🅒", D = "🅓", E = "🅔", F = "🅕",
    G = "🅖", H = "🅗", I = "🅘", J = "🅙", K = "🅚", L = "🅛", M = "🅜", N = "🅝",
    O = "🅞", P = "🅟", Q = "🅠", R = "🅡", S = "🅢", T = "🅣", U = "🅤", V = "🅥",
    W = "🅦", X = "🅧", Y = "🅨", Z = "🅩"
}

local DiacriticsMapping = {
    a = "ấ", b = "ɓ", c = "ć", d = "ḓ", e = "ệ", f = "ƒ", g = "ǵ", h = "ħ",
    i = "į", j = "ǰ", k = "ķ", l = "ŀ", m = "ṃ", n = "ñ", o = "ố", p = "ṗ",
    q = "ʠ", r = "ř", s = "ş", t = "ť", u = "ų", v = "ṽ", w = "ẇ", x = "ẋ",
    y = "ỳ", z = "ž", A = "Ấ", B = "Ḅ", C = "Ć", D = "Ḓ", E = "Ệ", F = "Ƒ",
    G = "Ǵ", H = "Ħ", I = "Į", J = "ǰ", K = "Ķ", L = "Ŀ", M = "Ṃ", N = "Ń",
    O = "Ố", P = "Ṗ", Q = "Q̇", R = "Ř", S = "Ş", T = "Ť", U = "Ų", V = "Ṽ",
    W = "Ẉ", X = "Ẍ", Y = "Ỳ", Z = "Ž"
}

local UnderlineMapping = {
    a = "a̳", b = "b̳", c = "c̳", d = "d̳", e = "e̳", f = "f̳", g = "g̳", h = "h̳",
    i = "i̳", j = "j̳", k = "k̳", l = "l̳", m = "m̳", n = "n̳", o = "o̳", p = "p̳",
    q = "q̳", r = "r̳", s = "s̳", t = "t̳", u = "u̳", v = "v̳", w = "w̳", x = "x̳",
    y = "y̳", z = "z̳", A = "A̳", B = "B̳", C = "C̳", D = "D̳", E = "E̳", F = "F̳",
    G = "G̳", H = "H̳", I = "I̳", J = "J̳", K = "K̳", L = "L̳", M = "M̳", N = "N̳",
    O = "O̳", P = "P̳", Q = "Q̳", R = "R̳", S = "S̳", T = "T̳", U = "U̳", V = "V̳",
    W = "W̳", X = "X̳", Y = "Y̳", Z = "Z̳"
}


local methods = {
    English = EnglishMapping,
    Language = LanguageMapping,
    Circle = CircleMapping,
    Diacritics = DiacriticsMapping,
    Underline = UnderlineMapping
}

local currentMethod = "English"

local MethodsDropdown = MTab:CreateDropdown({
    Name = "Methods",
    Options = {"English", "Language", "Circle", "Diacritics", "Underline"},
    CurrentOption = {"English"},
    MultipleOptions = false,
    Flag = "MethodsDropdown",
    Callback = function(CurrentOption)
        currentMethod = CurrentOption[1]
    end
})

local ChatBypassTextbox = MTab:CreateInput({
    Name = "Chat Bypass",
    Text = "",
    PlaceholderText = "Enter message to bypass",
    Flag = "ChatBypassTextbox",
    Callback = function(Text)
        bypassText = Text
    end
})

local function bypassMessage(message)
    local selectedMapping = methods[currentMethod]
    local bypassedMessage = ""
    local wordCount = 0
    
    for i = 1, #message do
        local char = message:sub(i, i)
        bypassedMessage = bypassedMessage .. (selectedMapping[char] or char)
        
        if char == " " then
            wordCount = wordCount + 1
            if wordCount % 6 == 0 then
                bypassedMessage = bypassedMessage .. " "
            end
        end
    end

    bypassedMessage = bypassedMessage:gsub(" ", function()
        return math.random(2) == 7 and "" or ""
    end)

    local actualWordCount = 0
    bypassedMessage = bypassedMessage:gsub("[]", function(fakeSpace)
        actualWordCount = actualWordCount + 1
        if actualWordCount % 7 == 0 then
            return " "
        else
            return fakeSpace
        end
    end)

    bypassedMessage = "󠀈" .. bypassedMessage .. "󠀄"

    return bypassedMessage
end



local sendMessage = function(message)
    if TextChatService then
        local textChannels = TextChatService:FindFirstChild("TextChannels")
        if textChannels then
            local textChannel = textChannels:WaitForChild("RBXGeneral")
            if textChannel then
                textChannel:SendAsync(message)
                return
            else
                warn("No suitable text channel found in TextChatService. Falling back to legacy chat.")
                if ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") then
                    ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
                else
                    warn("Legacy chat events are not available.")
                end
            end
        else
            warn("TextChannels not found in TextChatService. Falling back to legacy chat.")
            if ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") then
                ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
            else
                warn("Legacy chat events are not available.")
            end
        end
    elseif ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") then
        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
    else
         warn("Legacy chat events are not available.")
    end
end

local SendButton = MTab:CreateButton({
    Name = "Send",
    Callback = function()
        if bypassText ~= "" then
            local bypassedText = bypassMessage(bypassText)

            sendMessage(bypassedText)
        else
            Rayfield:Notify({
                Title = "No message specified.",
                Content = "You didn't enter a message to bypass.",
                Duration = 6.5,
                Image = 4483362458,
                Actions = {
                    Ignore = {
                        Name = "Okay!",
                        Callback = function()
                            print("The user tapped Okay!")
                        end
                    }
                }
            })
        end
    end
})

local AutoBypassToggle = MTab:CreateToggle({
    Name = "Auto Bypass",
    CurrentValue = false,
    Flag = "AutoBypassToggle",
    Callback = function(Value)
        autoBool = Value
        local TextBox = nil

        if autoBool then
            UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if input.KeyCode == Enum.KeyCode.RightControl then
                    if gameProcessed then return end
                    if not TextBox then
                        local screenGui = Instance.new("ScreenGui")
                        screenGui.Parent = game.Players.LocalPlayer.PlayerGui 

                        TextBox = Instance.new("TextBox")
                        TextBox.Name = "TextBox"
                        TextBox.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
                        TextBox.TextScaled = true
                        TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextBox.Position = UDim2.new(0.5, -98, 0.9, 0)
                        TextBox.Size = UDim2.new(0, 196, 0, 22)
                        TextBox.Text = "Type message here"
                        TextBox.Parent = screenGui

                        local Rounder = Instance.new("UICorner")
                        Rounder.Parent = TextBox

                        TextBox:CaptureFocus()

                        TextBox.FocusLost:Connect(function(enterPressed)
                            if enterPressed then
                                if TextBox.Text ~= "" then
                                    local bypassedText = bypassMessage(TextBox.Text)
                                    sendMessage(bypassedText)
                                    TextBox:Destroy()
                                    TextBox = nil
                                else
                                    Rayfield:Notify({
                                        Title = "No message specified.",
                                        Content = "You didn't enter a message to bypass.",
                                        Duration = 6.5,
                                        Image = 4483362458,
                                        Actions = {
                                            Ignore = {
                                                Name = "Okay!",
                                                Callback = function()
                                                    print("The user tapped Okay!")
                                                end
                                            }
                                        }
                                    })
                                end
                            end
                        end)
                    end
                end
            end)
        end
    end
})

local fixBypasses = MTab:CreateButton({
    Name = "Fix Bypasses",
    Callback = function()
        local function generateString(length)
            local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            local generatedString = ""
            
            for i = 1, length do
                local randomIndex = math.random(1, #chars)
                generatedString = generatedString .. chars:sub(randomIndex, randomIndex)
            end
            
            return generatedString
        end

        local messageSent = game.Players:Chat("/e " .. generateString(85))

        print(tostring(messageSent))
    end
})

local seperatorSpace = MTab:CreateSection("")

local seperator = MTab:CreateSection("Suggested Bypasses")

local bangParagraph = STab:CreateParagraph({
    Title = "Triceptasex",
    Content = "SOMETHING YOU'VE NEVER EXPERIENCED BEFORE."
})

local teleportTarget = ""
local spamEnabled = false
local spamInterval = 0.01
local chatInterval = 1

local TeleportTextbox = STab:CreateInput({
    Name = "Target",
    Text = "",
    PlaceholderText = "Enter Player Name or Display Name",
    Flag = "TeleportTextbox",
    Callback = function(text)
        teleportTarget = text
    end
})

local function findPlayerByNameOrDisplayName(name)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Name == name or player.DisplayName == name then
            return player
        end
    end
    return nil
end

local function teleportPlayer(targetName)
    local player = game.Players.LocalPlayer
    local targetPlayer = findPlayerByNameOrDisplayName(targetName)

    if targetPlayer and targetPlayer.Character then
        local playerCharacter = player.Character
        local playerHRP = playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart")
        local targetCharacter = targetPlayer.Character
        local targetHRP = targetCharacter:FindFirstChild("HumanoidRootPart")

        if playerHRP and targetHRP then
            -- Teleport slightly further back from the target (small offset)
            local initialPosition = targetHRP.Position - targetHRP.CFrame.LookVector * 0.1  -- Slightly further back (0.1)
            playerHRP.CFrame = CFrame.new(initialPosition, targetHRP.Position)

            -- Make player jump
            local humanoid = playerCharacter:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.Jump = true

                -- Play the emote animation
                local emoteAnimation = Instance.new("Animation")
                emoteAnimation.AnimationId = "rbxassetid://148840371"
                local emoteTrack = humanoid:LoadAnimation(emoteAnimation)
                emoteTrack:Play()
                emoteTrack:AdjustSpeed(2)  -- Adjust this value to change animation speed
            end

            -- Create a loop to spam moving inside the target (back and forth)
            local movingForward = false

            while spamEnabled do
                wait(0.02)  -- Extremely fast teleportation updates

                -- Calculate positions (slightly more offset)
                local targetPosition = targetHRP.Position
                local moveDirection = movingForward and targetHRP.CFrame.LookVector or -targetHRP.CFrame.LookVector
                local offsetPosition = targetPosition + moveDirection * 0.075  -- Slightly larger offset (0.075)

                -- Set the new position (virtually inside the target, but slightly more behind)
                playerHRP.CFrame = CFrame.new(offsetPosition, targetHRP.Position)

                -- Toggle between moving forward and backward inside the target
                movingForward = not movingForward
            end
        end
    end
end

local SpamToggle = STab:CreateToggle({
    Name = "Bang",
    Flag = "SpamToggle",
    Callback = function(state)
        spamEnabled = state
        if spamEnabled then
            task.spawn(function()
                while spamEnabled do
                    if teleportTarget ~= "" then
                        teleportPlayer(teleportTarget)
                    end
                    task.wait(spamInterval)
                end
            end)

            if chatBool then
                task.spawn(function()
                    local spamChat = {
                        "󠀇UGHHHH󠀇SH󠀇󠀇I󠀇T󠀇IMSOCLOSETOC󠀇UM󠀇MIN󠀇G󠀇",
                        "󠀇NAHWERENOTDONE󠀇󠀇BI󠀇TC󠀇󠀇H󠀇ROUND2󠀇", 
                        "󠀇AHHHHH󠀇FU󠀇󠀇C󠀇K󠀇IMGONNA󠀇󠀇C󠀇U󠀇M󠀇󠀇!!!󠀇",
                        "󠀇*󠀇CUMGOES󠀇F󠀇U󠀇C󠀇K󠀇󠀇IN󠀇󠀇G󠀇EVERYWHERE󠀇*󠀇",
                        "OHHHH-*s󠀇pl󠀇at󠀇severywhere*",
                    }

                    while spamEnabled do
                        local randomIndex = math.random(1, #spamChat)
                        local randomValue = spamChat[randomIndex]

                        sendMessage(randomValue)
                        task.wait(chatInterval)
                    end
                end)
            end
        end
    end
})

local bangSeperatorSpace = STab:CreateSection("")

local bangSeperator = STab:CreateSection("Premade Bypasses")

local girlsPussy = {
    MTab:CreateButton({ 
        Name = "(thinks in mind) * oh how i want to absolutely destroy that girls pussy.. *", 
        Callback = function()
            sendMessage("(thinksinmind)*ohhowiwanttoabsolutelyde󠀈󠀈str󠀈󠀈oy󠀈that󠀈󠀈g󠀈󠀈ir󠀈󠀈ls󠀈󠀈󠀈󠀈p󠀈󠀈u󠀈s󠀈󠀈󠀈s󠀈y󠀈󠀈󠀈.󠀈.󠀈󠀈󠀈*")
        end
}),

    RPTab:CreateButton({ 
        Name = "(thinks in mind) * oh how i want to absolutely destroy that girls pussy.. *", 
        Callback = function()
            sendMessage("(thinksinmind)*ohhowiwanttoabsolutelyde󠀈󠀈str󠀈󠀈oy󠀈that󠀈󠀈g󠀈󠀈ir󠀈󠀈ls󠀈󠀈󠀈󠀈p󠀈󠀈u󠀈s󠀈󠀈󠀈s󠀈y󠀈󠀈󠀈.󠀈.󠀈󠀈󠀈*")
        end
    })
}


local whippingCock = {
    MTab:CreateButton({
        Name = "*starts whipping my cock out slowly to the point u wouldnt notice*",
        Callback = function()
            sendMessage("*starts󠀈w󠀈󠀈hip󠀈󠀈p󠀈󠀈i󠀈󠀈n󠀈󠀈g󠀈󠀈my󠀈󠀈c󠀈󠀈o󠀈󠀈c󠀈k󠀈outslowlytothe󠀈po󠀈󠀈i󠀈nt󠀈󠀈u󠀈wouldntnotice*")
        end
    }),


    RPTab:CreateButton({
        Name = "*starts whipping my cock out slowly to the point u wouldnt notice*",
        Callback = function()
            sendMessage("*starts󠀈w󠀈󠀈hip󠀈󠀈p󠀈󠀈i󠀈󠀈n󠀈󠀈g󠀈󠀈my󠀈󠀈c󠀈󠀈o󠀈󠀈c󠀈k󠀈outslowlytothe󠀈po󠀈󠀈i󠀈nt󠀈󠀈u󠀈wouldntnotice*")
        end
    })
}


local wannaHaveSex = {
    MTab:CreateButton({
        Name = "wanna have sex?",
        Callback = function()
            sendMessage("wanna󠀈have󠀈󠀈󠀈s󠀈󠀈󠀈󠀈e󠀈󠀈󠀈x󠀈󠀈?")
        end
    }),
    
    STab:CreateButton({
        Name = "wanna have sex?",
        Callback = function()
            sendMessage("wanna󠀈have󠀈󠀈󠀈s󠀈󠀈󠀈󠀈e󠀈󠀈󠀈x󠀈󠀈?")
        end
    })
}


local gingerblox = {
    MTab:CreateButton({
        Name = "we should all suck gingerblox huge cock",
        Callback = function()
            sendMessage("weshouldalls󠀈󠀈uck󠀈gin󠀈ger󠀈bloxhug󠀈e󠀈c󠀈󠀈oc󠀈󠀈k󠀈󠀈󠀈")
        end
    }),


    CTab:CreateButton({
        Name = "we should all suck gingerblox huge cock",
        Callback = function()
            sendMessage("weshouldalls󠀈󠀈uck󠀈gin󠀈ger󠀈bloxhug󠀈e󠀈c󠀈󠀈oc󠀈󠀈k󠀈󠀈󠀈")
        end
    })
}


local stfu = {
    MTab:CreateButton({
        Name = "shut the fuck up",
        Callback = function()
            sendMessage("󠀈sh󠀈󠀈󠀈󠀈utth󠀈e󠀈󠀈fu󠀈c󠀈k󠀈󠀈up")
        end
    }),


    CTab:CreateButton({
        Name = "shut the fuck up",
        Callback = function()
            sendMessage("󠀈sh󠀈󠀈󠀈󠀈utth󠀈e󠀈󠀈fu󠀈c󠀈k󠀈󠀈up")
        end
    })
}


local rapeYou = {
    MTab:CreateButton({
        Name = "i will rape you",
        Callback = function()
            sendMessage("󠀈iw󠀈󠀈󠀈󠀈󠀈󠀈󠀈󠀈󠀈󠀈󠀈󠀈󠀈ill󠀈󠀈󠀈r󠀈󠀈ap󠀈󠀈eyou")
        end
    }),


    STab:CreateButton({
        Name = "i will rape you",
        Callback = function()
            sendMessage("󠀈iw󠀈󠀈󠀈󠀈󠀈󠀈󠀈󠀈󠀈󠀈󠀈󠀈󠀈ill󠀈󠀈󠀈r󠀈󠀈ap󠀈󠀈eyou")
        end
    })
}   


local soTrue = {
    MTab:CreateButton({
        Name = "that's actually so fucking true tho",
        Callback = function()
            sendMessage("󠀈󠀈that'sactu󠀈allyso󠀈fu󠀈󠀈c󠀈ki󠀈ng󠀈truetho󠀈")
        end
    }),


    CTab:CreateButton({
        Name = "that's actually so fucking true tho",
        Callback = function()
            sendMessage("󠀈󠀈that'sactu󠀈allyso󠀈fu󠀈󠀈c󠀈ki󠀈ng󠀈truetho󠀈")
        end
    })
}    


local thinksSlick = {
    MTab:CreateButton({
        Name = "nah this nigga thinks he's slick",
        Callback = function()
            sendMessage("󠀈nah󠀈󠀈󠀈󠀈this󠀈ni󠀈g󠀈󠀈ga󠀈thinkshe'sslick󠀈󠀈")
        end
    }),


    CTab:CreateButton({
        Name = "nah this nigga thinks he's slick",
        Callback = function()
            sendMessage("󠀈nah󠀈󠀈󠀈󠀈this󠀈ni󠀈g󠀈󠀈ga󠀈thinkshe'sslick󠀈󠀈")
        end
    })
}


local penisErected = {
    MTab:CreateButton({
        Name = "my penis got erected seeing that",
        Callback = function()
            sendMessage("󠀈󠀈my󠀈󠀈󠀈󠀈󠀈pe󠀈󠀈nis󠀈got󠀈er󠀈ec󠀈ted󠀈seeingthat󠀈")
        end
    }),


    STab:CreateButton({
        Name = "my penis got erected seeing that",
        Callback = function()
            sendMessage("󠀈󠀈my󠀈󠀈󠀈󠀈󠀈pe󠀈󠀈nis󠀈got󠀈er󠀈ec󠀈ted󠀈seeingthat󠀈")
        end
    })
}

local joinDiscord = CTab:CreateButton({
    Name = ".gg/yTx8r73wxm | team fly bypasser!",
    Callback = function()
        sendMessage(".󠀈g󠀈g/󠀈󠀈y󠀈Tx8r7󠀈3󠀈󠀈w󠀈x󠀈m󠀈󠀈󠀈󠀈|󠀈team󠀈flybypasser!󠀈")
    end
})


local actuallyFucked = CTab:CreateButton({
    Name = "nah that's actually so fucked",
    Callback = function()
        sendMessage("󠀈nahthat'sactuallyso󠀈fu󠀈󠀈cke󠀈d󠀈")
    end
})


local fuckingInsane = CTab:CreateButton({
    Name = "omg that's fucking insane lol",
    Callback = function()
        sendMessage("󠀈󠀈󠀈omgthat's󠀈󠀈󠀈f󠀈󠀈u󠀈󠀈c󠀈k󠀈󠀈󠀈󠀈i󠀈ng󠀈󠀈in󠀈sa󠀈ne󠀈lol󠀈󠀈󠀈")
    end
})


local fatBitch = CTab:CreateButton({
    Name = "you stupid fatass bitch",
    Callback = function()
        sendMessage("󠀈󠀈󠀈you󠀈stu󠀈pi󠀈d󠀈󠀈󠀈f󠀈󠀈at󠀈as󠀈s󠀈󠀈b󠀈i󠀈tc󠀈h󠀈󠀈󠀈󠀈")
    end
})

local hugeCock = RPTab:CreateButton({
    Name = "*whips huge cock across ur face*",
    Callback = function()
        sendMessage("*󠀈w󠀈hi󠀈󠀈ps󠀈󠀈huge󠀈󠀈󠀈c󠀈oc󠀈󠀈k󠀈󠀈across󠀈ur󠀈face*")
    end
})


local getsErected = RPTab:CreateButton({
    Name = "*gets so erected and hopes they dont notice*",
    Callback = function()
        sendMessage("*󠀈gets󠀈󠀈󠀈so󠀈󠀈󠀈󠀈ere󠀈c󠀈󠀈te󠀈d󠀈󠀈󠀈󠀈and󠀈󠀈󠀈hopes󠀈󠀈󠀈they󠀈󠀈󠀈dont󠀈󠀈󠀈notice󠀈*")
    end
})


local slipIn = RPTab:CreateButton({
    Name = "*slips it in*",
    Callback = function()
        sendMessage("*s󠀈lip󠀈s󠀈󠀈󠀈󠀈it󠀈󠀈󠀈󠀈i󠀈n*")
    end
})


local pornHub = WBTab:CreateButton({
    Name = "pornhub.com",
    Callback = function()
        sendMessage("󠀈p󠀈o󠀈rnh󠀈ub.com󠀈")
    end
})


local jerkMate = WBTab:CreateButton({
    Name = "jerkmate.com",
    Callback = function()
        sendMessage("je󠀈rkm󠀈at󠀈e.com")
    end
})

local onlyfans = WBTab:CreateButton({
    Name = "onlyfans.com/[USERNAME]",
    Callback = function()
        local username = player.Name
        sendMessage("o󠀈nl󠀈yfa󠀈ns.com/" .. username)
    end
})

local hugeAss = STab:CreateButton({
    Name = "damn girl lemme see that huge ass",
    Callback = function()
        sendMessage("󠀈da󠀈mngirllem󠀈meseethathug󠀈e󠀈a󠀈󠀈s󠀈󠀈s󠀈󠀈", "All")
    end
})

local rapingMinors = STab:CreateButton({
    Name = "i love raping minors",
    Callback = function()
        sendMessage("󠀈i󠀈lo󠀈ve󠀈󠀈r󠀈a󠀈p󠀈i󠀈n󠀈󠀈g󠀈󠀈m󠀈ino󠀈󠀈󠀈rs󠀈󠀈󠀈󠀈")
    end
})

local kys = WTab:CreateButton({
    Name = "kys",
    Callback = function()
        sendMessage("󠀈󠀈󠀈󠀈󠀈󠀈k󠀈󠀈󠀈󠀈󠀈у󠀈󠀈󠀈ѕ󠀈󠀈󠀈")
    end
})

local slut = WTab:CreateButton({
    Name = "slut",
    Callback = function()
        sendMessage("󠀈󠀈󠀈󠀈󠀈󠀈s󠀈󠀈I󠀈ut󠀈")
    end
})

local shit = WTab:CreateButton({
    Name = "shit",
    Callback = function()
        sendMessage("󠀈󠀈󠀈󠀈󠀈󠀈sһ󠀈󠀈і󠀈󠀈󠀈󠀈󠀈t󠀈󠀈󠀈")
    end
})

local nigga = WTab:CreateButton({
    Name = "nigga",
    Callback = function()
        sendMessage("󠀈n󠀈і󠀈󠀈gg󠀈а󠀈")
    end
})

local ohFuck = WTab:CreateButton({
    Name = "oh fuck",
    Callback = function()
        sendMessage("󠀈󠀈oh󠀈f󠀈󠀈u󠀈c󠀈󠀈󠀈󠀈k󠀈󠀈")
    end
})

local bitch = WTab:CreateButton({
    Name = "bitch",
    Callback = function()
        sendMessage("󠀈󠀈󠀈b󠀈󠀈i󠀈t󠀈󠀈󠀈󠀈с󠀈󠀈һ󠀈󠀈󠀈")
    end
})

local giantDick = WTab:CreateButton({
    Name = "giant dick",
    Callback = function()
        sendMessage("giant󠀈󠀈d󠀈󠀈i󠀈с󠀗󠀈󠀈󠀈󠀈k󠀈󠀈")
    end
})

local dick = WTab:CreateButton({
    Name = "dick",
    Callback = function()
        sendMessage("d󠀈󠀈і󠀈c󠀗󠀈󠀈k󠀈󠀈")
    end
})

local bbc = WTab:CreateButton({
    Name = "big black cock",
    Callback = function()
        sendMessage("big󠀈󠀈󠀈󠀈󠀈bl󠀈ac󠀈k󠀈с󠀗󠀈󠀈o󠀈󠀈󠀈с󠀗󠀈󠀈󠀈󠀈k󠀈󠀈󠀈󠀈")
    end
})

local pussy = WTab:CreateButton({
    Name = "pussy",
    Callback = function()
        sendMessage("рu󠀇󠀇󠀇󠀇󠀇ѕ󠀇󠀇󠀇ѕ󠀇󠀇󠀇󠀈у󠀈")
    end
})

local retard = WTab:CreateButton({
    Name = "retard",
    Callback = function()
        sendMessage("󠀈󠀈󠀈r󠀈󠀈е󠀈󠀈t󠀈а󠀈r󠀈d")
    end
})

local cumslut = WTab:CreateButton({
    Name = "cumslut",
    Callback = function()
        sendMessage("󠀈󠀈cum󠀈s󠀈󠀈l󠀈u󠀈󠀈󠀈󠀈t󠀈󠀈")
    end
})

local fucktard = WTab:CreateButton({
    Name = "fucktard",
    Callback = function()
        sendMessage("󠀈󠀈󠀈f󠀈󠀈u󠀈󠀈󠀈c󠀈󠀈k󠀈t󠀈󠀈a󠀈r󠀈󠀈󠀈󠀈d󠀈󠀈")
    end
})

local gotDiscord = CTab:CreateButton({
    Name = "u got discord?",
    Callback = function()
        sendMessage("󠀈ug󠀈ot󠀈di󠀈s󠀈c󠀈o󠀈r󠀈󠀈󠀈d󠀈?󠀈")
    end
})

local getOutTheWay = RTab:CreateButton({
    Name = "GET OUT THE FUCKING WAY",
    Callback = function()
        sendMessage("󠀈GET󠀈OUT󠀈THE󠀈󠀈F󠀈UC󠀈󠀈KI󠀈N󠀈G󠀈󠀈WAY󠀈")
    end
})

local getFucked = RTab:CreateButton({
    Name = "GGS GET FUCKED BUDDY",
    Callback = function()
        sendMessage("󠀈GG󠀈SGET󠀈F󠀈U󠀈CK󠀈󠀈E󠀈D󠀈BUD󠀈DY󠀈")
    end
})

local fuckingBlind = RTab:CreateButton({
    Name = "ARE YOU FUCKING BLIND?!",
    Callback = function()
        sendMessage("󠀈AREYOU󠀈F󠀈U󠀈CK󠀈󠀈I󠀈N󠀈GBLIND󠀈?!")
    end
})

local nobodyCares = RTab:CreateButton({
    Name = "NOBODY ACTUALLY GIVES A FUCK",
    Callback = function()
        sendMessage("󠀈NOBODYACTUALLYGIVESA󠀈F󠀈󠀈U󠀈C󠀈K󠀈󠀈")
    end
})

local thrustsCock = RPTab:CreateButton({
    Name = "*thrusts my throbbing hard cock into ur tight ass*",
    Callback = function()
        sendMessage("*󠀇thrustsmythrobbing󠀇ha󠀇rd󠀇󠀇󠀇c󠀇o󠀇󠀇c󠀇k󠀇󠀇intourtight󠀇a󠀇󠀇s󠀇s󠀇󠀇*")
    end
})

local hopOffDick = CTab:CreateButton({
    Name = "hop off my dick",
    Callback = function()
        sendMessage("hopoffmyd󠀇i󠀇󠀇c󠀇k󠀇󠀇")
    end
})

local scriptAss = CTab:CreateButton({
    Name = "that script is ass",
    Callback = function()
        sendMessage("thatscriptisa󠀇s󠀇󠀇s󠀇󠀇")
    end
})

local realShit = CTab:CreateButton({
    Name = "real shit gang ❤️",
    Callback = function()
        sendMessage("󠀇real󠀇s󠀇h󠀇i󠀇t󠀇ga󠀇ng󠀇❤️󠀇")
    end
})

local pipeDown = CTab:CreateButton({
    Name = "pipe down and suck my cock",
    Callback = function()
        sendMessage("pipedownand󠀇s󠀇uc󠀇kmy󠀇c󠀇oc󠀇k󠀇󠀇")
    end
})

local fwThat = CTab:CreateButton({
    Name = "tbh i fuck with that",
    Callback = function()
        sendMessage("tbhifu󠀇ck󠀇wi󠀇t󠀇hth󠀇a󠀇t")
    end
})

local chillPill = CTab:CreateButton({
    Name = "take a fucking chill pill",
    Callback = function()
        sendMessage("takeafu󠀇ck󠀇i󠀇n󠀇gchi󠀇llpil󠀇l")
    end
})

local discordCom = WBTab:CreateButton({
    Name = "discord.com",
    Callback = function()
        sendMessage("󠀇󠀇di󠀇s󠀇co󠀇󠀇rd󠀇.c󠀇o󠀇m󠀇󠀇")
    end
})

local youtube = WBTab:CreateButton({
    Name = "youtube.com",
    Callback = function()
        sendMessage("󠀇y󠀇o󠀇󠀇ut󠀇u󠀇be󠀇󠀇.c󠀇o󠀇m󠀇󠀇")
    end
})

local babblingCunt = CTab:CreateButton({
    Name = "shut up you babbling cunt",
    Callback = function()
        sendMessage("󠀇󠀈shut󠀈up󠀈yo󠀈u󠀈bab󠀈bl󠀈ing󠀈c󠀈un󠀈t󠀈󠀇󠀇")
    end
})

local babblingCuntRage = RTab:CreateButton({
    Name = "OMG STFU YOU BABBLING CUNT!!",
    Callback = function()
        sendMessage("󠀇󠀈󠀈OMG󠀈󠀈ST󠀈FU󠀈󠀈YOU󠀈BA󠀈BBL󠀈ING󠀈󠀈CU󠀈N󠀈T!!󠀈󠀇")
    end
})

local eWebsite = WBTab:CreateButton({
    Name = "e621.net",
    Callback = function()
        sendMessage("󠀈e6󠀈21󠀈.n󠀈et󠀈")
    end
})

local currentGameName = gameIds[game.PlaceId]

if currentGameName then
    local BTab = Window:CreateTab("Booths", 88655102796043)

    local decalId = 0

    function customizeBooth(boothText, decal)
        local args = {
            [1] = "Update",
            [2] = {
                ["DescriptionText"] = boothText,
                ["ImageId"] = decal
            }
        }

        game:GetService("ReplicatedStorage"):WaitForChild("CustomiseBooth"):FireServer(unpack(args))  
    end

    local boothsWarning = BTab:CreateParagraph({
        Title = "Booths",
        Content = "We have detected that you are playing Rate My Avatar! Here are some booth bypasses:"
    })

    local changeImageId = BTab:CreateInput({
        Name = "Image ID",
        PlaceholderText = "Type Decal ID here.",
        Callback = function(Text)
            decalId = Text
        end
    })

    local boothSeperatorSpace = BTab:CreateSection("")

    local boothSeperator = BTab:CreateSection("Booth Bypasses")

    local fuckChatFilter = BTab:CreateButton({
        Name = "fuck the chat filter",
        Callback = function()
            customizeBooth("󠀈f󠀈u󠀈󠀈c󠀈k󠀈thechatfilter", decalId)
        end
    })

    local askDiddyAnything = BTab:CreateButton({
        Name = "ask diddy anything",
        Callback = function()
            customizeBooth("󠀈ask󠀈d󠀈id󠀈d󠀈y󠀈anything󠀈", decalId)
        end
    })

    local askRapist = BTab:CreateButton({
        Name = "ask a rapist anything",
        Callback = function()
            customizeBooth("askar󠀈a󠀈pis󠀈tanything", decalId)
        end
    })

    local askRaper = BTab:CreateButton({
        Name = "ask a raper anything",
        Callback = function()
            customizeBooth("󠀈aska󠀈ra󠀈p󠀈er󠀈anything󠀈", decalId)
        end
    })

    local kidsTouched = BTab:CreateButton({
        Name = "guessing how many kids you've fucked",
        Callback = function()
            customizeBooth("guessinghowmanykids you've󠀈fuc󠀈ke󠀈d󠀈󠀈", decalId)
        end
    })

    local freeDiddy = BTab:CreateButton({
        Name = "FREE DIDDY!",
        Callback = function()
            customizeBooth("FR󠀈EE󠀈DI󠀈DD󠀈Y󠀈!󠀈", decalId)
        end
    })
end
