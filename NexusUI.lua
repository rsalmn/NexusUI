--[[ 
    NEXUS UI (v4.0 - Enhanced Edition)
    ✨ New Features: Modern Dropdown, Error Prevention, Performance Boost
    🎨 Design: Glassmorphism, Smooth Animations, Better UX
]]

local Nexus = {
    Flags = {}, 
    Registry = {}, 
    Connections = {},
    IsDestroyed = false,
    Theme = {
        Accent = Color3.fromRGB(88, 166, 255),
        AccentHover = Color3.fromRGB(108, 186, 255),
        Background = Color3.fromRGB(16, 16, 20),
        Surface = Color3.fromRGB(24, 24, 28),
        SurfaceHigh = Color3.fromRGB(32, 32, 38),
        SurfaceHighest = Color3.fromRGB(42, 42, 48),
        Text = Color3.fromRGB(245, 245, 250),
        TextSub = Color3.fromRGB(180, 180, 190),
        TextMuted = Color3.fromRGB(120, 120, 135),
        Outline = Color3.fromRGB(60, 60, 70),
        Success = Color3.fromRGB(72, 187, 120),
        Warning = Color3.fromRGB(251, 191, 36),
        Error = Color3.fromRGB(248, 113, 113),
        Gradient1 = Color3.fromRGB(88, 166, 255),
        Gradient2 = Color3.fromRGB(147, 51, 234),
        Shadow = Color3.fromRGB(0, 0, 0)
    }
}

--// Services with error handling
local Services = {}
local function GetService(serviceName)
    if not Services[serviceName] then
        local success, service = pcall(function()
            return game:GetService(serviceName)
        end)
        Services[serviceName] = success and service or nil
    end
    return Services[serviceName]
end

local TweenService = GetService("TweenService")
local UserInputService = GetService("UserInputService")
local RunService = GetService("RunService")
local HttpService = GetService("HttpService")
local Players = GetService("Players")
local CoreGui = GetService("CoreGui")
local Lighting = GetService("Lighting")
local Stats = GetService("Stats")
local SoundService = GetService("SoundService")

--// Enhanced Helpers with error handling
local function SafeCreate(class, props, children)
    local success, inst = pcall(function()
        return Instance.new(class)
    end)
    
    if not success then
        warn("[Nexus] Failed to create " .. tostring(class))
        return nil
    end
    
    if props then
        for property, value in pairs(props) do
            pcall(function()
                inst[property] = value
            end)
        end
    end
    
    if children then
        for _, child in pairs(children) do
            if child and typeof(child) == "Instance" then
                child.Parent = inst
            end
        end
    end
    
    return inst
end

local function Create(class, props, children)
    return SafeCreate(class, props, children)
end

local function AddCorner(parent, radius)
    if not parent or not parent.Parent then return end
    return Create("UICorner", {
        CornerRadius = UDim.new(0, radius or 8),
        Parent = parent
    })
end

local function AddStroke(parent, color, thickness, transparency)
    if not parent or not parent.Parent then return end
    return Create("UIStroke", {
        Color = color or Nexus.Theme.Outline,
        Thickness = thickness or 1,
        Transparency = transparency or 0.6,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = parent
    })
end

local function AddShadow(parent, size, transparency)
    if not parent or not parent.Parent then return end
    
    local shadow = Create("ImageLabel", {
        Name = "DropShadow",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(-size, -size),
        Size = UDim2.new(1, size * 2, 1, size * 2),
        ZIndex = parent.ZIndex - 1,
        Image = "rbxassetid://6014261993",
        ImageColor3 = Nexus.Theme.Shadow,
        ImageTransparency = transparency or 0.8,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(49, 49, 450, 450),
        Parent = parent
    })
    
    return shadow
end

local function Tween(inst, props, time, style, direction, callback)
    -- [GANTI] dengan baris baru ini:
    if not inst or typeof(inst) ~= "Instance" or not inst.Parent then 
        warn("[NexusUI] Tween Error: Object is not an Instance!") 
        return 
    end
    
    local info = TweenInfo.new(
        time or 0.25,
        style or Enum.EasingStyle.Quad,
        direction or Enum.EasingDirection.Out
    )
    
    local tween = TweenService:Create(inst, info, props)
    tween:Play()
    
    if callback then
        tween.Completed:Connect(callback)
    end
    
    return tween
end

local function MakeDraggable(gui, handle)
    if not gui or not gui.Parent then return end
    
    local dragHandle = handle or gui
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    local function onInputBegan(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            
            --PlaySound("6895079853", 0.05) -- Subtle click sound
        end
    end
    
    local function onInputChanged(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or 
                        input.UserInputType == Enum.UserInputType.Touch) then
            
            local delta = input.Position - dragStart
            local newPos = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
            
            Tween(gui, {Position = newPos}, 0.1)
        end
    end
    
    local function onInputEnded(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or
           input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end
    
    -- Store connections for cleanup
    table.insert(Nexus.Connections, dragHandle.InputBegan:Connect(onInputBegan))
    table.insert(Nexus.Connections, dragHandle.InputChanged:Connect(onInputChanged))
    table.insert(Nexus.Connections, UserInputService.InputEnded:Connect(onInputEnded))
end

--// Enhanced Blur System
local BlurEffect = nil
local function InitializeBlur()
    if BlurEffect then return end
    
    pcall(function()
        BlurEffect = Instance.new("BlurEffect")
        BlurEffect.Name = "NexusBlur"
        BlurEffect.Size = 0
        BlurEffect.Parent = Lighting
    end)
end

local function SetBlur(enabled, intensity)
    if not BlurEffect then InitializeBlur() end
    if not BlurEffect then return end
    
    local targetSize = enabled and (intensity or 15) or 0
    -- Gunakan Quint untuk transisi blur yang lebih halus
    Tween(BlurEffect, {Size = targetSize}, 0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out) 
end

--// Enhanced Config System
function Nexus:SaveConfig(name)
    if not name or name == "" then return false end
    
    local success, result = pcall(function()
        if not isfolder("NexusConfig") then 
            makefolder("NexusConfig") 
        end
        
        local configData = {
            flags = Nexus.Flags,
            theme = "Custom", -- Could be expanded
            timestamp = os.time(),
            version = "4.0"
        }
        
        local json = HttpService:JSONEncode(configData)
        writefile("NexusConfig/" .. name .. ".json", json)
        return true
    end)
    
    return success and result
end

function Nexus:LoadConfig(name)
    if not name or name == "" then return false end
    
    local success, result = pcall(function()
        local filePath = "NexusConfig/" .. name .. ".json"
        if not isfile(filePath) then return false end
        
        local json = readfile(filePath)
        local data = HttpService:JSONDecode(json)
        
        if data.flags then
            for flag, value in pairs(data.flags) do
                if Nexus.Registry[flag] and Nexus.Registry[flag].Set then
                    Nexus.Registry[flag].Set(value)
                end
            end
        end
        
        return true
    end)
    
    return success and result
end

function Nexus:GetConfigs()
    local configs = {}
    pcall(function()
        if isfolder("NexusConfig") then
            for _, file in ipairs(listfiles("NexusConfig")) do
                local name = file:match("([^/\\]+)%.json$")
                if name then
                    table.insert(configs, name)
                end
            end
        end
    end)
    return configs
end

--// Enhanced Theme System
Nexus.ThemeChanged = Instance.new("BindableEvent")

local function UpdateThemeColors()
    -- Add subtle transparency and glow effects
    Nexus.Theme.AccentGlow = Color3.new(
        math.min(Nexus.Theme.Accent.R + 0.1, 1),
        math.min(Nexus.Theme.Accent.G + 0.1, 1),
        math.min(Nexus.Theme.Accent.B + 0.1, 1)
    )
end

function Nexus:SetTheme(themeName, customColors)
    local Themes = {
        Dark = {
            Accent = Color3.fromRGB(88, 166, 255),
            AccentHover = Color3.fromRGB(108, 186, 255),
            Background = Color3.fromRGB(16, 16, 20),
            Surface = Color3.fromRGB(24, 24, 28),
            SurfaceHigh = Color3.fromRGB(32, 32, 38),
            SurfaceHighest = Color3.fromRGB(42, 42, 48),
            Text = Color3.fromRGB(245, 245, 250),
            TextSub = Color3.fromRGB(180, 180, 190),
            TextMuted = Color3.fromRGB(120, 120, 135),
            Outline = Color3.fromRGB(60, 60, 70),
            Success = Color3.fromRGB(72, 187, 120),
            Warning = Color3.fromRGB(251, 191, 36),
            Error = Color3.fromRGB(248, 113, 113),
            Gradient1 = Color3.fromRGB(88, 166, 255),
            Gradient2 = Color3.fromRGB(147, 51, 234),
            Shadow = Color3.fromRGB(0, 0, 0)
        },
        Light = {
            Accent = Color3.fromRGB(59, 130, 246),
            AccentHover = Color3.fromRGB(79, 150, 266),
            Background = Color3.fromRGB(248, 250, 252),
            Surface = Color3.fromRGB(255, 255, 255),
            SurfaceHigh = Color3.fromRGB(241, 245, 249),
            SurfaceHighest = Color3.fromRGB(226, 232, 240),
            Text = Color3.fromRGB(15, 23, 42),
            TextSub = Color3.fromRGB(71, 85, 105),
            TextMuted = Color3.fromRGB(148, 163, 184),
            Outline = Color3.fromRGB(203, 213, 225),
            Success = Color3.fromRGB(34, 197, 94),
            Warning = Color3.fromRGB(245, 158, 11),
            Error = Color3.fromRGB(239, 68, 68),
            Gradient1 = Color3.fromRGB(59, 130, 246),
            Gradient2 = Color3.fromRGB(147, 51, 234),
            Shadow = Color3.fromRGB(0, 0, 0)
        },
        Ocean = {
            Accent = Color3.fromRGB(6, 182, 212),
            AccentHover = Color3.fromRGB(34, 197, 94),
            Background = Color3.fromRGB(8, 17, 25),
            Surface = Color3.fromRGB(15, 30, 42),
            SurfaceHigh = Color3.fromRGB(22, 45, 62),
            SurfaceHighest = Color3.fromRGB(30, 58, 82),
            Text = Color3.fromRGB(226, 245, 255),
            TextSub = Color3.fromRGB(164, 202, 225),
            TextMuted = Color3.fromRGB(125, 162, 185),
            Outline = Color3.fromRGB(45, 78, 102),
            Success = Color3.fromRGB(72, 187, 120),
            Warning = Color3.fromRGB(251, 191, 36),
            Error = Color3.fromRGB(248, 113, 113),
            Gradient1 = Color3.fromRGB(6, 182, 212),
            Gradient2 = Color3.fromRGB(59, 130, 246),
            Shadow = Color3.fromRGB(0, 0, 0)
        },
        Neon = {
            Accent = Color3.fromRGB(255, 20, 147),
            AccentHover = Color3.fromRGB(255, 60, 180),
            Background = Color3.fromRGB(10, 10, 15),
            Surface = Color3.fromRGB(18, 18, 25),
            SurfaceHigh = Color3.fromRGB(25, 25, 35),
            SurfaceHighest = Color3.fromRGB(35, 35, 48),
            Text = Color3.fromRGB(255, 255, 255),
            TextSub = Color3.fromRGB(200, 200, 220),
            TextMuted = Color3.fromRGB(150, 150, 170),
            Outline = Color3.fromRGB(255, 20, 147),
            Success = Color3.fromRGB(57, 255, 20),
            Warning = Color3.fromRGB(255, 165, 0),
            Error = Color3.fromRGB(255, 69, 0),
            Gradient1 = Color3.fromRGB(255, 20, 147),
            Gradient2 = Color3.fromRGB(138, 43, 226),
            Shadow = Color3.fromRGB(0, 0, 0)
        }
    }
    
    -- Custom theme handling
    if customColors then
        Themes.Custom = {}
        for key, value in pairs(Nexus.Theme) do
            Themes.Custom[key] = customColors[key] or value
        end
    end
    
    local selectedTheme = Themes[themeName]
    if selectedTheme then
        for key, value in pairs(selectedTheme) do
            Nexus.Theme[key] = value
        end
        
        UpdateThemeColors()
        
        if Nexus.ThemeChanged then
            Nexus.ThemeChanged:Fire(Nexus.Theme)
        end
        
        return true
    end
    
    return false
end

--// Initialize default theme
UpdateThemeColors()

--// Enhanced Dropdown Component
local function CreateModernDropdown(cfg, ParentFrame)
    -- Validation
    if not cfg then cfg = {} end
    if not ParentFrame or not ParentFrame.Parent then return nil end
    
    local Text = cfg.Text or "Dropdown"
    local Options = cfg.Options or {"No Options"}
    local Default = cfg.Default
    local Callback = cfg.Callback or function() end
    local Flag = cfg.Flag
    local MultiSelect = cfg.MultiSelect or false
    local SearchEnabled = cfg.Search or false
    local MaxVisible = cfg.MaxVisible or 6
    
    -- Validate options
    if type(Options) ~= "table" or #Options == 0 then
        Options = {"No Options Available"}
    end
    
    -- Clean options
    local CleanOptions = {}
    for i, option in ipairs(Options) do
        if option ~= nil then
            table.insert(CleanOptions, tostring(option))
        end
    end
    
    if #CleanOptions == 0 then
        CleanOptions = {"Empty"}
    end
    
    -- Initialize values
    local SelectedValues = MultiSelect and {} or nil
    local CurrentValue = Default and tostring(Default) or CleanOptions[1]
    local IsOpen = false
    local FilteredOptions = CleanOptions
    local SearchQuery = ""
    
    if MultiSelect and Default then
        if type(Default) == "table" then
            for _, v in ipairs(Default) do
                SelectedValues[tostring(v)] = true
            end
        else
            SelectedValues[tostring(Default)] = true
        end
    end
    
    -- Calculate dimensions
    local baseHeight = 44
    local optionHeight = 36
    local maxDropdownHeight = math.min(#CleanOptions, MaxVisible) * optionHeight + (SearchEnabled and 40 or 8)
    
    -- Main container
    local MainFrame = Create("Frame", {
        BackgroundColor3 = Nexus.Theme.Surface,
        Size = UDim2.new(1, 0, 0, baseHeight),
        ClipsDescendants = false, -- PENTING!
        Parent = ParentFrame,
        ZIndex = 20 -- ZIndex tinggi
    })
    
    if not MainFrame then return nil end
    
    AddCorner(MainFrame, 8)
    AddStroke(MainFrame, Nexus.Theme.Outline, 1, 0.4)
    AddShadow(MainFrame, 4, 0.9) -- Shadow sekarang akan terlihat
    
    -- Header section
    local Header = Create("Frame", {
        BackgroundColor3 = Nexus.Theme.SurfaceHigh,
        Size = UDim2.new(1, 0, 1, 0), -- Full size dari MainFrame
        Parent = MainFrame,
        ZIndex = 21
    })
    
    AddCorner(Header, 8)
    
    -- Gradient overlay
    local HeaderGradient = Create("UIGradient", {
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0.95, 0.95, 0.95))
        },
        Rotation = 90,
        Transparency = NumberSequence.new{
            NumberSequenceKeypoint.new(0, 0.98),
            NumberSequenceKeypoint.new(1, 0.95)
        },
        Parent = Header
    })
    
    -- Icon
    local Icon = Create("TextLabel", {
        Text = MultiSelect and "☰" or "▼", Font = Enum.Font.GothamBold, TextSize = 14,
        TextColor3 = Nexus.Theme.Accent, BackgroundTransparency = 1,
        Position = UDim2.new(0, 12, 0, 0), Size = UDim2.new(0, 20, 1, 0),
        Parent = Header, ZIndex = 22
    })
    
    -- Label
    local function UpdateLabel()
        local displayText = Text .. ": "
        
        if MultiSelect then
            local selectedCount = 0
            local selectedItems = {}
            
            for value, selected in pairs(SelectedValues or {}) do
                if selected then
                    selectedCount = selectedCount + 1
                    table.insert(selectedItems, value)
                end
            end
            
            if selectedCount == 0 then
                displayText = displayText .. "None Selected"
            elseif selectedCount == 1 then
                displayText = displayText .. selectedItems[1]
            elseif selectedCount <= 3 then
                displayText = displayText .. table.concat(selectedItems, ", ")
            else
                displayText = displayText .. selectedCount .. " Selected"
            end
        else
            displayText = displayText .. (CurrentValue or "None")
        end
        
        return displayText
    end
    
    local Label = Create("TextLabel", {
        Text = UpdateLabel(),
        Font = Enum.Font.GothamMedium,
        TextSize = 14,
        TextColor3 = Nexus.Theme.Text,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 40, 0, 0),
        Size = UDim2.new(1, -80, 1, 0),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = Header
    })
    
    -- Arrow
    local Arrow = Create("TextLabel", {
        Text = "⌄",
        Font = Enum.Font.GothamBold,
        TextSize = 16,
        TextColor3 = Nexus.Theme.TextSub,
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -32, 0, 0),
        Size = UDim2.new(0, 24, 1, 0),
        Parent = Header
    })
    
    -- Button
    local Button = Create("TextButton", {
        Text = "",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        Parent = Header
    })
    
    -- Dropdown content
    local Content = Create("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, baseHeight),
        Size = UDim2.new(1, 0, 0, 0),
        ClipsDescendants = true,
        Parent = MainFrame
    })
    
    -- Search box (if enabled)
    local SearchBox = nil
    if SearchEnabled then
        local SearchContainer = Create("Frame", {
            BackgroundColor3 = Nexus.Theme.SurfaceHighest,
            Size = UDim2.new(1, -8, 0, 32),
            Position = UDim2.new(0, 4, 0, 4),
            Parent = Content
        })
        
        AddCorner(SearchContainer, 6)
        AddStroke(SearchContainer, Nexus.Theme.Accent, 1, 0.7)
        
        SearchBox = Create("TextBox", {
            Text = "",
            PlaceholderText = "🔍 Search options...",
            PlaceholderColor3 = Nexus.Theme.TextMuted,
            Font = Enum.Font.Gotham,
            TextSize = 13,
            TextColor3 = Nexus.Theme.Text,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 8, 0, 0),
            Size = UDim2.new(1, -16, 1, 0),
            TextXAlignment = Enum.TextXAlignment.Left,
            ClearTextOnFocus = false,
            Parent = SearchContainer
        })
    end
    
    -- Options container
    local OptionsContainer = Create("ScrollingFrame", {
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 4, 0, SearchEnabled and 40 or 4),
        Size = UDim2.new(1, -8, 1, -(SearchEnabled and 44 or 8)),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Nexus.Theme.Accent,
        ScrollBarImageTransparency = 0.5,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        Parent = Content
    })
    
    local OptionsLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 2),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = OptionsContainer
    })
    
    -- Update canvas size when content changes
    OptionsLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        if OptionsContainer and OptionsContainer.Parent then
            OptionsContainer.CanvasSize = UDim2.new(0, 0, 0, OptionsLayout.AbsoluteContentSize.Y + 4)
        end
    end)
    
    -- Filter options function
    local function FilterOptions(query)
        query = query:lower()
        FilteredOptions = {}
        
        for _, option in ipairs(CleanOptions) do
            if query == "" or option:lower():find(query, 1, true) then
                table.insert(FilteredOptions, option)
            end
        end
        
        if #FilteredOptions == 0 then
            FilteredOptions = {"No matches found"}
        end
    end
    
    -- Render options function
    local function RenderOptions()
        -- Clear existing options
        for _, child in ipairs(OptionsContainer:GetChildren()) do
            if child:IsA("TextButton") or child:IsA("Frame") then
                child:Destroy()
            end
        end
        
        -- Create option buttons
        for i, option in ipairs(FilteredOptions) do
            if option == "No matches found" or option == "No Options Available" or option == "Empty" then
                -- Disabled option
                local DisabledOption = Create("Frame", {
                    BackgroundColor3 = Nexus.Theme.SurfaceHigh,
                    BackgroundTransparency = 0.5,
                    Size = UDim2.new(1, 0, 0, optionHeight - 4),
                    LayoutOrder = i,
                    Parent = OptionsContainer
                })
                
                AddCorner(DisabledOption, 6)
                
                Create("TextLabel", {
                    Text = option,
                    Font = Enum.Font.Gotham,
                    TextSize = 13,
                    TextColor3 = Nexus.Theme.TextMuted,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, -16, 1, 0),
                    Position = UDim2.new(0, 8, 0, 0),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = DisabledOption
                })
                
                continue
            end
            
            -- Regular option
            local OptionButton = Create("TextButton", {
                Text = "",
                BackgroundColor3 = Nexus.Theme.SurfaceHigh,
                BackgroundTransparency = MultiSelect and (SelectedValues[option] and 0.1 or 0.8) or 
                                        (option == CurrentValue and 0.1 or 0.8),
                Size = UDim2.new(1, 0, 0, optionHeight - 4),
                AutoButtonColor = false,
                LayoutOrder = i,
                Parent = OptionsContainer
            })
            
            AddCorner(OptionButton, 6)
            
            if MultiSelect and SelectedValues[option] then
                AddStroke(OptionButton, Nexus.Theme.Accent, 1, 0.3)
            elseif not MultiSelect and option == CurrentValue then
                AddStroke(OptionButton, Nexus.Theme.Accent, 1, 0.3)
            end
            
            -- Option content
            local OptionContent = Create("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Parent = OptionButton
            })
            
            -- Checkmark for multiselect or selected indicator
            if MultiSelect then
                local Checkmark = Create("TextLabel", {
                    Text = SelectedValues[option] and "✓" or "○",
                    Font = Enum.Font.GothamBold,
                    TextSize = 14,
                    TextColor3 = SelectedValues[option] and Nexus.Theme.Accent or Nexus.Theme.TextMuted,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 8, 0, 0),
                    Size = UDim2.new(0, 20, 1, 0),
                    Parent = OptionContent
                })
            elseif option == CurrentValue then
                Create("TextLabel", {
                    Text = "●",
                    Font = Enum.Font.GothamBold,
                    TextSize = 12,
                    TextColor3 = Nexus.Theme.Accent,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 8, 0, 0),
                    Size = UDim2.new(0, 16, 1, 0),
                    Parent = OptionContent
                })
            end
            
            -- Option text
            local OptionText = Create("TextLabel", {
                Text = option,
                Font = Enum.Font.Gotham,
                TextSize = 13,
                TextColor3 = (MultiSelect and SelectedValues[option]) or (option == CurrentValue) and
                            Nexus.Theme.Text or Nexus.Theme.TextSub,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, MultiSelect and 32 or 28, 0, 0),
                Size = UDim2.new(1, -(MultiSelect and 32 or 28), 1, 0),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTruncate = Enum.TextTruncate.AtEnd,
                Parent = OptionContent
            })
            
            -- Hover effects
            local function OnHover(hovering)
                if not OptionButton or not OptionButton.Parent then return end
                
                local targetTransparency = hovering and 0.3 or 
                                          ((MultiSelect and SelectedValues[option]) or 
                                           (option == CurrentValue)) and 0.1 or 0.8
                
                Tween(OptionButton, {BackgroundTransparency = targetTransparency}, 0.15)
                
                if hovering then
                    Tween(OptionText, {TextColor3 = Nexus.Theme.Text}, 0.15)
                else
                    local targetColor = (MultiSelect and SelectedValues[option]) or 
                                       (option == CurrentValue) and 
                                       Nexus.Theme.Text or Nexus.Theme.TextSub
                    Tween(OptionText, {TextColor3 = targetColor}, 0.15)
                end
            end
            
            OptionButton.MouseEnter:Connect(function() OnHover(true) end)
            OptionButton.MouseLeave:Connect(function() OnHover(false) end)
            
            -- Click handler
            OptionButton.MouseButton1Click:Connect(function()
                --PlaySound("6895079853", 0.08) -- Selection sound
                
                if MultiSelect then
                    SelectedValues[option] = not SelectedValues[option]
                    
                    -- Get all selected values
                    local selected = {}
                    for value, isSelected in pairs(SelectedValues) do
                        if isSelected then
                            table.insert(selected, value)
                        end
                    end
                    
                    Label.Text = UpdateLabel()
                    
                    pcall(function()
                        Callback(selected, option, SelectedValues[option])
                    end)
                    
                    if Flag then
                        Nexus.Flags[Flag] = selected
                    end
                    
                    RenderOptions() -- Re-render to update checkmarks
                else
                    CurrentValue = option
                    Label.Text = UpdateLabel()
                    
                    -- Close dropdown
                    IsOpen = false
                    ToggleDropdown()
                    
                    pcall(function()
                        Callback(option)
                    end)
                    
                    if Flag then
                        Nexus.Flags[Flag] = option
                    end
                end
            end)
        end
    end
    
    -- Toggle dropdown function
    local function ToggleDropdown()
        IsOpen = not IsOpen
        
        -- Calculate target height
        local targetHeight = baseHeight
        if IsOpen then
            local visibleOptions = math.min(#FilteredOptions, MaxVisible)
            targetHeight = baseHeight + (visibleOptions * optionHeight) + (SearchEnabled and 48 or 12)
        end
        
        -- Animate arrow
        Tween(Arrow, {
            Rotation = IsOpen and 180 or 0,
            TextColor3 = IsOpen and Nexus.Theme.Accent or Nexus.Theme.TextSub
        }, 0.2)
        
        -- Animate icon
        if MultiSelect then
            Tween(Icon, {
                TextColor3 = IsOpen and Nexus.Theme.AccentHover or Nexus.Theme.Accent,
                Rotation = IsOpen and 90 or 0
            }, 0.2)
        end
        
        -- Animate main frame
        Tween(MainFrame, {
            Size = UDim2.new(1, 0, 0, targetHeight)
        }, 0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        
        -- Update stroke opacity
        local strokeElement = MainFrame:FindFirstChild("UIStroke")
        if strokeElement then
            Tween(strokeElement, {
                Transparency = IsOpen and 0.2 or 0.4,
                Color = IsOpen and Nexus.Theme.Accent or Nexus.Theme.Outline
            }, 0.2)
        end
        
        -- Focus search box when opening
        if IsOpen and SearchBox then
            task.wait(0.1)
            SearchBox:CaptureFocus()
        end
        
        -- Play sound
        --PlaySound(IsOpen and "6895079853" or "6895079725", 0.06, IsOpen and 1.2 or 0.8)
    end
    
    -- Search functionality
    if SearchBox then
        SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
            SearchQuery = SearchBox.Text
            FilterOptions(SearchQuery)
            RenderOptions()
        end)
        
        SearchBox.FocusLost:Connect(function()
            if SearchBox.Text == "" then
                FilterOptions("")
                RenderOptions()
            end
        end)
    end
    
    -- Main button click
    Button.MouseButton1Click:Connect(function()
        ToggleDropdown()
    end)
    
    -- Header hover effect
    local function OnHeaderHover(hovering)
        if not Header or not Header.Parent then return end
        
        Tween(Header, {
            BackgroundColor3 = hovering and Nexus.Theme.SurfaceHighest or Nexus.Theme.SurfaceHigh
        }, 0.15)
        
        -- KODE BARU (AMAN)
        if HeaderGradient then
            -- UIGradient tidak bisa di-tween, jadi kita set langsung
            HeaderGradient.Transparency = NumberSequence.new{
                NumberSequenceKeypoint.new(0, hovering and 0.95 or 0.98),
                NumberSequenceKeypoint.new(1, hovering and 0.90 or 0.95)
            }
        end
    end
    
    Header.MouseEnter:Connect(function() OnHeaderHover(true) end)
    Header.MouseLeave:Connect(function() OnHeaderHover(false) end)
    
    -- Initial render
    FilterOptions("")
    RenderOptions()
    
    -- API
    local API = {}
    
    function API:SetValue(value)
        if MultiSelect then
            if type(value) == "table" then
                SelectedValues = {}
                for _, v in ipairs(value) do
                    local stringValue = tostring(v)
                    if table.find(CleanOptions, stringValue) then
                        SelectedValues[stringValue] = true
                    end
                end
            else
                local stringValue = tostring(value)
                if table.find(CleanOptions, stringValue) then
                    SelectedValues = {[stringValue] = true}
                end
            end
        else
            local stringValue = tostring(value)
            if table.find(CleanOptions, stringValue) then
                CurrentValue = stringValue
            end
        end
        
        Label.Text = UpdateLabel()
        RenderOptions()
        
        return true
    end
    
    function API:GetValue()
        if MultiSelect then
            local selected = {}
            for value, isSelected in pairs(SelectedValues or {}) do
                if isSelected then
                    table.insert(selected, value)
                end
            end
            return selected
        else
            return CurrentValue
        end
    end
    
    function API:SetOptions(newOptions)
        if not newOptions or type(newOptions) ~= "table" then
            return false
        end
        
        -- Validate and clean new options
        local newCleanOptions = {}
        for _, option in ipairs(newOptions) do
            if option ~= nil then
                table.insert(newCleanOptions, tostring(option))
            end
        end
        
        if #newCleanOptions == 0 then
            newCleanOptions = {"Empty"}
        end
        
        CleanOptions = newCleanOptions
        
        -- Reset selections if they're no longer valid
        if MultiSelect then
            local newSelectedValues = {}
            for value, isSelected in pairs(SelectedValues or {}) do
                if isSelected and table.find(CleanOptions, value) then
                    newSelectedValues[value] = true
                end
            end
            SelectedValues = newSelectedValues
        else
            if not table.find(CleanOptions, CurrentValue) then
                CurrentValue = CleanOptions[1]
            end
        end
        
        -- Close dropdown and refresh
        if IsOpen then
            ToggleDropdown()
        end
        
        FilterOptions(SearchQuery or "")
        RenderOptions()
        Label.Text = UpdateLabel()
        
        return true
    end
    
    function API:Clear()
        if MultiSelect then
            SelectedValues = {}
        else
            CurrentValue = CleanOptions[1] or "None"
        end
        
        Label.Text = UpdateLabel()
        RenderOptions()
        
        return true
    end
    
    function API:Close()
        if IsOpen then
            ToggleDropdown()
        end
    end
    
    function API:Open()
        if not IsOpen then
            ToggleDropdown()
        end
    end
    
    function API:Destroy()
        if MainFrame and MainFrame.Parent then
            MainFrame:Destroy()
        end
    end
    
    function API:SetEnabled(enabled)
        if MainFrame then
            MainFrame.Visible = enabled
        end
        return true
    end
    
    -- Register with flag system
    if Flag then
        Nexus.Registry[Flag] = API
    end
    
    -- Theme update handler
    local themeConnection = Nexus.ThemeChanged.Event:Connect(function()
        if not MainFrame or not MainFrame.Parent then return end
        
        -- Update colors
        MainFrame.BackgroundColor3 = Nexus.Theme.Surface
        Header.BackgroundColor3 = Nexus.Theme.SurfaceHigh
        Label.TextColor3 = Nexus.Theme.Text
        Icon.TextColor3 = Nexus.Theme.Accent
        
        local strokeElement = MainFrame:FindFirstChild("UIStroke")
        if strokeElement then
            strokeElement.Color = IsOpen and Nexus.Theme.Accent or Nexus.Theme.Outline
        end
        
        if SearchBox then
            SearchBox.TextColor3 = Nexus.Theme.Text
            SearchBox.PlaceholderColor3 = Nexus.Theme.TextMuted
            SearchBox.Parent.BackgroundColor3 = Nexus.Theme.SurfaceHighest
        end
        
        -- Re-render options with new theme
        RenderOptions()
    end)
    
    -- Store connection for cleanup
    table.insert(Nexus.Connections, themeConnection)
    
    return API
end

--// Main Window Function (continuing with all other components...)
function Nexus:Window(config)
    if Nexus.IsDestroyed then return end
    
    -- Enhanced validation
    if not config then config = {} end
    
    local Title = config.Title or "Nexus Hub"
    local Subtitle = config.Subtitle or "Enhanced UI Library"
    local Size = config.Size or {600, 380}
    local MinSize = config.MinSize or {480, 320}
    
    -- Create ScreenGui with better error handling
    local ScreenGui = Create("ScreenGui", {
        Name = "NexusUI_" .. HttpService:GenerateGUID(false):sub(1, 8),
        Parent = (RunService:IsStudio() and Players.LocalPlayer:WaitForChild("PlayerGui")) or CoreGui,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        IgnoreGuiInset = true
    })
    
    if not ScreenGui then
        warn("[Nexus] Failed to create ScreenGui")
        return nil
    end
    
    -- Enhanced Welcome Animation
    if config.Welcome ~= false then
        local IntroFrame = Create("Frame", {
            BackgroundColor3 = Nexus.Theme.Background,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0, 0),
            ZIndex = 9999,
            Parent = ScreenGui
        })
        
        local IntroGradient = Create("UIGradient", {
            Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Nexus.Theme.Gradient1),
                ColorSequenceKeypoint.new(0.5, Nexus.Theme.Background),
                ColorSequenceKeypoint.new(1, Nexus.Theme.Gradient2)
            },
            Rotation = 45,
            Transparency = NumberSequence.new{
                NumberSequenceKeypoint.new(0, 0.7),      -- BENAR: NumberSequenceKeypoint untuk transparency
                NumberSequenceKeypoint.new(0.5, 0),      -- BENAR: NumberSequenceKeypoint untuk transparency
                NumberSequenceKeypoint.new(1, 0.7)       -- BENAR: NumberSequenceKeypoint untuk transparency
            },
            Parent = IntroFrame
        })
        
        local LogoContainer = Create("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromOffset(120, 120),
            Position = UDim2.fromScale(0.5, 0.4),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Parent = IntroFrame
        })
        
        local Logo = Create("TextLabel", {
            Text = "N",
            Font = Enum.Font.GothamBold,
            TextSize = 72,
            TextColor3 = Nexus.Theme.Accent,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            TextTransparency = 1,
            Parent = LogoContainer
        })
        
        AddCorner(LogoContainer, 20)
        AddStroke(LogoContainer, Nexus.Theme.Accent, 3, 1)
        
        local TitleLabel = Create("TextLabel", {
            Text = Title,
            Font = Enum.Font.GothamBold,
            TextSize = 28,
            TextColor3 = Nexus.Theme.Text,
            TextTransparency = 1,
            BackgroundTransparency = 1,
            Position = UDim2.fromScale(0.5, 0.58),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Parent = IntroFrame
        })
        
        local SubtitleLabel = Create("TextLabel", {
            Text = Subtitle,
            Font = Enum.Font.Gotham,
            TextSize = 16,
            TextColor3 = Nexus.Theme.TextSub,
            TextTransparency = 1,
            BackgroundTransparency = 1,
            Position = UDim2.fromScale(0.5, 0.65),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Parent = IntroFrame
        })
        
        -- Enhanced animation sequence
        task.spawn(function()
            -- Logo border animation
            Tween(LogoContainer:FindFirstChild("UIStroke"), {Transparency = 0}, 0.6)
            task.wait(0.2)
            
            -- Logo text fade in
            Tween(Logo, {TextTransparency = 0}, 0.5)
            task.wait(0.3)
            
            -- Title animations
            Tween(TitleLabel, {TextTransparency = 0}, 0.4)
            task.wait(0.2)
            Tween(SubtitleLabel, {TextTransparency = 0}, 0.4)
            
            -- Logo pulse effect
            for i = 1, 2 do
                Tween(Logo, {
                    TextSize = 78,
                    TextColor3 = Nexus.Theme.AccentHover
                }, 0.3)
                task.wait(0.3)
                Tween(Logo, {
                    TextSize = 72,
                    TextColor3 = Nexus.Theme.Accent
                }, 0.3)
                task.wait(0.3)
            end
            
            task.wait(0.8)
            
            -- Fade out animation
            Tween(Logo, {TextTransparency = 1, TextSize = 0}, 0.4)
            Tween(TitleLabel, {TextTransparency = 1}, 0.3)
            Tween(SubtitleLabel, {TextTransparency = 1}, 0.3)
            Tween(LogoContainer:FindFirstChild("UIStroke"), {Transparency = 1}, 0.4)
            Tween(IntroFrame, {BackgroundTransparency = 1}, 0.5)
            
            task.wait(0.6)
            if IntroFrame and IntroFrame.Parent then
                IntroFrame:Destroy()
            end
        end)
    end
    
    -- Enhanced Watermark
    if config.Watermark ~= false then
        local WatermarkFrame = Create("Frame", {
            BackgroundColor3 = Nexus.Theme.Surface,
            Size = UDim2.new(0, 240, 0, 32),
            Position = UDim2.new(0, 16, 0, 16),
            Parent = ScreenGui
        })
        
        AddCorner(WatermarkFrame, 8)
        AddStroke(WatermarkFrame, Nexus.Theme.Accent, 1, 0.5)
        AddShadow(WatermarkFrame, 6, 0.8)
        
        local WatermarkGradient = Create("UIGradient", {
            Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                ColorSequenceKeypoint.new(1, Color3.new(0.9, 0.9, 0.9))
            },
            Transparency = NumberSequence.new{
                NumberSequenceKeypoint.new(0, 0.9),
                NumberSequenceKeypoint.new(1, 0.8)
            },
            Rotation = 45,
            Parent = WatermarkFrame
        })
        
        local WatermarkText = Create("TextLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, -16, 1, 0),
            Position = UDim2.new(0, 8, 0, 0),
            Font = Enum.Font.GothamMedium,
            TextSize = 13,
            TextColor3 = Nexus.Theme.Text,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = WatermarkFrame
        })
        
        MakeDraggable(WatermarkFrame)
        
        -- Enhanced watermark data
        local function UpdateWatermark()
            if not WatermarkFrame or not WatermarkFrame.Parent then return end
            
            local fps = math.floor(workspace:GetRealPhysicsFPS())
            local ping = 0
            
            pcall(function()
                ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
            end)
            
            local time = os.date("%H:%M:%S")
            local playerCount = #Players:GetPlayers()
            
            WatermarkText.Text = string.format("🚀 %d FPS | 📡 %dms | 👥 %d | %s", 
                fps, math.floor(ping), playerCount, time)
        end
        
        -- Update watermark every second
        --// Continue from Watermark section...

        -- Update watermark every second
        local watermarkConnection = RunService.Heartbeat:Connect(UpdateWatermark)
        table.insert(Nexus.Connections, watermarkConnection)
        
        UpdateWatermark()
        
        -- Theme update for watermark
        local watermarkThemeConnection = Nexus.ThemeChanged.Event:Connect(function()
            if WatermarkFrame and WatermarkFrame.Parent then
                WatermarkFrame.BackgroundColor3 = Nexus.Theme.Surface
                WatermarkText.TextColor3 = Nexus.Theme.Text
                
                local strokeElement = WatermarkFrame:FindFirstChild("UIStroke")
                if strokeElement then
                    strokeElement.Color = Nexus.Theme.Accent
                end
            end
        end)
        
        table.insert(Nexus.Connections, watermarkThemeConnection)
    end
    
    -- Main Window Frame
    local MainWindow = Create("Frame", {
        BackgroundColor3 = Nexus.Theme.Background,
        Size = UDim2.fromOffset(Size[1], Size[2]),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BorderSizePixel = 0,
        Parent = ScreenGui
    })
    
    -- Kita gunakan UIScale untuk animasi resize yang lebih aman dan mulus
    local MainScale = Create("UIScale", {
        Parent = MainWindow,
        Scale = 1
    })
    
    if not MainWindow then
        warn("[Nexus] Failed to create main window")
        return nil
    end
    
    AddCorner(MainWindow, 12)
    AddStroke(MainWindow, Nexus.Theme.Outline, 1, 0.3)
    AddShadow(MainWindow, 12, 0.6)
    
    -- Window Gradient Background
    local WindowGradient = Create("UIGradient", {
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),      -- BENAR: maksimal 1.0
            ColorSequenceKeypoint.new(1, Color3.new(0.95, 0.95, 0.95))
        },
        Rotation = 135,
        Transparency = NumberSequence.new{
            NumberSequenceKeypoint.new(0, 0.95),
            NumberSequenceKeypoint.new(1, 0.98)
        },
        Parent = MainWindow
    })
    
    -- Title Bar
    local TitleBar = Create("Frame", {
        BackgroundColor3 = Nexus.Theme.Surface,
        Size = UDim2.new(1, 0, 0, 48),
        Position = UDim2.fromOffset(0, 0),
        Parent = MainWindow
    })
    
    AddCorner(TitleBar, 12)
    
    -- Title Bar Bottom Corner Fix
    local TitleBarFix = Create("Frame", {
        BackgroundColor3 = Nexus.Theme.Surface,
        Size = UDim2.new(1, 0, 0, 12),
        Position = UDim2.new(0, 0, 1, -12),
        BorderSizePixel = 0,
        Parent = TitleBar
    })
    
    -- Title Bar Gradient
    local TitleGradient = Create("UIGradient", {
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Nexus.Theme.Gradient1),
            ColorSequenceKeypoint.new(0.5, Nexus.Theme.Accent),
            ColorSequenceKeypoint.new(1, Nexus.Theme.Gradient2)
        },
        Rotation = 45,
        Transparency = NumberSequence.new{
            NumberSequenceKeypoint.new(0, 0.1),
            NumberSequenceKeypoint.new(0.5, 0.05),
            NumberSequenceKeypoint.new(1, 0.15)
        },
        Parent = TitleBar
    })
    
    -- Auto-update dengan theme changes
    local titleGradientConnection = Nexus.ThemeChanged.Event:Connect(function()
        if TitleGradient and TitleGradient.Parent then
            TitleGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Nexus.Theme.Gradient1),
                ColorSequenceKeypoint.new(0.5, Nexus.Theme.Accent),
                ColorSequenceKeypoint.new(1, Nexus.Theme.Gradient2)
            }
        end
    end)
    
    table.insert(Nexus.Connections, titleGradientConnection)

    -- App Icon
    local AppIcon = Create("TextLabel", {
        Text = "🚀",
        Font = Enum.Font.GothamBold,
        TextSize = 20,
        TextColor3 = Nexus.Theme.Accent,
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(16, 0),
        Size = UDim2.fromOffset(32, 48),
        Parent = TitleBar
    })
    
    -- Window Title
    local WindowTitle = Create("TextLabel", {
        Text = Title,
        Font = Enum.Font.GothamBold,
        TextSize = 16,
        TextColor3 = Nexus.Theme.Text,
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(56, 0),
        Size = UDim2.new(1, -200, 1, 0),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = TitleBar
    })
    
    -- Window Subtitle
    local WindowSubtitle = Create("TextLabel", {
        Text = Subtitle,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextColor3 = Nexus.Theme.TextSub,
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(56, 24),
        Size = UDim2.new(1, -200, 0, 20),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = TitleBar
    })
    
    -- Window Controls Container
    local ControlsContainer = Create("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(120, 48),
        Position = UDim2.new(1, -128, 0, 0),
        Parent = TitleBar
    })
    
    -- Minimize Button
    local MinimizeButton = Create("TextButton", {
        Text = "─",
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        TextColor3 = Nexus.Theme.TextSub,
        BackgroundColor3 = Nexus.Theme.SurfaceHigh,
        BackgroundTransparency = 0.8,
        Size = UDim2.fromOffset(32, 28),
        Position = UDim2.fromOffset(8, 10),
        AutoButtonColor = false,
        Parent = ControlsContainer
    })
    
    AddCorner(MinimizeButton, 6)
    
    -- Settings Button
    local SettingsButton = Create("TextButton", {
        Text = "⚙",
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        TextColor3 = Nexus.Theme.TextSub,
        BackgroundColor3 = Nexus.Theme.SurfaceHigh,
        BackgroundTransparency = 0.8,
        Size = UDim2.fromOffset(32, 28),
        Position = UDim2.fromOffset(44, 10),
        AutoButtonColor = false,
        Parent = ControlsContainer
    })
    
    AddCorner(SettingsButton, 6)
    
    -- Close Button
    local CloseButton = Create("TextButton", {
        Text = "✕",
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        TextColor3 = Color3.fromRGB(255, 100, 100),
        BackgroundColor3 = Nexus.Theme.SurfaceHigh,
        BackgroundTransparency = 0.8,
        Size = UDim2.fromOffset(32, 28),
        Position = UDim2.fromOffset(80, 10),
        AutoButtonColor = false,
        Parent = ControlsContainer
    })
    
    AddCorner(CloseButton, 6)
    
    -- Button hover effects
    local function CreateButtonHover(button, hoverColor)
        button.MouseEnter:Connect(function()
            Tween(button, {BackgroundTransparency = 0.2}, 0.15)
            if hoverColor then
                Tween(button, {TextColor3 = hoverColor}, 0.15)
            end
        end)
        
        button.MouseLeave:Connect(function()
            Tween(button, {BackgroundTransparency = 0.8}, 0.15)
            if button == CloseButton then
                Tween(button, {TextColor3 = Color3.fromRGB(255, 100, 100)}, 0.15)
            else
                Tween(button, {TextColor3 = Nexus.Theme.TextSub}, 0.15)
            end
        end)
    end
    
    CreateButtonHover(MinimizeButton)
    CreateButtonHover(SettingsButton)
    CreateButtonHover(CloseButton, Color3.fromRGB(255, 120, 120))
    
    -- Window state management
    local IsMinimized = false
    
    -- [[ FIX: Floating Bubble dengan UIScale ]]
    local ToggleButton = nil
    
    local function CreateMobileToggle()
        if ToggleButton then return end
        
        -- Ambil Gambar Profil User (Headshot)
        local userId = Players.LocalPlayer.UserId
        local thumbType = Enum.ThumbnailType.HeadShot
        local thumbSize = Enum.ThumbnailSize.Size48x48
        local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
        
        -- Buat Tombol Bulat
        ToggleButton = Create("ImageButton", {
            Name = "NexusToggle",
            Image = content,
            BackgroundColor3 = Nexus.Theme.Surface,
            Size = UDim2.fromOffset(0, 0), -- Mulai 0
            Position = UDim2.new(0.1, 0, 0.1, 0),
            Parent = ScreenGui,
            ZIndex = 9999
        })
        
        AddCorner(ToggleButton, 100) 
        AddStroke(ToggleButton, Nexus.Theme.Accent, 2, 0)
        AddShadow(ToggleButton, 10, 0.6)
        MakeDraggable(ToggleButton, ToggleButton)
        
        -- Animasi Bubble Muncul
        Tween(ToggleButton, {Size = UDim2.fromOffset(50, 50)}, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        
        -- Logic Saat Bubble Ditekan (Buka Menu)
        ToggleButton.MouseButton1Click:Connect(function()
            -- PlaySound("6895079853", 0.1)
            
            -- 1. Nyalakan Blur
            SetBlur(true, 8)
            
            -- 2. Hilangkan Bubble
            if ToggleButton then
                Tween(ToggleButton, {Size = UDim2.fromOffset(0, 0)}, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
                task.wait(0.25)
                ToggleButton:Destroy()
                ToggleButton = nil
            end
            
            IsMinimized = false
            MinimizeButton.Text = "─"
            
            -- 3. Munculkan Menu Utama
            MainWindow.Visible = true
            
            -- [PERBAIKAN] Pastikan ClipsDescendants SELALU False agar shadow tidak putus
            MainWindow.ClipsDescendants = false 
            
            -- 4. Animasi Membesar menggunakan UIScale (Lebih mulus & aman)
            -- Kita set Scale ke 0 dulu biar start dari kecil
            MainScale.Scale = 0
            Tween(MainScale, {Scale = 1}, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            
            -- 5. Restore Shadow (Animasi transparansi)
            local shadow = MainWindow:FindFirstChild("DropShadow")
            if shadow then 
                Tween(shadow, {ImageTransparency = 0.6}, 0.4) 
            end
        end)
    end
    
    local OriginalSize = MainWindow.Size
    
    -- Minimize functionality (Floating Bubble Mode)
    MinimizeButton.MouseButton1Click:Connect(function()
        IsMinimized = true
        -- PlaySound("6895079853", 0.1)
        
        -- 1. Matikan Blur
        SetBlur(false)
        
        -- 2. Sembunyikan Shadow
        local shadow = MainWindow:FindFirstChild("DropShadow")
        if shadow then Tween(shadow, {ImageTransparency = 1}, 0.2) end

        -- 3. Animasi Mengecil menggunakan UIScale
        -- Kita TIDAK resize frame, tapi mengubah skala-nya. Konten tidak akan bocor.
        Tween(MainScale, {Scale = 0}, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        
        -- 4. Tunggu animasi selesai
        task.delay(0.35, function()
            if IsMinimized then
                MainWindow.Visible = false
                CreateMobileToggle()
            end
        end)
    end)
    
    -- Close functionality with confirmation (FIXED)
    CloseButton.MouseButton1Click:Connect(function()
        -- [FIX] Nyalakan Clipping SEBELUM animasi tutup dimulai
        -- Ini memotong semua tombol/teks agar tidak tertinggal saat window mengecil
        MainWindow.ClipsDescendants = true 
        
        -- Sembunyikan shadow instan agar tidak aneh
        local shadow = MainWindow:FindFirstChild("DropShadow")
        if shadow then shadow.ImageTransparency = 1 end
        
        -- Smooth close animation
        Tween(MainWindow, {
            Size = UDim2.fromOffset(0, 0), -- Mengecil sampai habis
            BackgroundTransparency = 1
        }, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        
        task.wait(0.4)
        
        -- Cleanup connections
        for _, connection in ipairs(Nexus.Connections) do
            if connection then
                connection:Disconnect()
            end
        end
        
        -- Cleanup blur
        SetBlur(false)
        
        -- Destroy GUI
        if ScreenGui and ScreenGui.Parent then
            ScreenGui:Destroy()
        end
        
        Nexus.IsDestroyed = true
    end)
    
    -- Settings dropdown functionality
    local SettingsOpen = false
    local SettingsDropdown = nil
    
    SettingsButton.MouseButton1Click:Connect(function()
        if SettingsOpen then
            if SettingsDropdown then
                Tween(SettingsDropdown, {
                    Size = UDim2.fromOffset(0, 0),
                    BackgroundTransparency = 1
                }, 0.2)
                task.wait(0.2)
                SettingsDropdown:Destroy()
                SettingsDropdown = nil
            end
            SettingsOpen = false
            return
        end
        
        --PlaySound("6895079853", 0.08)
        SettingsOpen = true
        
        SettingsDropdown = Create("Frame", {
            BackgroundColor3 = Nexus.Theme.Surface,
            Size = UDim2.fromOffset(0, 0),
            Position = UDim2.fromOffset(-140, 40),
            BackgroundTransparency = 1,
            Parent = SettingsButton
        })
        
        AddCorner(SettingsDropdown, 8)
        AddStroke(SettingsDropdown, Nexus.Theme.Outline, 1, 0.4)
        AddShadow(SettingsDropdown, 8, 0.7)
        
        -- Settings options
        local settingsOptions = {
            {text = "🎨 Dark Theme", callback = function() Nexus:SetTheme("Dark") end},
            {text = "☀️ Light Theme", callback = function() Nexus:SetTheme("Light") end},
            {text = "🌊 Ocean Theme", callback = function() Nexus:SetTheme("Ocean") end},
            {text = "💫 Neon Theme", callback = function() Nexus:SetTheme("Neon") end},
            {text = "📁 Export Config", callback = function() 
                Nexus:SaveConfig("AutoSave_" .. os.date("%H%M%S"))
                Nexus:Notify({
                    Title = "Config Exported ✅",
                    Content = "Saved to NexusConfig folder",
                    Duration = 2
                })
            end},
            {text = "🔄 Reset Settings", callback = function()
                for flag, registry in pairs(Nexus.Registry) do
                    if registry.Set then
                        registry.Set(nil)
                    end
                end
                Nexus:Notify({
                    Title = "Reset Complete 🔄",
                    Content = "All settings cleared",
                    Duration = 2
                })
            end}
        }
        
        local layout = Create("UIListLayout", {
            Padding = UDim.new(0, 2),
            Parent = SettingsDropdown
        })
        
        -- Animate dropdown appearance
        Tween(SettingsDropdown, {
            Size = UDim2.fromOffset(180, (#settingsOptions * 32) + 8),
            BackgroundTransparency = 0
        }, 0.25, Enum.EasingStyle.Back)
        
        for i, option in ipairs(settingsOptions) do
            local optionButton = Create("TextButton", {
                Text = option.text,
                Font = Enum.Font.Gotham,
                TextSize = 13,
                TextColor3 = Nexus.Theme.TextSub,
                BackgroundColor3 = Nexus.Theme.SurfaceHigh,
                BackgroundTransparency = 0.8,
                Size = UDim2.new(1, -8, 0, 28),
                Position = UDim2.fromOffset(4, 0),
                AutoButtonColor = false,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = SettingsDropdown
            })
            
            AddCorner(optionButton, 6)
            
            -- Padding for text
            local textPadding = Create("UIPadding", {
                PaddingLeft = UDim.new(0, 8),
                Parent = optionButton
            })
            
            -- Hover effect
            optionButton.MouseEnter:Connect(function()
                Tween(optionButton, {
                    BackgroundTransparency = 0.2,
                    TextColor3 = Nexus.Theme.Text
                }, 0.15)
            end)
            
            optionButton.MouseLeave:Connect(function()
                Tween(optionButton, {
                    BackgroundTransparency = 0.8,
                    TextColor3 = Nexus.Theme.TextSub
                }, 0.15)
            end)
            
            optionButton.MouseButton1Click:Connect(function()
                --PlaySound("6895079853", 0.05)
                if option.callback then
                    pcall(option.callback)
                end
                
                -- Close dropdown
                SettingsOpen = false
                if SettingsDropdown then
                    Tween(SettingsDropdown, {
                        Size = UDim2.fromOffset(0, 0),
                        BackgroundTransparency = 1
                    }, 0.2)
                    task.wait(0.2)
                    SettingsDropdown:Destroy()
                    SettingsDropdown = nil
                end
            end)
        end
        
        -- Close dropdown when clicking outside
        local outsideConnection
        outsideConnection = UserInputService.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                
                -- [PERBAIKAN 1] Cek dulu apakah dropdown ada. Jika tidak, putuskan koneksi dan berhenti.
                if not SettingsDropdown or not SettingsDropdown.Parent then
                    if outsideConnection then outsideConnection:Disconnect() end
                    return
                end

                local mousePos = UserInputService:GetMouseLocation()
                local dropdownPos = SettingsDropdown.AbsolutePosition
                local dropdownSize = SettingsDropdown.AbsoluteSize
                
                -- Cek apakah klik berada DI LUAR (OUTSIDE) area
                if mousePos.X < dropdownPos.X or mousePos.X > dropdownPos.X + dropdownSize.X or
                mousePos.Y < dropdownPos.Y or mousePos.Y > dropdownPos.Y + dropdownSize.Y then
                    
                    SettingsOpen = false
                    
                    -- Simpan referensi ke objek saat ini untuk animasi
                    local currentDropdown = SettingsDropdown
                    
                    if currentDropdown then
                        Tween(currentDropdown, {
                            Size = UDim2.fromOffset(0, 0),
                            BackgroundTransparency = 1
                        }, 0.2)
                        
                        -- Gunakan task.spawn atau delay agar input tidak macet (opsional tapi lebih baik)
                        task.spawn(function()
                            task.wait(0.2)
                            -- [PERBAIKAN 2] Cek lagi apakah objek masih ada sebelum destroy
                            if currentDropdown and currentDropdown.Parent then
                                currentDropdown:Destroy()
                            end
                        end)
                        
                        -- Set nil global segera agar logika toggle tombol settings tidak bingung
                        SettingsDropdown = nil
                    end
                    
                    if outsideConnection then outsideConnection:Disconnect() end
                end
            end
        end)
    end)
    
    -- Content Container
    local ContentContainer = Create("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, -48),
        Position = UDim2.fromOffset(0, 48),
        Parent = MainWindow
    })
    
    -- Tab Container
    local TabContainer = Create("Frame", {
        BackgroundColor3 = Nexus.Theme.Surface,
        Size = UDim2.fromOffset(200, 0),
        Position = UDim2.fromOffset(0, 0),
        Parent = ContentContainer
    })
    
    -- Fix for tab container height
    local tabContainerHeightConnection = ContentContainer:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        if TabContainer and TabContainer.Parent then
            TabContainer.Size = UDim2.fromOffset(200, ContentContainer.AbsoluteSize.Y)
        end
    end)
    
    table.insert(Nexus.Connections, tabContainerHeightConnection)
    
    AddStroke(TabContainer, Nexus.Theme.Outline, 1, 0.6)
    
    -- Tab Container Gradient
    local TabGradient = Create("UIGradient", {
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Nexus.Theme.Surface),
            ColorSequenceKeypoint.new(0.5, Nexus.Theme.SurfaceHigh),
            ColorSequenceKeypoint.new(1, Nexus.Theme.Surface)
        },
        Rotation = 90,
        Transparency = NumberSequence.new{
            NumberSequenceKeypoint.new(0, 0.1),
            NumberSequenceKeypoint.new(0.5, 0.05),
            NumberSequenceKeypoint.new(1, 0.15)
        },
        Parent = TabContainer
    })

    -- Tab List
    local TabList = Create("ScrollingFrame", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, -16),
        Position = UDim2.fromOffset(0, 8),
        CanvasSize = UDim2.fromOffset(0, 0),
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Nexus.Theme.Accent,
        ScrollBarImageTransparency = 0.7,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        Parent = TabContainer
    })
    
    local TabLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 4),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = TabList
    })
    
    -- Update tab canvas size
    TabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        if TabList and TabList.Parent then
            TabList.CanvasSize = UDim2.fromOffset(0, TabLayout.AbsoluteContentSize.Y + 16)
        end
    end)
    
    -- Page Container
    local PageContainer = Create("Frame", {
        BackgroundColor3 = Nexus.Theme.Background,
        Size = UDim2.new(1, -200, 1, 0),
        Position = UDim2.fromOffset(200, 0),
        Parent = ContentContainer
    })
    
    -- Page Container Gradient
    local PageGradient = Create("UIGradient", {
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Nexus.Theme.Background),
            ColorSequenceKeypoint.new(0.5, Nexus.Theme.Surface),
            ColorSequenceKeypoint.new(1, Nexus.Theme.Background)
        },
        Rotation = 180,
        Transparency = NumberSequence.new{
            NumberSequenceKeypoint.new(0, 0.05),
            NumberSequenceKeypoint.new(0.5, 0.02),
            NumberSequenceKeypoint.new(1, 0.08)
        },
        Parent = PageContainer
    })
    
    -- Auto-update dengan theme changes
    local pageGradientConnection = Nexus.ThemeChanged.Event:Connect(function()
        if PageGradient and PageGradient.Parent then
            PageGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Nexus.Theme.Background),
                ColorSequenceKeypoint.new(0.5, Nexus.Theme.Surface),
                ColorSequenceKeypoint.new(1, Nexus.Theme.Background)
            }
        end
    end)
    
    table.insert(Nexus.Connections, pageGradientConnection)

    
    -- Page Padding
    local PagePadding = Create("UIPadding", {
        PaddingTop = UDim.new(0, 16),
        PaddingBottom = UDim.new(0, 16),
        PaddingLeft = UDim.new(0, 16),
        PaddingRight = UDim.new(0, 16),
        Parent = PageContainer
    })
    
    -- Tab management
    local Tabs = {}
    local ActiveTab = nil
    
    -- Make window draggable
    MakeDraggable(MainWindow, TitleBar)
    
    -- Blur effect
    SetBlur(true, 8)
    
    -- Enhanced notification system
    local NotificationContainer = Create("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 320, 1, 0),
        Position = UDim2.new(1, -336, 0, 16),
        Parent = ScreenGui
    })
    
    local NotificationLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        Parent = NotificationContainer
    })
    
    -- Enhanced Notification Function
    function Nexus:Notify(config)
        if not config then config = {} end
        
        local Title = config.Title or "Notification"
        local Content = config.Content or ""
        local Duration = config.Duration or 3
        local Type = config.Type or "Info" -- Info, Success, Warning, Error
        local Callback = config.Callback
        
        -- Color scheme based on type
        local Colors = {
            Info = {
                bg = Nexus.Theme.Surface,
                accent = Nexus.Theme.Accent,
                icon = "ℹ️"
            },
            Success = {
                bg = Nexus.Theme.Surface,
                accent = Nexus.Theme.Success,
                icon = "✅"
            },
            Warning = {
                bg = Nexus.Theme.Surface,
                accent = Nexus.Theme.Warning,
                icon = "⚠️"
            },
            Error = {
                bg = Nexus.Theme.Surface,
                accent = Nexus.Theme.Error,
                icon = "❌"
            }
        }
        
        local colorScheme = Colors[Type] or Colors.Info
        
        -- Create notification
        local Notification = Create("Frame", {
            BackgroundColor3 = colorScheme.bg,
            Size = UDim2.new(1, 0, 0, 0),
            Position = UDim2.fromOffset(320, 0),
            BackgroundTransparency = 0.1,
            LayoutOrder = 1,
            Parent = NotificationContainer
        })
        
        AddCorner(Notification, 10)
        AddStroke(Notification, colorScheme.accent, 1, 0.3)
        AddShadow(Notification, 8, 0.8)
        
        -- Gradient overlay
        local NotificationGradient = Create("UIGradient", {
            Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Nexus.Theme.Surface),
                ColorSequenceKeypoint.new(0.5, Nexus.Theme.SurfaceHigh),
                ColorSequenceKeypoint.new(1, Nexus.Theme.Surface)
            },
            Rotation = 45,
            Transparency = NumberSequence.new{
                NumberSequenceKeypoint.new(0, 0.05),
                NumberSequenceKeypoint.new(0.5, 0.02),
                NumberSequenceKeypoint.new(1, 0.08)
            },
            Parent = NotifFrame  -- Pastikan parent benar
        })
        
        -- Auto-update dengan theme changes
        local notifGradientConnection = Nexus.ThemeChanged.Event:Connect(function()
            if NotificationGradient and NotificationGradient.Parent then
                NotificationGradient.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Nexus.Theme.Surface),
                    ColorSequenceKeypoint.new(0.5, Nexus.Theme.SurfaceHigh),
                    ColorSequenceKeypoint.new(1, Nexus.Theme.Surface)
                }
            end
        end)
        
        table.insert(Nexus.Connections, notifGradientConnection)

        
        -- Progress bar
        local ProgressBar = Create("Frame", {
            BackgroundColor3 = colorScheme.accent,
            Size = UDim2.new(1, 0, 0, 3),
            Position = UDim2.new(0, 0, 1, -3),
            Parent = Notification
        })
        
        AddCorner(ProgressBar, 2)
        
        -- Icon
        local Icon = Create("TextLabel", {
            Text = colorScheme.icon,
            Font = Enum.Font.GothamBold,
            TextSize = 16,
            TextColor3 = colorScheme.accent,
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(12, 12),
            Size = UDim2.fromOffset(20, 20),
            Parent = Notification
        })
        
        -- Title
        local TitleLabel = Create("TextLabel", {
            Text = Title,
            Font = Enum.Font.GothamBold,
            TextSize = 14,
            TextColor3 = Nexus.Theme.Text,
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(40, 12),
            Size = UDim2.new(1, -80, 0, 20),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            Parent = Notification
        })
        
        -- Content
        local ContentLabel = Create("TextLabel", {
            Text = Content,
            Font = Enum.Font.Gotham,
            TextSize = 12,
            TextColor3 = Nexus.Theme.TextSub,
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(40, 32),
            Size = UDim2.new(1, -80, 0, 16),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextWrapped = true,
            Parent = Notification
        })
        
        -- Close button
        local CloseBtn = Create("TextButton", {
            Text = "✕",
            Font = Enum.Font.GothamBold,
            TextSize = 12,
            TextColor3 = Nexus.Theme.TextMuted,
            BackgroundTransparency = 1,
            Position = UDim2.new(1, -32, 0, 8),
            Size = UDim2.fromOffset(24, 24),
            Parent = Notification
        })
        
        -- Calculate content height
        local contentHeight = 56
        if Content and Content:len() > 40 then
            contentHeight = 72
        end
        
        -- Animate notification appearance
        Tween(Notification, {
            Size = UDim2.new(1, 0, 0, contentHeight),
            Position = UDim2.fromOffset(0, 0)
        }, 0.4, Enum.EasingStyle.Back)
        
        --PlaySound("6895079853", 0.1, 1.2)
        
        -- Auto dismiss
        local dismissTween = nil
        local function DismissNotification()
            if dismissTween then dismissTween:Cancel() end
            
            Tween(Notification, {
                Position = UDim2.fromOffset(320, 0),
                BackgroundTransparency = 1
            }, 0.3)
            
            Tween(ProgressBar, {BackgroundTransparency = 1}, 0.3)
            
            task.wait(0.3)
            if Notification and Notification.Parent then
                Notification:Destroy()
            end
        end
        
        -- Progress bar animation
        if Duration > 0 then
            Tween(ProgressBar, {Size = UDim2.new(0, 0, 0, 3)}, Duration)
            
            task.spawn(function()
                task.wait(Duration)
                DismissNotification()
            end)
        end
        
        -- Manual close
        CloseBtn.MouseButton1Click:Connect(function()
            if Callback then
                pcall(Callback)
            end
            DismissNotification()
        end)
        
        -- Click notification
        local notifButton = Create("TextButton", {
            Text = "",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, -32, 1, 0),
            Parent = Notification
        })
        
        notifButton.MouseButton1Click:Connect(function()
            if Callback then
                pcall(Callback)
            end
            DismissNotification()
        end)
        
        return {
            Dismiss = DismissNotification,
            SetProgress = function(progress)
                if ProgressBar and ProgressBar.Parent then
                    Tween(ProgressBar, {
                        Size = UDim2.new(math.clamp(progress, 0, 1), 0, 0, 3)
                    }, 0.2)
                end
            end
        }
    end
    
    local function CreateTab(config)
        if not config then config = {} end
        
        local Name = config.Name or config.Text or "Tab"
        local Icon = config.Icon or "📄"
        local Visible = config.Visible ~= false
        
        -- [PERBAIKAN 1] Mengganti .Button menjadi .TabBtn agar tidak bentrok dengan fungsi Button()
        local Tab = {
            Name = Name,
            Icon = Icon,
            Visible = Visible,
            Elements = {},
            Page = nil,
            TabBtn = nil 
        }
        
        -- Membuat Tombol Tab (Tab Button)
        local TabButton = Create("TextButton", {
            Text = "",
            BackgroundColor3 = Nexus.Theme.SurfaceHigh,
            BackgroundTransparency = ActiveTab and 0.8 or 0.3,
            Size = UDim2.new(1, -16, 0, 44),
            Position = UDim2.fromOffset(8, 0),
            AutoButtonColor = false,
            Visible = Visible,
            Parent = TabList
        })
        
        AddCorner(TabButton, 8)
        if not ActiveTab then
            AddStroke(TabButton, Nexus.Theme.Accent, 1, 0.4)
        end
        
        local TabContent = Create("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0),
            Parent = TabButton
        })
        
        -- [PERBAIKAN 2] Rename variabel lokal agar jelas ini adalah Objek GUI
        local TabIconObj = Create("TextLabel", {
            Text = Icon,
            Font = Enum.Font.GothamBold,
            TextSize = 16,
            TextColor3 = ActiveTab and Nexus.Theme.TextSub or Nexus.Theme.Accent,
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(12, 0),
            Size = UDim2.fromOffset(24, 44),
            Parent = TabContent
        })
        
        local TabNameObj = Create("TextLabel", {
            Text = Name,
            Font = Enum.Font.GothamMedium,
            TextSize = 14,
            TextColor3 = ActiveTab and Nexus.Theme.TextSub or Nexus.Theme.Text,
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(44, 0),
            Size = UDim2.new(1, -56, 1, 0),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            Parent = TabContent
        })
        
        -- Membuat Halaman (Page) untuk Tab ini
        local TabPage = Create("ScrollingFrame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0),
            CanvasSize = UDim2.fromOffset(0, 0),
            ScrollBarThickness = 4,
            ScrollBarImageColor3 = Nexus.Theme.Accent,
            ScrollBarImageTransparency = 0.6,
            ScrollingDirection = Enum.ScrollingDirection.Y,
            Visible = not ActiveTab,
            Parent = PageContainer
        })
        
        local PageLayout = Create("UIListLayout", {
            Padding = UDim.new(0, 12),
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = TabPage
        })
        
        -- Auto-resize canvas saat konten bertambah
        PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            if TabPage and TabPage.Parent then
                TabPage.CanvasSize = UDim2.fromOffset(0, PageLayout.AbsoluteContentSize.Y + 32)
            end
        end)
        
        -- Simpan referensi ke objek Tab (Gunakan .TabBtn)
        Tab.TabBtn = TabButton
        Tab.Page = TabPage
        
        -- Set Tab Pertama sebagai Aktif Otomatis
        if not ActiveTab then
            ActiveTab = Tab
            TabButton.BackgroundTransparency = 0.3
            TabIconObj.TextColor3 = Nexus.Theme.Accent
            TabNameObj.TextColor3 = Nexus.Theme.Text
            TabPage.Visible = true
        end
        
        -- [PERBAIKAN 3] Logika Klik Tab (Menggunakan .TabBtn yang baru)
        TabButton.MouseButton1Click:Connect(function()
            -- Play Sound (Optional)
            -- PlaySound("6895079853", 0.05, 1.1)

            -- Nonaktifkan Tab Lama
            if ActiveTab then
                -- Gunakan ActiveTab.TabBtn (bukan .Button)
                Tween(ActiveTab.TabBtn, {BackgroundTransparency = 0.8}, 0.2)
                
                local oldStroke = ActiveTab.TabBtn:FindFirstChild("UIStroke")
                if oldStroke then oldStroke:Destroy() end
                
                -- Reset warna text & icon tab lama
                local content = ActiveTab.TabBtn:FindFirstChild("Frame")
                if content then
                    for _, child in ipairs(content:GetChildren()) do
                        if child:IsA("TextLabel") then
                            Tween(child, {TextColor3 = Nexus.Theme.TextSub}, 0.2)
                        end
                    end
                end
                
                if ActiveTab.Page then ActiveTab.Page.Visible = false end
            end
            
            -- Aktifkan Tab Baru (Tab yang diklik)
            ActiveTab = Tab
            
            Tween(TabButton, {BackgroundTransparency = 0.3}, 0.2)
            AddStroke(TabButton, Nexus.Theme.Accent, 1, 0.4)
            
            Tween(TabIconObj, {TextColor3 = Nexus.Theme.Accent}, 0.2)
            Tween(TabNameObj, {TextColor3 = Nexus.Theme.Text}, 0.2)
            
            TabPage.Visible = true
        end)
        
        -- Hover Effects
        TabButton.MouseEnter:Connect(function()
            if ActiveTab ~= Tab then
                Tween(TabButton, {BackgroundTransparency = 0.6}, 0.15)
                Tween(TabIconObj, {TextColor3 = Nexus.Theme.Accent}, 0.15)
                Tween(TabNameObj, {TextColor3 = Nexus.Theme.Text}, 0.15)
            end
        end)
        
        TabButton.MouseLeave:Connect(function()
            if ActiveTab ~= Tab then
                Tween(TabButton, {BackgroundTransparency = 0.8}, 0.15)
                Tween(TabIconObj, {TextColor3 = Nexus.Theme.TextSub}, 0.15)
                Tween(TabNameObj, {TextColor3 = Nexus.Theme.TextSub}, 0.15)
            end
        end)
        
        table.insert(Tabs, Tab)
        
        -- Tab API methods
        function Tab:Section(text)
            local SectionFrame = Create("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 32),
                Parent = TabPage
            })
            
            local SectionLabel = Create("TextLabel", {
                Text = text or "Section",
                Font = Enum.Font.GothamBold,
                TextSize = 16,
                TextColor3 = Nexus.Theme.Text,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = SectionFrame
            })
            
            -- Section underline
            local SectionLine = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.Accent,
                Size = UDim2.new(0, 40, 0, 2),
                Position = UDim2.new(0, 0, 1, -4),
                Parent = SectionFrame
            })
            
            AddCorner(SectionLine, 1)
            
            return SectionFrame
        end
        
        function Tab:Divider()
            local DividerFrame = Create("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 16),
                Parent = TabPage
            })
            
            local DividerLine = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.Outline,
                BackgroundTransparency = 0.6,
                Size = UDim2.new(1, 0, 0, 1),
                Position = UDim2.new(0, 0, 0.5, 0),
                Parent = DividerFrame
            })
            
            return DividerFrame
        end
        
        function Tab:Label(config)
            if type(config) == "string" then
                config = {Text = config}
            end
            if not config then config = {} end
            
            local Text = config.Text or "Label"
            local Color = config.Color or Nexus.Theme.TextSub
            local Size = config.Size or 14
            local Font = config.Font or Enum.Font.Gotham
            
            local LabelFrame = Create("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 24),
                Parent = TabPage
            })
            
            local Label = Create("TextLabel", {
                Text = Text,
                Font = Font,
                TextSize = Size,
                TextColor3 = Color,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
                Parent = LabelFrame
            })
            
            -- Auto-resize based on text
            local function UpdateSize()
                if Label and Label.Parent then
                    local textSize = game:GetService("TextService"):GetTextSize(
                        Label.Text, Label.TextSize, Label.Font, 
                        Vector2.new(Label.AbsoluteSize.X, math.huge)
                    )
                    LabelFrame.Size = UDim2.new(1, 0, 0, math.max(24, textSize.Y + 4))
                end
            end
            
            UpdateSize()
            
            -- Theme update
            local labelThemeConnection = Nexus.ThemeChanged.Event:Connect(function()
                if Label and Label.Parent then
                    Label.TextColor3 = Color == Nexus.Theme.TextSub and Nexus.Theme.TextSub or Color
                end
            end)
            
            table.insert(Nexus.Connections, labelThemeConnection)
            
            return {
                SetText = function(newText)
                    Label.Text = tostring(newText or "")
                    UpdateSize()
                end,
                SetColor = function(newColor)
                    Color = newColor
                    Label.TextColor3 = newColor
                end,
                GetText = function()
                    return Label.Text
                end
            }
        end
        
        function Tab:Button(config)
            if type(config) == "string" then
                config = {Text = config}
            end
            if not config then config = {} end
            
            local Text = config.Text or "Button"
            local Callback = config.Callback or function() end
            local Icon = config.Icon
            
            local ButtonFrame = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.Surface,
                Size = UDim2.new(1, 0, 0, 44),
                Parent = TabPage
            })
            
            AddCorner(ButtonFrame, 8)
            AddStroke(ButtonFrame, Nexus.Theme.Outline, 1, 0.4)
            
            -- Base gradient
            local ButtonGradient = Create("UIGradient", {
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Nexus.Theme.Surface),
                    ColorSequenceKeypoint.new(0.5, Nexus.Theme.SurfaceHigh),
                    ColorSequenceKeypoint.new(1, Nexus.Theme.Surface)
                },
                Rotation = 90,
                Transparency = NumberSequence.new{
                    NumberSequenceKeypoint.new(0, 0.05),
                    NumberSequenceKeypoint.new(0.5, 0.02),
                    NumberSequenceKeypoint.new(1, 0.08)
                },
                Parent = ButtonFrame
            })
            
            -- Hover state enhancement
            ButtonFrame.MouseEnter:Connect(function()
                if ButtonGradient then
                    ButtonGradient.Transparency = NumberSequence.new{
                        NumberSequenceKeypoint.new(0, 0.02),
                        NumberSequenceKeypoint.new(0.5, 0),
                        NumberSequenceKeypoint.new(1, 0.05)
                    }
                end
            end)
            
            ButtonFrame.MouseLeave:Connect(function()
                if ButtonGradient then
                    ButtonGradient.Transparency = NumberSequence.new{
                        NumberSequenceKeypoint.new(0, 0.05),
                        NumberSequenceKeypoint.new(0.5, 0.02),
                        NumberSequenceKeypoint.new(1, 0.08)
                    }
                end
            end)
            
            ButtonFrame.MouseLeave:Connect(function()
                Tween(ButtonGradient, {
                    Transparency = NumberSequence.new{
                        NumberSequenceKeypoint.new(0, 0.05),
                        NumberSequenceKeypoint.new(0.5, 0.02),
                        NumberSequenceKeypoint.new(1, 0.08)
                    }
                }, 0.15)
            end)
            
            -- Theme update connection
            local buttonGradientConnection = Nexus.ThemeChanged.Event:Connect(function()
                if ButtonGradient and ButtonGradient.Parent then
                    ButtonGradient.Color = ColorSequence.new{
                        ColorSequenceKeypoint.new(0, Nexus.Theme.Surface),
                        ColorSequenceKeypoint.new(0.5, Nexus.Theme.SurfaceHigh),
                        ColorSequenceKeypoint.new(1, Nexus.Theme.Surface)
                    }
                end
            end)
            
            table.insert(Nexus.Connections, buttonGradientConnection)

            
            local Button = Create("TextButton", {
                Text = "",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                AutoButtonColor = false,
                Parent = ButtonFrame
            })
            
            local ButtonContent = Create("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Parent = Button
            })
            
            -- Icon (if provided)
            local iconSize = 0
            if Icon then
                local ButtonIcon = Create("TextLabel", {
                    Text = Icon,
                    Font = Enum.Font.GothamBold,
                    TextSize = 16,
                    TextColor3 = Nexus.Theme.Accent,
                    BackgroundTransparency = 1,
                    Position = UDim2.fromOffset(16, 0),
                    Size = UDim2.fromOffset(24, 44),
                    Parent = ButtonContent
                })
                iconSize = 32
            end
            
            -- Button text
            local ButtonText = Create("TextLabel", {
                Text = Text,
                Font = Enum.Font.GothamMedium,
                TextSize = 14,
                TextColor3 = Nexus.Theme.Text,
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(16 + iconSize, 0),
                Size = UDim2.new(1, -(32 + iconSize), 1, 0),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTruncate = Enum.TextTruncate.AtEnd,
                Parent = ButtonContent
            })
            
            -- Hover effects
            Button.MouseEnter:Connect(function()
                Tween(ButtonFrame, {BackgroundColor3 = Nexus.Theme.SurfaceHigh}, 0.15)
                
                local stroke = ButtonFrame:FindFirstChild("UIStroke")
                if stroke then
                    Tween(stroke, {
                        Color = Nexus.Theme.Accent,
                        Transparency = 0.2
                    }, 0.15)
                end
            end)
            
            Button.MouseLeave:Connect(function()
                Tween(ButtonFrame, {BackgroundColor3 = Nexus.Theme.Surface}, 0.15)
                
                local stroke = ButtonFrame:FindFirstChild("UIStroke")
                if stroke then
                    Tween(stroke, {
                        Color = Nexus.Theme.Outline,
                        Transparency = 0.4
                    }, 0.15)
                end
            end)
            
            -- Click animation
            Button.MouseButton1Down:Connect(function()
                Tween(ButtonFrame, {Size = UDim2.new(1, -4, 0, 42)}, 0.1)
            end)
            
            Button.MouseButton1Up:Connect(function()
                Tween(ButtonFrame, {Size = UDim2.new(1, 0, 0, 44)}, 0.1)
            end)
            
            -- Callback
            Button.MouseButton1Click:Connect(function()
                ----PlaySound("6895079853", 0.1)
                pcall(Callback)
            end)
            
            -- Theme updates
            local buttonThemeConnection = Nexus.ThemeChanged.Event:Connect(function()
                if ButtonFrame and ButtonFrame.Parent then
                    ButtonFrame.BackgroundColor3 = Nexus.Theme.Surface
                    ButtonText.TextColor3 = Nexus.Theme.Text
                    
                    if Icon then
                        ButtonContent:FindFirstChild("TextLabel").TextColor3 = Nexus.Theme.Accent
                    end
                end
            end)
            
            table.insert(Nexus.Connections, buttonThemeConnection)
            
            return {
                SetText = function(newText)
                    ButtonText.Text = tostring(newText or "")
                end,
                GetText = function()
                    return ButtonText.Text
                end,
                SetEnabled = function(enabled)
                    Button.Visible = enabled
                end
            }
        end
        
        -- Enhanced Dropdown with the new system
        function Tab:Dropdown(config)
            if not TabPage or not TabPage.Parent then return nil end
            return CreateModernDropdown(config, TabPage)
        end
        
        -- Continue with other components in the next part...
        function Tab:Toggle(config)
            if type(config) == "string" then
                config = {Text = config}
            end
            if not config then config = {} end
            
            local Text = config.Text or "Toggle"
            local Default = config.Default or false
            local Callback = config.Callback or function() end
            local Flag = config.Flag
            
            local CurrentValue = Default
            
            local ToggleFrame = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.Surface,
                Size = UDim2.new(1, 0, 0, 44),
                Parent = TabPage
            })
            
            AddCorner(ToggleFrame, 8)
            AddStroke(ToggleFrame, Nexus.Theme.Outline, 1, 0.4)
            
            local ToggleText = Create("TextLabel", {
                Text = Text,
                Font = Enum.Font.GothamMedium,
                TextSize = 14,
                TextColor3 = Nexus.Theme.Text,
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(16, 0),
                Size = UDim2.new(1, -80, 1, 0),
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = ToggleFrame
            })
            
            -- Toggle switch container
            local SwitchContainer = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.SurfaceHighest, -- Warna Track Mati
                Size = UDim2.fromOffset(44, 6), -- Lebih tipis (Garis)
                Position = UDim2.new(1, -60, 0.5, -3),
                Parent = ToggleFrame
            })
            AddCorner(SwitchContainer, 3)
            
            local SwitchFill = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.Accent,
                Size = UDim2.new(0, 0, 1, 0), -- Mulai dari 0
                Parent = SwitchContainer
            })
            AddCorner(SwitchFill, 3)
            
            -- Handle (Kepala Toggle)
            local SwitchHandle = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.TextSub, -- Warna mati
                Size = UDim2.fromOffset(18, 18),
                Position = UDim2.fromScale(0, 0.5),
                AnchorPoint = Vector2.new(0, 0.5), -- Center Y
                Parent = SwitchContainer
            })
            AddCorner(SwitchHandle, 100) -- Bulat sempurna
            
            AddCorner(SwitchHandle, 10)
            AddShadow(SwitchHandle, 2, 0.8)
            
            local ToggleButton = Create("TextButton", {
                Text = "",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Parent = ToggleFrame
            })
            
            local function UpdateToggle(newValue)
                CurrentValue = newValue
                
                Tween(SwitchContainer, {
                    BackgroundColor3 = CurrentValue and Nexus.Theme.Accent or Nexus.Theme.SurfaceHigh
                }, 0.2)
                
                Tween(SwitchHandle, {
                    Position = UDim2.fromOffset(CurrentValue and 26 or 2, 2)
                }, 0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
                
                pcall(function()
                    Callback(CurrentValue)
                end)
                
                if Flag then
                    Nexus.Flags[Flag] = CurrentValue
                end
            end
            
            ToggleButton.MouseButton1Click:Connect(function()
                --PlaySound("6895079853", 0.08, CurrentValue and 0.9 or 1.1)
                UpdateToggle(not CurrentValue)
            end)
            
            -- Hover effect
            ToggleButton.MouseEnter:Connect(function()
                Tween(ToggleFrame, {BackgroundColor3 = Nexus.Theme.SurfaceHigh}, 0.15)
            end)
            
            ToggleButton.MouseLeave:Connect(function()
                Tween(ToggleFrame, {BackgroundColor3 = Nexus.Theme.Surface}, 0.15)
            end)
            
            -- Initialize value
            UpdateToggle(CurrentValue)
            
            -- Register with flag system
            if Flag then
                Nexus.Registry[Flag] = {
                    Set = UpdateToggle,
                    Get = function() return CurrentValue end
                }
            end
            
            -- Theme update
            local toggleThemeConnection = Nexus.ThemeChanged.Event:Connect(function()
                if ToggleFrame and ToggleFrame.Parent then
                    ToggleFrame.BackgroundColor3 = Nexus.Theme.Surface
                    ToggleText.TextColor3 = Nexus.Theme.Text
                    SwitchContainer.BackgroundColor3 = CurrentValue and Nexus.Theme.Accent or Nexus.Theme.SurfaceHigh
                    SwitchHandle.BackgroundColor3 = Nexus.Theme.Text
                end
            end)
            
            table.insert(Nexus.Connections, toggleThemeConnection)
            
            return {
                Set = UpdateToggle,
                Get = function() return CurrentValue end,
                SetText = function(newText)
                    ToggleText.Text = tostring(newText or "")
                end
            }
        end
        
        function Tab:Slider(config)
            if not config then config = {} end
            
            local Text = config.Text or "Slider"
            local Min = config.Min or 0
            local Max = config.Max or 100
            local Default = config.Default or Min
            local Increment = config.Increment or 1
            local Suffix = config.Suffix or ""
            local Prefix = config.Prefix or ""
            local Callback = config.Callback or function() end
            local Flag = config.Flag
            
            -- Validate values
            Min = tonumber(Min) or 0
            Max = tonumber(Max) or 100
            Default = math.clamp(tonumber(Default) or Min, Min, Max)
            Increment = math.max(tonumber(Increment) or 1, 0.01)
            
            if Min >= Max then
                Max = Min + 100
            end
            
            local CurrentValue = Default
            
            local SliderFrame = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.Surface,
                Size = UDim2.new(1, 0, 0, 56),
                Parent = TabPage
            })
            
            AddCorner(SliderFrame, 8)
            AddStroke(SliderFrame, Nexus.Theme.Outline, 1, 0.4)
            
            -- Header section
            local HeaderFrame = Create("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 28),
                Position = UDim2.fromOffset(0, 8),
                Parent = SliderFrame
            })
            
            local SliderText = Create("TextLabel", {
                Text = Text,
                Font = Enum.Font.GothamMedium,
                TextSize = 14,
                TextColor3 = Nexus.Theme.Text,
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(16, 0),
                Size = UDim2.new(1, -120, 1, 0),
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = HeaderFrame
            })
            
            -- Value display
            local ValueFrame = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.SurfaceHighest,
                Size = UDim2.fromOffset(80, 20),
                Position = UDim2.new(1, -96, 0, 4),
                Parent = HeaderFrame
            })
            
            AddCorner(ValueFrame, 4)
            AddStroke(ValueFrame, Nexus.Theme.Accent, 1, 0.6)
            
            local ValueLabel = Create("TextLabel", {
                Text = Prefix .. tostring(CurrentValue) .. Suffix,
                Font = Enum.Font.GothamMedium,
                TextSize = 12,
                TextColor3 = Nexus.Theme.Accent,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Parent = ValueFrame
            })
            
            -- Slider track
            local SliderTrack = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.SurfaceHigh,
                Size = UDim2.new(1, -32, 0, 6),
                Position = UDim2.fromOffset(16, 40),
                Parent = SliderFrame
            })
            
            AddCorner(SliderTrack, 3)
            
            -- Slider fill
            local SliderFill = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.Accent,
                Size = UDim2.new((CurrentValue - Min) / (Max - Min), 0, 1, 0),
                Position = UDim2.fromOffset(0, 0),
                Parent = SliderTrack
            })
            
            AddCorner(SliderFill, 3)
            
            -- Slider handle
            local SliderHandle = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.Text,
                Size = UDim2.fromOffset(16, 16),
                Position = UDim2.new((CurrentValue - Min) / (Max - Min), -8, 0.5, -8),
                Parent = SliderTrack
            })
            
            AddCorner(SliderHandle, 8)
            AddStroke(SliderHandle, Nexus.Theme.Accent, 2, 0.3)
            AddShadow(SliderHandle, 4, 0.7)
            
            -- Handle glow effect
            local HandleGlow = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.Accent,
                BackgroundTransparency = 0.8,
                Size = UDim2.fromOffset(24, 24),
                Position = UDim2.fromOffset(-4, -4),
                Parent = SliderHandle
            })
            
            AddCorner(HandleGlow, 12)
            
            -- Slider interaction
            local Dragging = false
            
            local function UpdateSlider(value, animate)
                value = math.clamp(value, Min, Max)
                
                -- Round to increment
                if Increment > 0 then
                    value = math.round(value / Increment) * Increment
                end
                
                CurrentValue = value
                local percentage = (value - Min) / (Max - Min)
                
                -- Update visuals
                if animate ~= false then
                    Tween(SliderFill, {Size = UDim2.new(percentage, 0, 1, 0)}, 0.15)
                    Tween(SliderHandle, {Position = UDim2.new(percentage, -8, 0.5, -8)}, 0.15)
                else
                    SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
                    SliderHandle.Position = UDim2.new(percentage, -8, 0.5, -8)
                end
                
                ValueLabel.Text = Prefix .. tostring(value) .. Suffix
                
                pcall(function()
                    Callback(value)
                end)
                
                if Flag then
                    Nexus.Flags[Flag] = value
                end
            end
            
            local SliderButton = Create("TextButton", {
                Text = "",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Parent = SliderFrame
            })
            
            local function OnInputBegan(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or
                   input.UserInputType == Enum.UserInputType.Touch then
                    
                    -- [SAFETY CHECK 1] Pastikan elemen slider masih ada
                    if not SliderTrack or not SliderTrack.Parent then return end

                    Dragging = true
                    -- PlaySound("6895079853", 0.05)
                    
                    -- Handle glow animation (Cek dulu apakah HandleGlow ada)
                    if HandleGlow then
                        Tween(HandleGlow, {
                            Size = UDim2.fromOffset(32, 32),
                            Position = UDim2.fromOffset(-8, -8),
                            BackgroundTransparency = 0.6
                        }, 0.15)
                    end
                    
                    -- Calculate initial value
                    local mousePos = input.Position.X
                    local trackPos = SliderTrack.AbsolutePosition.X
                    local trackSize = SliderTrack.AbsoluteSize.X
                    
                    -- [SAFETY CHECK 2] Mencegah pembagian dengan nol (jarang terjadi, tapi aman)
                    if trackSize == 0 then return end

                    local percentage = math.clamp((mousePos - trackPos) / trackSize, 0, 1)
                    local newValue = Min + (percentage * (Max - Min))
                    
                    UpdateSlider(newValue)
                end
            end
            
            local function OnInputChanged(input)
                if Dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or
                                input.UserInputType == Enum.UserInputType.Touch) then
                    
                    -- [SAFETY CHECK 3] PENTING: Cek lagi saat dragging
                    -- Jika UI ditutup saat drag, hentikan drag dan return
                    if not SliderTrack or not SliderTrack.Parent then 
                        Dragging = false
                        return 
                    end

                    local mousePos = input.Position.X
                    local trackPos = SliderTrack.AbsolutePosition.X
                    local trackSize = SliderTrack.AbsoluteSize.X
                    
                    if trackSize == 0 then return end

                    local percentage = math.clamp((mousePos - trackPos) / trackSize, 0, 1)
                    local newValue = Min + (percentage * (Max - Min))
                    
                    UpdateSlider(newValue, false)
                end
            end
            
            local function OnInputEnded(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or
                   input.UserInputType == Enum.UserInputType.Touch then
                    
                    Dragging = false
                    --PlaySound("6895079725", 0.03)
                    
                    -- Reset handle glow
                    Tween(HandleGlow, {
                        Size = UDim2.fromOffset(24, 24),
                        Position = UDim2.fromOffset(-4, -4),
                        BackgroundTransparency = 0.8
                    }, 0.15)
                end
            end
            
            -- Connect events
            table.insert(Nexus.Connections, SliderButton.InputBegan:Connect(OnInputBegan))
            table.insert(Nexus.Connections, UserInputService.InputChanged:Connect(OnInputChanged))
            table.insert(Nexus.Connections, UserInputService.InputEnded:Connect(OnInputEnded))
            
            -- Hover effects
            SliderButton.MouseEnter:Connect(function()
                Tween(SliderFrame, {BackgroundColor3 = Nexus.Theme.SurfaceHigh}, 0.15)
                Tween(SliderHandle, {Size = UDim2.fromOffset(18, 18)}, 0.15)
            end)
            
            SliderButton.MouseLeave:Connect(function()
                if not Dragging then
                    Tween(SliderFrame, {BackgroundColor3 = Nexus.Theme.Surface}, 0.15)
                    Tween(SliderHandle, {Size = UDim2.fromOffset(16, 16)}, 0.15)
                end
            end)
            
            -- Initialize
            UpdateSlider(CurrentValue, false)
            
            -- Register
            if Flag then
                Nexus.Registry[Flag] = {
                    Set = function(value) UpdateSlider(tonumber(value) or Min) end,
                    Get = function() return CurrentValue end
                }
            end
            
            -- Theme updates
            local sliderThemeConnection = Nexus.ThemeChanged.Event:Connect(function()
                if SliderFrame and SliderFrame.Parent then
                    SliderFrame.BackgroundColor3 = Nexus.Theme.Surface
                    SliderText.TextColor3 = Nexus.Theme.Text
                    SliderTrack.BackgroundColor3 = Nexus.Theme.SurfaceHigh
                    SliderFill.BackgroundColor3 = Nexus.Theme.Accent
                    SliderHandle.BackgroundColor3 = Nexus.Theme.Text
                    ValueFrame.BackgroundColor3 = Nexus.Theme.SurfaceHighest
                    ValueLabel.TextColor3 = Nexus.Theme.Accent
                    HandleGlow.BackgroundColor3 = Nexus.Theme.Accent
                end
            end)
            
            table.insert(Nexus.Connections, sliderThemeConnection)
            
            return {
                Set = function(value) UpdateSlider(tonumber(value) or Min) end,
                Get = function() return CurrentValue end,
                SetText = function(newText) SliderText.Text = tostring(newText or "") end,
                SetMin = function(newMin) 
                    Min = tonumber(newMin) or Min
                    UpdateSlider(CurrentValue)
                end,
                SetMax = function(newMax)
                    Max = tonumber(newMax) or Max
                    UpdateSlider(CurrentValue)
                end
            }
        end
        
        function Tab:TextBox(config)
            if not config then config = {} end
            
            local Text = config.Text or "TextBox"
            local Placeholder = config.Placeholder or "Enter text..."
            local Default = config.Default or ""
            local Multiline = config.Multiline or false
            local Numeric = config.Numeric or false
            local Callback = config.Callback or function() end
            local Flag = config.Flag
            
            local CurrentValue = tostring(Default)
            
            local TextBoxFrame = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.Surface,
                Size = UDim2.new(1, 0, 0, Multiline and 80 or 44),
                Parent = TabPage
            })
            
            AddCorner(TextBoxFrame, 8)
            AddStroke(TextBoxFrame, Nexus.Theme.Outline, 1, 0.4)
            
            -- Label
            if Text and Text ~= "" then
                local TextBoxLabel = Create("TextLabel", {
                    Text = Text,
                    Font = Enum.Font.GothamMedium,
                    TextSize = 12,
                    TextColor3 = Nexus.Theme.TextSub,
                    BackgroundTransparency = 1,
                    Position = UDim2.fromOffset(16, 4),
                    Size = UDim2.new(1, -32, 0, 16),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = TextBoxFrame
                })
            end
            
            -- Input container
            local InputContainer = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.SurfaceHighest,
                Size = UDim2.new(1, -16, 0, Multiline and 52 or 24),
                Position = UDim2.fromOffset(8, Text and Text ~= "" and 22 or 10),
                Parent = TextBoxFrame
            })
            
            AddCorner(InputContainer, 6)
            AddStroke(InputContainer, Nexus.Theme.Outline, 1, 0.8)
            
            -- TextBox
            local TextBox = Create("TextBox", {
                Text = CurrentValue,
                PlaceholderText = Placeholder,
                PlaceholderColor3 = Nexus.Theme.TextMuted,
                Font = Enum.Font.Gotham,
                TextSize = 13,
                TextColor3 = Nexus.Theme.Text,
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(8, 0),
                Size = UDim2.new(1, -16, 1, 0),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Multiline and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center,
                TextWrapped = Multiline,
                MultiLine = Multiline,
                ClearTextOnFocus = false,
                Parent = InputContainer
            })
            
            -- Add padding for multiline
            if Multiline then
                local textPadding = Create("UIPadding", {
                    PaddingTop = UDim.new(0, 4),
                    PaddingBottom = UDim.new(0, 4),
                    Parent = TextBox
                })
            end
            
            -- Numeric input validation
            if Numeric then
                TextBox:GetPropertyChangedSignal("Text"):Connect(function()
                    local text = TextBox.Text
                    local newText = text:gsub("[^%d%.%-]", "") -- Allow digits, decimal point, minus
                    
                    -- Ensure only one decimal point and minus at start
                    local decimalCount = 0
                    local result = ""
                    local minusAdded = false
                    
                    for i = 1, #newText do
                        local char = newText:sub(i, i)
                        
                        if char == "." and decimalCount == 0 then
                            decimalCount = 1
                            result = result .. char
                        elseif char == "-" and i == 1 and not minusAdded then
                            minusAdded = true
                            result = result .. char
                        elseif char:match("%d") then
                            result = result .. char
                        end
                    end
                    
                    if result ~= text then
                        TextBox.Text = result
                    end
                end)
            end
            
            -- Focus effects
            TextBox.Focused:Connect(function()
                --PlaySound("6895079853", 0.04)
                
                local stroke = InputContainer:FindFirstChild("UIStroke")
                if stroke then
                    Tween(stroke, {
                        Color = Nexus.Theme.Accent,
                        Transparency = 0.3,
                        Thickness = 1.5
                    }, 0.2)
                end
                
                Tween(InputContainer, {BackgroundColor3 = Nexus.Theme.Surface}, 0.2)
            end)
            
            TextBox.FocusLost:Connect(function()
                local stroke = InputContainer:FindFirstChild("UIStroke")
                if stroke then
                    Tween(stroke, {
                        Color = Nexus.Theme.Outline,
                        Transparency = 0.8,
                        Thickness = 1
                    }, 0.2)
                end
                
                Tween(InputContainer, {BackgroundColor3 = Nexus.Theme.SurfaceHighest}, 0.2)
                
                -- Update value and trigger callback
                local newValue = TextBox.Text
                if Numeric then
                    newValue = tonumber(newValue) or 0
                end
                
                CurrentValue = newValue
                
                pcall(function()
                    Callback(CurrentValue)
                end)
                
                if Flag then
                    Nexus.Flags[Flag] = CurrentValue
                end
            end)
            
            -- Register
            if Flag then
                Nexus.Registry[Flag] = {
                    Set = function(value)
                        CurrentValue = Numeric and (tonumber(value) or 0) or tostring(value or "")
                        TextBox.Text = tostring(CurrentValue)
                    end,
                    Get = function() return CurrentValue end
                }
            end
            
            -- Theme updates
            local textboxThemeConnection = Nexus.ThemeChanged.Event:Connect(function()
                if TextBoxFrame and TextBoxFrame.Parent then
                    TextBoxFrame.BackgroundColor3 = Nexus.Theme.Surface
                    InputContainer.BackgroundColor3 = Nexus.Theme.SurfaceHighest
                    TextBox.TextColor3 = Nexus.Theme.Text
                    TextBox.PlaceholderColor3 = Nexus.Theme.TextMuted
                    
                    if TextBoxFrame:FindFirstChild("TextLabel") then
                        TextBoxFrame:FindFirstChild("TextLabel").TextColor3 = Nexus.Theme.TextSub
                    end
                end
            end)
            
            table.insert(Nexus.Connections, textboxThemeConnection)
            
            return {
                Set = function(value)
                    CurrentValue = Numeric and (tonumber(value) or 0) or tostring(value or "")
                    TextBox.Text = tostring(CurrentValue)
                end,
                Get = function() return CurrentValue end,
                SetPlaceholder = function(newPlaceholder)
                    TextBox.PlaceholderText = tostring(newPlaceholder or "")
                end
            }
        end
        
        function Tab:Keybind(config)
            if not config then config = {} end
            
            local Text = config.Text or "Keybind"
            local Default = config.Default or Enum.KeyCode.F
            local Callback = config.Callback or function() end
            local Flag = config.Flag
            local Mode = config.Mode or "Toggle" -- Toggle, Hold, Always
            
            local CurrentKey = Default
            local IsBinding = false
            local IsActive = false
            
            local KeybindFrame = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.Surface,
                Size = UDim2.new(1, 0, 0, 44),
                Parent = TabPage
            })
            
            AddCorner(KeybindFrame, 8)
            AddStroke(KeybindFrame, Nexus.Theme.Outline, 1, 0.4)
            
            local KeybindText = Create("TextLabel", {
                Text = Text,
                Font = Enum.Font.GothamMedium,
                TextSize = 14,
                TextColor3 = Nexus.Theme.Text,
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(16, 0),
                Size = UDim2.new(1, -120, 1, 0),
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = KeybindFrame
            })
            
            -- Mode indicator
            local ModeLabel = Create("TextLabel", {
                Text = Mode,
                Font = Enum.Font.Gotham,
                TextSize = 10,
                TextColor3 = Nexus.Theme.TextMuted,
                BackgroundTransparency = 1,
                Position = UDim2.new(1, -100, 0, 2),
                Size = UDim2.new(0, 60, 0, 12),
                TextXAlignment = Enum.TextXAlignment.Center,
                Parent = KeybindFrame
            })
            
            -- Key display
            local KeyDisplay = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.SurfaceHighest,
                Size = UDim2.fromOffset(80, 28),
                Position = UDim2.new(1, -96, 0.5, -14),
                Parent = KeybindFrame
            })
            
            AddCorner(KeyDisplay, 6)
            AddStroke(KeyDisplay, IsActive and Nexus.Theme.Accent or Nexus.Theme.Outline, 1, IsActive and 0.3 or 0.6)
            
            local KeyLabel = Create("TextLabel", {
                Text = IsBinding and "..." or (CurrentKey.Name or "None"),
                Font = Enum.Font.GothamBold,
                TextSize = 12,
                TextColor3 = IsBinding and Nexus.Theme.Warning or (IsActive and Nexus.Theme.Accent or Nexus.Theme.Text),
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Parent = KeyDisplay
            })
            
            local KeyButton = Create("TextButton", {
                Text = "",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Parent = KeybindFrame
            })
            
            -- Key names mapping
            local KeyNames = {
                [Enum.KeyCode.LeftShift] = "LShift",
                [Enum.KeyCode.RightShift] = "RShift",
                [Enum.KeyCode.LeftControl] = "LCtrl",
                [Enum.KeyCode.RightControl] = "RCtrl",
                [Enum.KeyCode.LeftAlt] = "LAlt",
                [Enum.KeyCode.RightAlt] = "RAlt",
                [Enum.KeyCode.CapsLock] = "Caps",
                [Enum.KeyCode.One] = "1",
                [Enum.KeyCode.Two] = "2",
                [Enum.KeyCode.Three] = "3",
                [Enum.KeyCode.Four] = "4",
                [Enum.KeyCode.Five] = "5",
                [Enum.KeyCode.Six] = "6",
                [Enum.KeyCode.Seven] = "7",
                [Enum.KeyCode.Eight] = "8",
                [Enum.KeyCode.Nine] = "9",
                [Enum.KeyCode.Zero] = "0",
                [Enum.KeyCode.KeypadOne] = "Num1",
                [Enum.KeyCode.KeypadTwo] = "Num2",
                [Enum.KeyCode.KeypadThree] = "Num3",
                [Enum.KeyCode.KeypadFour] = "Num4",
                [Enum.KeyCode.KeypadFive] = "Num5",
                [Enum.KeyCode.KeypadSix] = "Num6",
                [Enum.KeyCode.KeypadSeven] = "Num7",
                [Enum.KeyCode.KeypadEight] = "Num8",
                [Enum.KeyCode.KeypadNine] = "Num9",
                [Enum.KeyCode.KeypadZero] = "Num0"
            }
            
            local function GetKeyName(key)
                return KeyNames[key] or key.Name or "Unknown"
            end
            
            local function UpdateKeyDisplay()
                KeyLabel.Text = IsBinding and "..." or GetKeyName(CurrentKey)
                KeyLabel.TextColor3 = IsBinding and Nexus.Theme.Warning or (IsActive and Nexus.Theme.Accent or Nexus.Theme.Text)
                
                local stroke = KeyDisplay:FindFirstChild("UIStroke")
                if stroke then
                    stroke.Color = IsActive and Nexus.Theme.Accent or Nexus.Theme.Outline
                    stroke.Transparency = IsActive and 0.3 or 0.6
                end
            end
            
            -- Keybind setting
            KeyButton.MouseButton1Click:Connect(function()
                if IsBinding then return end
                
                IsBinding = true
                --PlaySound("6895079853", 0.08)
                UpdateKeyDisplay()
                
                local connection
                connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
                    if gameProcessed then return end
                    
                    if input.UserInputType == Enum.UserInputType.Keyboard then
                        local key = input.KeyCode
                        
                        if key ~= Enum.KeyCode.Unknown then
                            CurrentKey = key
                            IsBinding = false
                            
                            UpdateKeyDisplay()
                            --PlaySound("6895079725", 0.06)
                            
                            if Flag then
                                Nexus.Flags[Flag] = CurrentKey
                            end
                            
                            connection:Disconnect()
                        end
                    end
                end)
                
                -- Auto-cancel after 5 seconds
                task.spawn(function()
                    task.wait(5)
                    if IsBinding then
                        IsBinding = false
                        UpdateKeyDisplay()
                        connection:Disconnect()
                    end
                end)
            end)
            
            -- Key activation handling
            local keyConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed or IsBinding then return end
                
                if input.KeyCode == CurrentKey then
                    if Mode == "Toggle" then
                        IsActive = not IsActive
                        UpdateKeyDisplay()
                        pcall(function()
                            Callback(IsActive, CurrentKey)
                        end)
                    elseif Mode == "Hold" then
                        IsActive = true
                        UpdateKeyDisplay()
                        pcall(function()
                            Callback(true, CurrentKey)
                        end)
                    elseif Mode == "Always" then
                        pcall(function()
                            Callback(CurrentKey)
                        end)
                    end
                end
            end)
            
            local keyEndConnection = UserInputService.InputEnded:Connect(function(input, gameProcessed)
                if gameProcessed or IsBinding then return end
                
                if input.KeyCode == CurrentKey and Mode == "Hold" then
                    IsActive = false
                    UpdateKeyDisplay()
                    pcall(function()
                        Callback(false, CurrentKey)
                    end)
                end
            end)
            
            table.insert(Nexus.Connections, keyConnection)
            table.insert(Nexus.Connections, keyEndConnection)
            
            -- Initialize
            UpdateKeyDisplay()
            
            -- Register
            if Flag then
                Nexus.Registry[Flag] = {
                    Set = function(key)
                        if typeof(key) == "EnumItem" and key.EnumType == Enum.KeyCode then
                            CurrentKey = key
                            UpdateKeyDisplay()
                        end
                    end,
                    Get = function() return CurrentKey end,
                    GetState = function() return IsActive end
                }
            end
            
            -- Theme updates
            local keybindThemeConnection = Nexus.ThemeChanged.Event:Connect(function()
                if KeybindFrame and KeybindFrame.Parent then
                    KeybindFrame.BackgroundColor3 = Nexus.Theme.Surface
                    KeybindText.TextColor3 = Nexus.Theme.Text
                    KeyDisplay.BackgroundColor3 = Nexus.Theme.SurfaceHighest
                    ModeLabel.TextColor3 = Nexus.Theme.TextMuted
                    UpdateKeyDisplay()
                end
            end)
            
            table.insert(Nexus.Connections, keybindThemeConnection)
            
            return {
                Set = function(key)
                    if typeof(key) == "EnumItem" and key.EnumType == Enum.KeyCode then
                        CurrentKey = key
                        UpdateKeyDisplay()
                    end
                end,
                Get = function() return CurrentKey end,
                GetState = function() return IsActive end,
                SetMode = function(newMode)
                    if newMode == "Toggle" or newMode == "Hold" or newMode == "Always" then
                        Mode = newMode
                        ModeLabel.Text = Mode
                    end
                end
            }
        end
        
        function Tab:ColorPicker(config)
            if not config then config = {} end
            
            local Text = config.Text or "Color Picker"
            local Default = config.Default or Color3.fromRGB(255, 255, 255)
            local Callback = config.Callback or function() end
            local Flag = config.Flag
            
            local CurrentColor = Default
            
            local ColorFrame = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.Surface,
                Size = UDim2.new(1, 0, 0, 44),
                Parent = TabPage
            })
            
            AddCorner(ColorFrame, 8)
            AddStroke(ColorFrame, Nexus.Theme.Outline, 1, 0.4)
            
            local ColorText = Create("TextLabel", {
                Text = Text,
                Font = Enum.Font.GothamMedium,
                TextSize = 14,
                TextColor3 = Nexus.Theme.Text,
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(16, 0),
                Size = UDim2.new(1, -80, 1, 0),
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = ColorFrame
            })
            
            -- Color preview
            local ColorPreview = Create("Frame", {
                BackgroundColor3 = CurrentColor,
                Size = UDim2.fromOffset(48, 28),
                Position = UDim2.new(1, -64, 0.5, -14),
                Parent = ColorFrame
            })
            
            AddCorner(ColorPreview, 6)
            AddStroke(ColorPreview, Nexus.Theme.Outline, 1, 0.4)
            
            local ColorButton = Create("TextButton", {
                Text = "",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Parent = ColorFrame
            })
            
            -- Color picker popup
            local ColorPickerOpen = false
            local ColorPickerFrame = nil
            
            local function UpdateColor(newColor)
                CurrentColor = newColor
                ColorPreview.BackgroundColor3 = newColor
                
                pcall(function()
                    Callback(newColor)
                end)
                
                if Flag then
                    Nexus.Flags[Flag] = newColor
                end
            end
            
            ColorButton.MouseButton1Click:Connect(function()
                if ColorPickerOpen then return end
                
                ColorPickerOpen = true
                --PlaySound("6895079853", 0.08)
                
                -- Create color picker popup
                ColorPickerFrame = Create("Frame", {
                    BackgroundColor3 = Nexus.Theme.Surface,
                    Size = UDim2.fromOffset(280, 320),
                    Position = UDim2.new(0.5, -140, 0.5, -160),
                    Parent = ScreenGui
                })
                
                AddCorner(ColorPickerFrame, 12)
                AddStroke(ColorPickerFrame, Nexus.Theme.Accent, 2, 0.4)
                AddShadow(ColorPickerFrame, 16, 0.8)
                
                -- Header
                local PickerHeader = Create("Frame", {
                    BackgroundColor3 = Nexus.Theme.SurfaceHigh,
                    Size = UDim2.new(1, 0, 0, 40),
                    Parent = ColorPickerFrame
                })
                
                AddCorner(PickerHeader, 12)
                
                local HeaderFix = Create("Frame", {
                    BackgroundColor3 = Nexus.Theme.SurfaceHigh,
                    Size = UDim2.new(1, 0, 0, 12),
                    Position = UDim2.new(0, 0, 1, -12),
                    BorderSizePixel = 0,
                    Parent = PickerHeader
                })
                
                local PickerTitle = Create("TextLabel", {
                    Text = "Color Picker",
                    Font = Enum.Font.GothamBold,
                    TextSize = 16,
                    TextColor3 = Nexus.Theme.Text,
                    BackgroundTransparency = 1,
                    Position = UDim2.fromOffset(16, 0),
                    Size = UDim2.new(1, -80, 1, 0),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = PickerHeader
                })
                
                -- Close button
                local ClosePickerBtn = Create("TextButton", {
                    Text = "✕",
                    Font = Enum.Font.GothamBold,
                    TextSize = 14,
                    TextColor3 = Nexus.Theme.TextSub,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromOffset(32, 32),
                    Position = UDim2.new(1, -40, 0, 4),
                    Parent = PickerHeader
                })
                
                -- HSV conversion functions
                local function RGBtoHSV(r, g, b)
                    r, g, b = r / 255, g / 255, b / 255
                    local max, min = math.max(r, g, b), math.min(r, g, b)
                    local h, s, v
                    v = max
                    
                    local d = max - min
                    if max == 0 then
                        s = 0
                    else
                        s = d / max
                    end
                    
                    if max == min then
                        h = 0
                    else
                        if max == r then
                            h = (g - b) / d
                            if g < b then h = h + 6 end
                        elseif max == g then
                            h = (b - r) / d + 2
                        elseif max == b then
                            h = (r - g) / d + 4
                        end
                        h = h / 6
                    end
                    
                    return h, s, v
                end
                
                local function HSVtoRGB(h, s, v)
                    local r, g, b
                    local i = math.floor(h * 6)
                    local f = h * 6 - i
                    local p = v * (1 - s)
                    local q = v * (1 - f * s)
                    local t = v * (1 - (1 - f) * s)
                    
                    i = i % 6
                    
                    if i == 0 then
                        r, g, b = v, t, p
                    elseif i == 1 then
                        r, g, b = q, v, p
                    elseif i == 2 then
                        r, g, b = p, v, t
                    elseif i == 3 then
                        r, g, b = p, q, v
                    elseif i == 4 then
                        r, g, b = t, p, v
                    elseif i == 5 then
                        r, g, b = v, p, q
                    end
                    
                    return math.floor(r * 255), math.floor(g * 255), math.floor(b * 255)
                end
                
                -- Get current HSV
                local h, s, v = RGBtoHSV(CurrentColor.R * 255, CurrentColor.G * 255, CurrentColor.B * 255)
                
                -- Color wheel
                local ColorWheel = Create("Frame", {
                    BackgroundColor3 = Color3.new(1, 1, 1),
                    Size = UDim2.fromOffset(200, 200),
                    Position = UDim2.fromOffset(16, 56),
                    Parent = ColorPickerFrame
                })
                
                AddCorner(ColorWheel, 8)
                
                -- Hue bar
                local HueBar = Create("Frame", {
                    BackgroundColor3 = Color3.new(1, 0, 0),
                    Size = UDim2.fromOffset(24, 200),
                    Position = UDim2.fromOffset(232, 56),
                    Parent = ColorPickerFrame
                })
                
                AddCorner(HueBar, 4)
                
                -- Hue gradient
                local HueGradient = Create("UIGradient", {
                    Color = ColorSequence.new{
                        ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)),
                        ColorSequenceKeypoint.new(0.17, Color3.new(1, 1, 0)),
                        ColorSequenceKeypoint.new(0.33, Color3.new(0, 1, 0)),
                        ColorSequenceKeypoint.new(0.5, Color3.new(0, 1, 1)),
                        ColorSequenceKeypoint.new(0.67, Color3.new(0, 0, 1)),
                        ColorSequenceKeypoint.new(0.83, Color3.new(1, 0, 1)),
                        ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0))
                    },
                    Rotation = 90,
                    Parent = HueBar
                })
                
                -- Color preview in picker
                local PickerPreview = Create("Frame", {
                    BackgroundColor3 = CurrentColor,
                    Size = UDim2.fromOffset(200, 32),
                    Position = UDim2.fromOffset(16, 272),
                    Parent = ColorPickerFrame
                })
                
                AddCorner(PickerPreview, 6)
                AddStroke(PickerPreview, Nexus.Theme.Outline, 1, 0.4)
                
                -- Update color function
                local function UpdatePickerColor()
                    local r, g, b = HSVtoRGB(h, s, v)
                    local newColor = Color3.fromRGB(r, g, b)
                    PickerPreview.BackgroundColor3 = newColor
                    UpdateColor(newColor)
                end
                
                -- Hue slider interaction
                local HueSlider = Create("TextButton", {
                    Text = "",
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 1, 0),
                    Parent = HueBar
                })
                
                local HueDragging = false
                
                HueSlider.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        -- [SAFETY 1] Cek apakah HueBar ada
                        if not HueBar or not HueBar.Parent then return end

                        HueDragging = true
                        
                        -- Definisi variabel koneksi dulu agar bisa saling akses
                        local moveConnection, releaseConnection
                        
                        local function UpdateHue()
                            -- [SAFETY 2] Cek lagi saat update berjalan
                            if not HueBar or not HueBar.Parent then
                                -- Jika bar hilang saat drag, putuskan koneksi paksa
                                if moveConnection then moveConnection:Disconnect() end
                                if releaseConnection then releaseConnection:Disconnect() end
                                HueDragging = false
                                return
                            end

                            local mouseY = UserInputService:GetMouseLocation().Y
                            local relativeY = mouseY - HueBar.AbsolutePosition.Y
                            
                            -- [SAFETY 3] Hindari pembagian dengan nol
                            local barSizeY = HueBar.AbsoluteSize.Y
                            if barSizeY == 0 then return end

                            local percentage = math.clamp(relativeY / barSizeY, 0, 1)
                            h = percentage
                            UpdatePickerColor()
                        end
                        
                        UpdateHue()
                        
                        moveConnection = UserInputService.InputChanged:Connect(function(input2)
                            if input2.UserInputType == Enum.UserInputType.MouseMovement and HueDragging then
                                UpdateHue()
                            end
                        end)
                        
                        releaseConnection = UserInputService.InputEnded:Connect(function(input2)
                            if input2.UserInputType == Enum.UserInputType.MouseButton1 then
                                HueDragging = false
                                
                                -- Putuskan koneksi agar memori bersih
                                if moveConnection then moveConnection:Disconnect() end
                                if releaseConnection then releaseConnection:Disconnect() end
                            end
                        end)
                    end
                end)
                
                -- Color wheel interaction
                local WheelButton = Create("TextButton", {
                    Text = "",
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 1, 0),
                    Parent = ColorWheel
                })
                
                local WheelDragging = false
                
                WheelButton.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        WheelDragging = true
                        
                        local function UpdateWheel()
                            local mouse = UserInputService:GetMouseLocation()
                            local relativeX = mouse.X - ColorWheel.AbsolutePosition.X
                            local relativeY = mouse.Y - ColorWheel.AbsolutePosition.Y
                            s = math.clamp(relativeX / ColorWheel.AbsoluteSize.X, 0, 1)
                            v = math.clamp(1 - (relativeY / ColorWheel.AbsoluteSize.Y), 0, 1)
                            UpdatePickerColor()
                        end
                        
                        UpdateWheel()
                        
                        local moveConnection = UserInputService.InputChanged:Connect(function(input2)
                            if input2.UserInputType == Enum.UserInputType.MouseMovement and WheelDragging then
                                UpdateWheel()
                            end
                        end)
                        
                        local releaseConnection = UserInputService.InputEnded:Connect(function(input2)
                            if input2.UserInputType == Enum.UserInputType.MouseButton1 then
                                WheelDragging = false
                                moveConnection:Disconnect()
                                releaseConnection:Disconnect()
                            end
                        end)
                    end
                end)
                
                -- Update color wheel gradient based on hue
                local function UpdateColorWheel()
                    local hueColor = Color3.fromHSV(h, 1, 1)
                    ColorWheel.BackgroundColor3 = hueColor
                end
                
                -- Color wheel gradients for saturation and value
                local SaturationGradient = Create("UIGradient", {
                    Color = ColorSequence.new{
                        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                        ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
                    },
                    Transparency = NumberSequence.new{
                        ColorSequenceKeypoint.new(0, 0),
                        ColorSequenceKeypoint.new(1, 1)
                    },
                    Rotation = 0,
                    Parent = ColorWheel
                })
                
                local ValueGradient = Create("UIGradient", {
                    Color = ColorSequence.new{
                        ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
                        ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
                    },
                    Transparency = NumberSequence.new{
                        ColorSequenceKeypoint.new(0, 1),
                        ColorSequenceKeypoint.new(1, 0)
                    },
                    Rotation = 90,
                    Parent = ColorWheel
                })
                
                UpdateColorWheel()
                
                -- Close picker
                local function ClosePicker()
                    ColorPickerOpen = false
                    Tween(ColorPickerFrame, {
                        Size = UDim2.fromOffset(0, 0),
                        BackgroundTransparency = 1
                    }, 0.2)
                    task.wait(0.2)
                    if ColorPickerFrame then
                        ColorPickerFrame:Destroy()
                        ColorPickerFrame = nil
                    end
                end
                
                ClosePickerBtn.MouseButton1Click:Connect(function()
                    --PlaySound("6895079725", 0.06)
                    ClosePicker()
                end)
                
                -- Click outside to close
                local OutsideClickConnection
                OutsideClickConnection = UserInputService.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        local mouse = UserInputService:GetMouseLocation()
                        local framePos = ColorPickerFrame.AbsolutePosition
                        local frameSize = ColorPickerFrame.AbsoluteSize
                        
                        if mouse.X < framePos.X or mouse.X > framePos.X + frameSize.X or
                           mouse.Y < framePos.Y or mouse.Y > framePos.Y + frameSize.Y then
                            ClosePicker()
                            OutsideClickConnection:Disconnect()
                        end
                    end
                end)
                
                -- Animate picker open
                ColorPickerFrame.Size = UDim2.fromOffset(0, 0)
                ColorPickerFrame.BackgroundTransparency = 1
                Tween(ColorPickerFrame, {
                    Size = UDim2.fromOffset(280, 320),
                    BackgroundTransparency = 0
                }, 0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
                
                -- Initial color wheel update
                UpdateColorWheel()
            end)
            
            -- Hover effects
            ColorButton.MouseEnter:Connect(function()
                Tween(ColorFrame, {BackgroundColor3 = Nexus.Theme.SurfaceHigh}, 0.15)
                Tween(ColorPreview, {Size = UDim2.fromOffset(52, 32)}, 0.15)
            end)
            
            ColorButton.MouseLeave:Connect(function()
                Tween(ColorFrame, {BackgroundColor3 = Nexus.Theme.Surface}, 0.15)
                Tween(ColorPreview, {Size = UDim2.fromOffset(48, 28)}, 0.15)
            end)
            
            -- Register
            if Flag then
                Nexus.Registry[Flag] = {
                    Set = function(color)
                        if typeof(color) == "Color3" then
                            UpdateColor(color)
                        end
                    end,
                    Get = function() return CurrentColor end
                }
            end
            
            -- Theme updates
            local colorThemeConnection = Nexus.ThemeChanged.Event:Connect(function()
                if ColorFrame and ColorFrame.Parent then
                    ColorFrame.BackgroundColor3 = Nexus.Theme.Surface
                    ColorText.TextColor3 = Nexus.Theme.Text
                end
            end)
            
            table.insert(Nexus.Connections, colorThemeConnection)
            
            return {
                Set = function(color)
                    if typeof(color) == "Color3" then
                        UpdateColor(color)
                    end
                end,
                Get = function() return CurrentColor end,
                SetText = function(newText)
                    ColorText.Text = tostring(newText or "")
                end
            }
        end
        
        -- Return Tab API
        return Tab
    end
    
    -- Window Theme Updates
    local windowThemeConnection = Nexus.ThemeChanged.Event:Connect(function()
        if not MainWindow or not MainWindow.Parent then return end
        
        -- Update window colors
        MainWindow.BackgroundColor3 = Nexus.Theme.Background
        TitleBar.BackgroundColor3 = Nexus.Theme.Surface
        TitleBarFix.BackgroundColor3 = Nexus.Theme.Surface
        WindowTitle.TextColor3 = Nexus.Theme.Text
        WindowSubtitle.TextColor3 = Nexus.Theme.TextSub
        TabContainer.BackgroundColor3 = Nexus.Theme.Surface
        PageContainer.BackgroundColor3 = Nexus.Theme.Background
        AppIcon.TextColor3 = Nexus.Theme.Accent
        
        -- Update gradients
        TitleGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Nexus.Theme.Gradient1),
            ColorSequenceKeypoint.new(1, Nexus.Theme.Gradient2)
        }
        
        -- Update control buttons
        MinimizeButton.TextColor3 = Nexus.Theme.TextSub
        SettingsButton.TextColor3 = Nexus.Theme.TextSub
        MinimizeButton.BackgroundColor3 = Nexus.Theme.SurfaceHigh
        SettingsButton.BackgroundColor3 = Nexus.Theme.SurfaceHigh
        CloseButton.BackgroundColor3 = Nexus.Theme.SurfaceHigh
        
        -- Update strokes
        local windowStroke = MainWindow:FindFirstChild("UIStroke")
        if windowStroke then
            windowStroke.Color = Nexus.Theme.Outline
        end
        
        local tabStroke = TabContainer:FindFirstChild("UIStroke")
        if tabStroke then
            tabStroke.Color = Nexus.Theme.Outline
        end
    end)
    
    table.insert(Nexus.Connections, windowThemeConnection)
    
    -- 📍 SEKARANG WINDOWAPI BISA MENGGUNAKAN CreateTab
    local WindowAPI = {
        SetTitle = function(newTitle)
            WindowTitle.Text = tostring(newTitle or "")
        end,
        SetSubtitle = function(newSubtitle)
            WindowSubtitle.Text = tostring(newSubtitle or "")
        end,
        SetIcon = function(newIcon)
            AppIcon.Text = tostring(newIcon or "🚀")
        end,
        Tab = function(config)
            return CreateTab(config)  -- ✅ SEKARANG BERFUNGSI
        end,
        Notify = Nexus.Notify,
        SetTheme = Nexus.SetTheme,
        SaveConfig = Nexus.SaveConfig,
        LoadConfig = Nexus.LoadConfig,
        GetConfigs = Nexus.GetConfigs,
        Destroy = function()
            --PlaySound("6895079725", 0.1, 0.8)
            
            -- Cleanup connections
            for _, connection in pairs(Nexus.Connections) do
                if connection and typeof(connection) == "RBXScriptConnection" then
                    connection:Disconnect()
                elseif connection and connection.Disconnect then
                    connection:Disconnect()
                end
            end
            
            -- Close window with animation
            Tween(MainWindow, {
                Size = UDim2.fromOffset(0, 0),
                BackgroundTransparency = 1
            }, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
            
            task.wait(0.3)
            
            if ScreenGui and ScreenGui.Parent then
                ScreenGui:Destroy()
            end
            
            Nexus.Connections = {}
            Nexus.Registry = {}
            Nexus.Flags = {}
        end,
        Minimize = function()
            if WindowMinimized then
                -- Restore
                WindowMinimized = false
                Tween(MainWindow, {
                    Size = WindowSize
                }, 0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                MinimizeButton.Text = "−"
            else
                -- Minimize
                WindowMinimized = true
                Tween(MainWindow, {
                    Size = UDim2.new(0, WindowSize.X.Offset, 0, 40)
                }, 0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                MinimizeButton.Text = "□"
            end
            --PlaySound("6895079853", 0.06)
        end,
        GetFlag = function(flag)
            return Nexus.Flags[flag]
        end,
        SetFlag = function(flag, value)
            if Nexus.Registry[flag] and Nexus.Registry[flag].Set then
                Nexus.Registry[flag].Set(value)
            else
                Nexus.Flags[flag] = value
            end
        end
    }

    
    return WindowAPI
end


-- Config System Functions
function Nexus:SaveConfig(name)
    if not name or name == "" then
        self:Notify({
            Text = "Please provide a config name",
            Type = "Warning"
        })
        return false
    end
    
    local configData = {}
    
    for flag, value in pairs(self.Flags) do
        -- Convert Color3 to RGB table for JSON compatibility
        if typeof(value) == "Color3" then
            configData[flag] = {
                Type = "Color3",
                R = value.R,
                G = value.G,
                B = value.B
            }
        elseif typeof(value) == "EnumItem" then
            configData[flag] = {
                Type = "EnumItem",
                EnumType = tostring(value.EnumType),
                Name = value.Name,
                Value = value.Value
            }
        else
            configData[flag] = {
                Type = typeof(value),
                Value = value
            }
        end
    end
    
    local success, result = pcall(function()
        return HttpService:JSONEncode(configData)
    end)
    
    if success then
        if not isfolder("NexusUI") then
            makefolder("NexusUI")
        end
        
        writefile("NexusUI/" .. name .. ".json", result)
        
        self:Notify({
            Text = "Config '" .. name .. "' saved successfully",
            Type = "Success"
        })
        return true
    else
        self:Notify({
            Text = "Failed to save config: " .. tostring(result),
            Type = "Error"
        })
        return false
    end
end

function Nexus:LoadConfig(name)
    if not name or name == "" then
        self:Notify({
            Text = "Please provide a config name",
            Type = "Warning"
        })
        return false
    end
    
    local filePath = "NexusUI/" .. name .. ".json"
    
    if not isfile(filePath) then
        self:Notify({
            Text = "Config '" .. name .. "' not found",
            Type = "Error"
        })
        return false
    end
    
    local success, configData = pcall(function()
        return HttpService:JSONDecode(readfile(filePath))
    end)
    
    if not success then
        self:Notify({
            Text = "Failed to load config: Invalid JSON",
            Type = "Error"
        })
        return false
    end
    
    local loadedCount = 0
    
    for flag, data in pairs(configData) do
        if data.Type and data.Value ~= nil then
            local value = data.Value
            
            -- Convert special types back
            if data.Type == "Color3" then
                value = Color3.new(data.R or 0, data.G or 0, data.B or 0)
            elseif data.Type == "EnumItem" and data.EnumType and data.Name then
                if data.EnumType == "Enum.KeyCode" then
                    value = Enum.KeyCode[data.Name]
                end
            end
            
            -- Set the value
            if self.Registry[flag] and self.Registry[flag].Set then
                pcall(function()
                    self.Registry[flag].Set(value)
                    loadedCount = loadedCount + 1
                end)
            else
                self.Flags[flag] = value
                loadedCount = loadedCount + 1
            end
        end
    end
    
    self:Notify({
        Text = "Config '" .. name .. "' loaded (" .. loadedCount .. " settings)",
        Type = "Success"
    })
    
    return true
end

function Nexus:GetConfigs()
    if not isfolder("NexusUI") then
        return {}
    end
    
    local configs = {}
    local files = listfiles("NexusUI")
    
    for _, file in pairs(files) do
        local name = file:match("NexusUI/(.+)%.json$")
        if name then
            table.insert(configs, name)
        end
    end
    
    return configs
end

-- Export Nexus
return Nexus
