--[[ 
    NEXUS UI (v4.0 - Enhanced Edition) - FIXED VERSION
    ✨ Features: Modern Components, Error Prevention, Performance Optimized
    🎨 Design: Glassmorphism, Smooth Animations, Enhanced UX
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
    if not inst or not inst.Parent then return end
    
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

local function PlaySound(soundId, volume, pitch)
    pcall(function()
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. tostring(soundId)
        sound.Volume = volume or 0.1
        sound.Pitch = pitch or 1
        sound.Parent = SoundService
        sound:Play()
        
        sound.Ended:Connect(function()
            sound:Destroy()
        end)
    end)
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
            
            PlaySound("6895079853", 0.05)
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
    Tween(BlurEffect, {Size = targetSize}, 0.4)
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
            theme = "Custom",
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

UpdateThemeColors()

--// ====================================================================
--// 📦 COMPONENT CREATION FUNCTIONS
--// ====================================================================

-- 🏷️ CREATE LABEL FUNCTION
local function CreateLabel(parent, config)
    config = config or {}
    local Text = config.Text or "Label"
    local Style = config.Style or "Default"
    
    local LabelFrame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 25),
        BackgroundTransparency = 1,
        Parent = parent
    })
    
    local LabelText = Create("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = Text,
        TextColor3 = Nexus.Theme.Text,
        TextScaled = true,
        Font = Enum.Font.Gotham,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = LabelFrame
    })
    
    if Style == "Title" then
        LabelFrame.Size = UDim2.new(1, 0, 0, 35)
        LabelText.Font = Enum.Font.GothamBold
        LabelText.TextSize = 18
        LabelText.TextColor3 = Nexus.Theme.Text
    elseif Style == "Subtitle" then
        LabelFrame.Size = UDim2.new(1, 0, 0, 28)
        LabelText.Font = Enum.Font.GothamMedium
        LabelText.TextSize = 16
        LabelText.TextColor3 = Nexus.Theme.TextSub
    elseif Style == "Info" then
        LabelFrame.Size = UDim2.new(1, 0, 0, 22)
        LabelText.Font = Enum.Font.Gotham
        LabelText.TextSize = 12
        LabelText.TextColor3 = Nexus.Theme.TextMuted
    end
    
    return {
        Frame = LabelFrame,
        Label = LabelText,
        SetText = function(newText)
            LabelText.Text = tostring(newText)
        end
    }
end

-- 🔘 CREATE BUTTON FUNCTION
local function CreateButton(parent, config)
    config = config or {}
    local Text = config.Text or "Button"
    local Callback = config.Callback or function() end
    local Style = config.Style or "Default"
    
    local ButtonFrame = Create("TextButton", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Text = "",
        Parent = parent
    })
    
    AddCorner(ButtonFrame, 8)
    AddStroke(ButtonFrame, Nexus.Theme.Outline, 1, 0.7)
    
    local ButtonGradient = Create("UIGradient", {
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Nexus.Theme.Surface),
            ColorSequenceKeypoint.new(0.5, Nexus.Theme.SurfaceHigh),
            ColorSequenceKeypoint.new(1, Nexus.Theme.Surface)
        },
        Rotation = 90,
        Parent = ButtonFrame
    })
    
    local ButtonText = Create("TextLabel", {
        Size = UDim2.new(1, -10, 1, 0),
        Position = UDim2.fromOffset(5, 0),
        BackgroundTransparency = 1,
        Text = Text,
        TextColor3 = Nexus.Theme.Text,
        TextScaled = true,
        Font = Enum.Font.GothamMedium,
        TextSize = 14,
        Parent = ButtonFrame
    })
    
    if Style == "Primary" then
        ButtonGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Nexus.Theme.Accent),
            ColorSequenceKeypoint.new(1, Nexus.Theme.Accent)
        }
        ButtonText.TextColor3 = Color3.new(1, 1, 1)
    elseif Style == "Success" then
        ButtonGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Nexus.Theme.Success),
            ColorSequenceKeypoint.new(1, Nexus.Theme.Success)
        }
        ButtonText.TextColor3 = Color3.new(1, 1, 1)
    elseif Style == "Danger" then
        ButtonGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Nexus.Theme.Error),
            ColorSequenceKeypoint.new(1, Nexus.Theme.Error)
        }
        ButtonText.TextColor3 = Color3.new(1, 1, 1)
    end
    
    ButtonFrame.MouseEnter:Connect(function()
        Tween(ButtonFrame, {Size = UDim2.new(1, 0, 0, 42)}, 0.15)
    end)
    
    ButtonFrame.MouseLeave:Connect(function()
        Tween(ButtonFrame, {Size = UDim2.new(1, 0, 0, 40)}, 0.15)
    end)
    
    ButtonFrame.MouseButton1Click:Connect(function()
        PlaySound("6895079853", 0.08)
        Tween(ButtonFrame, {Size = UDim2.new(1, 0, 0, 38)}, 0.1)
        task.wait(0.1)
        Tween(ButtonFrame, {Size = UDim2.new(1, 0, 0, 40)}, 0.1)
        pcall(Callback)
    end)
    
    return {
        Frame = ButtonFrame,
        Text = ButtonText,
        SetText = function(newText)
            ButtonText.Text = tostring(newText)
        end,
        SetCallback = function(newCallback)
            Callback = newCallback or function() end
        end
    }
end

-- 🔄 CREATE TOGGLE FUNCTION
local function CreateToggle(parent, config)
    config = config or {}
    local Text = config.Text or "Toggle"
    local Default = config.Default or false
    local Callback = config.Callback or function() end
    local Flag = config.Flag
    
    local ToggleValue = Default
    
    local ToggleFrame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    AddCorner(ToggleFrame, 8)
    AddStroke(ToggleFrame, Nexus.Theme.Outline, 1, 0.7)
    
    local ToggleText = Create("TextLabel", {
        Size = UDim2.new(1, -60, 1, 0),
        Position = UDim2.fromOffset(15, 0),
        BackgroundTransparency = 1,
        Text = Text,
        TextColor3 = Nexus.Theme.Text,
        TextScaled = true,
        Font = Enum.Font.Gotham,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = ToggleFrame
    })
    
    local ToggleButton = Create("TextButton", {
        Size = UDim2.fromOffset(35, 20),
        Position = UDim2.new(1, -45, 0.5, -10),
        BackgroundColor3 = Color3.fromRGB(100, 100, 100),
        BorderSizePixel = 0,
        Text = "",
        Parent = ToggleFrame
    })
    
    AddCorner(ToggleButton, 10)
    
    local ToggleIndicator = Create("Frame", {
        Size = UDim2.fromOffset(14, 14),
        Position = UDim2.fromOffset(3, 3),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        Parent = ToggleButton
    })
    
    AddCorner(ToggleIndicator, 7)
    
    local function UpdateToggle()
        if ToggleValue then
            Tween(ToggleButton, {BackgroundColor3 = Nexus.Theme.Accent}, 0.2)
            Tween(ToggleIndicator, {Position = UDim2.fromOffset(18, 3)}, 0.2)
        else
            Tween(ToggleButton, {BackgroundColor3 = Color3.fromRGB(100, 100, 100)}, 0.2)
            Tween(ToggleIndicator, {Position = UDim2.fromOffset(3, 3)}, 0.2)
        end
    end
    
    UpdateToggle()
    
    local ToggleConnection = ToggleButton.MouseButton1Click:Connect(function()
        ToggleValue = not ToggleValue
        UpdateToggle()
        PlaySound("6895079853", 0.06)
        
        if Flag then
            Nexus.Flags[Flag] = ToggleValue
        end
        
        pcall(Callback, ToggleValue)
    end)
    
    table.insert(Nexus.Connections, ToggleConnection)
    
    if Flag then
        Nexus.Registry[Flag] = {
            Set = function(value)
                ToggleValue = value
                UpdateToggle()
                pcall(Callback, ToggleValue)
            end,
            Get = function()
                return ToggleValue
            end
        }
        Nexus.Flags[Flag] = ToggleValue
    end
    
    return {
        Frame = ToggleFrame,
        Set = function(value)
            ToggleValue = value
            UpdateToggle()
        end,
        Get = function()
            return ToggleValue
        end
    }
end

-- 🎚️ CREATE SLIDER FUNCTION
local function CreateSlider(parent, config)
    config = config or {}
    local Text = config.Text or "Slider"
    local Min = config.Min or 0
    local Max = config.Max or 100
    local Default = config.Default or Min
    local Callback = config.Callback or function() end
    local Flag = config.Flag
    
    local SliderValue = Default
    
    local SliderFrame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 55),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    AddCorner(SliderFrame, 8)
    AddStroke(SliderFrame, Nexus.Theme.Outline, 1, 0.7)
    
    local SliderText = Create("TextLabel", {
        Size = UDim2.new(1, -15, 0, 20),
        Position = UDim2.fromOffset(15, 8),
        BackgroundTransparency = 1,
        Text = Text,
        TextColor3 = Nexus.Theme.Text,
        TextScaled = true,
        Font = Enum.Font.Gotham,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = SliderFrame
    })
    
    local SliderValueLabel = Create("TextLabel", {
        Size = UDim2.fromOffset(60, 20),
        Position = UDim2.new(1, -75, 0, 8),
        BackgroundTransparency = 1,
        Text = tostring(SliderValue),
        TextColor3 = Nexus.Theme.Accent,
        TextScaled = true,
        Font = Enum.Font.GothamMedium,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Right,
        Parent = SliderFrame
    })
    
    local SliderTrack = Create("Frame", {
        Size = UDim2.new(1, -30, 0, 6),
        Position = UDim2.fromOffset(15, 35),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        BorderSizePixel = 0,
        Parent = SliderFrame
    })
    
    AddCorner(SliderTrack, 3)
    
    local SliderFill = Create("Frame", {
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = Nexus.Theme.Accent,
        BorderSizePixel = 0,
        Parent = SliderTrack
    })
    
    AddCorner(SliderFill, 3)
    
    local SliderButton = Create("TextButton", {
        Size = UDim2.fromOffset(16, 16),
        Position = UDim2.fromOffset(-8, -5),
        BackgroundColor3 = Nexus.Theme.Accent,
        BorderSizePixel = 0,
        Text = "",
        Parent = SliderTrack
    })
    
    AddCorner(SliderButton, 8)
    
    local function UpdateSlider()
        local percentage = (SliderValue - Min) / (Max - Min)
        local fillSize = UDim2.new(percentage, 0, 1, 0)
        local buttonPos = UDim2.new(percentage, -8, 0, -5)
        
        Tween(SliderFill, {Size = fillSize}, 0.1)
        Tween(SliderButton, {Position = buttonPos}, 0.1)
        SliderValueLabel.Text = tostring(SliderValue)
    end
    
    UpdateSlider()
    
    local dragging = false
    
    local function UpdateValue(input)
        local trackPos = SliderTrack.AbsolutePosition.X
        local trackSize = SliderTrack.AbsoluteSize.X
        local mousePos = input.Position.X
        
        local percentage = math.clamp((mousePos - trackPos) / trackSize, 0, 1)
        SliderValue = math.floor(Min + (Max - Min) * percentage)
        
        UpdateSlider()
        
        if Flag then
            Nexus.Flags[Flag] = SliderValue
        end
        
        pcall(Callback, SliderValue)
    end
    
    local SliderConnection1 = SliderButton.MouseButton1Down:Connect(function()
        dragging = true
        PlaySound("6895079853", 0.04)
    end)
    
    local SliderConnection2 = UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            UpdateValue(input)
        end
    end)
    
    local SliderConnection3 = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    local SliderConnection4 = SliderTrack.MouseButton1Click:Connect(function()
        UpdateValue(UserInputService:GetMouseLocation())
    end)
    
    table.insert(Nexus.Connections, SliderConnection1)
    table.insert(Nexus.Connections, SliderConnection2)
    table.insert(Nexus.Connections, SliderConnection3)
    table.insert(Nexus.Connections, SliderConnection4)
    
    if Flag then
        Nexus.Registry[Flag] = {
            Set = function(value)
                SliderValue = math.clamp(value, Min, Max)
                UpdateSlider()
                pcall(Callback, SliderValue)
            end,
            Get = function()
                return SliderValue
            end
        }
        Nexus.Flags[Flag] = SliderValue
    end
    
    return {
        Frame = SliderFrame,
        Set = function(value)
            SliderValue = math.clamp(value, Min, Max)
            UpdateSlider()
        end,
        Get = function()
            return SliderValue
        end
    }
end

--// ====================================================================
--// 📦 ADVANCED COMPONENT CREATION FUNCTIONS
--// ====================================================================

-- 📋 CREATE DROPDOWN FUNCTION (FIXED)
local function CreateDropdown(parent, config)
    -- Validation & defaults
    config = config or {}
    if not parent or not parent.Parent then return nil end
    
    local Text = config.Text or "Dropdown"
    local Options = config.Options or {"No Options"}
    local Default = config.Default
    local Callback = config.Callback or function() end
    local Flag = config.Flag
    local MultiSelect = config.MultiSelect or false
    local SearchEnabled = config.Search or false
    local MaxVisible = config.MaxVisible or 6
    
    -- Validate & clean options
    if type(Options) ~= "table" or #Options == 0 then
        Options = {"No Options Available"}
    end
    
    local CleanOptions = {}
    for i, option in ipairs(Options) do
        if option ~= nil then
            table.insert(CleanOptions, tostring(option))
        end
    end
    
    if #CleanOptions == 0 then
        CleanOptions = {"Empty"}
    end
    
    -- Initialize state
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
        Size = UDim2.new(1, 0, 0, baseHeight),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    AddCorner(MainFrame, 8)
    AddStroke(MainFrame, Nexus.Theme.Outline, 1, 0.7)
    
    -- Header button
    local HeaderButton = Create("TextButton", {
        Size = UDim2.new(1, 0, 0, baseHeight),
        BackgroundTransparency = 1,
        Text = "",
        Parent = MainFrame
    })
    
    local HeaderText = Create("TextLabel", {
        Size = UDim2.new(1, -50, 1, 0),
        Position = UDim2.fromOffset(15, 0),
        BackgroundTransparency = 1,
        Text = Text,
        TextColor3 = Nexus.Theme.Text,
        TextScaled = true,
        Font = Enum.Font.Gotham,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = HeaderButton
    })
    
    local HeaderValue = Create("TextLabel", {
        Size = UDim2.new(1, -80, 1, 0),
        Position = UDim2.fromOffset(15, 0),
        BackgroundTransparency = 1,
        Text = CurrentValue,
        TextColor3 = Nexus.Theme.Accent,
        TextScaled = true,
        Font = Enum.Font.GothamMedium,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Right,
        Parent = HeaderButton
    })
    
    local Arrow = Create("TextLabel", {
        Size = UDim2.fromOffset(20, 20),
        Position = UDim2.new(1, -30, 0.5, -10),
        BackgroundTransparency = 1,
        Text = "▼",
        TextColor3 = Nexus.Theme.TextMuted,
        TextScaled = true,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        Parent = HeaderButton
    })
    
    -- Dropdown container
    local DropdownContainer = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        Position = UDim2.fromOffset(0, baseHeight + 2),
        BackgroundColor3 = Nexus.Theme.SurfaceHigh,
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 10,
        Parent = MainFrame
    })
    
    AddCorner(DropdownContainer, 8)
    AddStroke(DropdownContainer, Nexus.Theme.Outline, 1, 0.5)
    AddShadow(DropdownContainer, 4, 0.7)
    
    -- Search box (if enabled)
    local SearchBox = nil
    if SearchEnabled then
        SearchBox = Create("TextBox", {
            Size = UDim2.new(1, -16, 0, 32),
            Position = UDim2.fromOffset(8, 4),
            BackgroundColor3 = Nexus.Theme.Surface,
            BorderSizePixel = 0,
            Text = "",
            PlaceholderText = "Search options...",
            TextColor3 = Nexus.Theme.Text,
            PlaceholderColor3 = Nexus.Theme.TextMuted,
            Font = Enum.Font.Gotham,
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = DropdownContainer
        })
        
        AddCorner(SearchBox, 6)
        AddStroke(SearchBox, Nexus.Theme.Outline, 1, 0.8)
    end
    
    -- Options scroll frame
    local OptionsScroll = Create("ScrollingFrame", {
        Size = UDim2.new(1, -8, 1, SearchEnabled and -44 or -8),
        Position = UDim2.fromOffset(4, SearchEnabled and 40 or 4),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = Nexus.Theme.Accent,
        ScrollBarImageTransparency = 0.3,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Parent = DropdownContainer
    })
    
    local OptionsLayout = Create("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 2),
        Parent = OptionsScroll
    })
    
    -- Update canvas size
    OptionsLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        OptionsScroll.CanvasSize = UDim2.new(0, 0, 0, OptionsLayout.AbsoluteContentSize.Y)
    end)
    
    -- Functions
    local function GetDisplayValue()
        if MultiSelect then
            local selected = {}
            for value, isSelected in pairs(SelectedValues) do
                if isSelected then
                    table.insert(selected, value)
                end
            end
            return #selected > 0 and table.concat(selected, ", ") or "None Selected"
        else
            return CurrentValue
        end
    end
    
    local function UpdateOptions()
        -- Clear existing options
        for _, child in ipairs(OptionsScroll:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
        
        -- Create option buttons
        for _, option in ipairs(FilteredOptions) do
            local OptionButton = Create("TextButton", {
                Size = UDim2.new(1, -8, 0, optionHeight - 2),
                BackgroundColor3 = Nexus.Theme.Surface,
                BorderSizePixel = 0,
                Text = "",
                Parent = OptionsScroll
            })
            
            AddCorner(OptionButton, 6)
            
            local OptionText = Create("TextLabel", {
                Size = UDim2.new(1, -40, 1, 0),
                Position = UDim2.fromOffset(12, 0),
                BackgroundTransparency = 1,
                Text = option,
                TextColor3 = Nexus.Theme.Text,
                TextScaled = true,
                Font = Enum.Font.Gotham,
                TextSize = 12,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = OptionButton
            })
            
            local CheckMark = Create("TextLabel", {
                Size = UDim2.fromOffset(16, 16),
                Position = UDim2.new(1, -24, 0.5, -8),
                BackgroundTransparency = 1,
                Text = "✓",
                TextColor3 = Nexus.Theme.Accent,
                TextScaled = true,
                Font = Enum.Font.GothamBold,
                TextSize = 12,
                Visible = false,
                Parent = OptionButton
            })
            
            -- Update visual state
            local function UpdateOptionState()
                if MultiSelect then
                    CheckMark.Visible = SelectedValues[option] or false
                    OptionButton.BackgroundColor3 = SelectedValues[option] and Nexus.Theme.SurfaceHighest or Nexus.Theme.Surface
                else
                    CheckMark.Visible = CurrentValue == option
                    OptionButton.BackgroundColor3 = CurrentValue == option and Nexus.Theme.SurfaceHighest or Nexus.Theme.Surface
                end
            end
            
            UpdateOptionState()
            
            -- Option selection
            OptionButton.MouseButton1Click:Connect(function()
                PlaySound("6895079853", 0.05)
                
                if MultiSelect then
                    SelectedValues[option] = not SelectedValues[option]
                    UpdateOptionState()
                    HeaderValue.Text = GetDisplayValue()
                    
                    if Flag then
                        local selected = {}
                        for value, isSelected in pairs(SelectedValues) do
                            if isSelected then
                                table.insert(selected, value)
                            end
                        end
                        Nexus.Flags[Flag] = selected
                    end
                    
                    pcall(Callback, SelectedValues)
                else
                    CurrentValue = option
                    HeaderValue.Text = GetDisplayValue()
                    
                    if Flag then
                        Nexus.Flags[Flag] = CurrentValue
                    end
                    
                    UpdateOptions()
                    pcall(Callback, CurrentValue)
                    
                    -- Close dropdown for single select
                    task.wait(0.1)
                    IsOpen = false
                    Tween(Arrow, {Rotation = 0}, 0.2)
                    Tween(DropdownContainer, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
                    task.wait(0.2)
                    DropdownContainer.Visible = false
                    MainFrame.Size = UDim2.new(1, 0, 0, baseHeight)
                end
            end)
            
            -- Hover effects
            OptionButton.MouseEnter:Connect(function()
                if not ((MultiSelect and SelectedValues[option]) or (not MultiSelect and CurrentValue == option)) then
                    Tween(OptionButton, {BackgroundColor3 = Nexus.Theme.SurfaceHigh}, 0.15)
                end
            end)
            
            OptionButton.MouseLeave:Connect(function()
                UpdateOptionState()
            end)
        end
    end
    
    local function FilterOptions()
        FilteredOptions = {}
        local query = SearchQuery:lower()
        
        for _, option in ipairs(CleanOptions) do
            if query == "" or option:lower():find(query, 1, true) then
                table.insert(FilteredOptions, option)
            end
        end
        
        if #FilteredOptions == 0 then
            FilteredOptions = {"No results found"}
        end
        
        UpdateOptions()
    end
    
    local function ToggleDropdown()
        IsOpen = not IsOpen
        
        if IsOpen then
            FilteredOptions = CleanOptions
            UpdateOptions()
            DropdownContainer.Visible = true
            local targetHeight = math.min(maxDropdownHeight, OptionsLayout.AbsoluteContentSize.Y + (SearchEnabled and 48 or 16))
            
            Tween(Arrow, {Rotation = 180}, 0.2)
            Tween(DropdownContainer, {Size = UDim2.new(1, 0, 0, targetHeight)}, 0.2)
            Tween(MainFrame, {Size = UDim2.new(1, 0, 0, baseHeight + targetHeight + 2)}, 0.2)
            
            if SearchBox then
                SearchBox:CaptureFocus()
            end
        else
            Tween(Arrow, {Rotation = 0}, 0.2)
            Tween(DropdownContainer, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
            Tween(MainFrame, {Size = UDim2.new(1, 0, 0, baseHeight)}, 0.2)
            
            task.wait(0.2)
            DropdownContainer.Visible = false
            
            if SearchBox then
                SearchBox:ReleaseFocus()
                SearchBox.Text = ""
                SearchQuery = ""
            end
        end
    end
    
    -- Event connections
    HeaderButton.MouseButton1Click:Connect(ToggleDropdown)
    
    if SearchBox then
        SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
            SearchQuery = SearchBox.Text
            FilterOptions()
        end)
    end
    
    -- Initialize
    HeaderValue.Text = GetDisplayValue()
    
    -- Registry setup
    if Flag then
        Nexus.Registry[Flag] = {
            Set = function(value)
                if MultiSelect then
                    SelectedValues = {}
                    if type(value) == "table" then
                        for _, v in ipairs(value) do
                            SelectedValues[tostring(v)] = true
                        end
                    end
                else
                    CurrentValue = tostring(value)
                end
                HeaderValue.Text = GetDisplayValue()
                if IsOpen then UpdateOptions() end
                pcall(Callback, MultiSelect and SelectedValues or CurrentValue)
            end,
            Get = function()
                if MultiSelect then
                    local selected = {}
                    for value, isSelected in pairs(SelectedValues) do
                        if isSelected then
                            table.insert(selected, value)
                        end
                    end
                    return selected
                else
                    return CurrentValue
                end
            end
        }
        
        Nexus.Flags[Flag] = MultiSelect and (function()
            local selected = {}
            for value, isSelected in pairs(SelectedValues) do
                if isSelected then
                    table.insert(selected, value)
                end
            end
            return selected
        end)() or CurrentValue
    end
    
    return {
        Frame = MainFrame,
        Set = function(value)
            if MultiSelect then
                SelectedValues = {}
                if type(value) == "table" then
                    for _, v in ipairs(value) do
                        SelectedValues[tostring(v)] = true
                    end
                end
            else
                CurrentValue = tostring(value)
            end
            HeaderValue.Text = GetDisplayValue()
            if IsOpen then UpdateOptions() end
        end,
        Get = function()
            if MultiSelect then
                local selected = {}
                for value, isSelected in pairs(SelectedValues) do
                    if isSelected then
                        table.insert(selected, value)
                    end
                end
                return selected
            else
                return CurrentValue
            end
        end,
        UpdateOptions = function(newOptions)
            if type(newOptions) == "table" and #newOptions > 0 then
                CleanOptions = {}
                for _, option in ipairs(newOptions) do
                    table.insert(CleanOptions, tostring(option))
                end
                FilteredOptions = CleanOptions
                if IsOpen then UpdateOptions() end
            end
        end
    }
end

-- 🎨 CREATE COLOR PICKER FUNCTION
local function CreateColorPicker(parent, config)
    config = config or {}
    local Text = config.Text or "Color Picker"
    local Default = config.Default or Color3.fromRGB(255, 255, 255)
    local Callback = config.Callback or function() end
    local Flag = config.Flag
    
    local SelectedColor = Default
    
    local ColorFrame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    AddCorner(ColorFrame, 8)
    AddStroke(ColorFrame, Nexus.Theme.Outline, 1, 0.7)
    
    local ColorText = Create("TextLabel", {
        Size = UDim2.new(1, -60, 1, 0),
        Position = UDim2.fromOffset(15, 0),
        BackgroundTransparency = 1,
        Text = Text,
        TextColor3 = Nexus.Theme.Text,
        TextScaled = true,
        Font = Enum.Font.Gotham,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = ColorFrame
    })
    
    local ColorPreview = Create("TextButton", {
        Size = UDim2.fromOffset(30, 25),
        Position = UDim2.new(1, -40, 0.5, -12.5),
        BackgroundColor3 = SelectedColor,
        BorderSizePixel = 0,
        Text = "",
        Parent = ColorFrame
    })
    
    AddCorner(ColorPreview, 6)
    AddStroke(ColorPreview, Nexus.Theme.Outline, 1, 0.5)
    
    -- Simple color picker dialog (basic implementation)
    ColorPreview.MouseButton1Click:Connect(function()
        PlaySound("6895079853", 0.06)
        
        -- Create simple color selection popup
        local colors = {
            Color3.fromRGB(255, 0, 0),     -- Red
            Color3.fromRGB(255, 165, 0),   -- Orange
            Color3.fromRGB(255, 255, 0),   -- Yellow
            Color3.fromRGB(0, 255, 0),     -- Green
            Color3.fromRGB(0, 255, 255),   -- Cyan
            Color3.fromRGB(0, 0, 255),     -- Blue
            Color3.fromRGB(128, 0, 128),   -- Purple
            Color3.fromRGB(255, 192, 203), -- Pink
            Color3.fromRGB(255, 255, 255), -- White
            Color3.fromRGB(128, 128, 128), -- Gray
            Color3.fromRGB(0, 0, 0),       -- Black
            Color3.fromRGB(139, 69, 19),   -- Brown
        }
        
        -- This would normally open a full color picker
        -- For now, cycle through preset colors
        local currentIndex = 1
        for i, color in ipairs(colors) do
            if color == SelectedColor then
                currentIndex = i
                break
            end
        end
        
        currentIndex = (currentIndex % #colors) + 1
        SelectedColor = colors[currentIndex]
        
        ColorPreview.BackgroundColor3 = SelectedColor
        
        if Flag then
            Nexus.Flags[Flag] = SelectedColor
        end
        
        pcall(Callback, SelectedColor)
    end)
    
    if Flag then
        Nexus.Registry[Flag] = {
            Set = function(color)
                SelectedColor = color
                ColorPreview.BackgroundColor3 = SelectedColor
                pcall(Callback, SelectedColor)
            end,
            Get = function()
                return SelectedColor
            end
        }
        Nexus.Flags[Flag] = SelectedColor
    end
    
    return {
        Frame = ColorFrame,
        Set = function(color)
            SelectedColor = color
            ColorPreview.BackgroundColor3 = SelectedColor
        end,
        Get = function()
            return SelectedColor
        end
    }
end

-- 📝 CREATE TEXT BOX FUNCTION
local function CreateTextBox(parent, config)
    config = config or {}
    local Text = config.Text or "Text Box"
    local Default = config.Default or ""
    local PlaceholderText = config.PlaceholderText or "Enter text..."
    local Callback = config.Callback or function() end
    local Flag = config.Flag
    
    local TextValue = Default
    
    local TextFrame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 70),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    AddCorner(TextFrame, 8)
    AddStroke(TextFrame, Nexus.Theme.Outline, 1, 0.7)
    
    local TextLabel = Create("TextLabel", {
        Size = UDim2.new(1, -15, 0, 25),
        Position = UDim2.fromOffset(15, 8),
        BackgroundTransparency = 1,
        Text = Text,
        TextColor3 = Nexus.Theme.Text,
        TextScaled = true,
        Font = Enum.Font.Gotham,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TextFrame
    })
    
    local TextInput = Create("TextBox", {
        Size = UDim2.new(1, -30, 0, 30),
        Position = UDim2.fromOffset(15, 35),
        BackgroundColor3 = Nexus.Theme.SurfaceHigh,
        BorderSizePixel = 0,
        Text = TextValue,
        PlaceholderText = PlaceholderText,
        TextColor3 = Nexus.Theme.Text,
        PlaceholderColor3 = Nexus.Theme.TextMuted,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TextFrame
    })
    
    AddCorner(TextInput, 6)
    AddStroke(TextInput, Nexus.Theme.Outline, 1, 0.8)
    
    -- Focus effects
    TextInput.Focused:Connect(function()
        Tween(TextInput, {BackgroundColor3 = Nexus.Theme.SurfaceHighest}, 0.2)
        AddStroke(TextInput, Nexus.Theme.Accent, 1, 0.5)
    end)
    
    TextInput.FocusLost:Connect(function()
        Tween(TextInput, {BackgroundColor3 = Nexus.Theme.SurfaceHigh}, 0.2)
        AddStroke(TextInput, Nexus.Theme.Outline, 1, 0.8)
        
        TextValue = TextInput.Text
        
        if Flag then
            Nexus.Flags[Flag] = TextValue
        end
        
        pcall(Callback, TextValue)
    end)
    
    if Flag then
        Nexus.Registry[Flag] = {
            Set = function(text)
                TextValue = tostring(text)
                TextInput.Text = TextValue
                pcall(Callback, TextValue)
            end,
            Get = function()
                return TextValue
            end
        }
        Nexus.Flags[Flag] = TextValue
    end
    
    return {
        Frame = TextFrame,
        Set = function(text)
            TextValue = tostring(text)
            TextInput.Text = TextValue
        end,
        Get = function()
            return TextValue
        end,
        Focus = function()
            TextInput:CaptureFocus()
        end
    }
end
--// ====================================================================
--// 📦 FINAL COMPONENTS & API SYSTEM
--// ====================================================================

-- ⌨️ CREATE KEYBIND FUNCTION
local function CreateKeybind(parent, config)
    config = config or {}
    local Text = config.Text or "Keybind"
    local Default = config.Default or Enum.KeyCode.F
    local Callback = config.Callback or function() end
    local Flag = config.Flag
    
    local CurrentKey = Default
    local IsBinding = false
    
    local KeybindFrame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    AddCorner(KeybindFrame, 8)
    AddStroke(KeybindFrame, Nexus.Theme.Outline, 1, 0.7)
    
    local KeybindText = Create("TextLabel", {
        Size = UDim2.new(1, -100, 1, 0),
        Position = UDim2.fromOffset(15, 0),
        BackgroundTransparency = 1,
        Text = Text,
        TextColor3 = Nexus.Theme.Text,
        TextScaled = true,
        Font = Enum.Font.Gotham,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = KeybindFrame
    })
    
    local KeybindButton = Create("TextButton", {
        Size = UDim2.fromOffset(80, 25),
        Position = UDim2.new(1, -90, 0.5, -12.5),
        BackgroundColor3 = Nexus.Theme.SurfaceHigh,
        BorderSizePixel = 0,
        Text = CurrentKey.Name,
        TextColor3 = Nexus.Theme.Accent,
        TextScaled = true,
        Font = Enum.Font.GothamMedium,
        TextSize = 11,
        Parent = KeybindFrame
    })
    
    AddCorner(KeybindButton, 6)
    AddStroke(KeybindButton, Nexus.Theme.Outline, 1, 0.6)
    
    local function UpdateKeybindDisplay()
        if IsBinding then
            KeybindButton.Text = "..."
            KeybindButton.TextColor3 = Nexus.Theme.Warning
        else
            KeybindButton.Text = CurrentKey.Name
            KeybindButton.TextColor3 = Nexus.Theme.Accent
        end
    end
    
    KeybindButton.MouseButton1Click:Connect(function()
        if IsBinding then return end
        
        IsBinding = true
        UpdateKeybindDisplay()
        PlaySound("6895079853", 0.05)
        
        local connection
        connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            
            if input.UserInputType == Enum.UserInputType.Keyboard then
                CurrentKey = input.KeyCode
                IsBinding = false
                UpdateKeybindDisplay()
                connection:Disconnect()
                
                if Flag then
                    Nexus.Flags[Flag] = CurrentKey
                end
                
                PlaySound("6895079853", 0.04)
            end
        end)
    end)
    
    -- Key press detection
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed or IsBinding then return end
        
        if input.KeyCode == CurrentKey then
            pcall(Callback, CurrentKey)
        end
    end)
    
    if Flag then
        Nexus.Registry[Flag] = {
            Set = function(keycode)
                CurrentKey = keycode
                UpdateKeybindDisplay()
            end,
            Get = function()
                return CurrentKey
            end
        }
        Nexus.Flags[Flag] = CurrentKey
    end
    
    return {
        Frame = KeybindFrame,
        Set = function(keycode)
            CurrentKey = keycode
            UpdateKeybindDisplay()
        end,
        Get = function()
            return CurrentKey
        end
    }
end

-- 📑 CREATE SECTION FUNCTION
local function CreateSection(parent, config)
    config = config or {}
    local Text = config.Text or "Section"
    local Style = config.Style or "Default"
    
    local SectionFrame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 45),
        BackgroundTransparency = 1,
        Parent = parent
    })
    
    if Style == "Header" then
        SectionFrame.Size = UDim2.new(1, 0, 0, 50)
        
        local HeaderBg = Create("Frame", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = Nexus.Theme.SurfaceHigh,
            BorderSizePixel = 0,
            Parent = SectionFrame
        })
        
        AddCorner(HeaderBg, 8)
        
        local HeaderGradient = Create("UIGradient", {
            Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Nexus.Theme.Gradient1),
                ColorSequenceKeypoint.new(1, Nexus.Theme.Gradient2)
            },
            Rotation = 45,
            Transparency = NumberSequence.new{
                NumberSequenceKeypoint.new(0, 0.8),
                NumberSequenceKeypoint.new(1, 0.9)
            },
            Parent = HeaderBg
        })
    end
    
    local SectionText = Create("TextLabel", {
        Size = UDim2.new(1, -20, 1, 0),
        Position = UDim2.fromOffset(10, 0),
        BackgroundTransparency = 1,
        Text = Text,
        TextColor3 = Style == "Header" and Nexus.Theme.Text or Nexus.Theme.Accent,
        TextScaled = true,
        Font = Style == "Header" and Enum.Font.GothamBold or Enum.Font.GothamMedium,
        TextSize = Style == "Header" and 16 or 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = SectionFrame
    })
    
    if Style == "Default" then
        local SectionLine = Create("Frame", {
            Size = UDim2.new(1, -120, 0, 2),
            Position = UDim2.new(0, 120, 0.5, -1),
            BackgroundColor3 = Nexus.Theme.Accent,
            BorderSizePixel = 0,
            Parent = SectionFrame
        })
        
        AddCorner(SectionLine, 1)
        
        local LineGradient = Create("UIGradient", {
            Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Nexus.Theme.Accent),
                ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
            },
            Transparency = NumberSequence.new{
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(1, 1)
            },
            Parent = SectionLine
        })
    end
    
    return {
        Frame = SectionFrame,
        SetText = function(newText)
            SectionText.Text = tostring(newText)
        end
    }
end

-- ➖ CREATE SEPARATOR FUNCTION
local function CreateSeparator(parent, config)
    config = config or {}
    local Height = config.Height or 20
    
    local SeparatorFrame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, Height),
        BackgroundTransparency = 1,
        Parent = parent
    })
    
    local SeparatorLine = Create("Frame", {
        Size = UDim2.new(1, -40, 0, 1),
        Position = UDim2.new(0, 20, 0.5, 0),
        BackgroundColor3 = Nexus.Theme.Outline,
        BorderSizePixel = 0,
        Parent = SeparatorFrame
    })
    
    return {
        Frame = SeparatorFrame
    }
end

--// ====================================================================
--// 🏢 WINDOW & TAB API SYSTEM
--// ====================================================================

-- 🪟 CREATE WINDOW FUNCTION
function Nexus:CreateWindow(config)
    config = config or {}
    local WindowTitle = config.Title or config.Name or "Nexus UI"
    local WindowSize = config.Size or UDim2.fromOffset(580, 460)
    local WindowIcon = config.Icon
    local IntroEnabled = config.IntroEnabled ~= false
    local SaveConfig = config.SaveConfig ~= false
    
    -- Destroy existing UI
    pcall(function()
        if Nexus.ScreenGui then
            Nexus.ScreenGui:Destroy()
        end
    end)
    
    -- Create ScreenGui
    local ScreenGui = Create("ScreenGui", {
        Name = "NexusUI",
        Parent = CoreGui,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        IgnoreGuiInset = true
    })
    
    Nexus.ScreenGui = ScreenGui
    
    -- Main Window
    local MainWindow = Create("Frame", {
        Name = "MainWindow",
        Size = WindowSize,
        Position = UDim2.new(0.5, -WindowSize.X.Offset/2, 0.5, -WindowSize.Y.Offset/2),
        BackgroundColor3 = Nexus.Theme.Background,
        BorderSizePixel = 0,
        Parent = ScreenGui
    })
    
    AddCorner(MainWindow, 12)
    AddShadow(MainWindow, 8, 0.6)
    MakeDraggable(MainWindow, MainWindow)
    
    -- Background gradient
    local BackgroundGradient = Create("UIGradient", {
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Nexus.Theme.Background),
            ColorSequenceKeypoint.new(1, Color3.new(
                math.max(Nexus.Theme.Background.R - 0.02, 0),
                math.max(Nexus.Theme.Background.G - 0.02, 0),
                math.max(Nexus.Theme.Background.B - 0.02, 0)
            ))
        },
        Rotation = 45,
        Parent = MainWindow
    })
    
    -- Top Bar
    local TopBar = Create("Frame", {
        Name = "TopBar",
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = MainWindow
    })
    
    AddCorner(TopBar, 12)
    
    local TopBarGradient = Create("UIGradient", {
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Nexus.Theme.Surface),
            ColorSequenceKeypoint.new(1, Nexus.Theme.SurfaceHigh)
        },
        Rotation = 90,
        Parent = TopBar
    })
    
    -- Window Icon
    local WindowIconLabel = nil
    if WindowIcon then
        WindowIconLabel = Create("ImageLabel", {
            Size = UDim2.fromOffset(24, 24),
            Position = UDim2.fromOffset(15, 13),
            BackgroundTransparency = 1,
            Image = "rbxassetid://" .. tostring(WindowIcon),
            Parent = TopBar
        })
    end
    
    -- Window Title
    local TitleLabel = Create("TextLabel", {
        Size = UDim2.new(1, WindowIcon and -100 or -80, 1, 0),
        Position = UDim2.fromOffset(WindowIcon and 50 or 20, 0),
        BackgroundTransparency = 1,
        Text = WindowTitle,
        TextColor3 = Nexus.Theme.Text,
        TextScaled = true,
        Font = Enum.Font.GothamBold,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TopBar
    })
    
    -- Close Button
    local CloseButton = Create("TextButton", {
        Size = UDim2.fromOffset(30, 30),
        Position = UDim2.new(1, -40, 0, 10),
        BackgroundColor3 = Nexus.Theme.Error,
        BorderSizePixel = 0,
        Text = "✕",
        TextColor3 = Color3.new(1, 1, 1),
        TextScaled = true,
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        Parent = TopBar
    })
    
    AddCorner(CloseButton, 15)
    
    CloseButton.MouseButton1Click:Connect(function()
        PlaySound("6895079853", 0.1)
        Tween(MainWindow, {Size = UDim2.new(0, 0, 0, 0)}, 0.3)
        Tween(MainWindow, {BackgroundTransparency = 1}, 0.3)
        task.wait(0.3)
        ScreenGui:Destroy()
        SetBlur(false)
        
        -- Cleanup connections
        for _, connection in ipairs(Nexus.Connections) do
            pcall(function()
                connection:Disconnect()
            end)
        end
        Nexus.Connections = {}
        Nexus.IsDestroyed = true
    end)
    
    CloseButton.MouseEnter:Connect(function()
        Tween(CloseButton, {BackgroundColor3 = Color3.fromRGB(220, 50, 50)}, 0.15)
    end)
    
    CloseButton.MouseLeave:Connect(function()
        Tween(CloseButton, {BackgroundColor3 = Nexus.Theme.Error}, 0.15)
    end)
    
    -- Tab Container
    local TabContainer = Create("Frame", {
        Name = "TabContainer",
        Size = UDim2.new(0, 140, 1, -60),
        Position = UDim2.fromOffset(10, 55),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = MainWindow
    })
    
    AddCorner(TabContainer, 8)
    
    local TabScroll = Create("ScrollingFrame", {
        Size = UDim2.new(1, -8, 1, -8),
        Position = UDim2.fromOffset(4, 4),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Nexus.Theme.Accent,
        ScrollBarImageTransparency = 0.5,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Parent = TabContainer
    })
    
    local TabLayout = Create("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4),
        Parent = TabScroll
    })
    
    TabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabScroll.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
    end)
    
    -- Content Container
    local ContentContainer = Create("Frame", {
        Name = "ContentContainer",
        Size = UDim2.new(1, -170, 1, -65),
        Position = UDim2.fromOffset(160, 55),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = MainWindow
    })
    
    AddCorner(ContentContainer, 8)
    
    -- Initialize blur
    SetBlur(true, 10)
    
    -- Window API
    local WindowAPI = {
        Window = MainWindow,
        ScreenGui = ScreenGui,
        TabContainer = TabContainer,
        ContentContainer = ContentContainer,
        Tabs = {},
        ActiveTab = nil
    }
    
    -- Create Tab Function
    function WindowAPI:Tab(config)
        config = config or {}
        local TabName = config.Name or config.Title or "Tab"
        local TabIcon = config.Icon
        local TabColor = config.Color or Nexus.Theme.Accent
        
        -- Tab Button
        local TabButton = Create("TextButton", {
            Name = TabName,
            Size = UDim2.new(1, -8, 0, 40),
            BackgroundColor3 = Nexus.Theme.SurfaceHigh,
            BorderSizePixel = 0,
            Text = "",
            LayoutOrder = #self.Tabs + 1,
            Parent = TabScroll
        })
        
        AddCorner(TabButton, 6)
        
        local TabButtonIcon = nil
        if TabIcon then
            TabButtonIcon = Create("ImageLabel", {
                Size = UDim2.fromOffset(18, 18),
                Position = UDim2.fromOffset(8, 11),
                BackgroundTransparency = 1,
                Image = "rbxassetid://" .. tostring(TabIcon),
                ImageColor3 = Nexus.Theme.TextSub,
                Parent = TabButton
            })
        end
        
        local TabButtonText = Create("TextLabel", {
            Size = UDim2.new(1, TabIcon and -35 or -16, 1, 0),
            Position = UDim2.fromOffset(TabIcon and 32 or 8, 0),
            BackgroundTransparency = 1,
            Text = TabName,
            TextColor3 = Nexus.Theme.TextSub,
            TextScaled = true,
            Font = Enum.Font.Gotham,
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = TabButton
        })
        
        -- Tab Content Page
        local TabPage = Create("ScrollingFrame", {
            Name = TabName .. "Page",
            Size = UDim2.new(1, -16, 1, -16),
            Position = UDim2.fromOffset(8, 8),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 4,
            ScrollBarImageColor3 = Nexus.Theme.Accent,
            ScrollBarImageTransparency = 0.4,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            Visible = false,
            Parent = ContentContainer
        })
        
        local PageLayout = Create("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8),
            Parent = TabPage
        })
        
        local PagePadding = Create("UIPadding", {
            PaddingTop = UDim.new(0, 8),
            PaddingBottom = UDim.new(0, 8),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
            Parent = TabPage
        })
        
        PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabPage.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 16)
        end)
        
        -- Tab switching logic
        local function ActivateTab()
            -- Deactivate all tabs
            for _, tab in ipairs(self.Tabs) do
                tab.Page.Visible = false
                Tween(tab.Button, {BackgroundColor3 = Nexus.Theme.SurfaceHigh}, 0.2)
                tab.ButtonText.TextColor3 = Nexus.Theme.TextSub
                if tab.ButtonIcon then
                    tab.ButtonIcon.ImageColor3 = Nexus.Theme.TextSub
                end
            end
            
            -- Activate this tab
            TabPage.Visible = true
            Tween(TabButton, {BackgroundColor3 = TabColor}, 0.2)
            TabButtonText.TextColor3 = Nexus.Theme.Text
            if TabButtonIcon then
                TabButtonIcon.ImageColor3 = Nexus.Theme.Text
            end
            
            self.ActiveTab = TabAPI
        end
        
        TabButton.MouseButton1Click:Connect(function()
            PlaySound("6895079853", 0.04)
            ActivateTab()
        end)
        
        -- Tab API
        local TabAPI = {
            Name = TabName,
            Page = TabPage,
            Button = TabButton,
            ButtonText = TabButtonText,
            ButtonIcon = TabButtonIcon,
            
            -- Component creation methods
            Label = function(self, cfg)
                return CreateLabel(TabPage, cfg)
            end,
            
            Button = function(self, cfg)
                return CreateButton(TabPage, cfg)
            end,
            
            Toggle = function(self, cfg)
                return CreateToggle(TabPage, cfg)
            end,
            
            Slider = function(self, cfg)
                return CreateSlider(TabPage, cfg)
            end,
            
            Dropdown = function(self, cfg)
                return CreateDropdown(TabPage, cfg)
            end,
            
            ColorPicker = function(self, cfg)
                return CreateColorPicker(TabPage, cfg)
            end,
            
            TextBox = function(self, cfg)
                return CreateTextBox(TabPage, cfg)
            end,
            
            Keybind = function(self, cfg)
                return CreateKeybind(TabPage, cfg)
            end,
            
            Section = function(self, cfg)
                return CreateSection(TabPage, cfg)
            end,
            
            Separator = function(self, cfg)
                return CreateSeparator(TabPage, cfg)
            end
        }
        
        table.insert(self.Tabs, TabAPI)
        
        -- Auto-select first tab
        if #self.Tabs == 1 then
            ActivateTab()
        end
        
        return TabAPI
    end
    
    -- Intro animation
    if IntroEnabled then
        MainWindow.Size = UDim2.new(0, 0, 0, 0)
        MainWindow.BackgroundTransparency = 1
        
        task.wait(0.1)
        
        Tween(MainWindow, {Size = WindowSize}, 0.4, Enum.EasingStyle.Back)
        Tween(MainWindow, {BackgroundTransparency = 0}, 0.4)
    end
    
    return WindowAPI
end

--// ====================================================================
--// 🎯 CLEANUP & RETURN
--// ====================================================================

-- Cleanup function
function Nexus:Destroy()
    pcall(function()
        if self.ScreenGui then
            self.ScreenGui:Destroy()
        end
    end)
    
    for _, connection in ipairs(self.Connections) do
        pcall(function()
            connection:Disconnect()
        end)
    end
    
    self.Connections = {}
    self.IsDestroyed = true
    SetBlur(false)
end

-- Game close cleanup
game:GetService("Players").LocalPlayer.OnTeleport:Connect(function()
    Nexus:Destroy()
end)

-- Return the library
return Nexus