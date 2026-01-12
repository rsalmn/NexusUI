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
        
        if not success then
            warn("[Nexus] Failed to get service:", serviceName)
        end
        
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

-- Tambah tracking
Nexus.ActiveTweens = Nexus.ActiveTweens or {}

local function Tween(inst, props, time, style, direction, callback)
    if Nexus.ActiveTweens[inst] then
        Nexus.ActiveTweens[inst]:Cancel()
    end
    
    if typeof(inst) ~= "Instance" then
        warn("[NexusUI] Tween Error: inst is not Instance")
        return
    end

    if not inst:IsDescendantOf(game) then
        -- object sudah di-destroy / belum masuk tree
        return
    end

    local info = TweenInfo.new(
        time or 0.25,
        style or Enum.EasingStyle.Quad,
        direction or Enum.EasingDirection.Out
    )

    local tween
    local ok, err = pcall(function()
        tween = TweenService:Create(inst, info, props)
        tween:Play()
    end)

    if not ok then
        warn("[NexusUI] Tween Create Failed:", err)
        return
    end

    Nexus.ActiveTweens[inst] = tween
    tween.Completed:Once(function()
        Nexus.ActiveTweens[inst] = nil
        if callback then callback() end
    end)
    

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
    
    local success = pcall(function()
        BlurEffect = Instance.new("BlurEffect")
        BlurEffect.Name = "NexusBlur"
        BlurEffect.Size = 0
        BlurEffect.Parent = Lighting
    end)
    
    if not success then
        warn("[Nexus] Blur effect not supported in this environment")
    end
end

local function SetBlur(enabled, intensity)
    if not BlurEffect then InitializeBlur() end
    if not BlurEffect then return end
    
    local targetSize = enabled and (intensity or 15) or 0
    -- Gunakan Quint untuk transisi blur yang lebih halus
    Tween(BlurEffect, {Size = targetSize}, 0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out) 
end


local CONFIG_FOLDER = "NexusConfig"
local CONFIG_VERSION = 2

function Nexus:SaveConfig(name)
    if not name or name == "" then return false end

    if not isfolder(CONFIG_FOLDER) then
        makefolder(CONFIG_FOLDER)
    end

    local data = {
        Version = CONFIG_VERSION,
        Flags = {},
        SavedAt = os.time()
    }

    for flag, value in pairs(self.Flags) do
        if typeof(value) == "Color3" then
            data.Flags[flag] = {
                Type = "Color3",
                R = value.R,
                G = value.G,
                B = value.B
            }
        elseif typeof(value) == "EnumItem" then
            data.Flags[flag] = {
                Type = "EnumItem",
                Enum = tostring(value.EnumType),
                Name = value.Name
            }
        else
            data.Flags[flag] = {
                Type = typeof(value),
                Value = value
            }
        end
    end

    local ok, json = pcall(HttpService.JSONEncode, HttpService, data)
    if not ok then return false end

    writefile(CONFIG_FOLDER .. "/" .. name .. ".json", json)
    return true
end

function Nexus:LoadConfig(name)
    local path = CONFIG_FOLDER .. "/" .. name .. ".json"
    if not isfile(path) then return false end

    local ok, data = pcall(function()
        return HttpService:JSONDecode(readfile(path))
    end)
    if not ok or not data then return false end

    -- backward compatibility (old configs)
    local flags = data.Flags or data.flags or data

    local applied = 0
    for flag, info in pairs(flags) do
        local value = info

        if typeof(info) == "table" and info.Type then
            if info.Type == "Color3" then
                value = Color3.new(info.R, info.G, info.B)
            elseif info.Type == "EnumItem" then
                local enumType = info.Enum or info.EnumType
                if enumType == "Enum.KeyCode" then
                    value = Enum.KeyCode[info.Name]
                end
            else
                value = info.Value
            end
        end

        if self.Registry[flag] and self.Registry[flag].Set then
            pcall(self.Registry[flag].Set, value)
        else
            self.Flags[flag] = value
        end

        applied += 1
    end

    self.AutoSave.ActiveConfig = name

    return true
end

function Nexus:GetConfigs()
    if not isfolder(CONFIG_FOLDER) then return {} end

    local list = {}
    for _, file in ipairs(listfiles(CONFIG_FOLDER)) do
        local name = file:match("([^/\\]+)%.json$")
        if name then
            table.insert(list, name)
        end
    end

    return list
end

----------------------------------------------------------------
-- AUTO SAVE STATE
----------------------------------------------------------------
Nexus.AutoSave = {
    Enabled = true,
    Delay = 2,              -- debounce delay (detik)
    ActiveConfig = nil,     -- nama config yang sedang aktif
    Dirty = false,
    _task = nil
}

function Nexus:_ScheduleAutoSave()
    self.AutoSave.Dirty = true
    
    if self.AutoSave._task then
        task.cancel(self.AutoSave._task)
        self.AutoSave._task = nil
    end
    
    self.AutoSave._task = task.delay(self.AutoSave.Delay, function()
        if not self.AutoSave.Dirty or not self.AutoSave.ActiveConfig then 
            return 
        end
        
        self.AutoSave.Dirty = false
        local success = pcall(function()
            self:SaveConfig(self.AutoSave.ActiveConfig)
        end)
        
        if not success then
            self.AutoSave.Dirty = true -- Retry next time
        end
    end)
end

function Nexus:Destroy()
    self.IsDestroyed = true
    
    -- Disconnect all
    for _, conn in ipairs(self.Connections) do
        if conn and conn.Connected then
            conn:Disconnect()
        end
    end
    
    -- Clear tweens
    if self.ActiveTweens then
        for _, tween in pairs(self.ActiveTweens) do
            tween:Cancel()
        end
    end
    
    -- Remove blur
    if BlurEffect then
        BlurEffect:Destroy()
    end
    
    table.clear(self.Connections)
    table.clear(self.Registry)
    table.clear(self.Flags)
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
function Nexus:CreateModernDropdown(config)
    -- Config validation
    local cfg = {
        Text = config.Text or "Dropdown",
        Parent = config.Parent,
        Options = config.Options or {"No Options"},
        Default = config.Default,
        MultiSelect = config.MultiSelect or false,
        Search = config.Search or false,
        MaxVisible = config.MaxVisible or 6,
        Placeholder = config.Placeholder or "Select option...",
        Description = config.Description,
        Callback = config.Callback or function() end,
        Flag = config.Flag
    }

    -- Validation
    if not cfg.Parent then
        error("[Nexus] CreateModernDropdown: Parent is required")
    end
    
    if type(cfg.Options) ~= "table" or #cfg.Options == 0 then
        warn("[Nexus] CreateModernDropdown: Options should be a non-empty table")
        cfg.Options = {"No Options"}
    end

    -- State management
    local DropdownState = {
        IsOpen = false,
        Selected = cfg.MultiSelect and {} or (cfg.Default or cfg.Options[1]),
        FilteredOptions = cfg.Options,
        SearchText = "",
        HoveredIndex = 1,
        AnimationTween = nil,
        SearchDebounce = nil
    }

    -- Create main container
    local Container = Create("Frame", {
        Name = "Dropdown_" .. cfg.Text,
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundTransparency = 1,
        Parent = cfg.Parent
    })

    -- Create dropdown button
    local DropdownButton = Create("TextButton", {
        Name = "Button",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        ClipsDescendants = true,
        Parent = Container
    })

    AddCorner(DropdownButton, 8)
    AddStroke(DropdownButton, Nexus.Theme.Outline, 1, 0.7)

    -- Gradient background
    local ButtonGradient = Create("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
            ColorSequenceKeypoint.new(1, Color3.new(0.95, 0.95, 0.95))
        }),
        Rotation = 90,
        Transparency = NumberSequence.new(0.8),
        Parent = DropdownButton
    })

    -- Button content frame
    local ButtonContent = Create("Frame", {
        Name = "Content",
        Size = UDim2.new(1, -24, 1, 0),
        Position = UDim2.new(0, 12, 0, 0),
        BackgroundTransparency = 1,
        Parent = DropdownButton
    })

    -- Selected text display
    local SelectedText = Create("TextLabel", {
        Name = "SelectedText",
        Size = UDim2.new(1, -24, 1, 0),
        BackgroundTransparency = 1,
        Text = cfg.Placeholder,
        TextColor3 = Nexus.Theme.TextMuted,
        TextSize = 14,
        Font = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = ButtonContent
    })

    -- Dropdown arrow
    local Arrow = Create("TextLabel", {
        Name = "Arrow",
        Size = UDim2.new(0, 20, 1, 0),
        Position = UDim2.new(1, -20, 0, 0),
        BackgroundTransparency = 1,
        Text = "▼",
        TextColor3 = Nexus.Theme.TextSub,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center,
        Parent = ButtonContent
    })

    -- Get root ScreenGui for panel
    local screenGui = Container:FindFirstAncestorOfClass("ScreenGui")
    if not screenGui then
        warn("[Nexus] CreateModernDropdown: No ScreenGui found, panel may clip")
        screenGui = Container
    end

    -- Create dropdown panel (initially hidden) - parented to ScreenGui
    local Panel = Create("Frame", {
        Name = "DropdownPanel_" .. cfg.Text,
        Size = UDim2.fromOffset(0, 0),
        Position = UDim2.fromOffset(0, 0),
        AnchorPoint = Vector2.new(0, 0),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Visible = false,
        ZIndex = 1000,
        Parent = screenGui
    })

    AddCorner(Panel, 8)
    AddStroke(Panel, Nexus.Theme.Outline, 1, 0.5)

    -- Function to update panel position
    local function UpdatePanelPosition()
        if not DropdownButton or not DropdownButton.Parent then return end
        
        local buttonPos = DropdownButton.AbsolutePosition
        local buttonSize = DropdownButton.AbsoluteSize
        
        Panel.Position = UDim2.fromOffset(
            buttonPos.X,
            buttonPos.Y + buttonSize.Y + 4
        )
        
        -- Update width to match button
        if DropdownState.IsOpen then
            Panel.Size = UDim2.fromOffset(buttonSize.X, Panel.Size.Y.Offset)
        end
    end

    -- Add Close Button untuk SEMUA dropdown (Single & Multi Select) dengan styling berbeda
    local CloseButtonFrame = nil
    local CloseButtonHeight = 32
    local RefreshOptions
    local UpdateSelectedDisplay
    local CloseDropdown

    CloseButtonFrame = Create("Frame", {
        Name = "CloseButton",
        Size = UDim2.new(1, -16, 0, 28),
        Position = UDim2.new(0, 8, 0, 4),
        BackgroundColor3 = Nexus.Theme.SurfaceHigh,
        BorderSizePixel = 0,
        Parent = Panel
    })

    AddCorner(CloseButtonFrame, 6)

    local CloseButton = Create("TextButton", {
        Name = "Close",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        Parent = CloseButtonFrame
    })

    -- Different styling for MultiSelect vs Single Select
    local closeIcon, closeText, closeColor
    if cfg.MultiSelect then
        closeIcon = "✓"  -- Checkmark untuk confirm selection
        closeText = "Done"
        closeColor = Nexus.Theme.Accent
    else
        closeIcon = "✕"  -- X untuk cancel
        closeText = "Cancel" 
        closeColor = Nexus.Theme.TextSub
    end

    -- Icon
    local CloseIcon = Create("TextLabel", {
        Size = UDim2.new(0, 20, 1, 0),
        Position = UDim2.new(0, 8, 0, 0),
        BackgroundTransparency = 1,
        Text = closeIcon,
        TextColor3 = closeColor,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = CloseButtonFrame
    })

    -- Text
    local CloseText = Create("TextLabel", {
        Size = UDim2.new(1, -28, 1, 0),
        Position = UDim2.new(0, 24, 0, 0),
        BackgroundTransparency = 1,
        Text = closeText,
        TextColor3 = closeColor,
        TextSize = 12,
        Font = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = CloseButtonFrame
    })

    -- Close button hover effects dengan warna conditional
    table.insert(Nexus.Connections, CloseButton.MouseEnter:Connect(function()
        local hoverColor = cfg.MultiSelect and Nexus.Theme.Accent or Nexus.Theme.SurfaceHighest
        local hoverTransparency = cfg.MultiSelect and 0.1 or 0
        
        Tween(CloseButtonFrame, {
            BackgroundColor3 = hoverColor,
            BackgroundTransparency = hoverTransparency
        }, 0.15)
        
        -- Animate icon and text color
        Tween(CloseIcon, {TextColor3 = Nexus.Theme.Text}, 0.15)
        Tween(CloseText, {TextColor3 = Nexus.Theme.Text}, 0.15)
    end))

    table.insert(Nexus.Connections, CloseButton.MouseLeave:Connect(function()
        Tween(CloseButtonFrame, {
            BackgroundColor3 = Nexus.Theme.SurfaceHigh,
            BackgroundTransparency = 0
        }, 0.15)
        
        -- Reset icon and text color
        Tween(CloseIcon, {TextColor3 = closeColor}, 0.15)
        Tween(CloseText, {TextColor3 = closeColor}, 0.15)
    end))

    -- Close button click
    table.insert(Nexus.Connections, CloseButton.Activated:Connect(function()
        CloseDropdown()
    end))

    -- Search box (if enabled) - UPDATED POSITION
    local SearchBox = nil
    local OptionsOffset = CloseButtonHeight + 8 -- Start from close button
        
    if cfg.Search then
        SearchBox = Create("TextBox", {
            Name = "Search",
            Size = UDim2.new(1, -16, 0, 32),
            Position = UDim2.new(0, 8, 0, OptionsOffset),
            BackgroundColor3 = Nexus.Theme.SurfaceHigh,
            BorderSizePixel = 0,
            Text = "",
            PlaceholderText = "Search...",
            PlaceholderColor3 = Nexus.Theme.TextMuted,
            TextColor3 = Nexus.Theme.Text,
            TextSize = 13,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            ClearTextOnFocus = false,
            Parent = Panel
        })

        AddCorner(SearchBox, 6)
        AddStroke(SearchBox, Nexus.Theme.Outline, 1, 0.8)
        OptionsOffset = OptionsOffset + 40 -- Add search height + padding
    end

    -- Options container with scrolling - UPDATED POSITION
    local OptionsContainer = Create("ScrollingFrame", {
        Name = "Options",
        Size = UDim2.new(1, 0, 1, -OptionsOffset - 8), -- Account for close button
        Position = UDim2.new(0, 0, 0, OptionsOffset),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = Nexus.Theme.Accent,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingEnabled = true,
        Parent = Panel
    })

    -- Options list layout
    local OptionsLayout = Create("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 2),
        Parent = OptionsContainer
    })

    -- Create option items
    local OptionItems = {}

    -- Forward declarations
    

    local function CreateOptionItem(text, index)
        -- FIX: Perbaiki logic selected detection
        local isSelected = false
        if cfg.MultiSelect then
            isSelected = table.find(DropdownState.Selected, text) ~= nil
        else
            isSelected = DropdownState.Selected == text
        end

        local OptionItem = Create("TextButton", {
            Name = "Option_" .. index,
            Size = UDim2.new(1, -8, 0, 28),
            BackgroundColor3 = isSelected and Nexus.Theme.Accent or Color3.new(0, 0, 0),
            BackgroundTransparency = isSelected and 0.1 or 1,
            BorderSizePixel = 0,
            Text = "",
            AutoButtonColor = false,
            LayoutOrder = index,
            Parent = OptionsContainer
        })

        AddCorner(OptionItem, 6)

        -- Option text dengan warna yang benar
        local OptionText = Create("TextLabel", {
            Name = "Text",
            Size = UDim2.new(1, cfg.MultiSelect and -28 or -12, 1, 0),
            Position = UDim2.new(0, 12, 0, 0),
            BackgroundTransparency = 1,
            Text = text,
            TextColor3 = isSelected and Nexus.Theme.Text or Nexus.Theme.TextSub,
            TextSize = 13,
            Font = isSelected and Enum.Font.GothamMedium or Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            Parent = OptionItem
        })

        -- Checkbox for multi-select (FIX: Update checkbox state)
        local Checkbox = nil
        if cfg.MultiSelect then
            Checkbox = Create("Frame", {
                Name = "Checkbox",
                Size = UDim2.new(0, 16, 0, 16),
                Position = UDim2.new(1, -24, 0.5, -8),
                BackgroundColor3 = isSelected and Nexus.Theme.Accent or Nexus.Theme.Surface,
                BorderSizePixel = 0,
                Parent = OptionItem
            })

            AddCorner(Checkbox, 4)
            AddStroke(Checkbox, Nexus.Theme.Outline, 1, 0.6)

            if isSelected then
                Create("TextLabel", {
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text = "✓",
                    TextColor3 = Nexus.Theme.Text,
                    TextSize = 12,
                    Font = Enum.Font.GothamBold,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    Parent = Checkbox
                })
            end
        end

        -- FIX: Update hover effects dengan selected state yang benar
        local function OnHover(hovering)
            if not OptionItem or not OptionItem.Parent then return end
            
            -- Re-check selected state (penting untuk real-time update)
            local currentlySelected = false
            if cfg.MultiSelect then
                currentlySelected = table.find(DropdownState.Selected, text) ~= nil
            else
                currentlySelected = DropdownState.Selected == text
            end
            
            local targetColor
            local targetTransparency
            
            if hovering then
                targetColor = Nexus.Theme.SurfaceHigh
                targetTransparency = 0.3
            elseif currentlySelected then
                targetColor = Nexus.Theme.Accent
                targetTransparency = 0.1
            else
                targetColor = Color3.new(0, 0, 0)
                targetTransparency = 1
            end
            
            Tween(OptionItem, {
                BackgroundColor3 = targetColor,
                BackgroundTransparency = targetTransparency
            }, 0.15)
            
            -- Update text color
            Tween(OptionText, {
                TextColor3 = (hovering or currentlySelected) and Nexus.Theme.Text or Nexus.Theme.TextSub
            }, 0.15)
            
            -- Update font weight
            OptionText.Font = currentlySelected and Enum.Font.GothamMedium or Enum.Font.Gotham
        end

        -- Click handling (FIX: Proper state update)
        local function OnClick()
            if cfg.MultiSelect then
                local selectedIndex = table.find(DropdownState.Selected, text)
                if selectedIndex then
                    table.remove(DropdownState.Selected, selectedIndex)
                else
                    table.insert(DropdownState.Selected, text)
                end
                
                UpdateSelectedDisplay()
                RefreshOptions() -- Penting: refresh untuk update visual
                
                pcall(cfg.Callback, DropdownState.Selected)
                
                if cfg.Flag then
                    Nexus.Flags[cfg.Flag] = DropdownState.Selected
                    Nexus:_ScheduleAutoSave()
                end
            else
                DropdownState.Selected = text
                UpdateSelectedDisplay()
                RefreshOptions() -- Penting: refresh sebelum close
                CloseDropdown()
                
                pcall(cfg.Callback, text)
                
                if cfg.Flag then
                    Nexus.Flags[cfg.Flag] = text
                    Nexus:_ScheduleAutoSave()
                end
            end
        end

        -- Connect events
        table.insert(Nexus.Connections, OptionItem.MouseEnter:Connect(function()
            OnHover(true)
        end))
        
        table.insert(Nexus.Connections, OptionItem.MouseLeave:Connect(function()
            OnHover(false)
        end))
        
        table.insert(Nexus.Connections, OptionItem.Activated:Connect(OnClick))

        OptionItems[text] = {
            Item = OptionItem,
            Text = OptionText,
            Checkbox = Checkbox,
            OnHover = OnHover,
            IsVisible = true,
            IsSelected = function() 
                if cfg.MultiSelect then
                    return table.find(DropdownState.Selected, text) ~= nil
                else
                    return DropdownState.Selected == text
                end
            end
        }

        return OptionItem
    end

    -- Search functionality
    local function FilterOptions(searchText)
        searchText = searchText:lower()
        DropdownState.FilteredOptions = {}
        
        for _, option in ipairs(cfg.Options) do
            if searchText == "" or option:lower():find(searchText, 1, true) then
                table.insert(DropdownState.FilteredOptions, option)
            end
        end
        
        RefreshOptions()
    end

    -- Refresh options display (ACCOUNT FOR CLOSE BUTTON)
    function RefreshOptions()
        -- Clear existing options
        for _, data in pairs(OptionItems) do
            if data.Item and data.Item.Parent then
                data.Item:Destroy()
            end
        end
        OptionItems = {}
        
        -- Create filtered options
        for index, option in ipairs(DropdownState.FilteredOptions) do
            CreateOptionItem(option, index)
        end
        
        -- Update panel height (ACCOUNT FOR CLOSE BUTTON)
        local optionCount = math.min(#DropdownState.FilteredOptions, cfg.MaxVisible)
        local panelHeight = OptionsOffset + (optionCount * 30) + ((optionCount - 1) * 2) + 16
        
        if DropdownState.IsOpen then
            local buttonWidth = DropdownButton.AbsoluteSize.X
            Tween(Panel, {
                Size = UDim2.fromOffset(buttonWidth, panelHeight)
            }, 0.25, Enum.EasingStyle.Quart)
        end
    end

    -- Update selected display
    function UpdateSelectedDisplay()
        if cfg.MultiSelect then
            if #DropdownState.Selected == 0 then
                SelectedText.Text = cfg.Placeholder
                SelectedText.TextColor3 = Nexus.Theme.TextMuted
            elseif #DropdownState.Selected == 1 then
                SelectedText.Text = DropdownState.Selected[1]
                SelectedText.TextColor3 = Nexus.Theme.Text
            else
                SelectedText.Text = #DropdownState.Selected .. " items selected"
                SelectedText.TextColor3 = Nexus.Theme.Text
            end
        else
            SelectedText.Text = DropdownState.Selected or cfg.Placeholder
            SelectedText.TextColor3 = DropdownState.Selected and Nexus.Theme.Text or Nexus.Theme.TextMuted
        end
    end

    -- Open dropdown (UPDATED height calculation)
    local function OpenDropdown()
        if DropdownState.IsOpen then return end
        
        DropdownState.IsOpen = true
        Panel.Visible = true
        
        -- Update position
        UpdatePanelPosition()
        
        -- Calculate panel height (INCLUDE CLOSE BUTTON)
        local optionCount = math.min(#DropdownState.FilteredOptions, cfg.MaxVisible)
        local targetHeight = OptionsOffset + (optionCount * 30) + ((optionCount - 1) * 2) + 16
        local buttonWidth = DropdownButton.AbsoluteSize.X
        
        -- Animate panel open
        Panel.Size = UDim2.fromOffset(buttonWidth, 0)
        DropdownState.AnimationTween = Tween(Panel, {
            Size = UDim2.fromOffset(buttonWidth, targetHeight)
        }, 0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        
        -- Animate arrow
        Tween(Arrow, {
            Rotation = 180,
            TextColor3 = Nexus.Theme.Accent
        }, 0.25)
        
        -- Animate button
        Tween(DropdownButton, {BackgroundColor3 = Nexus.Theme.SurfaceHigh}, 0.2)
        
        -- Focus search if enabled
        if SearchBox then
            task.wait(0.3)
            if SearchBox and SearchBox.Parent then
                SearchBox:CaptureFocus()
            end
        end
        
        -- Enable blur
        SetBlur(true, 8)
    end

    -- Close dropdown
    function CloseDropdown()
        if not DropdownState.IsOpen then return end
        
        DropdownState.IsOpen = false
        
        -- Cancel current animation
        if DropdownState.AnimationTween then
            DropdownState.AnimationTween:Cancel()
        end
        
        local buttonWidth = DropdownButton.AbsoluteSize.X
        
        -- Animate panel close
        DropdownState.AnimationTween = Tween(Panel, {
            Size = UDim2.fromOffset(buttonWidth, 0)
        }, 0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, function()
            Panel.Visible = false
        end)
        
        -- Animate arrow
        Tween(Arrow, {
            Rotation = 0,
            TextColor3 = Nexus.Theme.TextSub
        }, 0.2)
        
        -- Animate button
        Tween(DropdownButton, {BackgroundColor3 = Nexus.Theme.Surface}, 0.2)
        
        -- Clear search
        if SearchBox then
            SearchBox.Text = ""
            DropdownState.SearchText = ""
            FilterOptions("")
        end
        
        -- Disable blur
        SetBlur(false)
    end

    -- Search handling with debounce
    if SearchBox then
        table.insert(Nexus.Connections, SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
            local searchText = SearchBox.Text
            
            -- Cancel previous debounce
            if DropdownState.SearchDebounce then
                task.cancel(DropdownState.SearchDebounce)
            end
            
            -- Debounce search
            DropdownState.SearchDebounce = task.spawn(function()
                task.wait(0.3)
                if SearchBox and SearchBox.Parent and SearchBox.Text == searchText then
                    DropdownState.SearchText = searchText
                    FilterOptions(searchText)
                end
            end)
        end))

        -- Clear search on focus lost
        table.insert(Nexus.Connections, SearchBox.FocusLost:Connect(function()
            if SearchBox.Text == "" and DropdownState.IsOpen then
                task.wait(0.1)
                if not SearchBox:IsFocused() then
                    CloseDropdown()
                end
            end
        end))
    end

    -- Button click handling
    table.insert(Nexus.Connections, DropdownButton.Activated:Connect(function()
        if DropdownState.IsOpen then
            CloseDropdown()
        else
            OpenDropdown()
        end
    end))

    -- Click outside to close (UPDATED & FIXED)
    table.insert(Nexus.Connections, UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and DropdownState.IsOpen then
            local mouse = Players.LocalPlayer:GetMouse()
            local mouseX, mouseY = mouse.X, mouse.Y
            
            -- Check if clicking on dropdown button
            local buttonPos = DropdownButton.AbsolutePosition
            local buttonSize = DropdownButton.AbsoluteSize
            local onButton = (mouseX >= buttonPos.X and mouseX <= buttonPos.X + buttonSize.X and
                             mouseY >= buttonPos.Y and mouseY <= buttonPos.Y + buttonSize.Y)
            
            -- Check if clicking on dropdown panel
            local onPanel = false
            if Panel and Panel.Visible then
                local panelPos = Panel.AbsolutePosition
                local panelSize = Panel.AbsoluteSize
                onPanel = (mouseX >= panelPos.X and mouseX <= panelPos.X + panelSize.X and
                          mouseY >= panelPos.Y and mouseY <= panelPos.Y + panelSize.Y)
            end
            
            -- Close dropdown if clicking outside both button and panel
            if not onButton and not onPanel then
                CloseDropdown()
            end
        end
    end))

    -- Keyboard navigation (UPDATED with better ESC handling)
    table.insert(Nexus.Connections, UserInputService.InputBegan:Connect(function(input)
        if not DropdownState.IsOpen then return end
        
        if input.KeyCode == Enum.KeyCode.Escape then
            CloseDropdown()
        elseif input.KeyCode == Enum.KeyCode.Return then
            if DropdownState.FilteredOptions[DropdownState.HoveredIndex] then
                local optionText = DropdownState.FilteredOptions[DropdownState.HoveredIndex]
                local optionData = OptionItems[optionText]
                if optionData and optionData.Item then
                    optionData.Item.Activated:Fire()
                end
            elseif cfg.MultiSelect then
                -- For multiselect, Enter key closes dropdown
                CloseDropdown()
            end
        end
    end))

    -- ========== COLLAPSIBLE STATE MONITORING ==========
    -- Monitor parent collapsible untuk auto-close
    local function MonitorCollapsibleState()
        -- Method 1: Direct parent frame monitoring
        local function FindCollapsibleParent(obj)
            local current = obj.Parent
            while current do
                -- Cek apakah ini CollapsibleFrame (punya ClipsDescendants toggle behavior)
                if current:IsA("Frame") and current:FindFirstChildOfClass("TextButton") then
                    local hasArrow = false
                    for _, child in ipairs(current:GetDescendants()) do
                        if child:IsA("TextLabel") and (child.Text == "▼" or child.Text == "▲") then
                            hasArrow = true
                            break
                        end
                    end
                    if hasArrow then
                        return current
                    end
                end
                current = current.Parent
                if current == screenGui then break end
            end
            return nil
        end
        
        local collapsibleFrame = FindCollapsibleParent(Container)
        
        if collapsibleFrame then
            -- Monitor ClipsDescendants changes
            local clipsConnection = collapsibleFrame:GetPropertyChangedSignal("ClipsDescendants"):Connect(function()
                if collapsibleFrame.ClipsDescendants == true and DropdownState.IsOpen then
                    task.wait(0.05) -- Small delay untuk smooth transition
                    if DropdownState.IsOpen then
                        CloseDropdown()
                    end
                end
            end)
            table.insert(Nexus.Connections, clipsConnection)
            
            -- Monitor Size changes (collapsible animation)
            local lastHeight = collapsibleFrame.Size.Y.Offset
            local sizeConnection = collapsibleFrame:GetPropertyChangedSignal("Size"):Connect(function()
                local currentHeight = collapsibleFrame.Size.Y.Offset
                -- Jika height berkurang signifikan (closing animation)
                if currentHeight < lastHeight - 10 and DropdownState.IsOpen then
                    -- Cek apakah dropdown masih visible
                    local dropdownPos = DropdownButton.AbsolutePosition.Y + DropdownButton.AbsoluteSize.Y
                    local collapsibleBottom = collapsibleFrame.AbsolutePosition.Y + currentHeight
                    
                    if dropdownPos > collapsibleBottom then
                        CloseDropdown()
                    end
                end
                lastHeight = currentHeight
            end)
            table.insert(Nexus.Connections, sizeConnection)
        end
        
        -- Method 2: Universal visibility check via RenderStepped
        local visibilityMonitor = RunService.RenderStepped:Connect(function()
            if not DropdownState.IsOpen or not Panel.Visible then return end
            
            -- Check if dropdown button is actually visible
            local isVisible = true
            local checkParent = Container
            
            while checkParent and checkParent ~= screenGui do
                if checkParent:IsA("GuiObject") then
                    if not checkParent.Visible then
                        isVisible = false
                        break
                    end
                    
                    -- Check clipping
                    if checkParent.ClipsDescendants then
                        local btnBottom = DropdownButton.AbsolutePosition.Y + DropdownButton.AbsoluteSize.Y
                        local parentTop = checkParent.AbsolutePosition.Y
                        local parentBottom = parentTop + checkParent.AbsoluteSize.Y
                        
                        -- Button terpotong = dropdown harus close
                        if btnBottom > parentBottom + 5 then
                            isVisible = false
                            break
                        end
                    end
                end
                checkParent = checkParent.Parent
            end
            
            if not isVisible then
                CloseDropdown()
            end
        end)
        
        table.insert(Nexus.Connections, visibilityMonitor)
    end

    -- Panggil monitoring
    MonitorCollapsibleState()
    -- ========== END COLLAPSIBLE MONITORING ==========

    -- Update panel position on render step (for collapsible/scrolling)
    local updateConnection = RunService.RenderStepped:Connect(function()
        if DropdownState.IsOpen and Panel.Visible then
            UpdatePanelPosition()
        end
    end)
    table.insert(Nexus.Connections, updateConnection)

    -- Initial setup
    RefreshOptions()
    UpdateSelectedDisplay()

    -- Public methods
    local DropdownAPI = {
        SetOptions = function(self, newOptions)
            cfg.Options = newOptions or {}
            DropdownState.FilteredOptions = cfg.Options
            RefreshOptions()
        end,
        
        SetValue = function(self, value)
            if cfg.MultiSelect then
                DropdownState.Selected = type(value) == "table" and value or {}
            else
                DropdownState.Selected = value
            end
            UpdateSelectedDisplay()
            RefreshOptions()
        end,
        
        GetValue = function(self)
            return DropdownState.Selected
        end,
        
        Open = function(self)
            OpenDropdown()
        end,
        
        Close = function(self)
            CloseDropdown()
        end,
        
        Destroy = function(self)
            CloseDropdown()
            
            -- Disconnect update connection
            if updateConnection and updateConnection.Connected then
                updateConnection:Disconnect()
            end
            
            if Container and Container.Parent then
                Container:Destroy()
            end
            
            if Panel and Panel.Parent then
                Panel:Destroy()
            end
        end
    }

    -- Register for auto-save
    if cfg.Flag then
        Nexus.Registry[cfg.Flag] = {
            Get = function() return DropdownState.Selected end,
            Set = function(value) DropdownAPI:SetValue(value) end
        }
        Nexus.Flags[cfg.Flag] = DropdownState.Selected
    end

    return DropdownAPI
end

--// Main Window Function (continuing with all other components...)
function Nexus:Window(config)
    if Nexus.IsDestroyed then return end
    
    -- Enhanced validation
    if not config then config = {} end
    
    local Title = config.Title or "Nexus Hub"
    local Subtitle = config.Subtitle or "Enhanced UI Library"
    local BaseSize = config.Size or {600, 380} -- Ukuran asli (PC)
    local MinSize = config.MinSize or {350, 220} -- Ukuran minimal agar tidak kekecilan

    local Camera = workspace.CurrentCamera
    local Viewport = Camera.ViewportSize
    
    local FinalWidth = BaseSize[1]
    local FinalHeight = BaseSize[2]

    -- 1. Cek Lebar: Jika lebar UI > 85% lebar layar HP
    if FinalWidth > Viewport.X * 0.85 then
        local ratio = BaseSize[2] / BaseSize[1] -- Simpan rasio aspek
        FinalWidth = math.floor(Viewport.X * 0.85) -- Kecilkan jadi 85% lebar layar
        FinalHeight = math.floor(FinalWidth * ratio) -- Sesuaikan tinggi
    end
    
    -- 2. Cek Tinggi: Jika tinggi UI > 80% tinggi layar HP (Landscape)
    if FinalHeight > Viewport.Y * 0.8 then
        local ratio = BaseSize[1] / BaseSize[2]
        FinalHeight = math.floor(Viewport.Y * 0.8)
        FinalWidth = math.floor(FinalHeight * ratio)
    end
    
    -- 3. Terapkan Batas Minimal (Agar tidak terlalu kecil)
    FinalWidth = math.max(FinalWidth, MinSize[1])
    FinalHeight = math.max(FinalHeight, MinSize[2])
    
    local Size = {FinalWidth, FinalHeight}

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
            Position = UDim2.new(0, 16, 0, (Viewport.Y < 600 and 50) or 16), 
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
    
    -- Close Button
    local CloseButton = Create("TextButton", {
        Text = "", -- Kosongkan teks karena kita pakai gambar
        BackgroundColor3 = Nexus.Theme.SurfaceHigh,
        BackgroundTransparency = 0.8,
        Size = UDim2.fromOffset(32, 28),
        Position = UDim2.fromOffset(44, 10), -- Posisi di kiri (bekas Settings)
        AutoButtonColor = false,
        Parent = ControlsContainer
    })
    
    AddCorner(CloseButton, 6)

    local CloseIcon = Create("ImageLabel", {
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(16, 16), -- Ukuran Icon
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Image = "rbxassetid://9886659671", -- Icon X Modern (Lucide)
        ImageColor3 = Color3.fromRGB(255, 100, 100), -- Warna Merah
        Parent = CloseButton
    })
    
    -- 3. TERAKHIR, ANIMASI HOVER
    CloseButton.MouseEnter:Connect(function()
        Tween(CloseButton, {BackgroundTransparency = 0.2}, 0.15)
        Tween(CloseIcon, {ImageColor3 = Color3.fromRGB(255, 50, 50)}, 0.15)
    end)
    
    CloseButton.MouseLeave:Connect(function()
        Tween(CloseButton, {BackgroundTransparency = 0.8}, 0.15)
        Tween(CloseIcon, {ImageColor3 = Color3.fromRGB(255, 100, 100)}, 0.15)
    end)
    
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
    --CreateButtonHover(SettingsButton)
    
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
            Parent = Notification  -- Pastikan parent benar
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
        if type(config) == "string" then
            config = {Text = config}
        end
        
        if not config then config = {} end
        
        local Name = config.Name or config.Text or "Tab"
        local Icon = config.Icon or "📄"
        local Visible = config.Visible ~= false
        
        -- [PERBAIKAN 1] Mengganti .Button menjadi .TabBtn
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
        function Tab:Dropdown(cfg)
            if not TabPage or not TabPage.Parent then 
                warn("[Nexus] Tab:Dropdown - TabPage is not available")
                return nil 
            end
            
            -- Create new config table to avoid modifying original
            local dropdownConfig = {}
            for key, value in pairs(cfg) do
                dropdownConfig[key] = value
            end
            
            -- Set parent if not specified
            dropdownConfig.Parent = dropdownConfig.Parent or TabPage
            
            return Nexus:CreateModernDropdown(dropdownConfig)
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

        function Tab:Collapsible(initialConfig)
            local function CreateCollapsibleRecursive(ParentContainer, config)
                if type(config) == "string" then config = {Text = config} end
                if not config then config = {} end
                
                local Text = config.Text or "Collapsible"
                local IsOpen = config.Open or false
                
                local CollapsibleFrame = Create("Frame", {
                    BackgroundColor3 = Nexus.Theme.Surface,
                    Size = UDim2.new(1, 0, 0, 36),
                    ClipsDescendants = true,
                    ZIndex = 1,
                    Parent = ParentContainer
                })
                
                AddCorner(CollapsibleFrame, 8)
                AddStroke(CollapsibleFrame, Nexus.Theme.Outline, 1, 0.4)
                
                -- Header Button (Bagian yang diklik)
                local HeaderBtn = Create("TextButton", {
                    Text = "",
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 36),
                    Parent = CollapsibleFrame
                })
                
                local Title = Create("TextLabel", {
                    Text = Text,
                    Font = Enum.Font.GothamBold,
                    TextSize = 14,
                    TextColor3 = Nexus.Theme.Text,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 12, 0, 0),
                    Size = UDim2.new(1, -40, 1, 0),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = HeaderBtn
                })
                
                local Arrow = Create("TextLabel", {
                    Text = "▼",
                    Font = Enum.Font.Gotham,
                    TextSize = 12,
                    TextColor3 = Nexus.Theme.TextSub,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(1, -32, 0, 0),
                    Size = UDim2.new(0, 24, 1, 0),
                    Rotation = IsOpen and 180 or 0,
                    Parent = HeaderBtn
                })
                
                -- Container untuk isi elemen (Button, Toggle, dll)
                local ContentContainer = Create("Frame", {
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 0, 0, 36), -- Di bawah header
                    Size = UDim2.new(1, 0, 1, -36), -- Mengisi sisa ruang
                    ClipsDescendants = false, 
                    Parent = CollapsibleFrame
                })
                
                local ContentLayout = Create("UIListLayout", {
                    Padding = UDim.new(0, 8),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Parent = ContentContainer
                })
                
                local ContentPadding = Create("UIPadding", {
                    PaddingTop = UDim.new(0, 8),
                    PaddingBottom = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                    Parent = ContentContainer
                })
                
                -- Fungsi Resize Otomatis
                local function UpdateHeight()
                    local contentHeight = ContentLayout.AbsoluteContentSize.Y
                    local targetHeight = IsOpen and (contentHeight + 36 + 16) or 36
                    
                    if IsOpen then
                        CollapsibleFrame.ZIndex = 5 -- Naikkan prioritas saat buka
                        
                        Tween(CollapsibleFrame, {Size = UDim2.new(1, 0, 0, targetHeight)}, 0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                        Tween(Arrow, {Rotation = 180, TextColor3 = Nexus.Theme.Accent}, 0.3)
                        
                        task.delay(0.25, function()
                            if IsOpen then CollapsibleFrame.ClipsDescendants = false end
                        end)
                    else
                        CollapsibleFrame.ClipsDescendants = true
                        CollapsibleFrame.ZIndex = 1
                        
                        Tween(CollapsibleFrame, {Size = UDim2.new(1, 0, 0, targetHeight)}, 0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                        Tween(Arrow, {Rotation = 0, TextColor3 = Nexus.Theme.TextSub}, 0.3)
                    end
                end
                
                ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                    if IsOpen then UpdateHeight() end
                end)
                
                HeaderBtn.MouseButton1Click:Connect(function()
                    IsOpen = not IsOpen
                    UpdateHeight()
                end)
                
                -- Hover Effects Header
                HeaderBtn.MouseEnter:Connect(function()
                    Tween(CollapsibleFrame, {BackgroundColor3 = Nexus.Theme.SurfaceHigh}, 0.2)
                end)
                HeaderBtn.MouseLeave:Connect(function()
                    Tween(CollapsibleFrame, {BackgroundColor3 = Nexus.Theme.Surface}, 0.2)
                end)
                
                -- ==========================================================
                -- GROUP API
                -- ==========================================================
                local Group = {}
                
                function Group:Button(cfg)
                    if type(cfg) == "string" then cfg = {Text = cfg} end
                    local Text = cfg.Text or "Button"
                    local Callback = cfg.Callback or function() end
                    
                    local BtnFrame = Create("Frame", {
                        BackgroundColor3 = Nexus.Theme.SurfaceHigh,
                        Size = UDim2.new(1, 0, 0, 40),
                        Parent = ContentContainer
                    })
                    AddCorner(BtnFrame, 6)
                    
                    local Btn = Create("TextButton", {
                        Text = "", BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Parent = BtnFrame
                    })
                    
                    Create("TextLabel", {
                        Text = Text, Font = Enum.Font.GothamMedium, TextSize = 13,
                        TextColor3 = Nexus.Theme.Text, BackgroundTransparency = 1,
                        Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 12, 0, 0),
                        TextXAlignment = Enum.TextXAlignment.Left, Parent = BtnFrame
                    })
                    
                    Btn.MouseEnter:Connect(function() Tween(BtnFrame, {BackgroundColor3 = Nexus.Theme.SurfaceHighest}, 0.15) end)
                    Btn.MouseLeave:Connect(function() Tween(BtnFrame, {BackgroundColor3 = Nexus.Theme.SurfaceHigh}, 0.15) end)
                    Btn.MouseButton1Click:Connect(function() pcall(Callback) end)
                    
                    return {
                        SetText = function(t) end, -- Implement if needed
                        SetCallback = function(c) Callback = c end
                    }
                end

                -- [TAMBAHAN] Paragraph (Title + Content)
                function Group:Paragraph(cfg)
                    if type(cfg) == "string" then cfg = {Title = cfg} end
                    if not cfg then cfg = {} end
                    
                    local TitleText = cfg.Title or "Paragraph"
                    local ContentText = cfg.Content or cfg.Desc or ""
                    
                    -- Frame Container
                    local ParaFrame = Create("Frame", {
                        BackgroundColor3 = Nexus.Theme.SurfaceHigh,
                        Size = UDim2.new(1, 0, 0, 0), -- Tinggi akan otomatis
                        AutomaticSize = Enum.AutomaticSize.Y, -- Agar menyesuaikan panjang teks
                        Parent = ContentContainer
                    })
                    AddCorner(ParaFrame, 6)
                    
                    -- Padding agar teks tidak mepet pinggir
                    Create("UIPadding", {
                        PaddingTop = UDim.new(0, 10),
                        PaddingBottom = UDim.new(0, 10),
                        PaddingLeft = UDim.new(0, 12),
                        PaddingRight = UDim.new(0, 12),
                        Parent = ParaFrame
                    })
                    
                    -- Layout untuk menyusun Judul dan Isi secara vertikal
                    local ParaLayout = Create("UIListLayout", {
                        Padding = UDim.new(0, 4),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Parent = ParaFrame
                    })
                    
                    -- Label Judul
                    local TitleLbl = Create("TextLabel", {
                        Text = TitleText,
                        Font = Enum.Font.GothamBold,
                        TextSize = 13,
                        TextColor3 = Nexus.Theme.Text,
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1, 0, 0, 0),
                        AutomaticSize = Enum.AutomaticSize.Y,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        LayoutOrder = 1,
                        Parent = ParaFrame
                    })
                    
                    -- Label Isi (Content)
                    local ContentLbl = Create("TextLabel", {
                        Text = ContentText,
                        Font = Enum.Font.Gotham,
                        TextSize = 12,
                        TextColor3 = Nexus.Theme.TextSub,
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1, 0, 0, 0),
                        AutomaticSize = Enum.AutomaticSize.Y,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        LayoutOrder = 2,
                        Parent = ParaFrame
                    })
                    
                    -- Return API untuk update teks nanti
                    return {
                        SetTitle = function(t) TitleLbl.Text = tostring(t) end,
                        SetDesc = function(c) ContentLbl.Text = tostring(c) end,
                        SetContent = function(c) ContentLbl.Text = tostring(c) end
                    }
                end
                
                function Group:Toggle(cfg)
                    if type(cfg) == "string" then cfg = {Text = cfg} end
                    local Text = cfg.Text or "Toggle"
                    local Default = cfg.Default or false
                    local Callback = cfg.Callback or function() end
                    local Flag = cfg.Flag
                    local Toggled = Default
                    
                    local ToggleFrame = Create("Frame", {
                        BackgroundColor3 = Nexus.Theme.SurfaceHigh,
                        Size = UDim2.new(1, 0, 0, 40),
                        Parent = ContentContainer
                    })
                    AddCorner(ToggleFrame, 6)
                    
                    Create("TextLabel", {
                        Text = Text, Font = Enum.Font.GothamMedium, TextSize = 13,
                        TextColor3 = Nexus.Theme.Text, BackgroundTransparency = 1,
                        Size = UDim2.new(1, -50, 1, 0), Position = UDim2.new(0, 12, 0, 0),
                        TextXAlignment = Enum.TextXAlignment.Left, Parent = ToggleFrame
                    })
                    
                    local Switch = Create("Frame", {
                        BackgroundColor3 = Toggled and Nexus.Theme.Accent or Nexus.Theme.Surface,
                        Size = UDim2.new(0, 36, 0, 18),
                        Position = UDim2.new(1, -48, 0.5, -9),
                        Parent = ToggleFrame
                    })
                    AddCorner(Switch, 9)
                    
                    local Dot = Create("Frame", {
                        BackgroundColor3 = Nexus.Theme.Text,
                        Size = UDim2.new(0, 14, 0, 14),
                        Position = UDim2.new(0, Toggled and 20 or 2, 0.5, -7),
                        Parent = Switch
                    })
                    AddCorner(Dot, 7)
                    
                    local Btn = Create("TextButton", {
                        Text = "", BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Parent = ToggleFrame
                    })
                    
                    local function Update()
                        Tween(Switch, {BackgroundColor3 = Toggled and Nexus.Theme.Accent or Nexus.Theme.Surface}, 0.2)
                        Tween(Dot, {Position = UDim2.new(0, Toggled and 20 or 2, 0.5, -7)}, 0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                        pcall(Callback, Toggled)
                        if Flag then Nexus.Flags[Flag] = Toggled end
                    end
                    
                    Btn.MouseButton1Click:Connect(function()
                        Toggled = not Toggled
                        Update()
                    end)
                    
                    if Flag then
                        Nexus.Registry[Flag] = {
                            Set = function(v) Toggled = v; Update() end,
                            Get = function() return Toggled end
                        }
                    end
                    
                    -- Trigger default jika true
                    if Default then pcall(Callback, true) end
                    
                    return {
                        Set = function(v) Toggled = v; Update() end,
                        Get = function() return Toggled end
                    }
                end
                
                function Group:Slider(cfg)
                    local Text = cfg.Text or "Slider"
                    local Min, Max = cfg.Min or 0, cfg.Max or 100
                    local Default = cfg.Default or Min
                    local Callback = cfg.Callback or function() end
                    local Flag = cfg.Flag
                    local Value = math.clamp(Default, Min, Max)
                    
                    local SliderFrame = Create("Frame", {
                        BackgroundColor3 = Nexus.Theme.SurfaceHigh,
                        Size = UDim2.new(1, 0, 0, 50),
                        Parent = ContentContainer
                    })
                    AddCorner(SliderFrame, 6)
                    
                    Create("TextLabel", {
                        Text = Text, Font = Enum.Font.GothamMedium, TextSize = 13,
                        TextColor3 = Nexus.Theme.Text, BackgroundTransparency = 1,
                        Position = UDim2.new(0, 12, 0, 8), Size = UDim2.new(1, -24, 0, 14),
                        TextXAlignment = Enum.TextXAlignment.Left, Parent = SliderFrame
                    })
                    
                    local ValLabel = Create("TextLabel", {
                        Text = tostring(Value), Font = Enum.Font.GothamBold, TextSize = 12,
                        TextColor3 = Nexus.Theme.Accent, BackgroundTransparency = 1,
                        Position = UDim2.new(1, -12, 0, 8), Size = UDim2.new(0, 0, 0, 14),
                        TextXAlignment = Enum.TextXAlignment.Right, Parent = SliderFrame
                    })
                    
                    local Track = Create("Frame", {
                        BackgroundColor3 = Nexus.Theme.Surface,
                        Size = UDim2.new(1, -24, 0, 4), Position = UDim2.new(0, 12, 0, 32),
                        Parent = SliderFrame
                    })
                    AddCorner(Track, 2)
                    
                    local Fill = Create("Frame", {
                        BackgroundColor3 = Nexus.Theme.Accent,
                        Size = UDim2.new((Value - Min)/(Max - Min), 0, 1, 0),
                        Parent = Track
                    })
                    AddCorner(Fill, 2)
                    
                    local Btn = Create("TextButton", {Text="", BackgroundTransparency=1, Size=UDim2.new(1,0,1,0), Parent=SliderFrame})
                    local Dragging = false
                    
                    local function Update(input)
                        local pos = math.clamp((input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1)
                        Value = math.floor(Min + ((Max - Min) * pos))
                        ValLabel.Text = tostring(Value)
                        Fill.Size = UDim2.new(pos, 0, 1, 0)
                        pcall(Callback, Value)
                        if Flag then Nexus.Flags[Flag] = Value end
                    end
                    
                    Btn.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then Dragging=true; Update(i) end end)
                    UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then Dragging=false end end)
                    UserInputService.InputChanged:Connect(function(i) if Dragging and i.UserInputType == Enum.UserInputType.MouseMovement then Update(i) end end)
                    
                    if Flag then
                        Nexus.Registry[Flag] = { Set = function(v) Value = math.clamp(v, Min, Max); ValLabel.Text=tostring(Value); Fill.Size=UDim2.new((Value-Min)/(Max-Min),0,1,0) end }
                    end
                    
                    return {Set = function(v) Value = math.clamp(v, Min, Max); ValLabel.Text=tostring(Value); Fill.Size=UDim2.new((Value-Min)/(Max-Min),0,1,0) end}
                end
                
                function Group:Input(cfg)
                    if not cfg then cfg = {} end
                    local Text = cfg.Text or "Input"
                    local Placeholder = cfg.Placeholder or "Value..."
                    local Value = cfg.Value or ""
                    local Callback = cfg.Callback or function() end
                    local Flag = cfg.Flag
                    
                    local InputFrame = Create("Frame", {
                        BackgroundColor3 = Nexus.Theme.SurfaceHigh,
                        Size = UDim2.new(1, 0, 0, 50),
                        Parent = ContentContainer
                    })
                    AddCorner(InputFrame, 6)
                    
                    Create("TextLabel", {
                        Text = Text, Font = Enum.Font.GothamMedium, TextSize = 13,
                        TextColor3 = Nexus.Theme.Text, BackgroundTransparency = 1,
                        Position = UDim2.new(0, 12, 0, 8), Size = UDim2.new(1, -24, 0, 14),
                        TextXAlignment = Enum.TextXAlignment.Left, Parent = InputFrame
                    })
                    
                    local InputContainer = Create("Frame", {
                        BackgroundColor3 = Nexus.Theme.Surface,
                        Size = UDim2.new(1, -24, 0, 24), Position = UDim2.new(0, 12, 0, 24),
                        Parent = InputFrame
                    })
                    AddCorner(InputContainer, 4)
                    AddStroke(InputContainer, Nexus.Theme.Outline, 1, 0.5)
                    
                    local Box = Create("TextBox", {
                        Text = tostring(Value), PlaceholderText = Placeholder, Font = Enum.Font.Gotham, TextSize = 12,
                        TextColor3 = Nexus.Theme.Text, PlaceholderColor3 = Nexus.Theme.TextMuted, BackgroundTransparency = 1,
                        Size = UDim2.new(1, -8, 1, 0), Position = UDim2.new(0, 4, 0, 0),
                        TextXAlignment = Enum.TextXAlignment.Left, Parent = InputContainer
                    })
                    
                    Box.FocusLost:Connect(function()
                        pcall(Callback, Box.Text)
                        if Flag then Nexus.Flags[Flag] = Box.Text end
                        Tween(InputContainer, {BackgroundColor3 = Nexus.Theme.Surface}, 0.2)
                    end)
                    Box.Focused:Connect(function() Tween(InputContainer, {BackgroundColor3 = Nexus.Theme.SurfaceHighest}, 0.2) end)
                    
                    if Flag then Nexus.Registry[Flag] = {Set=function(v) Box.Text=tostring(v) end, Get=function() return Box.Text end} end
                    return {Set=function(v) Box.Text=tostring(v) end, Get=function() return Box.Text end}
                end
                
                function Group:Dropdown(cfg)
                    if not ContentContainer or not ContentContainer.Parent then return nil end
                    
                    -- Set parent ke ContentContainer kalo belum ada
                    cfg.Parent = cfg.Parent or ContentContainer
                    
                    return Nexus:CreateModernDropdown(cfg)
                end

                
                function Group:Label(cfg)
                    if type(cfg) == "string" then cfg = {Text = cfg} end
                    local LabelFrame = Create("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 24), Parent = ContentContainer})
                    Create("TextLabel", {
                        Text = cfg.Text, Font = Enum.Font.Gotham, TextSize = 12, TextColor3 = Nexus.Theme.TextSub, BackgroundTransparency = 1,
                        Size = UDim2.new(1, -16, 1, 0), Position = UDim2.new(0, 16, 0, 0), TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, Parent = LabelFrame
                    })
                end
                
                -- [[ KUNCI UTAMA NESTING ]]
                -- Kita tambahkan fungsi Collapsible ke dalam Group itu sendiri
                function Group:Collapsible(childConfig)
                    -- Panggil fungsi pembangun rekursif ini lagi,
                    -- TAPI Parent-nya sekarang adalah ContentContainer milik Collapsible ini
                    return CreateCollapsibleRecursive(ContentContainer, childConfig)
                end
                
                return Group
            end
            
            -- Panggilan pertama (Parent = TabPage utama)
            return CreateCollapsibleRecursive(TabPage, initialConfig)
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
        MinimizeButton.BackgroundColor3 = Nexus.Theme.SurfaceHigh
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
        Tab = function(self, config)
            -- Cek apakah dipanggil dengan titik dua (:) atau titik (.)
            -- Jika self adalah tabel WindowAPI (punya fungsi SetTitle), maka argumen asli ada di 'config'
            if type(self) == "table" and self.SetTitle then
                return CreateTab(config)
            else
                -- Jika dipanggil dengan titik (Window.Tab), maka 'self' adalah config-nya
                return CreateTab(self)
            end
        end,
        Notify = Nexus.Notify,
        SetTheme = Nexus.SetTheme,
        SaveConfig = Nexus.SaveConfig,
        LoadConfig = Nexus.LoadConfig,
        GetConfigs = Nexus.GetConfigs,
        Destroy = function()
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
                WindowMinimized = false
                Tween(MainWindow, {
                    Size = WindowSize
                }, 0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                MinimizeButton.Text = "−"
            else
                WindowMinimized = true
                Tween(MainWindow, {
                    Size = UDim2.new(0, WindowSize.X.Offset, 0, 40)
                }, 0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                MinimizeButton.Text = "□"
            end
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

            Nexus:_ScheduleAutoSave()
        end
    }

    
    return WindowAPI
end

-- Export Nexus
return Nexus
