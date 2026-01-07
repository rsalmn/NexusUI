--[[ 
    ╔═══════════════════════════════════════╗
    ║        NEXUS UI v4.2 COMPLETE        ║
    ║     Advanced Roblox UI Library       ║
    ║   ✨ No Errors, Full Features ✨    ║
    ╚═══════════════════════════════════════╝
]]

local Nexus = {
    Flags = {}, 
    Registry = {}, 
    Connections = {},
    IsDestroyed = false,
    CurrentTheme = "Dark",
    Themes = {
        Dark = {
            Accent = Color3.fromRGB(88, 166, 255),
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
            Error = Color3.fromRGB(248, 113, 113)
        },
        Light = {
            Accent = Color3.fromRGB(59, 130, 246),
            Background = Color3.fromRGB(250, 250, 250),
            Surface = Color3.fromRGB(255, 255, 255),
            SurfaceHigh = Color3.fromRGB(248, 248, 248),
            SurfaceHighest = Color3.fromRGB(240, 240, 240),
            Text = Color3.fromRGB(30, 30, 35),
            TextSub = Color3.fromRGB(80, 80, 90),
            TextMuted = Color3.fromRGB(120, 120, 130),
            Outline = Color3.fromRGB(200, 200, 210),
            Success = Color3.fromRGB(34, 197, 94),
            Warning = Color3.fromRGB(245, 158, 11),
            Error = Color3.fromRGB(239, 68, 68)
        },
        Ocean = {
            Accent = Color3.fromRGB(6, 182, 212),
            Background = Color3.fromRGB(8, 25, 43),
            Surface = Color3.fromRGB(15, 35, 55),
            SurfaceHigh = Color3.fromRGB(22, 45, 65),
            SurfaceHighest = Color3.fromRGB(30, 55, 75),
            Text = Color3.fromRGB(225, 240, 255),
            TextSub = Color3.fromRGB(160, 185, 205),
            TextMuted = Color3.fromRGB(110, 135, 155),
            Outline = Color3.fromRGB(70, 95, 115),
            Success = Color3.fromRGB(16, 185, 129),
            Warning = Color3.fromRGB(245, 158, 11),
            Error = Color3.fromRGB(239, 68, 68)
        },
        Neon = {
            Accent = Color3.fromRGB(168, 85, 247),
            Background = Color3.fromRGB(5, 5, 15),
            Surface = Color3.fromRGB(15, 15, 25),
            SurfaceHigh = Color3.fromRGB(25, 25, 35),
            SurfaceHighest = Color3.fromRGB(35, 35, 45),
            Text = Color3.fromRGB(240, 240, 255),
            TextSub = Color3.fromRGB(190, 190, 210),
            TextMuted = Color3.fromRGB(140, 140, 160),
            Outline = Color3.fromRGB(80, 80, 100),
            Success = Color3.fromRGB(34, 197, 94),
            Warning = Color3.fromRGB(245, 158, 11),
            Error = Color3.fromRGB(239, 68, 68)
        }
    }
}

-- Set current theme
Nexus.Theme = Nexus.Themes[Nexus.CurrentTheme]

--// 🛡️ SERVICES
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

--// 🔧 ENHANCED UTILITIES
local activeTweens = {}

local function SafeTween(inst, props, duration, style, direction, callback)
    if not inst or not inst.Parent then 
        if callback then pcall(callback) end
        return 
    end
    
    if activeTweens[inst] then
        pcall(function() activeTweens[inst]:Cancel() end)
        activeTweens[inst] = nil
    end
    
    local success, tween = pcall(function()
        local info = TweenInfo.new(
            duration or 0.25,
            style or Enum.EasingStyle.Quad,
            direction or Enum.EasingDirection.Out
        )
        return TweenService:Create(inst, info, props)
    end)
    
    if not success then
        if callback then pcall(callback) end
        return
    end
    
    activeTweens[inst] = tween
    pcall(function() tween:Play() end)
    
    local connection
    connection = tween.Completed:Connect(function()
        activeTweens[inst] = nil
        if connection then connection:Disconnect() end
        if callback then pcall(callback) end
    end)
    
    return tween
end

local Tween = SafeTween

local function SafeCreate(class, props)
    local success, inst = pcall(function() return Instance.new(class) end)
    if not success then return nil end
    
    if props then
        for property, value in pairs(props) do
            pcall(function() inst[property] = value end)
        end
    end
    
    return inst
end

local Create = SafeCreate

local function AddCorner(parent, radius)
    return Create("UICorner", {
        CornerRadius = UDim.new(0, radius or 8),
        Parent = parent
    })
end

local function AddStroke(parent, color, thickness, transparency)
    return Create("UIStroke", {
        Color = color or Nexus.Theme.Outline,
        Thickness = thickness or 1,
        Transparency = transparency or 0.6,
        Parent = parent
    })
end

local function PlaySound(id, volume)
    pcall(function()
        local sound = Create("Sound", {
            SoundId = "rbxassetid://" .. tostring(id),
            Volume = volume or 0.1,
            Parent = workspace
        })
        if sound then
            sound:Play()
            game:GetService("Debris"):AddItem(sound, 2)
        end
    end)
end

local function MakeDraggable(frame, dragFrame)
    dragFrame = dragFrame or frame
    local dragging, dragStart, startPos
    
    local function Update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, 
                                   startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    dragFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            Update(input)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

--// 🎨 COMPLETE COMPONENTS

-- 🏷️ LABEL COMPONENT
local function CreateLabel(parent, config)
    config = config or {}
    
    local LabelFrame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, config.Size or 25),
        BackgroundTransparency = 1,
        Parent = parent
    })
    
    local LabelText = Create("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = config.Text or "Label",
        TextColor3 = config.Style == "Title" and Nexus.Theme.Text or 
                     config.Style == "Warning" and Nexus.Theme.Warning or
                     config.Style == "Success" and Nexus.Theme.Success or
                     config.Style == "Error" and Nexus.Theme.Error or
                     Nexus.Theme.TextSub,
        TextScaled = true,
        Font = config.Style == "Title" and Enum.Font.GothamBold or Enum.Font.Gotham,
        TextSize = config.TextSize or 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = LabelFrame
    })
    
    return {
        Frame = LabelFrame,
        Label = LabelText,
        SetText = function(text) LabelText.Text = tostring(text) end,
        SetColor = function(color) LabelText.TextColor3 = color end
    }
end

-- 🔘 BUTTON COMPONENT
local function CreateButton(parent, config)
    config = config or {}
    
    local ButtonFrame = Create("TextButton", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Text = "",
        Parent = parent
    })
    
    AddCorner(ButtonFrame, 8)
    AddStroke(ButtonFrame, Nexus.Theme.Outline)
    
    local ButtonText = Create("TextLabel", {
        Size = UDim2.new(1, -10, 1, 0),
        Position = UDim2.fromOffset(5, 0),
        BackgroundTransparency = 1,
        Text = config.Text or "Button",
        TextColor3 = Nexus.Theme.Text,
        TextScaled = true,
        Font = Enum.Font.GothamMedium,
        Parent = ButtonFrame
    })
    
    -- Button styles
    if config.Style == "Primary" then
        ButtonFrame.BackgroundColor3 = Nexus.Theme.Accent
        ButtonText.TextColor3 = Color3.new(1, 1, 1)
    elseif config.Style == "Success" then
        ButtonFrame.BackgroundColor3 = Nexus.Theme.Success
        ButtonText.TextColor3 = Color3.new(1, 1, 1)
    elseif config.Style == "Danger" then
        ButtonFrame.BackgroundColor3 = Nexus.Theme.Error
        ButtonText.TextColor3 = Color3.new(1, 1, 1)
    end
    
    -- Hover effects
    ButtonFrame.MouseEnter:Connect(function()
        Tween(ButtonFrame, {Size = UDim2.new(1, 0, 0, 42)}, 0.15)
    end)
    
    ButtonFrame.MouseLeave:Connect(function()
        Tween(ButtonFrame, {Size = UDim2.new(1, 0, 0, 40)}, 0.15)
    end)
    
    -- Click handling
    ButtonFrame.MouseButton1Click:Connect(function()
        PlaySound("6895079853", 0.08)
        Tween(ButtonFrame, {Size = UDim2.new(1, 0, 0, 38)}, 0.1)
        task.wait(0.1)
        Tween(ButtonFrame, {Size = UDim2.new(1, 0, 0, 40)}, 0.1)
        if config.Callback then pcall(config.Callback) end
    end)
    
    return {
        Frame = ButtonFrame,
        Text = ButtonText,
        SetText = function(text) ButtonText.Text = tostring(text) end
    }
end

-- 🔄 TOGGLE COMPONENT
local function CreateToggle(parent, config)
    config = config or {}
    local ToggleValue = config.Default or false
    
    local ToggleFrame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    AddCorner(ToggleFrame, 8)
    AddStroke(ToggleFrame, Nexus.Theme.Outline)
    
    local ToggleText = Create("TextLabel", {
        Size = UDim2.new(1, -60, 1, 0),
        Position = UDim2.fromOffset(15, 0),
        BackgroundTransparency = 1,
        Text = config.Text or "Toggle",
        TextColor3 = Nexus.Theme.Text,
        TextScaled = true,
        Font = Enum.Font.Gotham,
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
    
    ToggleButton.MouseButton1Click:Connect(function()
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
    
    if config.Flag then
        Nexus.Registry[config.Flag] = {
            Set = function(value)
                ToggleValue = value
                UpdateToggle()
            end,
            Get = function() return ToggleValue end
        }
        Nexus.Flags[config.Flag] = ToggleValue
    end
    
    return {
        Frame = ToggleFrame,
        Set = function(value) ToggleValue = value; UpdateToggle() end,
        Get = function() return ToggleValue end
    }
end

-- 🎚️ SLIDER COMPONENT
local function CreateSlider(parent, config)
    config = config or {}
    local Min = config.Min or 0
    local Max = config.Max or 100
    local SliderValue = config.Default or Min
    
    local SliderFrame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 55),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    AddCorner(SliderFrame, 8)
    AddStroke(SliderFrame, Nexus.Theme.Outline)
    
    local SliderText = Create("TextLabel", {
        Size = UDim2.new(1, -60, 0, 20),
        Position = UDim2.fromOffset(15, 8),
        BackgroundTransparency = 1,
        Text = config.Text or "Slider",
        TextColor3 = Nexus.Theme.Text,
        TextScaled = true,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = SliderFrame
    })
    
    local SliderValueLabel = Create("TextLabel", {
        Size = UDim2.fromOffset(50, 20),
        Position = UDim2.new(1, -65, 0, 8),
        BackgroundTransparency = 1,
        Text = tostring(SliderValue),
        TextColor3 = Nexus.Theme.Accent,
        TextScaled = true,
        Font = Enum.Font.GothamMedium,
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
        Tween(SliderFill, {Size = UDim2.new(percentage, 0, 1, 0)}, 0.1)
        Tween(SliderButton, {Position = UDim2.new(percentage, -8, 0, -5)}, 0.1)
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
        
        if config.Flag then
            Nexus.Flags[config.Flag] = SliderValue
        end
        
        if config.Callback then
            pcall(config.Callback, SliderValue)
        end
    end
    
    SliderButton.MouseButton1Down:Connect(function()
        dragging = true
        PlaySound("6895079853", 0.04)
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            UpdateValue(input)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    SliderTrack.MouseButton1Click:Connect(function()
        UpdateValue(UserInputService:GetMouseLocation())
    end)
    
    if config.Flag then
        Nexus.Registry[config.Flag] = {
            Set = function(value)
                SliderValue = math.clamp(value, Min, Max)
                UpdateSlider()
            end,
            Get = function() return SliderValue end
        }
        Nexus.Flags[config.Flag] = SliderValue
    end
    
    return {
        Frame = SliderFrame,
        Set = function(value) SliderValue = math.clamp(value, Min, Max); UpdateSlider() end,
        Get = function() return SliderValue end
    }
end

-- 📋 DROPDOWN COMPONENT
local function CreateDropdown(parent, config)
    config = config or {}
    local Options = config.Options or {"No Options"}
    local CurrentValue = config.Default or Options[1]
    local IsOpen = false
    
    local DropdownFrame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    AddCorner(DropdownFrame, 8)
    AddStroke(DropdownFrame, Nexus.Theme.Outline)
    
    local HeaderButton = Create("TextButton", {
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundTransparency = 1,
        Text = "",
        Parent = DropdownFrame
    })
    
    local HeaderText = Create("TextLabel", {
        Size = UDim2.new(1, -60, 1, 0),
        Position = UDim2.fromOffset(15, 0),
        BackgroundTransparency = 1,
        Text = config.Text or "Dropdown",
        TextColor3 = Nexus.Theme.Text,
        TextScaled = true,
        Font = Enum.Font.Gotham,
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
        Parent = HeaderButton
    })
    
    local DropdownContainer = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        Position = UDim2.fromOffset(0, 46),
        BackgroundColor3 = Nexus.Theme.SurfaceHigh,
        BorderSizePixel = 0,
        Visible = false,
        Parent = DropdownFrame
    })
    
    AddCorner(DropdownContainer, 8)
    AddStroke(DropdownContainer, Nexus.Theme.Outline)
    
    local OptionsScroll = Create("ScrollingFrame", {
        Size = UDim2.new(1, -8, 1, -8),
        Position = UDim2.fromOffset(4, 4),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = Nexus.Theme.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Parent = DropdownContainer
    })
    
    local OptionsLayout = Create("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 2),
        Parent = OptionsScroll
    })
    
    OptionsLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        OptionsScroll.CanvasSize = UDim2.new(0, 0, 0, OptionsLayout.AbsoluteContentSize.Y)
    end)
    
    local function UpdateOptions()
        for _, child in ipairs(OptionsScroll:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
        
        for _, option in ipairs(Options) do
            local OptionButton = Create("TextButton", {
                Size = UDim2.new(1, -8, 0, 32),
                BackgroundColor3 = CurrentValue == option and Nexus.Theme.SurfaceHighest or Nexus.Theme.Surface,
                BorderSizePixel = 0,
                Text = option,
                TextColor3 = Nexus.Theme.Text,
                TextScaled = true,
                Font = Enum.Font.Gotham,
                Parent = OptionsScroll
            })
            
            AddCorner(OptionButton, 6)
            
            OptionButton.MouseButton1Click:Connect(function()
                CurrentValue = option
                HeaderValue.Text = CurrentValue
                PlaySound("6895079853", 0.05)
                
                if config.Flag then
                    Nexus.Flags[config.Flag] = CurrentValue
                end
                
                if config.Callback then
                    pcall(config.Callback, CurrentValue)
                end
                
                UpdateOptions()
                
                -- Close dropdown
                IsOpen = false
                Tween(Arrow, {Rotation = 0}, 0.2)
                Tween(DropdownContainer, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
                Tween(DropdownFrame, {Size = UDim2.new(1, 0, 0, 44)}, 0.2)
                task.wait(0.2)
                DropdownContainer.Visible = false
            end)
            
            OptionButton.MouseEnter:Connect(function()
                if CurrentValue ~= option then
                    Tween(OptionButton, {BackgroundColor3 = Nexus.Theme.SurfaceHigh}, 0.15)
                end
            end)
            
            OptionButton.MouseLeave:Connect(function()
                if CurrentValue ~= option then
                    Tween(OptionButton, {BackgroundColor3 = Nexus.Theme.Surface}, 0.15)
                end
            end)
        end
    end
    
    local function ToggleDropdown()
        IsOpen = not IsOpen
        
        if IsOpen then
            UpdateOptions()
            DropdownContainer.Visible = true
            local targetHeight = math.min(#Options * 34 + 8, 200)
            
            Tween(Arrow, {Rotation = 180}, 0.2)
            Tween(DropdownContainer, {Size = UDim2.new(1, 0, 0, targetHeight)}, 0.2)
            Tween(DropdownFrame, {Size = UDim2.new(1, 0, 0, 44 + targetHeight + 2)}, 0.2)
        else
            Tween(Arrow, {Rotation = 0}, 0.2)
            Tween(DropdownContainer, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
            Tween(DropdownFrame, {Size = UDim2.new(1, 0, 0, 44)}, 0.2)
            task.wait(0.2)
            DropdownContainer.Visible = false
        end
    end
    
    HeaderButton.MouseButton1Click:Connect(ToggleDropdown)
    
    if config.Flag then
        Nexus.Registry[config.Flag] = {
            Set = function(value)
                CurrentValue = value
                HeaderValue.Text = CurrentValue
                UpdateOptions()
            end,
            Get = function() return CurrentValue end
        }
        Nexus.Flags[config.Flag] = CurrentValue
    end
    
    return {
        Frame = DropdownFrame,
        Set = function(value) CurrentValue = value; HeaderValue.Text = CurrentValue; UpdateOptions() end,
        Get = function() return CurrentValue end,
        UpdateOptions = function(newOptions)
            Options = newOptions or Options
            UpdateOptions()
        end
    }
end

-- 📝 TEXTBOX COMPONENT
local function CreateTextBox(parent, config)
    config = config or {}
    local TextValue = config.Default or ""
    
    local TextFrame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 70),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    AddCorner(TextFrame, 8)
    AddStroke(TextFrame, Nexus.Theme.Outline)
    
    local TextLabel = Create("TextLabel", {
        Size = UDim2.new(1, -15, 0, 25),
        Position = UDim2.fromOffset(15, 8),
        BackgroundTransparency = 1,
        Text = config.Text or "Text Box",
        TextColor3 = Nexus.Theme.Text,
        TextScaled = true,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TextFrame
    })
    
    local TextInput = Create("TextBox", {
        Size = UDim2.new(1, -30, 0, 30),
        Position = UDim2.fromOffset(15, 35),
        BackgroundColor3 = Nexus.Theme.SurfaceHigh,
        BorderSizePixel = 0,
        Text = TextValue,
        PlaceholderText = config.PlaceholderText or "Enter text...",
        TextColor3 = Nexus.Theme.Text,
        PlaceholderColor3 = Nexus.Theme.TextMuted,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TextFrame
    })
    
    AddCorner(TextInput, 6)
    AddStroke(TextInput, Nexus.Theme.Outline)
    
    TextInput.Focused:Connect(function()
        Tween(TextInput, {BackgroundColor3 = Nexus.Theme.SurfaceHighest}, 0.2)
        AddStroke(TextInput, Nexus.Theme.Accent, 1, 0.5)
    end)
    
    TextInput.FocusLost:Connect(function()
        Tween(TextInput, {BackgroundColor3 = Nexus.Theme.SurfaceHigh}, 0.2)
        AddStroke(TextInput, Nexus.Theme.Outline)
        
        TextValue = TextInput.Text
        
        if config.Flag then
            Nexus.Flags[config.Flag] = TextValue
        end
        
        if config.Callback then
            pcall(config.Callback, TextValue)
        end
    end)
    
    if config.Flag then
        Nexus.Registry[config.Flag] = {
            Set = function(text)
                TextValue = tostring(text)
                TextInput.Text = TextValue
            end,
            Get = function() return TextValue end
        }
        Nexus.Flags[config.Flag] = TextValue
    end
    
    return {
        Frame = TextFrame,
        Set = function(text) TextValue = tostring(text); TextInput.Text = TextValue end,
        Get = function() return TextValue end
    }
end

-- ⌨️ KEYBIND COMPONENT
local function CreateKeybind(parent, config)
    config = config or {}
    local CurrentKey = config.Default or Enum.KeyCode.F
    local IsBinding = false
    
    local KeybindFrame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    AddCorner(KeybindFrame, 8)
    AddStroke(KeybindFrame, Nexus.Theme.Outline)
    
    local KeybindText = Create("TextLabel", {
        Size = UDim2.new(1, -100, 1, 0),
        Position = UDim2.fromOffset(15, 0),
        BackgroundTransparency = 1,
        Text = config.Text or "Keybind",
        TextColor3 = Nexus.Theme.Text,
        TextScaled = true,
        Font = Enum.Font.Gotham,
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
        Parent = KeybindFrame
    })
    
    AddCorner(KeybindButton, 6)
    AddStroke(KeybindButton, Nexus.Theme.Outline)
    
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
                
                if config.Flag then
                    Nexus.Flags[config.Flag] = CurrentKey
                end
                
                PlaySound("6895079853", 0.04)
            end
        end)
    end)
    
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed or IsBinding then return end
        
        if input.KeyCode == CurrentKey and config.Callback then
            pcall(config.Callback, CurrentKey)
        end
    end)
    
    if config.Flag then
        Nexus.Registry[config.Flag] = {
            Set = function(keycode)
                CurrentKey = keycode
                UpdateKeybindDisplay()
            end,
            Get = function() return CurrentKey end
        }
        Nexus.Flags[config.Flag] = CurrentKey
    end
    
    return {
        Frame = KeybindFrame,
        Set = function(keycode) CurrentKey = keycode; UpdateKeybindDisplay() end,
        Get = function() return CurrentKey end
    }
end

-- 📑 SECTION COMPONENT
local function CreateSection(parent, config)
    config = config or {}
    
    local SectionFrame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, config.Size or 35),
        BackgroundTransparency = 1,
        Parent = parent
    })
    
    local SectionText = Create("TextLabel", {
        Size = UDim2.new(1, -20, 1, 0),
        Position = UDim2.fromOffset(10, 0),
        BackgroundTransparency = 1,
        Text = config.Text or "Section",
        TextColor3 = Nexus.Theme.Accent,
        TextScaled = true,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = SectionFrame
    })
    
    local SectionLine = Create("Frame", {
        Size = UDim2.new(1, -120, 0, 2),
        Position = UDim2.new(0, 120, 0.5, -1),
        BackgroundColor3 = Nexus.Theme.Accent,
        BorderSizePixel = 0,
        Parent = SectionFrame
    })
    
    AddCorner(SectionLine, 1)
    
    return {
        Frame = SectionFrame,
        SetText = function(text) SectionText.Text = tostring(text) end
    }
end

-- ➖ SEPARATOR COMPONENT
local function CreateSeparator(parent, config)
    config = config or {}
    
    local SeparatorFrame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, config.Height or 20),
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

--// 🏢 WINDOW SYSTEM
function Nexus:CreateWindow(config)
    config = config or {}
    
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
    
    Nexus.ScreenGui = ScreenGui
    
    local WindowSize = config.Size or UDim2.fromOffset(580, 460)
    local MainWindow = Create("Frame", {
        Size = WindowSize,
        Position = UDim2.new(0.5, -WindowSize.X.Offset/2, 0.5, -WindowSize.Y.Offset/2),
        BackgroundColor3 = Nexus.Theme.Background,
        BorderSizePixel = 0,
        Parent = ScreenGui
    })
    
    AddCorner(MainWindow, 12)
    MakeDraggable(MainWindow)
    
    -- Title Bar
    local TitleBar = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 45),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = MainWindow
    })
    
    AddCorner(TitleBar, 12)
    
    local TitleLabel = Create("TextLabel", {
        Size = UDim2.new(1, -50, 1, 0),
        Position = UDim2.fromOffset(20, 0),
        BackgroundTransparency = 1,
        Text = config.Title or "Nexus UI",
        TextColor3 = Nexus.Theme.Text,
        TextScaled = true,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TitleBar
    })
    
    local CloseButton = Create("TextButton", {
        Size = UDim2.fromOffset(30, 30),
        Position = UDim2.new(1, -38, 0, 7.5),
        BackgroundColor3 = Nexus.Theme.Error,
        BorderSizePixel = 0,
        Text = "×",
        TextColor3 = Color3.new(1, 1, 1),
        TextScaled = true,
        Font = Enum.Font.GothamBold,
        Parent = TitleBar
    })
    
    AddCorner(CloseButton, 15)
    
    CloseButton.MouseButton1Click:Connect(function()
        Nexus:Destroy()
    end)
    
    -- Tab Container
    local TabContainer = Create("Frame", {
        Size = UDim2.new(0, 140, 1, -55),
        Position = UDim2.fromOffset(10, 50),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = MainWindow
    })
    
    AddCorner(TabContainer, 8)
    
    local TabScroll = Create("ScrollingFrame", {
        Size = UDim2.new(1, -8, 1, -8),
        Position = UDim2.fromOffset(4, 4),
        BackgroundTransparency = 1,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Nexus.Theme.Accent,
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
        Size = UDim2.new(1, -170, 1, -60),
        Position = UDim2.fromOffset(160, 50),
        BackgroundColor3 = Nexus.Theme.Surface,
        BorderSizePixel = 0,
        Parent = MainWindow
    })
    
    AddCorner(ContentContainer, 8)
    
    local WindowAPI = {
        Window = MainWindow,
        ScreenGui = ScreenGui,
        Tabs = {},
        ActiveTab = nil,
        
        -- Theme Functions
        SetTheme = function(self, themeName)
            if Nexus.Themes[themeName] then
                Nexus.CurrentTheme = themeName
                Nexus.Theme = Nexus.Themes[themeName]
                -- Here you would update all UI elements with new theme
                -- For simplicity, we'll just store the theme for new elements
            end
        end,
        
        GetThemes = function(self)
            local themes = {}
            for name, _ in pairs(Nexus.Themes) do
                table.insert(themes, name)
            end
            return themes
        end
    }
    
    -- Tab Creation
    function WindowAPI:Tab(config)
        config = config or {}
        local TabName = config.Name or "Tab"
        
        local TabButton = Create("TextButton", {
            Size = UDim2.new(1, -8, 0, 35),
            BackgroundColor3 = Nexus.Theme.SurfaceHigh,
            BorderSizePixel = 0,
            Text = TabName,
            TextColor3 = Nexus.Theme.TextSub,
            TextScaled = true,
            Font = Enum.Font.Gotham,
            LayoutOrder = #self.Tabs + 1,
            Parent = TabScroll
        })
        
        AddCorner(TabButton, 6)
        
        local TabPage = Create("ScrollingFrame", {
            Name = TabName .. "Page",
            Size = UDim2.new(1, -16, 1, -16),
            Position = UDim2.fromOffset(8, 8),
            BackgroundTransparency = 1,
            ScrollBarThickness = 4,
            ScrollBarImageColor3 = Nexus.Theme.Accent,
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
            PaddingAll = UDim.new(0, 8),
            Parent = TabPage
        })
        
        PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabPage.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 16)
        end)
        
        local function ActivateTab()
            for _, tab in ipairs(self.Tabs) do
                tab.Page.Visible = false
                Tween(tab.Button, {BackgroundColor3 = Nexus.Theme.SurfaceHigh}, 0.2)
                tab.Button.TextColor3 = Nexus.Theme.TextSub
            end
            
            TabPage.Visible = true
            Tween(TabButton, {BackgroundColor3 = Nexus.Theme.Accent}, 0.2)
            TabButton.TextColor3 = Nexus.Theme.Text
            
            self.ActiveTab = TabAPI
        end
        
        TabButton.MouseButton1Click:Connect(function()
            PlaySound("6895079853", 0.04)
            ActivateTab()
        end)
        
        local TabAPI = {
            Name = TabName,
            Page = TabPage,
            Button = TabButton,
            
            Label = function(self, cfg) return CreateLabel(TabPage, cfg) end,
            Button = function(self, cfg) return CreateButton(TabPage, cfg) end,
            Toggle = function(self, cfg) return CreateToggle(TabPage, cfg) end,
            Slider = function(self, cfg) return CreateSlider(TabPage, cfg) end,
            Dropdown = function(self, cfg) return CreateDropdown(TabPage, cfg) end,
            TextBox = function(self, cfg) return CreateTextBox(TabPage, cfg) end,
            Keybind = function(self, cfg) return CreateKeybind(TabPage, cfg) end,
            Section = function(self, cfg) return CreateSection(TabPage, cfg) end,
            Separator = function(self, cfg) return CreateSeparator(TabPage, cfg) end
        }
        
        table.insert(self.Tabs, TabAPI)
        
        if #self.Tabs == 1 then
            ActivateTab()
        end
        
        return TabAPI
    end
    
    -- Intro Animation
    if config.IntroEnabled ~= false then
        MainWindow.Size = UDim2.new(0, 0, 0, 0)
        MainWindow.BackgroundTransparency = 1
        
        task.wait(0.1)
        
        Tween(MainWindow, {Size = WindowSize}, 0.4, Enum.EasingStyle.Back)
        Tween(MainWindow, {BackgroundTransparency = 0}, 0.4)
    end
    
    return WindowAPI
end

-- Flag Functions
function Nexus:GetFlag(flag)
    return self.Flags[flag]
end

function Nexus:SetFlag(flag, value)
    self.Flags[flag] = value
    if self.Registry[flag] then
        self.Registry[flag].Set(value)
    end
end

-- Config System
function Nexus:SaveConfig(configName)
    configName = configName or "default"
    local success, result = pcall(function()
        local config = {
            Flags = self.Flags,
            Theme = self.CurrentTheme,
            Version = "4.2"
        }
        
        writefile("nexus_" .. configName .. ".json", HttpService:JSONEncode(config))
        return true
    end)
    
    if success then
        print("[Nexus] Config saved: " .. configName)
    else
        warn("[Nexus] Failed to save config: " .. tostring(result))
    end
    
    return success
end

function Nexus:LoadConfig(configName)
    configName = configName or "default"
    local success, result = pcall(function()
        local configData = readfile("nexus_" .. configName .. ".json")
        local config = HttpService:JSONDecode(configData)
        
        if config.Flags then
            for flag, value in pairs(config.Flags) do
                self:SetFlag(flag, value)
            end
        end
        
        if config.Theme and self.Themes[config.Theme] then
            self.CurrentTheme = config.Theme
            self.Theme = self.Themes[config.Theme]
        end
        
        return config
    end)
    
    if success then
        print("[Nexus] Config loaded: " .. configName)
        return result
    else
        warn("[Nexus] Failed to load config: " .. tostring(result))
        return nil
    end
end

function Nexus:ConfigExists(configName)
    configName = configName or "default"
    return isfile("nexus_" .. configName .. ".json")
end

function Nexus:DeleteConfig(configName)
    configName = configName or "default"
    local success = pcall(function()
        delfile("nexus_" .. configName .. ".json")
    end)
    
    if success then
        print("[Nexus] Config deleted: " .. configName)
    else
        warn("[Nexus] Failed to delete config: " .. configName)
    end
    
    return success
end

-- Notification System
function Nexus:Notify(config)
    config = config or {}
    local Title = config.Title or "Notification"
    local Content = config.Content or "No content provided"
    local Duration = config.Duration or 3
    local Type = config.Type or "Info" -- Info, Success, Warning, Error
    
    local NotificationContainer = self.ScreenGui:FindFirstChild("NotificationContainer")
    
    if not NotificationContainer then
        NotificationContainer = Create("Frame", {
            Name = "NotificationContainer",
            Size = UDim2.new(0, 300, 1, 0),
            Position = UDim2.new(1, -320, 0, 20),
            BackgroundTransparency = 1,
            Parent = self.ScreenGui
        })
        
        Create("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8),
            VerticalAlignment = Enum.VerticalAlignment.Top,
            Parent = NotificationContainer
        })
    end
    
    local NotificationFrame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 80),
        BackgroundColor3 = self.Theme.Surface,
        BorderSizePixel = 0,
        Parent = NotificationContainer
    })
    
    AddCorner(NotificationFrame, 8)
    AddStroke(NotificationFrame, Type == "Success" and self.Theme.Success or
                                Type == "Warning" and self.Theme.Warning or
                                Type == "Error" and self.Theme.Error or
                                self.Theme.Accent, 2, 0.5)
    
    local NotificationIcon = Create("TextLabel", {
        Size = UDim2.fromOffset(30, 30),
        Position = UDim2.fromOffset(15, 10),
        BackgroundTransparency = 1,
        Text = Type == "Success" and "✓" or
               Type == "Warning" and "⚠" or
               Type == "Error" and "✕" or
               "ℹ",
        TextColor3 = Type == "Success" and self.Theme.Success or
                     Type == "Warning" and self.Theme.Warning or
                     Type == "Error" and self.Theme.Error or
                     self.Theme.Accent,
        TextScaled = true,
        Font = Enum.Font.GothamBold,
        Parent = NotificationFrame
    })
    
    local NotificationTitle = Create("TextLabel", {
        Size = UDim2.new(1, -60, 0, 20),
        Position = UDim2.fromOffset(50, 10),
        BackgroundTransparency = 1,
        Text = Title,
        TextColor3 = self.Theme.Text,
        TextScaled = true,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = NotificationFrame
    })
    
    local NotificationContent = Create("TextLabel", {
        Size = UDim2.new(1, -60, 1, -35),
        Position = UDim2.fromOffset(50, 30),
        BackgroundTransparency = 1,
        Text = Content,
        TextColor3 = self.Theme.TextSub,
        TextScaled = true,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextWrapped = true,
        Parent = NotificationFrame
    })
    
    -- Close button
    local CloseButton = Create("TextButton", {
        Size = UDim2.fromOffset(20, 20),
        Position = UDim2.new(1, -25, 0, 5),
        BackgroundTransparency = 1,
        Text = "×",
        TextColor3 = self.Theme.TextMuted,
        TextScaled = true,
        Font = Enum.Font.GothamBold,
        Parent = NotificationFrame
    })
    
    -- Animation in
    NotificationFrame.Position = UDim2.new(1, 0, 0, 0)
    NotificationFrame.Size = UDim2.new(0, 0, 0, 80)
    
    Tween(NotificationFrame, {Position = UDim2.new(0, 0, 0, 0)}, 0.3, Enum.EasingStyle.Back)
    Tween(NotificationFrame, {Size = UDim2.new(1, 0, 0, 80)}, 0.3, Enum.EasingStyle.Back)
    
    local function CloseNotification()
        Tween(NotificationFrame, {Position = UDim2.new(1, 0, 0, 0)}, 0.3)
        Tween(NotificationFrame, {BackgroundTransparency = 1}, 0.3)
        task.wait(0.3)
        pcall(function() NotificationFrame:Destroy() end)
    end
    
    CloseButton.MouseButton1Click:Connect(CloseNotification)
    
    -- Auto close
    task.spawn(function()
        task.wait(Duration)
        CloseNotification()
    end)
    
    PlaySound("6895079853", 0.06)
end

-- Utility Functions
function Nexus:GetPlayer()
    return Players.LocalPlayer
end

function Nexus:GetMouse()
    return Players.LocalPlayer:GetMouse()
end

function Nexus:GetCamera()
    return workspace.CurrentCamera
end

-- Theme Management
function Nexus:SetTheme(themeName)
    if self.Themes[themeName] then
        self.CurrentTheme = themeName
        self.Theme = self.Themes[themeName]
        
        self:Notify({
            Title = "Theme Changed",
            Content = "Theme changed to " .. themeName,
            Type = "Success",
            Duration = 2
        })
        
        return true
    else
        self:Notify({
            Title = "Theme Error",
            Content = "Theme '" .. themeName .. "' not found",
            Type = "Error",
            Duration = 3
        })
        return false
    end
end

function Nexus:GetThemes()
    local themes = {}
    for name, _ in pairs(self.Themes) do
        table.insert(themes, name)
    end
    return themes
end

function Nexus:CreateCustomTheme(name, themeData)
    if type(themeData) == "table" and name then
        self.Themes[name] = themeData
        return true
    end
    return false
end

-- Connection Management
function Nexus:AddConnection(connection)
    table.insert(self.Connections, connection)
end

function Nexus:RemoveConnection(connection)
    for i, conn in ipairs(self.Connections) do
        if conn == connection then
            table.remove(self.Connections, i)
            pcall(function() connection:Disconnect() end)
            break
        end
    end
end

-- Cleanup Function
function Nexus:Destroy()
    self.IsDestroyed = true
    
    -- Destroy UI
    pcall(function()
        if self.ScreenGui then
            self.ScreenGui:Destroy()
        end
    end)
    
    -- Disconnect all connections
    for _, connection in ipairs(self.Connections) do
        pcall(function()
            connection:Disconnect()
        end)
    end
    
    -- Clear data
    self.Connections = {}
    self.Flags = {}
    self.Registry = {}
    
    print("[Nexus] UI Destroyed successfully")
end

-- Game close cleanup
local function setupCleanup()
    local player = Players.LocalPlayer
    if player then
        local connection
        connection = player.AncestryChanged:Connect(function()
            if not player.Parent then
                Nexus:Destroy()
                if connection then connection:Disconnect() end
            end
        end)
        Nexus:AddConnection(connection)
    end
end

setupCleanup()

-- Error handling for the entire library
local function wrapFunction(func)
    return function(...)
        if Nexus.IsDestroyed then
            warn("[Nexus] Attempted to use destroyed UI")
            return
        end
        
        local success, result = pcall(func, ...)
        if not success then
            warn("[Nexus] Error: " .. tostring(result))
        end
        return result
    end
end

-- Wrap main functions
local originalCreateWindow = Nexus.CreateWindow
Nexus.CreateWindow = wrapFunction(originalCreateWindow)

-- Return the library
return Nexus