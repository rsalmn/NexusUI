-- Example usage for a Roblox Hub UI
local Nexus = loadstring(game:HttpGet("https://raw.githubusercontent.com/rsalmn/NexusUI/refs/heads/main/NexusUI.lua",true))() -- Adjust path as needed

-- Create your main hub window
local hub = Nexus:Window({
    Title = "Nexus Hub",
    Welcome = true,  -- Show welcome animation
    Watermark = true -- Show performance watermark
})

-- Create main tabs
local mainTab = hub:Tab("Main")
local settingsTab = hub:Tab("Settings")
local utilitiesTab = hub:Tab("Utilities")

-- Main Tab Content
mainTab:Section("Welcome")
mainTab:Paragraph("Welcome to Nexus Hub!", "This is your all-in-one management system.")

-- Create a ServerCard (premium feature)
mainTab:ServerCard()

-- Create buttons
mainTab:Divider()
mainTab:Section("Quick Actions")

mainTab:Button({
    Text = "Start Server",
    Callback = function()
        print("Starting server...")
        Nexus:Notify({
            Title = "Server Started",
            Content = "The server is now running!",
            Duration = 2
        })
    end
})

mainTab:Button({
    Text = "Stop Server",
    Callback = function()
        print("Stopping server...")
        Nexus:Notify({
            Title = "Server Stopped",
            Content = "The server has been stopped.",
            Duration = 2
        })
    end
})

-- Settings Tab
settingsTab:Section("Appearance")
settingsTab:Dropdown({
    Text = "Theme",
    Options = {"Dark", "Light", "Ocean", "Midnight", "Cosmic"},
    Callback = function(selected)
        Nexus:SetTheme(selected)
        print("Theme changed to:", selected)
    end,
    Flag = "selectedTheme"
})

settingsTab:Toggle({
    Text = "Enable Notifications",
    Default = true,
    Callback = function(state)
        print("Notifications:", state and "Enabled" or "Disabled")
    end,
    Flag = "notificationsEnabled"
})

settingsTab:Slider({
    Text = "UI Scale",
    Min = 0.8,
    Max = 1.5,
    Default = 1.0,
    Callback = function(value)
        print("UI Scale:", value)
    end,
    Flag = "uiScale"
})

settingsTab:Divider()
settingsTab:Section("System Settings")

settingsTab:Input({
    Text = "Server Name",
    Placeholder = "Enter server name...",
    Callback = function(text)
        print("Server name set to:", text)
    end
})

-- Utilities Tab
utilitiesTab:Section("Utilities")
utilitiesTab:ButtonCard({
    Title = "Player Manager",
    Description = "Manage players and permissions",
    Callback = function()
        print("Opening Player Manager...")
    end
})

utilitiesTab:ButtonCard({
    Title = "Settings Editor",
    Description = "Advanced configuration options",
    Callback = function()
        print("Opening Settings Editor...")
    end
})

utilitiesTab:Section("Tools")

utilitiesTab:MultiDropdown({
    Text = "Selected Tools",
    Options = {"Admin Tools", "Developer Tools", "Moderation", "Analytics", "Security"},
    Default = {"Admin Tools", "Developer Tools"},
    Callback = function(selected)
        print("Selected tools:", table.concat(selected, ", "))
    end
})

-- Add floating action button (premium feature)
-- You can use this in your main content area
local fab = mainTab:CreateControls(mainTab).FAB({
    Icon = "+",
    Callback = function()
        print("FAB clicked!")
        Nexus:CreatePremiumNotification({
            Title = "Action Triggered",
            Content = "Floating action button was clicked",
            Duration = 2
        })
    end
})

-- Load saved settings
task.delay(0.1, function()
    Nexus:Load("hubSettings")
end)

-- Add some built-in server information
local serverInfo = {
    Players = 15,
    MaxPlayers = 50,
    Ping = 42,
    FPS = 59
}

-- Add a progress indicator
local progress = utilitiesTab:ProgressIndicator({
    Text = "Server Status",
    Callback = function(value)
        print("Progress:", value)
    end
})

-- Example of setting progress
task.spawn(function()
    local progressValue = 0
    while true do
        task.wait(2)
        progressValue = (progressValue + 5) % 100
        progress:Set(progressValue)
    end
end)
