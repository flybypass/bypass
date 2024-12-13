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
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

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

local function sendMessage(message)
    local chatEvents = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents")
    local sayMessageEvent = chatEvents:WaitForChild("SayMessageRequest")

    local success, err = pcall(function()
        sayMessageEvent:FireServer(message, Enum.ChatColor.White)
    end)
    
    if not success then
        warn("Error sending message: " .. err)
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
