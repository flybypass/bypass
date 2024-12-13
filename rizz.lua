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

local Window = Rayfield:CreateWindow({
    Name = "Rizzler - 1.1",
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
        Key = {"they"}
    }
})

local Tabs = {
    Main = Window:CreateTab("Main", 4483362458)
}

local Line = "Select a line here!"
Tabs.Main:CreateLabel("Ready to send a message?")
Tabs.Main:CreateDropdown({
    Name = "Select Line",
    Options = {"Line 1", "Line 2", "Line 3"},
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
        local RandomLine = "Line 1"
        sendMessage(RandomLine)
    end
})
