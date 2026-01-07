--[[ 
    NEXUS UI v4.1 - ULTRA STABLE VERSION
    🔧 Fixed: Tween errors, Memory leaks, Stack overflow
    ✨ Enhanced: Error handling, Performance optimization
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

--// 🛡️ ENHANCED SERVICES WITH ERROR PROTECTION
local Services = {}
local function GetService(serviceName)
    if not Services[serviceName] then
        local success, service = pcall(function()
            return game:GetService(serviceName)
        end)
        Services[serviceName] = success and service or nil
        if not success then
            warn("[Nexus] Failed to get service: " .. tostring(serviceName))
        end
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

--// 🔧 ULTRA-SAFE TWEEN FUNCTION (FIXED)
local activeTweens = {}
local function SafeTween(inst, props, duration, style, direction, callback)
    -- Validate parameters
    if not inst or not inst.Parent then 
        if callback then pcall(callback) end
        return 
    end
    
    if not props or type(props) ~= "table" then 
        if callback then pcall(callback) end
        return 
    end
    
    -- Stop any existing tween on this instance
    if activeTweens[inst] then
        pcall(function()
            activeTweens[inst]:Cancel()
        end)
        activeTweens[inst] = nil
    end
    
    -- Create tween with safety
    local success, tween = pcall(function()
        local info = TweenInfo.new(
            duration or 0.25,
            style or Enum.EasingStyle.Quad,
            direction or Enum.EasingDirection.Out
        )
        return TweenService:Create(inst, info, props)
    end)
    
    if not success then
        warn("[Nexus] Tween creation failed")
        if callback then pcall(callback) end
        return
    end
    
    activeTweens[inst] = tween
    
    -- Play with error handling
    pcall(function()
        tween:Play()
    end)
    
    -- Handle completion
    local connection
    connection = tween.Completed:Connect(function()
        activeTweens[inst] = nil
        if connection then
            connection:Disconnect()
            connection = nil
        end
        if callback then 
            pcall(callback) 
        end
    end)
    
    return tween
end

-- Alias for compatibility
local Tween = SafeTween

--// 🛠️ ENHANCED HELPER FUNCTIONS
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
            local propSuccess = pcall(function()
                inst[property] = value
            end)
            if not propSuccess then
                warn("[Nexus] Failed to set property: " .. tostring(property))
            end
        end
    end
    
    if children then
        for _, child in pairs(children) do
            if child and typeof(child) == "Instance" then
                pcall(function()
                    child.Parent = inst
                end)
            end
        end
    end
    
    return inst
end

local Create = SafeCreate

local function AddCorner(parent, radius)
    if not parent or not parent.Parent then return nil end
    return Create("UICorner", {
        CornerRadius = UDim.new(0, radius or 8),
        Parent = parent
    })
end

local function AddStroke(parent, color, thickness, transparency)
    if not parent or not parent.Parent then return nil end
    return Create("UIStroke", {
        Color = color or Nexus.Theme.Outline,
        Thickness = thickness or 1,
        Transparency = transparency or 0.6,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = parent
    })
end

local function PlaySound(soundId, volume, pitch)
    pcall(function()
        local sound = Create("Sound", {
            SoundId = "rbxassetid://" .. tostring(soundId),
            Volume = volume or 0.1,
            Pitch = pitch or 1,
            Parent = workspace
        })
        
        if sound then
            sound:Play()
            game:GetService("Debris"):AddItem(sound, 5)
        end
    end)
end

--// 🎨 COMPONENT: BUTTON (FIXED)
local function CreateButton(parent, config)
    config = config or {}
    
    local ButtonFrame = Create("TextButton", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Text = "",
        Parent = parent
    })
    
    if not ButtonFrame then return nil end
    
    AddCorner(ButtonFrame, 8)
    AddStroke(ButtonFrame, Nexus.Theme.Outline, 1, 0.7)
    
    local ButtonText = Create("TextLabel", {
        Size = UDim2.new(1, -10, 1, 0),
        Position = UDim2.fromOffset(5, 0),
        BackgroundTransparency = 1,
        Text = config.Text or "Button",
        TextColor3 = Nexus.Theme.Text,
        TextScaled = true,
        Font = Enum.Font.GothamMedium,
        TextSize = 14,
        Parent = ButtonFrame
    })
    
    -- Safe click handling
    local clickConnection = ButtonFrame.MouseButton1Click:Connect(function()
        PlaySound("6895079853", 0.08)
        
        -- Visual feedback with safety
        Tween(ButtonFrame, {Size = UDim2.new(1, 0, 0, 38)}, 0.1)
        task.wait(0.1)
        Tween(ButtonFrame, {Size = UDim2.new(1, 0, 0, 40)}, 0.1)
        
        if config.Callback then
            pcall(config.Callback)
        end
    end)
    
    table.insert(Nexus.Connections, clickConnection)
    
    return {
        Frame = ButtonFrame,
        Text = ButtonText,
        SetText = function(newText)
            if ButtonText then
                ButtonText.Text = tostring(newText)
            end
        end
    }
end

--// 🔄 COMPONENT: TOGGLE (FIXED)
local function CreateToggle(parent, config)
    config = config or {}
    local ToggleValue = config.Default or false
    
    local ToggleFrame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    if not ToggleFrame then return nil end
    
    AddCorner(ToggleFrame, 8)
    AddStroke(ToggleFrame, Nexus.Theme.Outline, 1, 0.7)
    
    local ToggleText = Create("TextLabel", {
        Size = UDim2.new(1, -60, 1, 0),
        Position = UDim2.fromOffset(15, 0),
        BackgroundTransparency = 1,
        Text = config.Text or "Toggle",
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
        if not ToggleButton or not ToggleIndicator then return end
        
        if ToggleValue then
            Tween(ToggleButton, {BackgroundColor3 = Nexus.Theme.Accent}, 0.2)
            Tween(ToggleIndicator, {Position = UDim2.fromOffset(18, 3)}, 0.2)
        else
            Tween(ToggleButton, {BackgroundColor3 = Color3.fromRGB(100, 100, 100)}, 0.2)
            Tween(ToggleIndicator, {Position = UDim2.fromOffset(3, 3)}, 0.2)
        end
    end
    
    UpdateToggle()
    
    local toggleConnection = ToggleButton.MouseButton1Click:Connect(function()
        ToggleValue = not ToggleValue
        UpdateToggle()
        PlaySound("6895079853", 0.06)
        
        if config.Flag then
            Nexus.Flags[config.Flag] = ToggleValue
        end
        
        if config.Callback then
            pcall(config.Callback, ToggleValue)
        end
    end)
    
    table.insert(Nexus.Connections, toggleConnection)
    
    if config.Flag then
        Nexus.Registry[config.Flag] = {
            Set = function(value)
                ToggleValue = value
                UpdateToggle()
                if config.Callback then
                    pcall(config.Callback, ToggleValue)
                end
            end,
            Get = function()
                return ToggleValue
            end
        }
        Nexus.Flags[config.Flag] = ToggleValue
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

--// 🏢 WINDOW CREATION (ULTRA-FIXED)
function Nexus:CreateWindow(config)
    config = config or {}
    
    -- Destroy existing UI safely
    pcall(function()
        if Nexus.ScreenGui then
            Nexus.ScreenGui:Destroy()
        end
    end)
    
    local ScreenGui = Create("ScreenGui", {
        Name = "NexusUI",
        Parent = CoreGui,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        IgnoreGuiInset = true
    })
    
    if not ScreenGui then
        error("[Nexus] Failed to create ScreenGui")
        return
    end
    
    Nexus.ScreenGui = ScreenGui
    
    local WindowSize = config.Size or UDim2.fromOffset(580, 460)
    local MainWindow = Create("Frame", {
        Name = "MainWindow",
        Size = WindowSize,
        Position = UDim2.new(0.5, -WindowSize.X.Offset/2, 0.5, -WindowSize.Y.Offset/2),
        BackgroundColor3 = Nexus.Theme.Background,
        BorderSizePixel = 0,
        Parent = ScreenGui
    })
    
    AddCorner(MainWindow, 12)
    
    -- Simple title bar
    local TitleBar = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = MainWindow
    })
    
    AddCorner(TitleBar, 12)
    
    local TitleLabel = Create("TextLabel", {
        Size = UDim2.new(1, -50, 1, 0),
        Position = UDim2.fromOffset(15, 0),
        BackgroundTransparency = 1,
        Text = config.Title or "Nexus UI",
        TextColor3 = Nexus.Theme.Text,
        TextScaled = true,
        Font = Enum.Font.GothamBold,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TitleBar
    })
    
    -- Close button
    local CloseButton = Create("TextButton", {
        Size = UDim2.fromOffset(30, 30),
        Position = UDim2.new(1, -35, 0, 5),
        BackgroundColor3 = Nexus.Theme.Error,
        BorderSizePixel = 0,
        Text = "X",
        TextColor3 = Color3.new(1, 1, 1),
        TextScaled = true,
        Font = Enum.Font.GothamBold,
        Parent = TitleBar
    })
    
    AddCorner(CloseButton, 15)
    
    CloseButton.MouseButton1Click:Connect(function()
        pcall(function()
            ScreenGui:Destroy()
        end)
    end)
    
    -- Content area
    local ContentFrame = Create("Frame", {
        Size = UDim2.new(1, -20, 1, -60),
        Position = UDim2.fromOffset(10, 50),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = MainWindow
    })
    
    AddCorner(ContentFrame, 8)
    
    local ContentScroll = Create("ScrollingFrame", {
        Size = UDim2.new(1, -16, 1, -16),
        Position = UDim2.fromOffset(8, 8),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = Nexus.Theme.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Parent = ContentFrame
    })
    
    local ContentLayout = Create("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 8),
        Parent = ContentScroll
    })
    
    local ContentPadding = Create("UIPadding", {
        PaddingAll = UDim.new(0, 8),
        Parent = ContentScroll
    })
    
    -- Auto-resize canvas
    ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ContentScroll.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 16)
    end)
    
    -- Window API
    local WindowAPI = {
        Window = MainWindow,
        ScreenGui = ScreenGui,
        ContentScroll = ContentScroll,
        
        -- Direct component creation
        Button = function(self, config)
            return CreateButton(ContentScroll, config)
        end,
        
        Toggle = function(self, config)
            return CreateToggle(ContentScroll, config)
        end,
        
        Label = function(self, config)
            local label = Create("TextLabel", {
                Size = UDim2.new(1, 0, 0, 25),
                BackgroundTransparency = 1,
                Text = config.Text or "Label",
                TextColor3 = Nexus.Theme.Text,
                TextScaled = true,
                Font = Enum.Font.Gotham,
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = ContentScroll
            })
            
            return {
                Frame = label,
                SetText = function(text)
                    if label then
                        label.Text = tostring(text)
                    end
                end
            }
        end
    }
    
    return WindowAPI
end

-- Cleanup
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
end

return Nexus