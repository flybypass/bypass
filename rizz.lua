local cloneref = clonereference or clonereference
local cache = {}
local Services = setmetatable({}, {
    __index = function(_, serviceName)
        local service = cache[serviceName]
        if not service then
            service = cloneref()
            cache[serviceName] = service
        end
        return service
    end
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Packages = {
    Lines = {"Want to come to my place and watch Family Guy?", "Are you from Tennessee? Because you're the only 10 I see.", "If I could rearrange the alphabet, I’d put “U” and “I” together."}
}

local Window = Rayfield:CreateWindow({
    Name = "Rizzler - 1-0",
    LoadingTitle = "Rizzler",
    LoadingSubtitle = "by @exrand",
    DisableRayfieldPrompts = true,
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "Big Hub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "Rizzler Gateway",
        Subtitle = "Enter the code.",
        Note = "join the dsc for key",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"therail"}
    }
})

local Tabs = {
    Main = Window:CreateTab("Main", 4483362458)
}
local RizzlerModule = Tabs.Main:CreateSection("Rizzler")

Tabs.Main:CreateLabel(#Packages.Lines .. " lines are on your fingertips.")
local Line = "Select a line here!"
Tabs.Main:CreateDropdown({
    Name = "Select Line",
    Options = Packages.Lines,
    CurrentOption = {Line},
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(Option)
        Line = Option
    end
})

local sendMessage = function(message)
    if TextChatService then
        local textChannels = TextChatService:FindFirstChild("TextChannels")
        if textChannels then
            local textChannel = textChannels:FindFirstChild("RBXGeneral")
            if textChannel then
                textChannel:SendAsync(message)
                return
            else
                warn("RBXGeneral channel not found in TextChatService.")
            end
        else
            warn("TextChannels not found in TextChatService.")
        end
    end
    if ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") then
        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
    else
        warn("Legacy chat events are not available.")
    end
end

Tabs.Main:CreateButton({
    Name = "Say Line",
    Callback = function()
        if Line and type(Line) == "string" and Line ~= "Select a line here!" then
            sendMessage(Line)
        else
            warn("Invalid Line selected!")
        end
    end
})

Tabs.Main:CreateButton({
    Name = "Say Random Line",
    Callback = function()
        local RandomLine = Packages.Lines[math.random(1, #Packages.Lines)]
        if RandomLine and type(RandomLine) == "string" then
            sendMessage(RandomLine)
        else
            warn("No valid random line found!")
        end
    end
})
