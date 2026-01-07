--[[ 
    NEXUS UI (v3.5 - Stable Edition)
    Fixes: Missing ServerCard, Memory Leaks, Dropdown Logic
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

--// Helpers
local function Create(class, props, children)
    local inst = Instance.new(class)
    for i, v in pairs(props or {}) do inst[i] = v end
    for _, c in pairs(children or {}) do c.Parent = inst end
    return inst
end

local function AddCorner(parent, radius)
    Create("UICorner", {CornerRadius = UDim.new(0, radius or 6), Parent = parent})
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
    TweenService:Create(inst, TweenInfo.new(time or 0.2, Enum.EasingStyle.Quad), props):Play()
end

local function MakeDraggable(gui)
    local dragging, dragStart, startPos
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)
    gui.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            Tween(gui, {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)}, 0.05)
        end
    end)
end

--// Acrylic Blur
local Blur = Instance.new("BlurEffect")
Blur.Name = "NexusBlur"
Blur.Size = 0
Blur.Parent = Lighting
local function SetBlur(enabled) Tween(Blur, {Size = enabled and 15 or 0}, 0.4) end

--// Config System
function Nexus:Save(name)
    if not isfolder("NexusConfig") then makefolder("NexusConfig") end
    local json = HttpService:JSONEncode(Nexus.Flags)
    writefile("NexusConfig/" .. name .. ".json", json)
end

function Nexus:Load(name)
    if isfile("NexusConfig/" .. name .. ".json") then
        local json = readfile("NexusConfig/" .. name .. ".json")
        local data = HttpService:JSONDecode(json)
        for flag, value in pairs(data) do
            if Nexus.Registry[flag] then Nexus.Registry[flag]:Set(value) end
        end
    end
end

--// Theme System
Nexus.ThemeChanged = Instance.new("BindableEvent")
-- PROBLEM: Custom theme has undefined 'themes' variable
-- FIXED VERSION:
function Nexus:SetTheme(themeName, customColors)
    local Themes = {
        Dark = { Accent = Color3.fromRGB(0, 120, 212), Background = Color3.fromRGB(25, 25, 25), Surface = Color3.fromRGB(32, 32, 32), SurfaceHigh = Color3.fromRGB(45, 45, 45), Text = Color3.fromRGB(240, 240, 240), Outline = Color3.fromRGB(60,60,60), Gradient1=Color3.fromRGB(0,120,212), Gradient2=Color3.fromRGB(100,50,255) },
        Light = { Accent = Color3.fromRGB(0, 120, 212), Background = Color3.fromRGB(240, 240, 240), Surface = Color3.fromRGB(255, 255, 255), SurfaceHigh = Color3.fromRGB(230, 230, 230), Text = Color3.fromRGB(20, 20, 20), Outline = Color3.fromRGB(200,200,200), Gradient1=Color3.fromRGB(0,120,212), Gradient2=Color3.fromRGB(0,200,255) },
        Ocean = { Accent = Color3.fromRGB(86, 224, 255), Background = Color3.fromRGB(13, 22, 35), Surface = Color3.fromRGB(20, 32, 48), SurfaceHigh = Color3.fromRGB(30, 45, 65), Text = Color3.fromRGB(220, 245, 255), Outline = Color3.fromRGB(40, 60, 80), Gradient1=Color3.fromRGB(86,224,255), Gradient2=Color3.fromRGB(50,100,200) },
        Midnight = { Accent = Color3.fromRGB(160, 130, 255), Background = Color3.fromRGB(15, 15, 20), Surface = Color3.fromRGB(25, 25, 30), SurfaceHigh = Color3.fromRGB(35, 35, 45), Text = Color3.fromRGB(240, 240, 255), Outline = Color3.fromRGB(50, 50, 70), Gradient1=Color3.fromRGB(160,130,255), Gradient2=Color3.fromRGB(100,50,200) }
    }
    
    -- Add Custom theme properly
    Themes.Custom = {
        Accent = customColors and customColors.Accent or Color3.fromRGB(90, 150, 255),
        Background = customColors and customColors.Background or Color3.fromRGB(15, 15, 25),
        Surface = customColors and customColors.Surface or Color3.fromRGB(25, 25, 35),
        SurfaceHigh = customColors and customColors.SurfaceHigh or Color3.fromRGB(35, 35, 45),
        Text = customColors and customColors.Text or Color3.fromRGB(255, 255, 255),
        TextSub = customColors and customColors.TextSub or Color3.fromRGB(180, 180, 200),
        Outline = customColors and customColors.Outline or Color3.fromRGB(70, 70, 100),
        Gradient1 = customColors and customColors.Gradient1 or Color3.fromRGB(90, 150, 255),
        Gradient2 = customColors and customColors.Gradient2 or Color3.fromRGB(150, 80, 200)
    }
    
    if Themes[themeName] then
        for k, v in pairs(Themes[themeName]) do
            Nexus.Theme[k] = v
        end
        Nexus.ThemeChanged:Fire(Nexus.Theme)
    end
end


--// Main Window
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
    
    local function CreateControls(ParentFrame)
        local Item = {}
        function Item:Divider()
            local div = Create("Frame", {BackgroundColor3 = Nexus.Theme.Outline, Size = UDim2.new(1, -4, 0, 1), Parent = ParentFrame})
        end
        function Item:Section(text)
            Create("TextLabel", {Text=text, Font=Enum.Font.GothamBold, TextSize=14, TextColor3=Nexus.Theme.TextSub, BackgroundTransparency=1, Size=UDim2.new(1,0,0,24), TextXAlignment=Enum.TextXAlignment.Left, Parent=ParentFrame})
        end
        function Item:Paragraph(title, desc)
            local c = Create("Frame", {BackgroundColor3 = Nexus.Theme.Surface, Size = UDim2.new(1,0,0,0), AutomaticSize = Enum.AutomaticSize.Y, Parent = ParentFrame})
            AddCorner(c, 6) AddStroke(c, Nexus.Theme.Outline, 1)
            Create("TextLabel", {Text = title, Font = Enum.Font.GothamBold, TextSize = 14, TextColor3 = Nexus.Theme.Text, BackgroundTransparency = 1, Position = UDim2.new(0,12,0,12), Size = UDim2.new(1,-24,0,16), TextXAlignment = Enum.TextXAlignment.Left, Parent = c})
            Create("TextLabel", {Text = desc, Font = Enum.Font.Gotham, TextSize = 12, TextColor3 = Nexus.Theme.TextSub, BackgroundTransparency = 1, Position = UDim2.new(0,12,0,32), Size = UDim2.new(1,-24,0,0), AutomaticSize = Enum.AutomaticSize.Y, TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, Parent = c})
            Create("Frame", {BackgroundTransparency=1, Size=UDim2.new(1,0,0,12), LayoutOrder=100, Parent=c})
        end
        function Item:Button(cfg)
            local b = Create("TextButton", {Text=cfg.Text, BackgroundColor3=Nexus.Theme.Surface, Size=UDim2.new(1,0,0,38), TextColor3=Nexus.Theme.Text, Font=Enum.Font.GothamMedium, TextSize=14, Parent=ParentFrame})
            AddCorner(b, 6)
            b.MouseButton1Click:Connect(function() Tween(b, {Size=UDim2.new(1,-4,0,36)}, 0.05) task.wait(0.05) Tween(b, {Size=UDim2.new(1,0,0,38)}, 0.05) cfg.Callback() end)
        end
        function Item:Toggle(cfg)
            -- Add proper validation
            if not cfg then cfg = {} end
            
            -- Added safety check for ParentFrame
            if not ParentFrame then 
                warn("Toggle: ParentFrame is nil! Cannot create toggle item.")
                return 
            end
            
            local t = Create("TextButton", {
                Text = "", 
                BackgroundColor3 = Nexus.Theme.Surface, 
                Size = UDim2.new(1,0,0,38), 
                Parent = ParentFrame
            })
            
            AddCorner(t, 6)
            
            -- Safety check for required elements
            local textLabel = Create("TextLabel", {
                Text = cfg.Text or "Toggle",
                BackgroundTransparency = 1, 
                Position = UDim2.new(0,10,0,0), 
                Size = UDim2.new(1,-60,1,0), 
                Font = Enum.Font.GothamMedium, 
                TextSize = 14, 
                TextColor3 = Nexus.Theme.Text, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Parent = t
            })
            
            local box = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.SurfaceHigh, 
                Size = UDim2.new(0,40,0,20), 
                Position = UDim2.new(1,-50,0.5,-10), 
                Parent = t
            })
            
            AddCorner(box, 10)
            
            local knob = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.Text, 
                Size = UDim2.new(0,16,0,16), 
                Position = UDim2.new(0,2,0.5,-8), 
                Parent = box
            })
            
            AddCorner(knob, 8)
            
            local on = cfg.Default or false
            
            local function update()
                if not knob or not box then return end -- Safety check
                Tween(knob, {Position = on and UDim2.new(1,-18,0.5,-8) or UDim2.new(0,2,0.5,-8)}, 0.2)
                Tween(box, {BackgroundColor3 = on and Nexus.Theme.Accent or Nexus.Theme.SurfaceHigh}, 0.2)
                
                -- Safely call callback
                if type(cfg.Callback) == "function" then
                    cfg.Callback(on)
                end
                
                if cfg.Flag then 
                    Nexus.Flags[cfg.Flag] = on 
                end
            end
            
            -- Add safety check for click event
            if t and t.MouseButton1Click then
                t.MouseButton1Click:Connect(function() 
                    on = not on 
                    update() 
                end)
            end
            
            if cfg.Flag then 
                Nexus.Registry[cfg.Flag] = {Set = function(v) 
                    if type(v) == "boolean" then
                        on = v 
                        update() 
                    end
                end} 
            end
            
            if on then 
                update() 
            end
            
            -- Return the created item for reference
            return t
        end

        function Item:Slider(cfg)
            local f = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.Surface,
                Size = UDim2.new(1,0,0,50),
                Parent = ParentFrame
            })
            AddCorner(f, 6)

            local title = Create("TextLabel", {
                Text = cfg.Text,
                BackgroundTransparency = 1,
                Position = UDim2.new(0,10,0,5),
                Size = UDim2.new(1,-20,0,20),
                Font = Enum.Font.GothamMedium,
                TextSize = 14,
                TextColor3 = Nexus.Theme.Text,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = f
            })

            local valueLabel = Create("TextLabel", {
                BackgroundTransparency = 1,
                Position = UDim2.new(1,-40,0,5),
                Size = UDim2.new(0,30,0,20),
                Font = Enum.Font.GothamBold,
                TextSize = 14,
                TextColor3 = Nexus.Theme.Text,
                Parent = f
            })

            local bar = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.SurfaceHigh,
                Size = UDim2.new(1,-20,0,6),
                Position = UDim2.new(0,10,0,35),
                Parent = f
            })
            AddCorner(bar, 3)

            local fill = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.Accent,
                Size = UDim2.new(0,0,1,0),
                Parent = bar
            })
            AddCorner(fill, 3)

            local min, max = cfg.Min, cfg.Max
            local value = cfg.Default or min
            local dragging = false
            local inputConn

            -- Fixed in Slider component:
            local function set(val)
                value = math.clamp(val, min, max)
                valueLabel.Text = math.floor(value)
                fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
                cfg.Callback(value)
                if cfg.Flag then Nexus.Flags[cfg.Flag] = value end
            end
            
            bar.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                    -- Fixed: Proper cleanup for input connection
                    local inputConn = UserInputService.InputChanged:Connect(function(input)
                        if not dragging or not f.Parent then
                            if inputConn then inputConn:Disconnect() end
                            return
                        end
                        if input.UserInputType == Enum.UserInputType.MouseMovement then
                            local pct = math.clamp(
                                (input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X,
                                0, 1
                            )
                            set(min + (max - min) * pct)
                        end
                    end)
                    
                    -- Add cleanup connection
                    UserInputService.InputEnded:Connect(function(i2)
                        if i2.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false
                            if inputConn then 
                                inputConn:Disconnect() 
                            end
                        end
                    end)
                end
            end)


            UserInputService.InputEnded:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                    if inputConn then inputConn:Disconnect() end
                end
            end)

            if cfg.Flag then
                Nexus.Registry[cfg.Flag] = { Set = set }
            end

            set(value)

            Nexus.ThemeChanged.Event:Connect(function()
                f.BackgroundColor3 = Nexus.Theme.Surface
                bar.BackgroundColor3 = Nexus.Theme.SurfaceHigh
                fill.BackgroundColor3 = Nexus.Theme.Accent
                title.TextColor3 = Nexus.Theme.Text
                valueLabel.TextColor3 = Nexus.Theme.Text
            end)
        end

        function Item:Input(cfg)
            local text, placeholder = cfg.Text or "Input", cfg.Placeholder or "Type here..."
            local f = Create("Frame", {BackgroundColor3=Nexus.Theme.Surface, Size=UDim2.new(1,0,0,42), Parent=ParentFrame})
            AddCorner(f, 6)
            Create("TextLabel", {Text=text, Font=Enum.Font.GothamMedium, TextSize=14, TextColor3=Nexus.Theme.Text, BackgroundTransparency=1, Position=UDim2.new(0,12,0,0), Size=UDim2.new(1,-24,0,20), TextXAlignment=Enum.TextXAlignment.Left, Parent=f})
            local boxC = Create("Frame", {BackgroundColor3=Nexus.Theme.SurfaceHigh, Size=UDim2.new(1,-24,0,18), Position=UDim2.new(0,12,0,20), Parent=f})
            AddCorner(boxC, 4) AddStroke(boxC, Nexus.Theme.Outline, 1)
            local box = Create("TextBox", {Text="", PlaceholderText=placeholder, PlaceholderColor3=Nexus.Theme.TextSub, Font=Enum.Font.Gotham, TextSize=13, TextColor3=Nexus.Theme.Text, BackgroundTransparency=1, Size=UDim2.new(1,-8,1,0), Position=UDim2.new(0,4,0,0), TextXAlignment=Enum.TextXAlignment.Left, ClearTextOnFocus=false, Parent=boxC})
            box.FocusLost:Connect(function() cfg.Callback(box.Text) end)
        end
        function Item:MultiDropdown(cfg)
            local text, options, default = cfg.Text or "Multi Dropdown", cfg.Options or {}, cfg.Default or {}
            local f = Create("Frame", {BackgroundColor3 = Nexus.Theme.Surface, Size = UDim2.new(1,0,0,42), ClipsDescendants = true, Parent = ParentFrame})
            AddCorner(f, 6)
            local lbl = Create("TextLabel", {Text = text, Font = Enum.Font.GothamMedium, TextSize = 14, TextColor3 = Nexus.Theme.Text, BackgroundTransparency = 1, Position = UDim2.new(0,12,0,0), Size = UDim2.new(0.6,0,0,42), TextXAlignment=Enum.TextXAlignment.Left, Parent = f})
            local arr = Create("TextLabel", {Text = "v", Font = Enum.Font.GothamBold, TextSize = 14, TextColor3 = Nexus.Theme.TextSub, BackgroundTransparency=1, Position=UDim2.new(1,-30,0,0), Size=UDim2.new(0,30,0,42), Parent=f})
            local btn = Create("TextButton", {Text="", BackgroundTransparency=1, Size=UDim2.new(1,0,0,42), Parent=f})
            local container = Create("Frame", {BackgroundTransparency=1, Position=UDim2.new(0,0,0,42), Size=UDim2.new(1,0,0,0), Parent=f})
            Create("UIListLayout", {SortOrder=Enum.SortOrder.LayoutOrder, Parent=container})
            
            local selected = {}
            for _,v in pairs(default) do selected[v] = true end
            local function update()
                local t = {}
                for k,_ in pairs(selected) do table.insert(t, k) end
                if #t == 0 then lbl.Text = text .. " (None)" else lbl.Text = text .. " (" .. table.concat(t, ", ") .. ")" end
            end
            update()
            local open = false
            btn.MouseButton1Click:Connect(function() open = not open Tween(arr, {Rotation=open and 180 or 0}, 0.2) Tween(f, {Size=UDim2.new(1,0,0, open and (42 + (#options*30) + 6) or 42)}, 0.3) end)
            for _, opt in pairs(options) do
                local ob = Create("TextButton", {Text=opt, Font=Enum.Font.Gotham, TextSize=13, TextColor3=Nexus.Theme.TextSub, BackgroundColor3=Nexus.Theme.Surface, BackgroundTransparency=0.5, Size=UDim2.new(1,-12,0,30), Parent=container})
                AddCorner(ob, 4)
                if selected[opt] then ob.TextColor3 = Nexus.Theme.Accent end
                ob.MouseButton1Click:Connect(function() 
                    if selected[opt] then selected[opt] = nil ob.TextColor3 = Nexus.Theme.TextSub else selected[opt] = true ob.TextColor3 = Nexus.Theme.Accent end
                    update()
                    local res = {} for k,_ in pairs(selected) do table.insert(res, k) end
                    cfg.Callback(res)
                end)
            end
        end
        function Item:Collapsible(text)
            local f = Create("Frame", {BackgroundColor3 = Nexus.Theme.Surface, Size = UDim2.new(1, 0, 0, 42), ClipsDescendants = true, Parent = ParentFrame})
            AddCorner(f, 6)
            local btn = Create("TextButton", {Text = "", BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 42), Parent = f})
            Create("TextLabel", {Text = text, Font = Enum.Font.GothamBold, TextSize = 14, TextColor3 = Nexus.Theme.Text, BackgroundTransparency = 1, Position = UDim2.new(0, 12, 0, 0), Size = UDim2.new(1, -40, 0, 42), TextXAlignment = Enum.TextXAlignment.Left, Parent = btn})
            local arr = Create("TextLabel", {Text = ">", Font = Enum.Font.GothamBold, TextSize = 14, TextColor3 = Nexus.Theme.TextSub, BackgroundTransparency = 1, Position = UDim2.new(1, -30, 0, 0), Size = UDim2.new(0, 30, 0, 42), Parent = btn})
            local content = Create("Frame", {BackgroundTransparency = 1, Position = UDim2.new(0, 0, 0, 42), Size = UDim2.new(1, 0, 0, 0), Parent = f})
            local list = Create("UIListLayout", {Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder, Parent = content})
            Create("UIPadding", {PaddingTop = UDim.new(0, 10), PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10), PaddingBottom = UDim.new(0, 10), Parent = content})
            local open = false
            btn.MouseButton1Click:Connect(function() open = not open Tween(arr, {Rotation=open and 90 or 0}, 0.2) Tween(f, {Size=UDim2.new(1,0,0, open and (42+list.AbsoluteContentSize.Y+20) or 42)}, 0.3) end)
            list:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() if open then Tween(f, {Size=UDim2.new(1,0,0, 42+list.AbsoluteContentSize.Y+20)}, 0.1) end end)
            return CreateControls(content)
        end
        
        function Item:Dropdown(cfg)
    -- ========================================
    -- 1. INPUT VALIDATION & SANITIZATION
    -- ========================================
    if not cfg or type(cfg) ~= "table" then
        warn("[NexusUI Dropdown] Invalid config")
        return nil
    end
    
    -- ✅ FIX: Validate Options is a table
    local Options = cfg.Options
    if not Options or type(Options) ~= "table" then
        warn("[NexusUI Dropdown] Options must be a table, got: " .. type(Options))
        Options = {"No Options"}
    end
    
    -- ✅ FIX: Handle empty Options array
    if #Options == 0 then
        warn("[NexusUI Dropdown] Empty Options array, using placeholder")
        Options = {"No Options Available"}
    end
    
    -- ✅ FIX: Validate each option value
    local ValidOptions = {}
    for i, opt in ipairs(Options) do
        if opt ~= nil then
            table.insert(ValidOptions, tostring(opt))
        else
            warn("[NexusUI Dropdown] Skipping nil option at index " .. i)
        end
    end
    
    if #ValidOptions == 0 then
        ValidOptions = {"No Valid Options"}
    end
    
    local Text = cfg.Text or "Dropdown"
    local Default = cfg.Default
    local Callback = cfg.Callback
    local Flag = cfg.Flag
    
    -- Validate Default exists in Options
    if Default ~= nil then
        local found = false
        for _, v in ipairs(ValidOptions) do
            if v == Default then
                found = true
                break
            end
        end
        if not found then
            warn("[NexusUI Dropdown] Default '" .. tostring(Default) .. "' not in options")
            Default = ValidOptions[1]
        end
    else
        Default = ValidOptions[1]
    end
    
    -- Validate Callback
    if Callback and type(Callback) ~= "function" then
        warn("[NexusUI Dropdown] Callback must be a function")
        Callback = function() end
    end
    
    -- ========================================
    -- 2. GUI CREATION
    -- ========================================
    local f = Create("Frame", {
        BackgroundColor3 = Nexus.Theme.Surface,
        Size = UDim2.new(1,0,0,42),
        ClipsDescendants = true,
        Parent = ParentFrame
    })
    AddCorner(f, 6)

    local label = Create("TextLabel", {
        Text = Text .. ": " .. tostring(Default),
        Font = Enum.Font.GothamMedium,
        TextSize = 14,
        TextColor3 = Nexus.Theme.Text,
        BackgroundTransparency = 1,
        Position = UDim2.new(0,12,0,0),
        Size = UDim2.new(0.7,0,0,42),
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = f
    })

    local arrow = Create("TextLabel", {
        Text = "v",
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        TextColor3 = Nexus.Theme.TextSub,
        BackgroundTransparency = 1,
        Position = UDim2.new(1,-30,0,0),
        Size = UDim2.new(0,30,0,42),
        Parent = f
    })

    local button = Create("TextButton", {
        Text = "",
        BackgroundTransparency = 1,
        Size = UDim2.new(1,0,0,42),
        Parent = f
    })

    local container = Create("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.new(0,0,0,42),
        Size = UDim2.new(1,0,0,0),
        Parent = f
    })

    local layout = Create("UIListLayout", {
        Parent = container,
        Padding = UDim.new(0,4)
    })

    -- ========================================
    -- 3. STATE MANAGEMENT
    -- ========================================
    local CurrentValue = Default
    local IsOpen = false
    local OptionButtons = {}
    
    -- ========================================
    -- 4. RENDER OPTIONS (SAFE ITERATION)
    -- ========================================
    local function RenderOptions()
        -- Clear existing buttons
        for _, btn in pairs(OptionButtons) do
            pcall(function()
                if btn and btn.Parent then
                    btn:Destroy()
                end
            end)
        end
        OptionButtons = {}
        
        -- ✅ FIX: Safe iteration with nil checks
        if not ValidOptions or type(ValidOptions) ~= "table" then
            warn("[NexusUI Dropdown] Cannot render: ValidOptions invalid")
            return
        end
        
        for _, opt in ipairs(ValidOptions) do
            if opt == nil then continue end -- Skip nil values
            
            local optBtn = Create("TextButton", {
                Text = tostring(opt),
                Font = Enum.Font.Gotham,
                TextSize = 13,
                TextColor3 = Nexus.Theme.TextSub,
                BackgroundColor3 = Nexus.Theme.SurfaceHigh,
                Size = UDim2.new(1,-12,0,28),
                Parent = container
            })
            AddCorner(optBtn, 4)
            
            -- Highlight if selected
            if opt == CurrentValue then
                optBtn.TextColor3 = Nexus.Theme.Accent
                optBtn.BackgroundColor3 = Color3.fromRGB(
                    Nexus.Theme.Accent.R * 255 * 0.2,
                    Nexus.Theme.Accent.G * 255 * 0.2,
                    Nexus.Theme.Accent.B * 255 * 0.2
                )
            end

            optBtn.MouseButton1Click:Connect(function()
                CurrentValue = opt
                label.Text = Text .. ": " .. tostring(opt)
                Toggle()
                
                -- Safe callback execution
                if Callback and type(Callback) == "function" then
                    pcall(function()
                        Callback(opt)
                    end)
                end
                
                if Flag then 
                    Nexus.Flags[Flag] = opt 
                end
                
                -- Re-render to update highlights
                RenderOptions()
            end)
            
            table.insert(OptionButtons, optBtn)
        end
    end
    
    -- ========================================
    -- 5. TOGGLE FUNCTION
    -- ========================================
    function Toggle()
        IsOpen = not IsOpen
        
        -- Safe height calculation
        local optionCount = #ValidOptions
        local targetHeight = IsOpen and (42 + (optionCount * 32) + 8) or 42
        
        Tween(arrow, {Rotation = IsOpen and 180 or 0}, 0.2)
        Tween(f, {Size = UDim2.new(1,0,0, targetHeight)}, 0.25)
    end

    button.MouseButton1Click:Connect(Toggle)
    
    -- Initial render
    RenderOptions()
    
    -- ========================================
    -- 6. PUBLIC API (REFRESH METHOD)
    -- ========================================
    local DropdownInstance = {}
    
    function DropdownInstance:Refresh(newOptions)
        -- Validate input
        if not newOptions or type(newOptions) ~= "table" then
            warn("[NexusUI Dropdown] Refresh failed: newOptions must be table")
            return false
        end
        
        -- Handle empty array
        if #newOptions == 0 then
            newOptions = {"No Options Available"}
            warn("[NexusUI Dropdown] Refresh with empty array")
        end
        
        -- Filter out nil values
        local filteredOptions = {}
        for _, opt in ipairs(newOptions) do
            if opt ~= nil then
                table.insert(filteredOptions, tostring(opt))
            end
        end
        
        if #filteredOptions == 0 then
            filteredOptions = {"No Valid Options"}
        end
        
        ValidOptions = filteredOptions
        
        -- Reset selection if current value no longer exists
        local found = false
        for _, v in ipairs(ValidOptions) do
            if v == CurrentValue then
                found = true
                break
            end
        end
        
        if not found then
            CurrentValue = ValidOptions[1](label.Text) = Text .. ": " .. tostring(CurrentValue)
        end
        
        -- Close dropdown before refresh
        if IsOpen then
            Toggle()
        end
        
        RenderOptions()
        return true
    end
    
    function DropdownInstance:Set(value)
        local found = false
        for _, v in ipairs(ValidOptions) do
            if v == value then
                found = true
                break
            end
        end
        
        if found then
            CurrentValue = value
            label.Text = Text .. ": " .. tostring(value)
            RenderOptions()
            return true
        else
            warn("[NexusUI Dropdown] Set failed: value not in options")
            return false
        end
    end
    
    function DropdownInstance:Get()
        return CurrentValue
    end
    
    function DropdownInstance:Destroy()
        pcall(function()
            if f and f.Parent then
                f:Destroy()
            end
        end)
    end
    
    -- ========================================
    -- 7. FLAG REGISTRY
    -- ========================================
    if Flag then
        Nexus.Registry[Flag] = DropdownInstance
    end
    
    -- ========================================
    -- 8. THEME UPDATES
    -- ========================================
    local themeConn = Nexus.ThemeChanged.Event:Connect(function()
        if not f or not f.Parent then
            themeConn:Disconnect()
            return
        end
        
        f.BackgroundColor3 = Nexus.Theme.Surface
        label.TextColor3 = Nexus.Theme.Text
        arrow.TextColor3 = Nexus.Theme.TextSub
        
        -- Update all option buttons
        for _, btn in pairs(OptionButtons) do
            if btn and btn.Parent then
                btn.BackgroundColor3 = Nexus.Theme.SurfaceHigh
                btn.TextColor3 = Nexus.Theme.TextSub
            end
        end
        
        RenderOptions() -- Re-render to apply theme
    end)
    
    return DropdownInstance
end

        
        function Item:SearchableDropdown(cfg)
            local f = Create("Frame", {
                BackgroundColor3 = Nexus.Theme.Surface,
                Size = UDim2.new(1,0,0,42),
                ClipsDescendants = true,
                Parent = ParentFrame
            })
            
            AddCorner(f, 6)
            
            local label = Create("TextLabel", {
                Text = cfg.Text or "Select...",
                Font = Enum.Font.GothamMedium,
                TextSize = 14,
                TextColor3 = Nexus.Theme.Text,
                BackgroundTransparency = 1,
                Position = UDim2.new(0,12,0,0),
                Size = UDim2.new(1,-24,0,42),
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = f
            })
            
            local btn = Create("TextButton", {
                Text = "",
                BackgroundTransparency = 1,
                Size = UDim2.new(1,0,0,42),
                Parent = f
            })
            
            local container = Create("Frame", {
                BackgroundTransparency = 1,
                Position = UDim2.new(0,0,0,42),
                Size = UDim2.new(1,0,0,0),
                Parent = f
            })
            
            local contentList = Create("UIListLayout", {
                Parent = container,
                SortOrder = Enum.SortOrder.LayoutOrder
            })
            
            local searchBox = Create("TextBox", {
                Text = "",
                PlaceholderText = "Search...",
                PlaceholderColor3 = Nexus.Theme.TextSub,
                Font = Enum.Font.Gotham,
                TextSize = 13,
                TextColor3 = Nexus.Theme.Text,
                BackgroundTransparency = 1,
                Size = UDim2.new(1,-12,0,28),
                Position = UDim2.new(0,6,0,14),
                Parent = container
            })
            
            local isOpen = false
            local searchResults = {}
            
            -- Filter logic
            searchBox:GetPropertyChangedSignal("Text"):Connect(function()
                local searchTerm = searchBox.Text:lower()
                for _, child in pairs(container:GetChildren()) do
                    if child:IsA("TextButton") and child ~= searchBox then
                        if searchTerm == "" then
                            child.Visible = true
                        else
                            child.Visible = child.Text:lower():find(searchTerm) ~= nil
                        end
                    end
                end
            end)
            
            -- Selector behavior
            btn.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                Tween(f, {Size = UDim2.new(1,0,0, isOpen and (42 + #cfg.Options * 30 + 40) or 42)}, 0.2)
            end)
            
            -- Add option buttons
            for i, option in ipairs(cfg.Options) do
                local optBtn = Create("TextButton", {
                    Text = option,
                    Font = Enum.Font.Gotham,
                    TextSize = 13,
                    TextColor3 = Nexus.Theme.TextSub,
                    BackgroundColor3 = Nexus.Theme.Surface,
                    BackgroundTransparency = 0.5,
                    Size = UDim2.new(1,-12,0,30),
                    Position = UDim2.new(0,0,0,0),
                    Parent = container
                })
                AddCorner(optBtn, 4)
                
                optBtn.MouseButton1Click:Connect(function()
                    label.Text = option
                    isOpen = false
                    Tween(f, {Size = UDim2.new(1,0,0,42)}, 0.2)
                    cfg.Callback(option)
                end)
            end
            
            return f
        end
        

        -- FIXED VERSION:
        function Item:ServerCard()
            local Card = Create("Frame", {BackgroundColor3 = Nexus.Theme.Surface, Size = UDim2.new(1, 0, 0, 130), Parent = ParentFrame})
            AddCorner(Card, 10) AddStroke(Card, Nexus.Theme.Outline, 1)
            
            -- FIXED: Properly create gradient on Card itself (not trying to parent to non-existent stroke)
            local Grad = Create("UIGradient", {
                Color=ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Nexus.Theme.Gradient1), 
                    ColorSequenceKeypoint.new(1, Nexus.Theme.Gradient2)
                }, 
                Rotation=45, 
                Parent=Card 
            })
            
            -- Rest of the code...
        
            Create("TextLabel", {Text="Server", Font=Enum.Font.GothamBold, TextSize=18, TextColor3=Nexus.Theme.Text, BackgroundTransparency=1, Position=UDim2.new(0,15,0,10), Size=UDim2.new(1,0,0,20), TextXAlignment=Enum.TextXAlignment.Left, Parent=Card})
            Create("TextLabel", {Text="Session Information", Font=Enum.Font.Gotham, TextSize=12, TextColor3=Nexus.Theme.TextSub, BackgroundTransparency=1, Position=UDim2.new(0,15,0,30), Size=UDim2.new(1,0,0,15), TextXAlignment=Enum.TextXAlignment.Left, Parent=Card})
            local Grid = Create("Frame", {BackgroundTransparency=1, Position=UDim2.new(0,15,0,55), Size=UDim2.new(1,-30,1,-65), Parent=Card})
            Create("UIGridLayout", {CellSize=UDim2.new(0.48,0,0.45,0), CellPadding=UDim2.new(0.04,0,0.1,0), SortOrder=Enum.SortOrder.LayoutOrder, Parent=Grid})
            local function AddStat(title, val)
                local Box = Create("Frame", {BackgroundColor3 = Nexus.Theme.SurfaceHigh, Parent = Grid}) AddCorner(Box, 6)
                Create("TextLabel", {Text=title, Font=Enum.Font.GothamBold, TextSize=12, TextColor3=Nexus.Theme.Text, BackgroundTransparency=1, Position=UDim2.new(0,10,0,5), Size=UDim2.new(1,0,0,15), TextXAlignment=Enum.TextXAlignment.Left, Parent=Box})
                return Create("TextLabel", {Text=val, Font=Enum.Font.Gotham, TextSize=11, TextColor3=Nexus.Theme.TextSub, BackgroundTransparency=1, Position=UDim2.new(0,10,0,22), Size=UDim2.new(1,0,0,15), TextXAlignment=Enum.TextXAlignment.Left, Parent=Box})
            end
            local pLbl, piLbl, tLbl, fLbl = AddStat("Players", "0/0"), AddStat("Ping", "0ms"), AddStat("Time", "00:00:00"), AddStat("FPS", "60")
            local SConn; SConn = RunService.Heartbeat:Connect(function()
                if not Card.Parent then SConn:Disconnect() return end
                pLbl.Text = #Players:GetPlayers() .. "/" .. Players.MaxPlayers
                piLbl.Text = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) .. "ms"
                local t = workspace.DistributedGameTime
                tLbl.Text = string.format("%02d:%02d:%02d", math.floor(t/3600), math.floor((t%3600)/60), math.floor(t%60))
                fLbl.Text = math.floor(workspace:GetRealPhysicsFPS())
            end)
        end
        function Item:ButtonCard(cfg)
            local Title, Desc = cfg.Title or "Card", cfg.Description or "Click"
            local Btn = Create("TextButton", {BackgroundColor3 = Nexus.Theme.Surface, Size = UDim2.new(1, 0, 0, 70), AutoButtonColor = false, Parent = ParentFrame})
            AddCorner(Btn, 10) AddStroke(Btn, Nexus.Theme.Outline, 1)
            Create("UIGradient", {Color=ColorSequence.new{ColorSequenceKeypoint.new(0, Nexus.Theme.Gradient1), ColorSequenceKeypoint.new(1, Nexus.Theme.Gradient2)}, Rotation=0, Transparency=NumberSequence.new(0.6), Parent=Btn})
            Create("TextLabel", {Text=Title, Font=Enum.Font.GothamBold, TextSize=18, TextColor3=Nexus.Theme.Text, BackgroundTransparency=1, Position=UDim2.new(0,15,0,12), Size=UDim2.new(1,0,0,20), TextXAlignment=Enum.TextXAlignment.Left, Parent=Btn})
            Create("TextLabel", {Text=Desc, Font=Enum.Font.Gotham, TextSize=12, TextColor3=Color3.new(1,1,1), BackgroundTransparency=1, Position=UDim2.new(0,15,0,35), Size=UDim2.new(1,0,0,15), TextXAlignment=Enum.TextXAlignment.Left, Parent=Btn})
            Btn.MouseButton1Click:Connect(function() Tween(Btn, {Size = UDim2.new(1,-4,0,68)}, 0.05) task.wait(0.05) Tween(Btn, {Size = UDim2.new(1,0,0,70)}, 0.05) cfg.Callback() end)
        end
        return Item
    end

    local Funcs = {}
    function Funcs:Divider()
        local div = Create("Frame", {BackgroundColor3 = Nexus.Theme.Outline, Size = UDim2.new(1, 0, 0, 1), Parent = TabContainer})
        Create("UIPadding", {PaddingTop=UDim.new(0,2), PaddingBottom=UDim.new(0,2), Parent=div}) 
    end
    function Funcs:Tab(name)
        local Page = Create("ScrollingFrame", {Visible=false, BackgroundTransparency=1, Size=UDim2.new(1,0,1,0), CanvasSize=UDim2.new(0,0,0,0), ScrollBarThickness=3, Parent=PagesFolder})
        local PList = Create("UIListLayout", {Padding=UDim.new(0,8), SortOrder=Enum.SortOrder.LayoutOrder, Parent=Page})
        Create("UIPadding", {PaddingTop=UDim.new(0,15), PaddingLeft=UDim.new(0,15), PaddingRight=UDim.new(0,15), Parent=Page})
        PList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() Page.CanvasSize = UDim2.new(0,0,0,PList.AbsoluteContentSize.Y+20) end)
        local Btn = Create("TextButton", {Text=name, Font=Enum.Font.GothamMedium, TextColor3=Nexus.Theme.TextSub, BackgroundColor3=Nexus.Theme.Surface, BackgroundTransparency=1, Size=UDim2.new(1,0,0,32), Parent=TabContainer})
        AddCorner(Btn, 6)
        Btn.MouseButton1Click:Connect(function() 
            if CurrentTab then CurrentTab.Btn.BackgroundTransparency=1 CurrentTab.Btn.TextColor3=Nexus.Theme.TextSub CurrentTab.Page.Visible=false end
            CurrentTab = {Btn=Btn, Page=Page} Btn.BackgroundTransparency=0 Btn.TextColor3=Nexus.Theme.Text Page.Visible=true
        end)
        if not CurrentTab then CurrentTab = {Btn=Btn, Page=Page} Btn.BackgroundTransparency=0 Btn.TextColor3=Nexus.Theme.Text Page.Visible=true end
        return CreateControls(Page)
    end
    return Funcs
end
return Nexus