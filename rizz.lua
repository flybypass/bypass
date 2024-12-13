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

-- Get the current channel for the player
local function getTextChatChannel()
    local player = game.Players.LocalPlayer
    for _, channel in pairs(TextChatService:GetChannels()) do
        if channel.Name == "RBXGeneral" then
            return channel
        end
    end
    return nil
end

Tabs.Main:CreateButton({
    Name = "Say Line",
    Callback = function()
        if Line and type(Line) == "string" and Line ~= "Select a line here!" then
            local channel = getTextChatChannel()
            if channel then
                local success, err = pcall(function()
                    channel:SendAsync(Line)
                end)
                if not success then
                    warn("Error sending message: " .. err)
                end
            else
                warn("RBXGeneral chat channel not found!")
            end
        else
            warn("Invalid Line selected!")
        end
    end
})

Tabs.Main:CreateButton({
    Name = "Say Random Line",
    Callback = function()
        local randomLine = "Hello, world!"  
        if randomLine and type(randomLine) == "string" then
            local channel = getTextChatChannel()
            if channel then
                local success, err = pcall(function()
                    channel:SendAsync(randomLine)
                end)
                if not success then
                    warn("Error sending message: " .. err)
                end
            else
                warn("RBXGeneral chat channel not found!")
            end
        else
            warn("No valid random line found!")
        end
    end
})
