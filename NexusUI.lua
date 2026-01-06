--[[ 
    NEXUS UI (v3.6 - Auto Theme Engine Edition)
    - Full Auto Theme Live Update
    - No manual binding
    - Framework-level theming
]]

local Nexus = {
    Flags = {},
    Registry = {},
    Theme = {
        Accent = Color3.fromRGB(0, 120, 212),
        Background = Color3.fromRGB(20, 20, 20),
        Surface = Color3.fromRGB(30, 30, 30),
        SurfaceHigh = Color3.fromRGB(40, 40, 40),
        Text = Color3.fromRGB(240, 240, 240),
        TextSub = Color3.fromRGB(170, 170, 170),
        Outline = Color3.fromRGB(60, 60, 60),
        Gradient1 = Color3.fromRGB(0, 120, 212),
        Gradient2 = Color3.fromRGB(100, 50, 255)
    }
}

--// Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local Stats = game:GetService("Stats")

--// ================================
--// AUTO THEME ENGINE (GLOBAL)
--// ================================

Nexus.ThemeChanged = Instance.new("BindableEvent")

-- Weak table = auto GC, no memory leak
Nexus._ThemeObjects = setmetatable({}, { __mode = "k" })

function Nexus:_ApplyTheme(inst)
    if inst.__NoTheme then return end

    local map = {}

    if inst:IsA("Frame") or inst:IsA("TextButton") then
        if inst.BackgroundTransparency < 1 then
            map.BackgroundColor3 = "Surface"
        end
    end

    if inst:IsA("TextLabel") or inst:IsA("TextButton") or inst:IsA("TextBox") then
        map.TextColor3 = "Text"
    end

    if inst:IsA("ImageLabel") or inst:IsA("ImageButton") then
        map.ImageColor3 = "Accent"
    end

    if inst:IsA("UIStroke") then
        map.Color = "Outline"
    end

    if inst:IsA("UIGradient") then
        inst.Color = ColorSequence.new(
            Nexus.Theme.Gradient1,
            Nexus.Theme.Gradient2
        )
    end

    if next(map) then
        Nexus._ThemeObjects[inst] = map
        for prop, themeKey in pairs(map) do
            if inst[prop] ~= nil then
                inst[prop] = Nexus.Theme[themeKey]
            end
        end
    end
end

Nexus.ThemeChanged.Event:Connect(function()
    for inst, map in pairs(Nexus._ThemeObjects) do
        if inst and inst.Parent then
            for prop, themeKey in pairs(map) do
                if inst[prop] ~= nil then
                    inst[prop] = Nexus.Theme[themeKey]
                end
            end
        end
    end
end)

--// ================================
--// HELPERS (OVERRIDDEN CREATE)
--// ================================

local function Create(class, props, children)
    local inst = Instance.new(class)

    for i, v in pairs(props or {}) do
        inst[i] = v
    end

    Nexus:_ApplyTheme(inst)

    for _, c in pairs(children or {}) do
        c.Parent = inst
    end

    return inst
end

local function AddCorner(parent, radius)
    Create("UICorner", {
        CornerRadius = UDim.new(0, radius or 6),
        Parent = parent
    })
end

local function AddStroke(parent, color, thickness)
    Create("UIStroke", {
        Color = color or Nexus.Theme.Outline,
        Thickness = thickness or 1,
        Transparency = 0.8,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = parent
    })
end

local function Tween(inst, props, time)
    TweenService:Create(
        inst,
        TweenInfo.new(time or 0.2, Enum.EasingStyle.Quad),
        props
    ):Play()
end

local function MakeDraggable(gui)
    local dragging, dragStart, startPos

    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            gui.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

--// ================================
--// THEME SYSTEM
--// ================================

function Nexus:SetTheme(themeName)
    local Themes = {
        Dark = {
            Accent = Color3.fromRGB(0, 120, 212),
            Background = Color3.fromRGB(25, 25, 25),
            Surface = Color3.fromRGB(32, 32, 32),
            SurfaceHigh = Color3.fromRGB(45, 45, 45),
            Text = Color3.fromRGB(240, 240, 240),
            TextSub = Color3.fromRGB(170, 170, 170),
            Outline = Color3.fromRGB(60,60,60),
            Gradient1 = Color3.fromRGB(0,120,212),
            Gradient2 = Color3.fromRGB(100,50,255)
        },
        Light = {
            Accent = Color3.fromRGB(0, 120, 212),
            Background = Color3.fromRGB(240, 240, 240),
            Surface = Color3.fromRGB(255, 255, 255),
            SurfaceHigh = Color3.fromRGB(230, 230, 230),
            Text = Color3.fromRGB(20, 20, 20),
            TextSub = Color3.fromRGB(100, 100, 100),
            Outline = Color3.fromRGB(200,200,200),
            Gradient1 = Color3.fromRGB(0,120,212),
            Gradient2 = Color3.fromRGB(0,200,255)
        },
        Ocean = {
            Accent = Color3.fromRGB(86, 224, 255),
            Background = Color3.fromRGB(13, 22, 35),
            Surface = Color3.fromRGB(20, 32, 48),
            SurfaceHigh = Color3.fromRGB(30, 45, 65),
            Text = Color3.fromRGB(220, 245, 255),
            TextSub = Color3.fromRGB(160, 200, 220),
            Outline = Color3.fromRGB(40, 60, 80),
            Gradient1 = Color3.fromRGB(86,224,255),
            Gradient2 = Color3.fromRGB(50,100,200)
        },
        Midnight = {
            Accent = Color3.fromRGB(160, 130, 255),
            Background = Color3.fromRGB(15, 15, 20),
            Surface = Color3.fromRGB(25, 25, 30),
            SurfaceHigh = Color3.fromRGB(35, 35, 45),
            Text = Color3.fromRGB(240, 240, 255),
            TextSub = Color3.fromRGB(180, 180, 200),
            Outline = Color3.fromRGB(50, 50, 70),
            Gradient1 = Color3.fromRGB(160,130,255),
            Gradient2 = Color3.fromRGB(100,50,200)
        }
    }

    local theme = Themes[themeName]
    if not theme then return end

    for k, v in pairs(theme) do
        Nexus.Theme[k] = v
    end

    Nexus.ThemeChanged:Fire(Nexus.Theme)
end

--// ================================
--// CONFIG SYSTEM
--// ================================

function Nexus:Save(name)
    if not isfolder("NexusConfig") then
        makefolder("NexusConfig")
    end
    writefile(
        "NexusConfig/" .. name .. ".json",
        HttpService:JSONEncode(Nexus.Flags)
    )
end

function Nexus:Load(name)
    local path = "NexusConfig/" .. name .. ".json"
    if not isfile(path) then return end

    local data = HttpService:JSONDecode(readfile(path))
    for flag, value in pairs(data) do
        if Nexus.Registry[flag] then
            Nexus.Registry[flag]:Set(value)
        end
    end
end

--// ================================
--// BLUR SYSTEM
--// ================================

local Blur = Instance.new("BlurEffect")
Blur.Name = "NexusBlur"
Blur.Size = 0
Blur.Parent = Lighting

local function SetBlur(state)
    Tween(Blur, { Size = state and 15 or 0 }, 0.4)
end

--// ================================
--// MAIN WINDOW
--// ================================

function Nexus:Window(config)
    local Title = config.Title or "Nexus Hub"

    local ScreenGui = Create("ScreenGui", {
        Name = "NexusUI",
        ResetOnSpawn = false,
        Parent = RunService:IsStudio()
            and Players.LocalPlayer.PlayerGui
            or CoreGui
    })

    --// ============================
    --// WELCOME SCREEN
    --// ============================

    if config.Welcome then
        local Intro = Create("Frame", {
            BackgroundColor3 = Nexus.Theme.Background,
            Size = UDim2.fromScale(1,1),
            ZIndex = 999,
            Parent = ScreenGui
        })

        local Logo = Create("ImageLabel", {
            Image = "rbxassetid://7072724536",
            BackgroundTransparency = 1,
            Size = UDim2.fromOffset(0,0),
            AnchorPoint = Vector2.new(0.5,0.5),
            Position = UDim2.fromScale(0.5,0.45),
            Parent = Intro
        })

        local Label = Create("TextLabel", {
            Text = Title,
            Font = Enum.Font.GothamBold,
            TextSize = 24,
            TextTransparency = 1,
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5,0.5),
            Position = UDim2.fromScale(0.5,0.55),
            Parent = Intro
        })

        Tween(Logo, { Size = UDim2.fromOffset(80,80) }, 0.6)
        task.wait(0.3)
        Tween(Label, { TextTransparency = 0 }, 0.5)
        task.wait(1.5)

        Tween(Logo, { ImageTransparency = 1 }, 0.3)
        Tween(Label, { TextTransparency = 1 }, 0.3)
        Tween(Intro, { BackgroundTransparency = 1 }, 0.4)
        task.wait(0.4)
        Intro:Destroy()
    end

    --// ============================
    --// NOTIFICATION SYSTEM
    --// ============================

    local NotifyList = Create("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0,1),
        Position = UDim2.new(1,-320,1,-20),
        Size = UDim2.new(0,300,1,0),
        ZIndex = 1000,
        Parent = ScreenGui
    })

    Create("UIListLayout", {
        Padding = UDim.new(0,10),
        VerticalAlignment = Enum.VerticalAlignment.Bottom,
        Parent = NotifyList
    })

    function Nexus:Notify(cfg)
        local Box = Create("Frame", {
            Size = UDim2.new(1,0,0,0),
            ClipsDescendants = true,
            Parent = NotifyList
        })
        AddCorner(Box, 8)
        AddStroke(Box)

        Create("TextLabel", {
            Text = cfg.Title or "Notification",
            Font = Enum.Font.GothamBold,
            TextSize = 14,
            BackgroundTransparency = 1,
            Position = UDim2.new(0,12,0,10),
            Size = UDim2.new(1,-24,0,20),
            Parent = Box
        })

        Create("TextLabel", {
            Text = cfg.Content or "",
            Font = Enum.Font.Gotham,
            TextSize = 13,
            BackgroundTransparency = 1,
            Position = UDim2.new(0,12,0,30),
            Size = UDim2.new(1,-24,0,20),
            Parent = Box
        })

        Tween(Box, { Size = UDim2.new(1,0,0,60) }, 0.25)

        task.delay(cfg.Duration or 3, function()
            Tween(Box, { Size = UDim2.new(1,0,0,0) }, 0.25)
            task.wait(0.25)
            Box:Destroy()
        end)
    end

    --// ============================
    --// MAIN LAYOUT
    --// ============================

    local Main = Create("Frame", {
        Size = UDim2.fromOffset(600,350),
        AnchorPoint = Vector2.new(0.5,0.5),
        Position = UDim2.fromScale(0.5,0.5),
        ClipsDescendants = true,
        Parent = ScreenGui
    })
    AddCorner(Main, 10)
    AddStroke(Main)
    MakeDraggable(Main)
    SetBlur(true)

    local Sidebar = Create("Frame", {
        Size = UDim2.new(0,180,1,0),
        Parent = Main
    })
    AddCorner(Sidebar, 10)

    local ContentArea = Create("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.new(0,180,0,0),
        Size = UDim2.new(1,-180,1,0),
        Parent = Main
    })

    local Pages = Create("Folder", {
        Parent = ContentArea
    })

    -- Close / Hide buttons (logic only, theme auto)
    local HideBtn = Create("TextButton", {
        Text = "Hide",
        Size = UDim2.new(0.5,-5,0,28),
        Position = UDim2.new(0,10,1,-38),
        Parent = Sidebar
    })
    AddCorner(HideBtn,6)

    local CloseBtn = Create("TextButton", {
        Text = "Close",
        Size = UDim2.new(0.5,-5,0,28),
        Position = UDim2.new(0.5,5,1,-38),
        Parent = Sidebar
    })
    AddCorner(CloseBtn,6)

    HideBtn.MouseButton1Click:Connect(function()
        Main.Visible = false
        SetBlur(false)
    end)

    CloseBtn.MouseButton1Click:Connect(function()
        SetBlur(false)
        ScreenGui:Destroy()
    end)

    -- RETURN API (TAB HANDLED IN PART 3)
    local API = {}
    API._Pages = Pages
    API._Sidebar = Sidebar

    return API
end
--// ================================
--// TAB & CONTROL SYSTEM
--// ================================

function Nexus:Window(config)
    local Title = config.Title or "Nexus Hub"
    local ScreenGui = Create("ScreenGui", {Name = "NexusUI", Parent = RunService:IsStudio() and Players.LocalPlayer.PlayerGui or CoreGui, ResetOnSpawn = false})
    
    -- Welcome Animation
    if config.Welcome then
        local IntroFrame = Create("Frame", {BackgroundColor3 = Nexus.Theme.Background, Size = UDim2.fromScale(1, 1), Position = UDim2.fromScale(0,0), ZIndex = 9999, Parent = ScreenGui})
        local Logo = Create("ImageLabel", {Image = "rbxassetid://7072724536", ImageColor3 = Nexus.Theme.Accent, BackgroundTransparency = 1, Size = UDim2.fromOffset(0,0), Position = UDim2.fromScale(0.5, 0.45), AnchorPoint = Vector2.new(0.5, 0.5), Parent = IntroFrame})
        local TitleLbl = Create("TextLabel", {Text = Title, Font = Enum.Font.GothamBold, TextSize = 24, TextColor3 = Nexus.Theme.Text, TextTransparency = 1, BackgroundTransparency = 1, Position = UDim2.fromScale(0.5, 0.55), AnchorPoint = Vector2.new(0.5, 0.5), Parent = IntroFrame})
        Tween(Logo, {Size = UDim2.fromOffset(80, 80)}, 0.6) task.wait(0.3) Tween(TitleLbl, {TextTransparency = 0}, 0.5) task.wait(1.5)
        Tween(Logo, {Size = UDim2.fromOffset(0,0), ImageTransparency = 1}, 0.4) Tween(TitleLbl, {TextTransparency = 1}, 0.4) Tween(IntroFrame, {BackgroundTransparency = 1}, 0.5) task.wait(0.5) IntroFrame:Destroy()
    end
    
    -- Watermark
    if config.Watermark then
        local Wat = Create("Frame", {BackgroundColor3 = Nexus.Theme.Surface, Size = UDim2.new(0, 200, 0, 30), Position = UDim2.new(0.02, 0, 0.02, 0), Parent = ScreenGui})
        AddCorner(Wat, 6) AddStroke(Wat, Nexus.Theme.Accent, 1)
        local WatText = Create("TextLabel", {BackgroundTransparency=1, Size=UDim2.new(1,0,1,0), Font=Enum.Font.GothamMedium, TextSize=13, TextColor3=Nexus.Theme.Text, Parent=Wat})
        MakeDraggable(Wat)
        local WConn; WConn = RunService.Heartbeat:Connect(function()
            if not Wat.Parent then WConn:Disconnect() return end
            local fps = math.floor(workspace:GetRealPhysicsFPS())
            local ping = 0
            pcall(function()
                ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
            end)
            WatText.Text = string.format("FPS: %d  |  Ping: %dms  |  CPU: %d%%", fps, ping, math.min(fps/60*100, 100))
        end)
    end

    -- Notifications
    local NotifyList = Create("Frame", {BackgroundTransparency = 1, Position = UDim2.new(1, -320, 1, -20), Size = UDim2.new(0, 300, 1, 0), AnchorPoint = Vector2.new(0, 1), Parent = ScreenGui, ZIndex = 1000})
    Create("UIListLayout", {Padding = UDim.new(0, 10), VerticalAlignment = Enum.VerticalAlignment.Bottom, SortOrder = Enum.SortOrder.LayoutOrder, Parent = NotifyList})

    function Nexus:Notify(cfg)
        local Frame = Create("Frame", {BackgroundColor3 = Nexus.Theme.Surface, Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1, ClipsDescendants = true, Parent = NotifyList})
        AddCorner(Frame, 8) AddStroke(Frame, Nexus.Theme.Outline, 1)
        Create("TextLabel", {Text = cfg.Title or "Notification", Font = Enum.Font.GothamBold, TextSize = 14, TextColor3 = Nexus.Theme.Accent, BackgroundTransparency = 1, Position = UDim2.new(0, 12, 0, 10), Size = UDim2.new(1, -24, 0, 20), TextXAlignment = Enum.TextXAlignment.Left, Parent = Frame})
        Create("TextLabel", {Text = cfg.Content or "", Font = Enum.Font.Gotham, TextSize = 13, TextColor3 = Nexus.Theme.Text, BackgroundTransparency = 1, Position = UDim2.new(0, 12, 0, 30), Size = UDim2.new(1, -24, 0, 20), TextXAlignment = Enum.TextXAlignment.Left, Parent = Frame})
        Tween(Frame, {Size = UDim2.new(1, 0, 0, 60), BackgroundTransparency = 0.1}, 0.3)
        task.delay(cfg.Duration or 3, function() Tween(Frame, {Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1}, 0.3) task.wait(0.3) Frame:Destroy() end)
    end

    -- UI Setup
    local OpenBtn = Create("TextButton", {Text = "N", Font = Enum.Font.GothamBold, TextSize = 24, TextColor3 = Nexus.Theme.Accent, BackgroundColor3 = Nexus.Theme.Surface, Size = UDim2.new(0, 50, 0, 50), Position = UDim2.new(0.1, 0, 0.1, 0), Visible = false, Parent = ScreenGui})
    AddCorner(OpenBtn, 25) AddStroke(OpenBtn, Nexus.Theme.Accent, 2) MakeDraggable(OpenBtn)

    local Main = Create("Frame", {BackgroundColor3 = Nexus.Theme.Background, BackgroundTransparency = 0.1, Size = UDim2.fromOffset(600, 350), Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5), ClipsDescendants = true, Parent = ScreenGui})
    AddCorner(Main, 10) AddStroke(Main, Nexus.Theme.Outline, 1) MakeDraggable(Main) SetBlur(true)

    local Sidebar = Create("Frame", {BackgroundColor3 = Nexus.Theme.Surface, BackgroundTransparency = 0.5, Size = UDim2.new(0, 180, 1, 0), Parent = Main})
    AddCorner(Sidebar, 10)
    Create("Frame", {BackgroundColor3 = Nexus.Theme.Surface, BackgroundTransparency = 0.5, Position = UDim2.new(1, -10, 0, 0), Size = UDim2.new(0, 10, 1, 0), BorderSizePixel = 0, Parent = Sidebar})

    local pImg = "rbxassetid://0" pcall(function() pImg = Players:GetUserThumbnailAsync(Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48) end)
    Create("ImageLabel", {Image = pImg, BackgroundTransparency=1, Position=UDim2.new(0,15,0,15), Size=UDim2.new(0,32,0,32), Parent=Sidebar})
    Create("TextLabel", {Text=Title, Font=Enum.Font.GothamBold, TextSize=14, TextColor3=Nexus.Theme.Text, BackgroundTransparency=1, Position=UDim2.new(0,55,0,15), Size=UDim2.new(0,100,0,16), TextXAlignment=Enum.TextXAlignment.Left, Parent=Sidebar})
    Create("TextLabel", {Text="@"..Players.LocalPlayer.Name, Font=Enum.Font.Gotham, TextSize=12, TextColor3=Nexus.Theme.TextSub, BackgroundTransparency=1, Position=UDim2.new(0,55,0,31), Size=UDim2.new(0,100,0,16), TextXAlignment=Enum.TextXAlignment.Left, Parent=Sidebar})

    local TabContainer = Create("ScrollingFrame", {BackgroundTransparency=1, Position=UDim2.new(0,10,0,60), Size=UDim2.new(1,-20,1,-100), CanvasSize=UDim2.new(0,0,0,0), ScrollBarThickness=0, Parent=Sidebar})
    local TabList = Create("UIListLayout", {Padding=UDim.new(0,5), SortOrder=Enum.SortOrder.LayoutOrder, Parent=TabContainer})
    TabList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() TabContainer.CanvasSize = UDim2.new(0,0,0,TabList.AbsoluteContentSize.Y) end)
    
    local ContentArea = Create("Frame", {BackgroundTransparency=1, Position=UDim2.new(0,180,0,0), Size=UDim2.new(1,-180,1,0), Parent=Main})
    local PagesFolder = Create("Folder", {Parent=ContentArea})

    local ControlsFrame = Create("Frame", {BackgroundTransparency=1, Position=UDim2.new(0,10,1,-40), Size=UDim2.new(1,-20,0,30), Parent=Sidebar})
    local HideBtn = Create("TextButton", {Text="Hide", Font=Enum.Font.GothamBold, BackgroundColor3=Nexus.Theme.SurfaceHigh, TextColor3=Nexus.Theme.Accent, Size=UDim2.new(0.5,-5,1,0), Parent=ControlsFrame}) AddCorner(HideBtn, 6)
    local CloseBtn = Create("TextButton", {Text="Close", Font=Enum.Font.GothamBold, BackgroundColor3=Nexus.Theme.SurfaceHigh, TextColor3=Color3.fromRGB(255,80,80), Size=UDim2.new(0.5,-5,1,0), Position=UDim2.new(0.5,5,0,0), Parent=ControlsFrame}) AddCorner(CloseBtn, 6)

    HideBtn.MouseButton1Click:Connect(function() Main.Visible = false OpenBtn.Visible = true SetBlur(false) end)
    OpenBtn.MouseButton1Click:Connect(function() OpenBtn.Visible = false Main.Visible = true SetBlur(true) end)
    CloseBtn.MouseButton1Click:Connect(function() SetBlur(false) ScreenGui:Destroy() end)

    local Tabs, CurrentTab = {}, nil

    local TabButtons = Create("ScrollingFrame", {
        BackgroundTransparency = 1,
        Position = UDim2.new(0,10,0,60),
        Size = UDim2.new(1,-20,1,-110),
        ScrollBarThickness = 0,
        Parent = Sidebar
    })

    local TabLayout = Create("UIListLayout", {
        Padding = UDim.new(0,6),
        Parent = TabButtons
    })

    TabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabButtons.CanvasSize = UDim2.new(0,0,0,TabLayout.AbsoluteContentSize.Y)
    end)

    local CurrentTab

    local function CreateControls(Parent)
        local Item = {}

        function Item:Divider()
            Create("Frame", {
                Size = UDim2.new(1,0,0,1),
                Parent = Parent
            })
        end

        function Item:Section(text)
            Create("TextLabel", {
                Text = text,
                Font = Enum.Font.GothamBold,
                TextSize = 14,
                BackgroundTransparency = 1,
                Size = UDim2.new(1,0,0,24),
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = Parent
            })
        end

        function Item:Button(cfg)
            local btn = Create("TextButton", {
                Text = cfg.Text,
                Size = UDim2.new(1,0,0,36),
                Parent = Parent
            })
            AddCorner(btn,6)

            btn.MouseButton1Click:Connect(function()
                Tween(btn, {Size = UDim2.new(1,-4,0,34)}, 0.05)
                task.wait(0.05)
                Tween(btn, {Size = UDim2.new(1,0,0,36)}, 0.05)
                cfg.Callback()
            end)
        end

        function Item:Toggle(cfg)
            local state = cfg.Default or false

            local holder = Create("TextButton", {
                Size = UDim2.new(1,0,0,36),
                Parent = Parent
            })
            AddCorner(holder,6)

            local label = Create("TextLabel", {
                Text = cfg.Text,
                BackgroundTransparency = 1,
                Position = UDim2.new(0,10,0,0),
                Size = UDim2.new(1,-60,1,0),
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = holder
            })

            local switch = Create("Frame", {
                Size = UDim2.new(0,40,0,20),
                Position = UDim2.new(1,-50,0.5,-10),
                Parent = holder
            })
            AddCorner(switch,10)

            local knob = Create("Frame", {
                Size = UDim2.new(0,16,0,16),
                Position = UDim2.new(0,2,0.5,-8),
                Parent = switch
            })
            AddCorner(knob,8)

            local function update()
                Tween(knob, {
                    Position = state and UDim2.new(1,-18,0.5,-8)
                        or UDim2.new(0,2,0.5,-8)
                },0.2)
                cfg.Callback(state)
                if cfg.Flag then Nexus.Flags[cfg.Flag] = state end
            end

            holder.MouseButton1Click:Connect(function()
                state = not state
                update()
            end)

            if cfg.Flag then
                Nexus.Registry[cfg.Flag] = {Set = function(v) state = v update() end}
            end

            update()
        end

        function Item:Slider(cfg)
            local min,max = cfg.Min,cfg.Max
            local val = cfg.Default or min

            local box = Create("Frame", {
                Size = UDim2.new(1,0,0,50),
                Parent = Parent
            })
            AddCorner(box,6)

            local lbl = Create("TextLabel", {
                Text = cfg.Text,
                BackgroundTransparency = 1,
                Position = UDim2.new(0,10,0,5),
                Size = UDim2.new(1,-60,0,20),
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = box
            })

            local valLbl = Create("TextLabel", {
                BackgroundTransparency = 1,
                Position = UDim2.new(1,-40,0,5),
                Size = UDim2.new(0,30,0,20),
                Parent = box
            })

            local bar = Create("Frame", {
                Size = UDim2.new(1,-20,0,6),
                Position = UDim2.new(0,10,0,35),
                Parent = box
            })
            AddCorner(bar,3)

            local fill = Create("Frame", {
                Size = UDim2.new(0,0,1,0),
                Parent = bar
            })
            AddCorner(fill,3)

            local function set(v)
                val = math.clamp(v,min,max)
                valLbl.Text = math.floor(val)
                fill.Size = UDim2.new((val-min)/(max-min),0,1,0)
                cfg.Callback(val)
                if cfg.Flag then Nexus.Flags[cfg.Flag] = val end
            end

            bar.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseButton1 then
                    local conn
                    conn = UserInputService.InputChanged:Connect(function(inp)
                        if inp.UserInputType == Enum.UserInputType.MouseMovement then
                            local p = math.clamp(
                                (inp.Position.X-bar.AbsolutePosition.X)/bar.AbsoluteSize.X,
                                0,1
                            )
                            set(min+(max-min)*p)
                        end
                    end)
                    UserInputService.InputEnded:Once(function() conn:Disconnect() end)
                end
            end)

            if cfg.Flag then
                Nexus.Registry[cfg.Flag] = {Set = set}
            end

            set(val)
        end

        function Item:Dropdown(cfg)
            local open = false

            local frame = Create("Frame", {
                Size = UDim2.new(1,0,0,42),
                ClipsDescendants = true,
                Parent = Parent
            })
            AddCorner(frame,6)

            local lbl = Create("TextLabel", {
                Text = cfg.Text,
                BackgroundTransparency = 1,
                Position = UDim2.new(0,12,0,0),
                Size = UDim2.new(1,-40,0,42),
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = frame
            })

            local arrow = Create("TextLabel", {
                Text = "v",
                BackgroundTransparency = 1,
                Position = UDim2.new(1,-30,0,0),
                Size = UDim2.new(0,30,0,42),
                Parent = frame
            })

            local btn = Create("TextButton", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1,0,0,42),
                Parent = frame
            })

            local list = Create("Frame", {
                Position = UDim2.new(0,0,0,42),
                Size = UDim2.new(1,0,0,0),
                Parent = frame
            })

            Create("UIListLayout",{Parent=list})

            local function toggle()
                open = not open
                Tween(arrow,{Rotation=open and 180 or 0},0.2)
                Tween(frame,{
                    Size = UDim2.new(1,0,0,
                        open and (42 + #cfg.Options*30 + 6) or 42)
                },0.25)
            end

            btn.MouseButton1Click:Connect(toggle)

            for _,opt in ipairs(cfg.Options) do
                local ob = Create("TextButton",{
                    Text = opt,
                    Size = UDim2.new(1,-12,0,28),
                    Parent = list
                })
                AddCorner(ob,4)

                ob.MouseButton1Click:Connect(function()
                    lbl.Text = cfg.Text .. ": " .. opt
                    toggle()
                    cfg.Callback(opt)
                    if cfg.Flag then Nexus.Flags[cfg.Flag] = opt end
                end)
            end
        end

        --// =========================
        --// ADVANCED COMPONENTS
        --// =========================

        function Item:Divider()
            Create("Frame", {
                Size = UDim2.new(1,0,0,1),
                Parent = Parent
            })
        end

        function Item:Paragraph(title, desc)
            local box = Create("Frame", {
                Size = UDim2.new(1,0,0,0),
                AutomaticSize = Enum.AutomaticSize.Y,
                Parent = Parent
            })
            AddCorner(box,6)
            AddStroke(box)

            Create("TextLabel", {
                Text = title,
                Font = Enum.Font.GothamBold,
                TextSize = 14,
                BackgroundTransparency = 1,
                Position = UDim2.new(0,12,0,10),
                Size = UDim2.new(1,-24,0,18),
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = box
            })

            Create("TextLabel", {
                Text = desc,
                Font = Enum.Font.Gotham,
                TextSize = 12,
                BackgroundTransparency = 1,
                Position = UDim2.new(0,12,0,30),
                Size = UDim2.new(1,-24,0,0),
                AutomaticSize = Enum.AutomaticSize.Y,
                TextWrapped = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = box
            })
        end

        function Item:Collapsible(text)
            local open = false

            local frame = Create("Frame", {
                Size = UDim2.new(1,0,0,42),
                ClipsDescendants = true,
                Parent = Parent
            })
            AddCorner(frame,6)

            local btn = Create("TextButton", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1,0,0,42),
                Parent = frame
            })

            Create("TextLabel", {
                Text = text,
                Font = Enum.Font.GothamBold,
                BackgroundTransparency = 1,
                Position = UDim2.new(0,12,0,0),
                Size = UDim2.new(1,-40,0,42),
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = btn
            })

            local arrow = Create("TextLabel", {
                Text = ">",
                BackgroundTransparency = 1,
                Position = UDim2.new(1,-30,0,0),
                Size = UDim2.new(0,30,0,42),
                Parent = btn
            })

            local content = Create("Frame", {
                Position = UDim2.new(0,0,0,42),
                Size = UDim2.new(1,0,0,0),
                Parent = frame
            })

            local layout = Create("UIListLayout", {
                Padding = UDim.new(0,8),
                Parent = content
            })

            Create("UIPadding", {
                PaddingTop = UDim.new(0,10),
                PaddingBottom = UDim.new(0,10),
                PaddingLeft = UDim.new(0,10),
                PaddingRight = UDim.new(0,10),
                Parent = content
            })

            local function resize()
                Tween(frame, {
                    Size = UDim2.new(1,0,0,
                        open and (42 + layout.AbsoluteContentSize.Y + 20) or 42)
                },0.25)
            end

            btn.MouseButton1Click:Connect(function()
                open = not open
                Tween(arrow,{Rotation=open and 90 or 0},0.2)
                resize()
            end)

            layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                if open then resize() end
            end)

            return CreateControls(content)
        end

        function Item:MultiDropdown(cfg)
            local open = false
            local selected = {}

            for _,v in ipairs(cfg.Default or {}) do
                selected[v] = true
            end

            local frame = Create("Frame", {
                Size = UDim2.new(1,0,0,42),
                ClipsDescendants = true,
                Parent = Parent
            })
            AddCorner(frame,6)

            local label = Create("TextLabel", {
                Text = cfg.Text,
                BackgroundTransparency = 1,
                Position = UDim2.new(0,12,0,0),
                Size = UDim2.new(1,-40,0,42),
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = frame
            })

            local arrow = Create("TextLabel", {
                Text = "v",
                BackgroundTransparency = 1,
                Position = UDim2.new(1,-30,0,0),
                Size = UDim2.new(0,30,0,42),
                Parent = frame
            })

            local btn = Create("TextButton", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1,0,0,42),
                Parent = frame
            })

            local list = Create("Frame", {
                Position = UDim2.new(0,0,0,42),
                Size = UDim2.new(1,0,0,0),
                Parent = frame
            })

            Create("UIListLayout",{Parent=list})

            local function updateText()
                local t = {}
                for k in pairs(selected) do table.insert(t,k) end
                label.Text = #t > 0 and
                    (cfg.Text .. " ("..table.concat(t,", ")..")")
                    or (cfg.Text.." (None)")
            end

            local function toggle()
                open = not open
                Tween(arrow,{Rotation=open and 180 or 0},0.2)
                Tween(frame,{
                    Size = UDim2.new(1,0,0,
                        open and (42 + #cfg.Options*30 + 6) or 42)
                },0.25)
            end

            btn.MouseButton1Click:Connect(toggle)

            for _,opt in ipairs(cfg.Options) do
                local o = Create("TextButton", {
                    Text = opt,
                    Size = UDim2.new(1,-12,0,28),
                    Parent = list
                })
                AddCorner(o,4)

                if selected[opt] then
                    o.TextColor3 = Nexus.Theme.Accent
                end

                o.MouseButton1Click:Connect(function()
                    selected[opt] = not selected[opt]
                    o.TextColor3 = selected[opt] and Nexus.Theme.Accent or Nexus.Theme.Text
                    updateText()
                    local res = {}
                    for k in pairs(selected) do table.insert(res,k) end
                    cfg.Callback(res)
                end)
            end

            updateText()
        end

        function Item:ButtonCard(cfg)
            local btn = Create("TextButton", {
                Size = UDim2.new(1,0,0,70),
                Parent = Parent
            })
            AddCorner(btn,10)
            AddStroke(btn)

            Create("UIGradient", {
                Rotation = 0,
                Transparency = NumberSequence.new(0.6),
                Parent = btn
            })

            Create("TextLabel", {
                Text = cfg.Title,
                Font = Enum.Font.GothamBold,
                TextSize = 18,
                BackgroundTransparency = 1,
                Position = UDim2.new(0,15,0,12),
                Size = UDim2.new(1,-30,0,20),
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = btn
            })

            Create("TextLabel", {
                Text = cfg.Description,
                Font = Enum.Font.Gotham,
                TextSize = 12,
                BackgroundTransparency = 1,
                Position = UDim2.new(0,15,0,35),
                Size = UDim2.new(1,-30,0,15),
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = btn
            })

            btn.MouseButton1Click:Connect(function()
                Tween(btn,{Size=UDim2.new(1,-4,0,68)},0.05)
                task.wait(0.05)
                Tween(btn,{Size=UDim2.new(1,0,0,70)},0.05)
                cfg.Callback()
            end)
        end

        function Item:ServerCard()
            local card = Create("Frame", {
                Size = UDim2.new(1,0,0,130),
                Parent = Parent
            })
            AddCorner(card,10)
            AddStroke(card)

            Create("UIGradient",{Rotation=45,Parent=card})

            Create("TextLabel", {
                Text = "Server",
                Font = Enum.Font.GothamBold,
                TextSize = 18,
                BackgroundTransparency = 1,
                Position = UDim2.new(0,15,0,10),
                Size = UDim2.new(1,0,0,20),
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = card
            })

            local grid = Create("Frame", {
                BackgroundTransparency = 1,
                Position = UDim2.new(0,15,0,50),
                Size = UDim2.new(1,-30,1,-60),
                Parent = card
            })

            Create("UIGridLayout", {
                CellSize = UDim2.new(0.48,0,0.45,0),
                CellPadding = UDim2.new(0.04,0,0.1,0),
                Parent = grid
            })

            local function stat(title)
                local b = Create("Frame",{Parent=grid})
                AddCorner(b,6)
                Create("TextLabel",{
                    Text=title,
                    Font=Enum.Font.GothamBold,
                    TextSize=12,
                    BackgroundTransparency=1,
                    Position=UDim2.new(0,10,0,5),
                    Size=UDim2.new(1,0,0,15),
                    Parent=b
                })
                return Create("TextLabel",{
                    Text="...",
                    Font=Enum.Font.Gotham,
                    TextSize=11,
                    BackgroundTransparency=1,
                    Position=UDim2.new(0,10,0,22),
                    Size=UDim2.new(1,0,0,15),
                    Parent=b
                })
            end

            local pLbl = stat("Players")
            local pingLbl = stat("Ping")
            local timeLbl = stat("Time")
            local fpsLbl = stat("FPS")

            local conn
            conn = RunService.Heartbeat:Connect(function()
                if not card.Parent then
                    conn:Disconnect()
                    return
                end
                pLbl.Text = #Players:GetPlayers().."/"..Players.MaxPlayers
                local ping = 0
                pcall(function()
                    ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
                end)
                pingLbl.Text = ping.."ms"
                local t = workspace.DistributedGameTime
                timeLbl.Text = string.format(
                    "%02d:%02d:%02d",
                    math.floor(t/3600),
                    math.floor((t%3600)/60),
                    math.floor(t%60)
                )
                fpsLbl.Text = math.floor(workspace:GetRealPhysicsFPS())
            end)
        end


        return Item
    end

    function Core:Tab(name)
        local Page = Create("ScrollingFrame", {
            Visible = false,
            BackgroundTransparency = 1,
            Size = UDim2.new(1,0,1,0),
            ScrollBarThickness = 3,
            Parent = Pages
        })

        local Layout = Create("UIListLayout", {
            Padding = UDim.new(0,8),
            Parent = Page
        })

        Create("UIPadding", {
            PaddingTop = UDim.new(0,15),
            PaddingLeft = UDim.new(0,15),
            PaddingRight = UDim.new(0,15),
            Parent = Page
        })

        Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Page.CanvasSize = UDim2.new(0,0,0,Layout.AbsoluteContentSize.Y+20)
        end)

        local Btn = Create("TextButton", {
            Text = name,
            Size = UDim2.new(1,0,0,32),
            Parent = TabButtons
        })
        AddCorner(Btn,6)

        Btn.MouseButton1Click:Connect(function()
            if CurrentTab then
                CurrentTab.Page.Visible = false
            end
            Page.Visible = true
            CurrentTab = {Page=Page}
        end)

        if not CurrentTab then
            Page.Visible = true
            CurrentTab = {Page=Page}
        end

        return CreateControls(Page)
    end

    return Core
end

return Nexus
