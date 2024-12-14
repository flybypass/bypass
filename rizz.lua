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
    Name = "Rizzer",
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
        Key = {"rizz"}
    }
})

local Tabs = {
    Main = Window:CreateTab("Main", 4483362458)
}
local RizzlerModule = Tabs.Main:CreateSection("Rizzler")

Tabs.Main:CreateLabel(#Packages.Lines .. " lines are on your fingertips.")
Tabs.Main:CreateDropdown({
    Name = "Select Line",
    Options = Packages.Lines,
    CurrentOption = {"Select a line here!"},
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(Option)
        Line = CurrentOption
    end
})

Tabs.Main:CreateButton({
    Name = "Say Line",
    Callback = function()
        if Remote then
            Remote:FireServer(Line, "All")
        else
            TargetChannel = TextChatService.TextChannels["RBXGeneral"]
            TargetChannel:SendAsync(Line)
        end
    end
})

Tabs.Main:CreateButton({
    Name = "Say Random Line",
    Callback = function()
        RandomLine = Packages.Lines[math.random(1, #Packages.Lines)]
        if Remote then
            Remote:FireServer(RandomLine, "All")
        else
            TargetChannel = TextChatService.TextChannels["RBXGeneral"]
            TargetChannel:SendAsync(RandomLine)
        end
    end
})
