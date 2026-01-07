--[[
    ╔══════════════════════════════════════════════════════════════╗
    ║                    NEXUS UI v5.0 - ADVANCED                 ║
    ║                  Revolutionary UI Library                   ║
    ║  ✨ Advanced Animations  🎨 Theme System  📱 Mobile Ready   ║
    ║  🔄 Config System       🔔 Notifications  🎯 Smart Features ║
    ║  📊 Analytics          🛡️ Anti-Detection  ⚡ Performance    ║
    ╚══════════════════════════════════════════════════════════════╝
]]

local Nexus = {
    Version = "5.0.0",
    Author = "Advanced Developer",
    BuildDate = os.date("%Y-%m-%d"),
    
    -- Core Systems
    Flags = {},
    Registry = {},
    Connections = {},
    Analytics = {
        SessionStart = tick(),
        ButtonClicks = 0,
        ToggleChanges = 0,
        SliderChanges = 0,
        ConfigLoads = 0,
        ThemeChanges = 0
    },
    
    -- Advanced Settings
    Settings = {
        AnimationSpeed = 1,
        SoundEnabled = true,
        ParticleEffects = true,
        AutoSave = true,
        AntiDetection = true,
        PerformanceMode = false,
        MobileOptimized = false,
        DebugMode = false
    },
    
    -- State Management
    State = {
        IsVisible = true,
        CurrentTheme = "NexusDark",
        ActiveWindow = nil,
        LoadedConfigs = {},
        CustomThemes = {}
    },
    
    -- Advanced Theme System
    Themes = {
        NexusDark = {
            Name = "Nexus Dark",
            Type = "Dark",
            Accent = Color3.fromRGB(98, 176, 255),
            AccentSecondary = Color3.fromRGB(138, 196, 255),
            AccentGradient = {Color3.fromRGB(98, 176, 255), Color3.fromRGB(138, 196, 255)},
            
            Background = Color3.fromRGB(12, 12, 16),
            BackgroundSecondary = Color3.fromRGB(16, 16, 20),
            Surface = Color3.fromRGB(20, 20, 26),
            SurfaceHigh = Color3.fromRGB(28, 28, 34),
            SurfaceHighest = Color3.fromRGB(36, 36, 42),
            
            Text = Color3.fromRGB(255, 255, 255),
            TextSecondary = Color3.fromRGB(200, 200, 210),
            TextMuted = Color3.fromRGB(150, 150, 160),
            TextDisabled = Color3.fromRGB(100, 100, 110),
            
            Border = Color3.fromRGB(60, 60, 70),
            BorderHover = Color3.fromRGB(80, 80, 90),
            BorderActive = Color3.fromRGB(98, 176, 255),
            
            Success = Color3.fromRGB(72, 187, 120),
            Warning = Color3.fromRGB(251, 191, 36),
            Error = Color3.fromRGB(248, 113, 113),
            Info = Color3.fromRGB(99, 179, 237),
            
            Shadow = Color3.fromRGB(0, 0, 0),
            Glow = Color3.fromRGB(98, 176, 255),
            
            -- Animation Properties
            AnimationEasing = Enum.EasingStyle.Quart,
            AnimationDirection = Enum.EasingDirection.Out,
            AnimationSpeed = 0.3
        },
        
        NexusLight = {
            Name = "Nexus Light",
            Type = "Light",
            Accent = Color3.fromRGB(59, 130, 246),
            AccentSecondary = Color3.fromRGB(99, 150, 246),
            AccentGradient = {Color3.fromRGB(59, 130, 246), Color3.fromRGB(99, 150, 246)},
            
            Background = Color3.fromRGB(248, 250, 252),
            BackgroundSecondary = Color3.fromRGB(241, 245, 249),
            Surface = Color3.fromRGB(255, 255, 255),
            SurfaceHigh = Color3.fromRGB(248, 250, 252),
            SurfaceHighest = Color3.fromRGB(241, 245, 249),
            
            Text = Color3.fromRGB(15, 23, 42),
            TextSecondary = Color3.fromRGB(51, 65, 85),
            TextMuted = Color3.fromRGB(100, 116, 139),
            TextDisabled = Color3.fromRGB(148, 163, 184),
            
            Border = Color3.fromRGB(226, 232, 240),
            BorderHover = Color3.fromRGB(203, 213, 225),
            BorderActive = Color3.fromRGB(59, 130, 246),
            
            Success = Color3.fromRGB(34, 197, 94),
            Warning = Color3.fromRGB(245, 158, 11),
            Error = Color3.fromRGB(239, 68, 68),
            Info = Color3.fromRGB(59, 130, 246),
            
            Shadow = Color3.fromRGB(0, 0, 0),
            Glow = Color3.fromRGB(59, 130, 246),
            
            AnimationEasing = Enum.EasingStyle.Quart,
            AnimationDirection = Enum.EasingDirection.Out,
            AnimationSpeed = 0.3
        },
        
        CyberNeon = {
            Name = "Cyber Neon",
            Type = "Neon",
            Accent = Color3.fromRGB(0, 255, 127),
            AccentSecondary = Color3.fromRGB(57, 255, 20),
            AccentGradient = {Color3.fromRGB(0, 255, 127), Color3.fromRGB(57, 255, 20)},
            
            Background = Color3.fromRGB(2, 2, 8),
            BackgroundSecondary = Color3.fromRGB(4, 4, 12),
            Surface = Color3.fromRGB(8, 8, 16),
            SurfaceHigh = Color3.fromRGB(12, 12, 20),
            SurfaceHighest = Color3.fromRGB(16, 16, 24),
            
            Text = Color3.fromRGB(0, 255, 127),
            TextSecondary = Color3.fromRGB(100, 255, 180),
            TextMuted = Color3.fromRGB(80, 200, 140),
            TextDisabled = Color3.fromRGB(60, 150, 100),
            
            Border = Color3.fromRGB(0, 100, 50),
            BorderHover = Color3.fromRGB(0, 150, 75),
            BorderActive = Color3.fromRGB(0, 255, 127),
            
            Success = Color3.fromRGB(0, 255, 100),
            Warning = Color3.fromRGB(255, 255, 0),
            Error = Color3.fromRGB(255, 50, 100),
            Info = Color3.fromRGB(0, 200, 255),
            
            Shadow = Color3.fromRGB(0, 0, 0),
            Glow = Color3.fromRGB(0, 255, 127),
            
            AnimationEasing = Enum.EasingStyle.Back,
            AnimationDirection = Enum.EasingDirection.Out,
            AnimationSpeed = 0.4
        },
        
        OceanDepth = {
            Name = "Ocean Depth",
            Type = "Ocean",
            Accent = Color3.fromRGB(6, 182, 212),
            AccentSecondary = Color3.fromRGB(34, 211, 238),
            AccentGradient = {Color3.fromRGB(6, 182, 212), Color3.fromRGB(34, 211, 238)},
            
            Background = Color3.fromRGB(3, 7, 18),
            BackgroundSecondary = Color3.fromRGB(7, 11, 22),
            Surface = Color3.fromRGB(11, 15, 25),
            SurfaceHigh = Color3.fromRGB(15, 20, 30),
            SurfaceHighest = Color3.fromRGB(20, 25, 35),
            
            Text = Color3.fromRGB(224, 242, 254),
            TextSecondary = Color3.fromRGB(186, 230, 253),
            TextMuted = Color3.fromRGB(125, 211, 252),
            TextDisabled = Color3.fromRGB(56, 189, 248),
            
            Border = Color3.fromRGB(30, 58, 138),
            BorderHover = Color3.fromRGB(59, 130, 246),
            BorderActive = Color3.fromRGB(6, 182, 212),
            
            Success = Color3.fromRGB(16, 185, 129),
            Warning = Color3.fromRGB(245, 158, 11),
            Error = Color3.fromRGB(239, 68, 68),
            Info = Color3.fromRGB(6, 182, 212),
            
            Shadow = Color3.fromRGB(0, 0, 0),
            Glow = Color3.fromRGB(6, 182, 212),
            
            AnimationEasing = Enum.EasingStyle.Sine,
            AnimationDirection = Enum.EasingDirection.Out,
            AnimationSpeed = 0.5
        }
    }
}

-- Set current theme
Nexus.Theme = Nexus.Themes[Nexus.State.CurrentTheme]

--// 🛡️ SERVICES & UTILITIES
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local TextService = game:GetService("TextService")
local GuiService = game:GetService("GuiService")

--// 🎨 ADVANCED ANIMATION SYSTEM
local AnimationController = {
    ActiveTweens = {},
    AnimationQueue = {},
    Performance = {
        FrameTime = 0,
        TweenCount = 0,
        MemoryUsage = 0
    }
}

-- Performance-optimized tween system
function AnimationController:CreateTween(instance, properties, config)
    if not instance or not instance.Parent then return nil end
    
    config = config or {}
    local duration = (config.Duration or Nexus.Theme.AnimationSpeed) * Nexus.Settings.AnimationSpeed
    local easingStyle = config.EasingStyle or Nexus.Theme.AnimationEasing
    local easingDirection = config.EasingDirection or Nexus.Theme.AnimationDirection
    
    -- Cancel existing tween for this instance
    if self.ActiveTweens[instance] then
        self.ActiveTweens[instance]:Cancel()
        self.ActiveTweens[instance] = nil
        self.Performance.TweenCount = math.max(0, self.Performance.TweenCount - 1)
    end
    
    -- Performance check
    if self.Performance.TweenCount > 50 and not Nexus.Settings.PerformanceMode then
        warn("[Nexus] High tween count detected. Consider enabling Performance Mode.")
    end
    
    local tweenInfo = TweenInfo.new(
        duration,
        easingStyle,
        easingDirection,
        config.RepeatCount or 0,
        config.Reverses or false,
        config.DelayTime or 0
    )
    
    local tween = TweenService:Create(instance, tweenInfo, properties)
    self.ActiveTweens[instance] = tween
    self.Performance.TweenCount = self.Performance.TweenCount + 1
    
    -- Cleanup on completion
    tween.Completed:Connect(function()
        if self.ActiveTweens[instance] == tween then
            self.ActiveTweens[instance] = nil
            self.Performance.TweenCount = math.max(0, self.Performance.TweenCount - 1)
        end
        if config.Callback then
            pcall(config.Callback)
        end
    end)
    
    tween:Play()
    return tween
end

-- Spring animation system
function AnimationController:SpringTween(instance, properties, config)
    config = config or {}
    local springConfig = {
        Duration = config.Duration or 0.6,
        EasingStyle = Enum.EasingStyle.Back,
        EasingDirection = Enum.EasingDirection.Out
    }
    return self:CreateTween(instance, properties, springConfig)
end

-- Elastic animation
function AnimationController:ElasticTween(instance, properties, config)
    config = config or {}
    local elasticConfig = {
        Duration = config.Duration or 0.8,
        EasingStyle = Enum.EasingStyle.Elastic,
        EasingDirection = Enum.EasingDirection.Out
    }
    return self:CreateTween(instance, properties, elasticConfig)
end

-- Bounce animation
function AnimationController:BounceTween(instance, properties, config)
    config = config or {}
    local bounceConfig = {
        Duration = config.Duration or 0.7,
        EasingStyle = Enum.EasingStyle.Bounce,
        EasingDirection = Enum.EasingDirection.Out
    }
    return self:CreateTween(instance, properties, bounceConfig)
end

-- Chain animations
function AnimationController:ChainTweens(animations)
    if not animations or #animations == 0 then return end
    
    local function playNext(index)
        if index > #animations then return end
        
        local anim = animations[index]
        local tween = self:CreateTween(anim.Instance, anim.Properties, anim.Config)
        
        if tween then
            tween.Completed:Connect(function()
                if anim.Callback then pcall(anim.Callback) end
                playNext(index + 1)
            end)
        else
            playNext(index + 1)
        end
    end
    
    playNext(1)
end

-- Parallel animations
function AnimationController:ParallelTweens(animations, callback)
    if not animations or #animations == 0 then 
        if callback then pcall(callback) end
        return 
    end
    
    local completed = 0
    local total = #animations
    
    for _, anim in ipairs(animations) do
        local tween = self:CreateTween(anim.Instance, anim.Properties, anim.Config)
        if tween then
            tween.Completed:Connect(function()
                if anim.Callback then pcall(anim.Callback) end
                completed = completed + 1
                if completed >= total and callback then
                    pcall(callback)
                end
            end)
        else
            completed = completed + 1
            if completed >= total and callback then
                pcall(callback)
            end
        end
    end
end

--// 🎵 ADVANCED SOUND SYSTEM
local SoundController = {
    SoundCache = {},
    DefaultSounds = {
        Click = "6895079853",
        Hover = "10066931761",
        Success = "9120386436", 
        Error = "9120397119",
        Notification = "9120384965",
        Whoosh = "1177785853",
        Pop = "10066936758",
        Chime = "9120365051"
    }
}

function SoundController:PlaySound(soundId, config)
    if not Nexus.Settings.SoundEnabled then return end
    
    config = config or {}
    local volume = config.Volume or 0.1
    local pitch = config.Pitch or 1
    local pan = config.Pan or 0
    
    -- Use cached sound if available
    local soundKey = tostring(soundId)
    local sound = self.SoundCache[soundKey]
    
    if not sound then
        sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. soundId
        sound.Volume = 0
        sound.Parent = SoundService
        sound:Play() -- Pre-load
        sound.Ended:Connect(function()
            sound:Destroy()
            self.SoundCache[soundKey] = nil
        end)
        self.SoundCache[soundKey] = sound
    end
    
    -- Play with effects
    sound.Volume = volume
    sound.PlaybackSpeed = pitch
    if sound:FindFirstChild("PanSpatializer") then
        sound.PanSpatializer.Pan = pan
    end
    
    if not sound.IsPlaying then
        sound:Play()
    end
end

function SoundController:PreloadSounds()
    for name, id in pairs(self.DefaultSounds) do
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. id
        sound.Volume = 0
        sound.Parent = SoundService
        sound:Play()
        sound.Ended:Connect(function() sound:Destroy() end)
    end
end

--// 🎆 PARTICLE EFFECTS SYSTEM
local ParticleController = {
    Effects = {},
    EffectTemplates = {
        Click = {
            Texture = "rbxassetid://8560915132",
            Lifetime = NumberRange.new(0.3, 0.6),
            Rate = 50,
            SpreadAngle = Vector2.new(45, 45),
            Speed = NumberRange.new(5, 10)
        },
        Success = {
            Texture = "rbxassetid://8560915132", 
            Lifetime = NumberRange.new(0.5, 1.0),
            Rate = 30,
            SpreadAngle = Vector2.new(30, 30),
            Speed = NumberRange.new(3, 8)
        }
    }
}

function ParticleController:CreateEffect(parent, effectType, config)
    if not Nexus.Settings.ParticleEffects then return end
    
    config = config or {}
    local template = self.EffectTemplates[effectType] or self.EffectTemplates.Click
    
    local attachment = Instance.new("Attachment")
    attachment.Parent = parent
    
    local emitter = Instance.new("ParticleEmitter")
    emitter.Parent = attachment
    
    -- Apply template
    emitter.Texture = template.Texture
    emitter.Lifetime = template.Lifetime
    emitter.Rate = template.Rate
    emitter.SpreadAngle = template.SpreadAngle
    emitter.Speed = template.Speed
    
    -- Apply config overrides
    for prop, value in pairs(config) do
        pcall(function() emitter[prop] = value end)
    end
    
    -- Auto cleanup
    emitter.Enabled = true
    task.wait(0.1)
    emitter.Enabled = false
    
    game:GetService("Debris"):AddItem(attachment, 2)
end

--// 📊 ANALYTICS SYSTEM
local AnalyticsController = {
    Events = {},
    SessionData = {
        StartTime = tick(),
        EndTime = nil,
        Duration = 0,
        Events = {}
    }
}

function AnalyticsController:TrackEvent(eventName, data)
    if not Nexus.Settings.DebugMode then return end
    
    local event = {
        Name = eventName,
        Data = data or {},
        Timestamp = tick(),
        SessionTime = tick() - self.SessionData.StartTime
    }
    
    table.insert(self.Events, event)
    table.insert(self.SessionData.Events, event)
    
    -- Update counters
    if eventName == "ButtonClick" then
        Nexus.Analytics.ButtonClicks = Nexus.Analytics.ButtonClicks + 1
    elseif eventName == "ToggleChange" then
        Nexus.Analytics.ToggleChanges = Nexus.Analytics.ToggleChanges + 1
    elseif eventName == "SliderChange" then
        Nexus.Analytics.SliderChanges = Nexus.Analytics.SliderChanges + 1
    elseif eventName == "ConfigLoad" then
        Nexus.Analytics.ConfigLoads = Nexus.Analytics.ConfigLoads + 1
    elseif eventName == "ThemeChange" then
        Nexus.Analytics.ThemeChanges = Nexus.Analytics.ThemeChanges + 1
    end
    
    if Nexus.Settings.DebugMode then
        print("[Nexus Analytics]", eventName, HttpService:JSONEncode(data or {}))
    end
end

function AnalyticsController:GetSessionStats()
    return {
        Duration = tick() - self.SessionData.StartTime,
        TotalEvents = #self.Events,
        EventBreakdown = {
            ButtonClicks = Nexus.Analytics.ButtonClicks,
            ToggleChanges = Nexus.Analytics.ToggleChanges,
            SliderChanges = Nexus.Analytics.SliderChanges,
            ConfigLoads = Nexus.Analytics.ConfigLoads,
            ThemeChanges = Nexus.Analytics.ThemeChanges
        }
    }
end

function AnalyticsController:ExportSessionData()
    self.SessionData.EndTime = tick()
    self.SessionData.Duration = self.SessionData.EndTime - self.SessionData.StartTime
    
    return {
        Session = self.SessionData,
        Analytics = Nexus.Analytics,
        Version = Nexus.Version,
        BuildDate = Nexus.BuildDate
    }
end

--// 🔧 ADVANCED UTILITY FUNCTIONS
local Utils = {}

function Utils.Create(className, properties)
    local success, instance = pcall(function()
        return Instance.new(className)
    end)
    
    if not success then
        warn("[Nexus] Failed to create " .. className)
        return nil
    end
    
    for property, value in pairs(properties or {}) do
        local propSuccess = pcall(function()
            instance[property] = value
        end)
        if not propSuccess and Nexus.Settings.DebugMode then
            warn("[Nexus] Failed to set " .. property .. " on " .. className)
        end
    end
    
    return instance
end

function Utils.AddCorner(instance, radius, cornerType)
    if not instance then return nil end
    
    local corner = Utils.Create("UICorner", {
        CornerRadius = UDim.new(0, radius or 8),
        Parent = instance
    })
    
    if cornerType == "Rounded" then
        corner.CornerRadius = UDim.new(0.5, 0)
    elseif cornerType == "Sharp" then
        corner.CornerRadius = UDim.new(0, 2)
    end
    
    return corner
end

function Utils.AddStroke(instance, color, thickness, transparency, lineJoinMode)
    if not instance then return nil end
    
    local stroke = Utils.Create("UIStroke", {
        Color = color or Nexus.Theme.Border,
        Thickness = thickness or 1,
        Transparency = transparency or 0.6,
        LineJoinMode = lineJoinMode or Enum.LineJoinMode.Round,
        Parent = instance
    })
    
    return stroke
end

function Utils.AddGradient(instance, colorSequence, rotation)
    if not instance then return nil end
    
    local gradient = Utils.Create("UIGradient", {
        Color = colorSequence or ColorSequence.new{
            ColorSequenceKeypoint.new(0, Nexus.Theme.AccentGradient[1]),
            ColorSequenceKeypoint.new(1, Nexus.Theme.AccentGradient[2])
        },
        Rotation = rotation or 0,
        Parent = instance
    })
    
    return gradient
end

function Utils.AddShadow(instance, shadowType)
    if not instance then return nil end
    
    shadowType = shadowType or "Default"
    
    local shadow = Utils.Create("ImageLabel", {
        Name = "Shadow",
        Size = UDim2.new(1, 20, 1, 20),
        Position = UDim2.fromOffset(-10, -10),
        BackgroundTransparency = 1,
        Image = "rbxassetid://8560915132", -- Shadow texture
        ImageColor3 = Nexus.Theme.Shadow,
        ImageTransparency = 0.8,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(20, 20, 80, 80),
        ZIndex = instance.ZIndex - 1,
        Parent = instance.Parent
    })
    
    if shadowType == "Glow" then
        shadow.ImageColor3 = Nexus.Theme.Glow
        shadow.ImageTransparency = 0.9
        Utils.AddGradient(shadow)
    elseif shadowType == "Inset" then
        shadow.Size = UDim2.new(1, 0, 1, 0)
        shadow.Position = UDim2.new(0, 0, 0, 0)
        shadow.ImageTransparency = 0.95
    end
    
    return shadow
end

function Utils.MakeDraggable(frame, dragHandle, constrainToScreen)
    dragHandle = dragHandle or frame
    constrainToScreen = constrainToScreen ~= false
    
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    local function updateDrag(input)
        local delta = input.Position - dragStart
        local newPos = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X,
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
        
        -- Constrain to screen
        if constrainToScreen then
            local vpSize = workspace.CurrentCamera.ViewportSize
            local frameSize = frame.AbsoluteSize
            
            local minX = 0
            local maxX = vpSize.X - frameSize.X
            local minY = 0
            local maxY = vpSize.Y - frameSize.Y
            
            local constrainedX = math.clamp(newPos.X.Offset, minX, maxX)
            local constrainedY = math.clamp(newPos.Y.Offset, minY, maxY)
            
            newPos = UDim2.new(0, constrainedX, 0, constrainedY)
        end
        
        AnimationController:CreateTween(frame, {Position = newPos}, {Duration = 0.1})
    end
    
    local connection1 = dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            SoundController:PlaySound(SoundController.DefaultSounds.Click, {Volume = 0.05})
            AnalyticsController:TrackEvent("DragStart", {Element = frame.Name})
        end
    end)
    
    local connection2 = UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateDrag(input)
        end
    end)
    
    local connection3 = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if dragging then
                AnalyticsController:TrackEvent("DragEnd", {Element = frame.Name})
            end
            dragging = false
        end
    end)
    
    -- Store connections for cleanup
    table.insert(Nexus.Connections, connection1)
    table.insert(Nexus.Connections, connection2)
    table.insert(Nexus.Connections, connection3)
    
    return {connection1, connection2, connection3}
end

function Utils.AddListLayout(parent, config)
    config = config or {}
    
    local layout = Utils.Create("UIListLayout", {
        SortOrder = config.SortOrder or Enum.SortOrder.LayoutOrder,
        Padding = config.Padding or UDim.new(0, 8),
        FillDirection = config.FillDirection or Enum.FillDirection.Vertical,
        HorizontalAlignment = config.HorizontalAlignment or Enum.HorizontalAlignment.Center,
        VerticalAlignment = config.VerticalAlignment or Enum.VerticalAlignment.Top,
        Parent = parent
    })
    
    return layout
end

function Utils.AddPadding(parent, padding)
    if not parent then return nil end
    
    local paddingValue = padding or 8
    local paddingInstance = Utils.Create("UIPadding", {
        PaddingTop = UDim.new(0, paddingValue),
        PaddingBottom = UDim.new(0, paddingValue),
        PaddingLeft = UDim.new(0, paddingValue),
        PaddingRight = UDim.new(0, paddingValue),
        Parent = parent
    })
    
    return paddingInstance
end

function Utils.GetTextBounds(text, font, textSize, maxSize)
    local textService = TextService
    return textService:GetTextSize(text, textSize, font, maxSize or Vector2.new(math.huge, math.huge))
end

function Utils.IsMobile()
    return UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
end

function Utils.GetDeviceInfo()
    return {
        IsMobile = Utils.IsMobile(),
        TouchEnabled = UserInputService.TouchEnabled,
        KeyboardEnabled = UserInputService.KeyboardEnabled,
        MouseEnabled = UserInputService.MouseEnabled,
        GamepadEnabled = UserInputService.GamepadEnabled,
        VREnabled = UserInputService.VREnabled
    }
end

--// 📱 MOBILE OPTIMIZATION
local MobileController = {
    IsMobile = Utils.IsMobile(),
    SafeAreaInsets = nil,
    TouchControls = {}
}

function MobileController:Initialize()
    if not self.IsMobile then return end
    
    -- Get safe area insets
    self.SafeAreaInsets = GuiService:GetGuiInset()
    
    -- Apply mobile-specific settings
    Nexus.Settings.MobileOptimized = true
    
    -- Increase touch targets
    self:OptimizeForTouch()
end

function MobileController:OptimizeForTouch()
    -- This will be called during component creation
    -- to make buttons larger, add more padding, etc.
end

function MobileController:CreateTouchRipple(parent, position)
    if not Nexus.Settings.ParticleEffects then return end
    
    local ripple = Utils.Create("Frame", {
        Size = UDim2.fromOffset(0, 0),
        Position = UDim2.new(0, position.X, 0, position.Y),
        BackgroundColor3 = Nexus.Theme.Accent,
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        Parent = parent,
        ZIndex = parent.ZIndex + 10
    })
    
    Utils.AddCorner(ripple, 0, "Rounded")
    
    -- Animate ripple
    AnimationController:CreateTween(ripple, {
        Size = UDim2.fromOffset(100, 100),
        Position = UDim2.new(0, position.X - 50, 0, position.Y - 50),
        BackgroundTransparency = 1
    }, {
        Duration = 0.6,
        EasingStyle = Enum.EasingStyle.Quad,
        Callback = function()
            ripple:Destroy()
        end
    })
end

-- Initialize mobile optimizations
MobileController:Initialize()

--// 🛡️ ANTI-DETECTION SYSTEM
local AntiDetection = {
    Enabled = Nexus.Settings.AntiDetection,
    Obfuscation = {
        StringObfuscation = true,
        RandomizeNames = true,
        HideFromDevConsole = true
    },
    Protection = {
        AntiSkid = true,
        AntiDebug = true,
        IntegrityCheck = true
    }
}

function AntiDetection:Initialize()
    if not self.Enabled then return end
    
    -- Hide from developer console
    if self.Obfuscation.HideFromDevConsole then
        self:HideFromConsole()
    end
    
    -- Initialize protection
    if self.Protection.AntiSkid then
        self:EnableAntiSkid()
    end
    
    if self.Protection.IntegrityCheck then
        self:EnableIntegrityCheck()
    end
end

function AntiDetection:HideFromConsole()
    -- Prevent the UI from being easily detected in developer console
    pcall(function()
        local function randomString(length)
            local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
            local result = ""
            for i = 1, length do
                local rand = math.random(1, #chars)
                result = result .. chars:sub(rand, rand)
            end
            return result
        end
        
        -- Randomize ScreenGui name
        if Nexus.ScreenGui then
            Nexus.ScreenGui.Name = randomString(math.random(8, 16))
        end
    end)
end

function AntiDetection:EnableAntiSkid()
    -- Basic anti-skidding protection
    local function checkIntegrity()
        local expected = "NexusUI_" .. Nexus.Version
        local actual = tostring(Nexus.Author) .. "_" .. tostring(Nexus.Version)
        
        if actual ~= expected then
            warn("[Nexus] Integrity check failed. Unauthorized modification detected.")
            return false
        end
        return true
    end
    
    -- Run integrity check periodically
    task.spawn(function()
        while Nexus.ScreenGui and Nexus.ScreenGui.Parent do
            if not checkIntegrity() then
                -- Handle integrity failure
                break
            end
            task.wait(30) -- Check every 30 seconds
        end
    end)
end

function AntiDetection:EnableIntegrityCheck()
    -- Monitor for suspicious activity
    local suspicious_keywords = {"steal", "skid", "copy", "rip", "yoink"}
    
    local function scanForSuspicious(str)
        str = string.lower(tostring(str))
        for _, keyword in ipairs(suspicious_keywords) do
            if string.find(str, keyword) then
                return true
            end
        end
        return false
    end
    
    -- This is more of a deterrent than actual protection
    if Nexus.Settings.DebugMode then
        print("[Nexus] Integrity monitoring enabled")
    end
end

-- Initialize anti-detection
AntiDetection:Initialize()

print("🚀 Advanced systems loaded! Need me to continue with the component system?")
