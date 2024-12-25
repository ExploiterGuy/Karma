local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local BottomBar = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local ToggleVisibilityButton = Instance.new("TextButton") -- New Minimize Button
local TitleText = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local SearchBar = Instance.new("TextBox") -- New search bar
local Tabshow = Instance.new("TextButton") -- New search bar
local TabContainer = Instance.new("TextLabel")
local OtherTab = Instance.new("TextButton")
local OtherFrame = Instance.new("ScrollingFrame")
local ContentFrame = Instance.new("ScrollingFrame")
local MainTab = Instance.new("TextButton")
local TabCorner = Instance.new("UICorner")
local SearchCorner = Instance.new("UICorner")
local OtherCorner = Instance.new("UICorner")
local MainCorner = Instance.new("UICorner")
local TabshowCorner = Instance.new("UICorner")
local LogoButton = Instance.new("TextButton");
local bottomcorner = Instance.new("UICorner")
local mainframecorner = Instance.new("UICorner")
local topcorner = Instance.new("UICorner")
local AnimCorner = Instance.new("UICorner")
local AnimTab = Instance.new("TextButton")
local bottomcorner2 = Instance.new("UICorner")
local BottomBar2 = Instance.new("Frame")
local TopBar2 = Instance.new("Frame")
local topcorner2 = Instance.new("UICorner")
local MuseumTab = Instance.new("TextButton")
local MuseumCorner = Instance.new("UICorner")
local MuseumFrameWarn = Instance.new("TextLabel")
local YesButton = Instance.new("TextButton")
local NoButton = Instance.new("TextButton")
local MuseumFrameCorner = Instance.new("UICorner")
local NoCorner = Instance.new("UICorner")
local YesCorner = Instance.new("UICorner")
local bottomcorner3 = Instance.new("UICorner")
local BottomBar3 = Instance.new("Frame")
local TopBar3 = Instance.new("Frame")
local topcorner3 = Instance.new("UICorner")

-- For Animations
local animations = {} -- To store animation tracks for toggling
local buttons = {} -- To store buttons

-- UI Properties
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BackgroundTransparency = 0.2
MainFrame.Size = UDim2.new(0, 426, 0, 258) -- Wider UI
MainFrame.Position = UDim2.new(0.6, -200, 0.8, -300)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

mainframecorner.Parent = MainFrame
mainframecorner.CornerRadius = UDim.new(0, 10)

-- Make the frame draggable
local UIS = game:GetService("UserInputService")
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- TopBar
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(162, 241, 245)
TopBar.Size = UDim2.new(1, 0, 0, 31)

topcorner.Parent = TopBar
topcorner.CornerRadius = UDim.new(0, 10)

-- BottomBar
BottomBar.Parent = MainFrame
BottomBar.BackgroundColor3 = Color3.fromRGB(162, 241, 245)
BottomBar.Size = UDim2.new(1, 0, 0, 30)
BottomBar.Position = UDim2.new(0, 0, 1, -31)

bottomcorner.Parent = BottomBar
bottomcorner.CornerRadius = UDim.new(0, 10)

BottomBar2.Parent = TabContainer
BottomBar2.BackgroundColor3 = Color3.fromRGB(162, 241, 245)
BottomBar2.Size = UDim2.new(1.5, 0, 0, 30)
BottomBar2.Position = UDim2.new(0, 0, 1, -31)

bottomcorner2.Parent = BottomBar2
bottomcorner2.CornerRadius = UDim.new(0, 10)

-- TopBar
TopBar2.Parent = TabContainer
TopBar2.BackgroundColor3 = Color3.fromRGB(162, 241, 245)
TopBar2.Size = UDim2.new(1.5, 0, 0, 31)
TopBar2.Position = UDim2.new(0, 0, 0, -30)

topcorner2.Parent = TopBar2
topcorner2.CornerRadius = UDim.new(0, 10)

BottomBar3.Parent = MuseumFrameWarn
BottomBar3.BackgroundColor3 = Color3.fromRGB(162, 241, 245)
BottomBar3.Size = UDim2.new(1, 0, 0, 30)
BottomBar3.Position = UDim2.new(0, 0, 1, -31)
BottomBar3.BackgroundTransparency = 0.5

bottomcorner3.Parent = BottomBar3
bottomcorner3.CornerRadius = UDim.new(0, 10)

-- TopBar
TopBar3.Parent = MuseumFrameWarn
TopBar3.BackgroundColor3 = Color3.fromRGB(162, 241, 245)
TopBar3.Size = UDim2.new(1, 0, 0, 31)
TopBar3.BackgroundTransparency = 0.5

topcorner3.Parent = TopBar3
topcorner3.CornerRadius = UDim.new(0, 10)

-- Input box for animation speed
local SpeedInput = Instance.new("TextBox")
local SpeedCorner = Instance.new("UICorner")
SpeedInput.Parent = BottomBar
SpeedInput.Size = UDim2.new(0.4, 0, 1, 0)
SpeedInput.Position = UDim2.new(0.3, 0, 0, 0)
SpeedInput.PlaceholderText = "Enter speed (1 = normal)"
SpeedInput.TextScaled = true
SpeedInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedInput.Text = ""

SpeedCorner.Parent = SpeedInput
SpeedCorner.CornerRadius = UDim.new(0, 10)

-- Function to update animation speed based on input
SpeedInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local speed = tonumber(SpeedInput.Text)
        if speed then
            for _, animTrack in pairs(animations) do
                if animTrack and animTrack:IsPlaying() then
                    animTrack:AdjustSpeed(speed)
                end
            end
        end
    end
end)

-- Search Bar
SearchBar.Parent = TopBar
SearchBar.Size = UDim2.new(0.4, 0, 1, 0) -- Adjusted to fit the TopBar
SearchBar.Position = UDim2.new(0.6, -60, 0, 0) -- Positioned next to the TitleText
SearchBar.PlaceholderText = "Search animations"
SearchBar.TextScaled = true
SearchBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SearchBar.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBar.Text = ""

SearchCorner.Parent = SearchBar
SearchCorner.CornerRadius = UDim.new(0, 10)

-- Function to filter animations based on search input
SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
    local searchText = string.lower(SearchBar.Text)
    for _, button in pairs(buttons) do
        if string.find(string.lower(button.Text), searchText) then
            button.Visible = true
        else
            button.Visible = false
        end
    end
end)

Tabshow.Parent = BottomBar
Tabshow.BackgroundTransparency = 0.4
Tabshow.Size = UDim2.new(0, 50, 0, 30)
Tabshow.Position = UDim2.new(0, 70, 0, 0)
Tabshow.Text = "More"
Tabshow.Font = Enum.Font.Cartoon
Tabshow.TextScaled = true
Tabshow.TextColor3 = Color3.fromRGB(0, 0, 0)
Tabshow.BorderColor3 = Color3.fromRGB(0, 150, 0)
Tabshow.BackgroundColor3 = Color3.fromRGB(200, 200, 200)

TabContainer.Visible = false  -- Set initial visibility to false

TabshowCorner.Parent = Tabshow
TabshowCorner.CornerRadius = UDim.new(0, 10)

Tabshow.MouseButton1Click:Connect(function()
    TabContainer.Visible = not TabContainer.Visible
end)

TabContainer.Name = "TabContainer"
TabContainer.Parent = MainFrame
TabContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TabContainer.Position = UDim2.new(0, -100, 0, 30)
TabContainer.Size = UDim2.new(0, 100, 1, -30)
TabContainer.BackgroundTransparency = 0.2

TabCorner.Parent = TabContainer
TabCorner.CornerRadius = UDim.new(0, 10)

-- Title Text
TitleText.Parent = TopBar
TitleText.BackgroundTransparency = 1
TitleText.Text = "Aquamatrix By ExploitFin"
TitleText.Font = Enum.Font.Cartoon
TitleText.TextSize = 25
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.Size = UDim2.new(0.3, -90, 1, 0) -- Adjusted to make space for the search bar
TitleText.Position = UDim2.new(0.4, -75, 0, 0)

-- Close Button
CloseButton.Parent = TopBar
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "X"
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
CloseButton.Size = UDim2.new(0, 30, 1, 0)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.TextScaled = true
CloseButton.TextColor3 = Color3.fromRGB(255, 0, 0)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

OtherTab.Name = "OtherTab"
OtherTab.Parent = TabContainer
OtherTab.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
OtherTab.Position = UDim2.new(0, 0, 0, 30)
OtherTab.Size = UDim2.new(1, 0, 0, 30)
OtherTab.Font = Enum.Font.Cartoon
OtherTab.Text = "Bundle-Anim"
OtherTab.TextWrapped = true
OtherTab.TextColor3 = Color3.new(0, 0, 0)
OtherTab.TextSize = 20
OtherTab.BackgroundTransparency = 0.4

OtherCorner.CornerRadius = UDim.new(0, 9)
OtherCorner.Parent = OtherTab

MainTab.Name = "MainTab"
MainTab.Parent = TabContainer
MainTab.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
MainTab.Position = UDim2.new(0, 0, 0, 0)
MainTab.Size = UDim2.new(1, 0, 0, 30)
MainTab.Font = Enum.Font.Cartoon
MainTab.Text = "Main"
MainTab.TextWrapped = true
MainTab.TextColor3 = Color3.new(0, 0, 0)
MainTab.TextSize = 25
MainTab.BackgroundTransparency = 0.4

MainCorner.CornerRadius = UDim.new(0, 9)
MainCorner.Parent = MainTab

AnimTab.Name = "AnimTab"
AnimTab.Parent = TabContainer
AnimTab.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
AnimTab.Position = UDim2.new(0, 0, 0, 60)
AnimTab.Size = UDim2.new(1, 0, 0, 30)
AnimTab.Font = Enum.Font.Cartoon
AnimTab.Text = "Anim Scripts"
AnimTab.TextWrapped = true
AnimTab.TextColor3 = Color3.new(0, 0, 0)
AnimTab.TextSize = 20
AnimTab.BackgroundTransparency = 0.4

AnimCorner.CornerRadius = UDim.new(0, 9)
AnimCorner.Parent = AnimTab

MuseumTab.Name = "AnimTab"
MuseumTab.Parent = TabContainer
MuseumTab.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
MuseumTab.Position = UDim2.new(0, 0, 0, 165)
MuseumTab.Size = UDim2.new(1, 0, 0, 30)
MuseumTab.Font = Enum.Font.Cartoon
MuseumTab.Text = "Museum"
MuseumTab.TextWrapped = true
MuseumTab.TextColor3 = Color3.new(0, 0, 0)
MuseumTab.TextSize = 23
MuseumTab.BackgroundTransparency = 0.4

MuseumTab.MouseButton1Click:Connect(function()
MuseumFrameWarn.Visible = true
end)

MuseumCorner.CornerRadius = UDim.new(0, 9)
MuseumCorner.Parent = MuseumTab

MuseumFrameWarn.Name = "MuseumFrameWarn"
MuseumFrameWarn.Parent = ScreenGui
MuseumFrameWarn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MuseumFrameWarn.Position = UDim2.new(0.38, 10, 0.32, 40)
MuseumFrameWarn.Size = UDim2.new(0.14, 100, 0.27, -30)
MuseumFrameWarn.Text = "Are You Sure You Want To Join \nMuseum Of Roblox Animations?"
MuseumFrameWarn.TextSize = 28
MuseumFrameWarn.TextColor3 = Color3.new(255, 255, 255)
MuseumFrameWarn.Font = Enum.Font.Cartoon
MuseumFrameWarn.Visible = false
MuseumFrameWarn.BackgroundTransparency = 0

MuseumFrameCorner.CornerRadius = UDim.new(0, 10)
MuseumFrameCorner.Parent = MuseumFrameWarn

NoButton.TextScaled = true
NoButton.TextWrapped = true
NoButton.Font = Enum.Font.Cartoon
NoButton.BackgroundTransparency = 0.3
NoButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
NoButton.Text = "No"
NoButton.Size = UDim2.new(0.3, 0, 0, 40)
NoButton.Position = UDim2.new(0.6, 0, 0.7, 0)
NoButton.Parent = MuseumFrameWarn

NoCorner.CornerRadius = UDim.new(0, 10)
NoCorner.Parent = NoButton

NoButton.MouseButton1Click:Connect(function()
MuseumFrameWarn.Visible = false
end)

-- Define YesButton properties
YesButton.TextScaled = true
YesButton.TextWrapped = true
YesButton.Font = Enum.Font.Cartoon
YesButton.BackgroundTransparency = 0.3
YesButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
YesButton.Text = "Join"
YesButton.Size = UDim2.new(0.3, 0, 0, 40)
YesButton.Position = UDim2.new(0.1, 0, 0.7, 0)
YesButton.Parent = MuseumFrameWarn

-- Add UICorner to YesButton
local YesCorner = Instance.new("UICorner")
YesCorner.CornerRadius = UDim.new(0, 10)
YesCorner.Parent = YesButton

-- Script to join a specific Roblox game by ID when YesButton is clicked
local gameId = 17238090666 -- The target game ID

YesButton.MouseButton1Click:Connect(function()
YesButton.Text = "Joining."
wait(0.3)
YesButton.Text = "Joining.."
wait(0.3)
YesButton.Text = "Joining..."
wait(0.3)
    if syn and syn.queue_on_teleport then
        syn.queue_on_teleport("print('Teleporting to game ID " .. gameId .. "')")
    end

    local teleportService = game:GetService("TeleportService")
    teleportService:Teleport(gameId)
end)


OtherFrame.Name = "OtherFrame"
OtherFrame.Parent = MainFrame
OtherFrame.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
OtherFrame.Position = UDim2.new(0, 10, 0, 40)
OtherFrame.Size = UDim2.new(1, -20, 1, -70)
OtherFrame.BackgroundTransparency = 1
OtherFrame.CanvasSize = UDim2.new(0, 0, 1, 0)
OtherFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
OtherFrame.ScrollBarThickness = 10

ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
ContentFrame.Position = UDim2.new(0, 10, 0, 40)
ContentFrame.Size = UDim2.new(1, -20, 1, -70)
ContentFrame.BackgroundTransparency = 1
ContentFrame.CanvasSize = UDim2.new(0, 0, 1, 0)
ContentFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ContentFrame.ScrollBarThickness = 10

-- Minimize Button
ToggleVisibilityButton.Parent = TopBar
ToggleVisibilityButton.BackgroundTransparency = 1
ToggleVisibilityButton.Text = "v"
ToggleVisibilityButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
ToggleVisibilityButton.Size = UDim2.new(0, 30, 1, 0)
ToggleVisibilityButton.Position = UDim2.new(1, -60, 0, 0)
ToggleVisibilityButton.TextScaled = true
ToggleVisibilityButton.TextColor3 = Color3.fromRGB(0, 0, 255)

local minimized = false
ToggleVisibilityButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        ScrollingFrame.Visible = false
        BottomBar.Visible = false
        MainFrame.Size = UDim2.new(0, 426, 0, 31)
        ToggleVisibilityButton.Text = "^"
    else
        ScrollingFrame.Visible = true
        BottomBar.Visible = true
        MainFrame.Size = UDim2.new(0, 426, 0, 258)
        ToggleVisibilityButton.Text = "v"
    end
end)

-- Track currently active tab
local currentTab = "Main" -- Start with the Main tab
local minimized = false -- Track if minimized

local tabs = { 
    {name = "Main", frame = ScrollingFrame},
    {name = "Bundle-Anim", frame = OtherFrame},
    {name = "Anim-Scripts", frame = ContentFrame}
}

-- Function to switch tabs
local function switchTab(selectedTabName)
    -- Only switch tabs if not minimized
    if minimized then
        return
    end

    for _, tab in pairs(tabs) do
        tab.frame.Visible = false
    end

    for index, tab in pairs(tabs) do
        if tab.name == selectedTabName then
            tab.frame.Visible = true
        end
    end

    -- Update currentTab to track the active tab
    currentTab = selectedTabName
end

-- Toggle minimize button logic
ToggleVisibilityButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    
    if minimized then
        -- Collapse MainFrame's size to just show the TitleBar
        MainFrame.Size = UDim2.new(0, 300, 0, 30)  -- Shrink to the height of the TitleBar
        -- Hide everything inside MainFrame except the TitleBar
        for _, child in pairs(MainFrame:GetChildren()) do
            if child ~= TitleBar then
                child.Visible = false
            end
        end
        ToggleVisibilityButton.Text = "+"
    else
        -- Restore MainFrame's size and show the previously active tab
        MainFrame.Size = UDim2.new(0, 300, 0, 200)  -- Restore original size
        switchTab(currentTab)  -- Restore the previously active tab
        ToggleVisibilityButton.Text = "-"
    end
end)

-- Tab button click connections
MainTab.MouseButton1Click:Connect(function()
    switchTab("Main")
end)

OtherTab.MouseButton1Click:Connect(function()
    switchTab("Bundle-Anim")
end)

AnimTab.MouseButton1Click:Connect(function()
    switchTab("Anim-Scripts")
end)

-- Start with "Main" tab visible
switchTab("Main")

-- Scrolling Frame for buttons
ScrollingFrame.Parent = MainFrame
ScrollingFrame.Size = UDim2.new(1, -20, 1, -70)
ScrollingFrame.Position = UDim2.new(0, 10, 0, 40)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 8, 0)
ScrollingFrame.ScrollBarThickness = 10
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

-- Set up UIGridLayout for a three-column layout
local gridLayout = Instance.new("UIGridLayout")
gridLayout.Parent = ScrollingFrame
gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
gridLayout.CellSize = UDim2.new(0, 120, 0, 40) -- Button size
gridLayout.CellPadding = UDim2.new(0, 10, 0, 10) -- Space between buttons
gridLayout.FillDirectionMaxCells = 3 -- Set number of columns to 3

-- Set up UIGridLayout for a three-column layout
local gridLayout2 = Instance.new("UIGridLayout")
gridLayout2.Parent = OtherFrame
gridLayout2.SortOrder = Enum.SortOrder.LayoutOrder
gridLayout2.CellSize = UDim2.new(0, 120, 0, 40) -- Button size
gridLayout2.CellPadding = UDim2.new(0, 10, 0, 10) -- Space between buttons
gridLayout2.FillDirectionMaxCells = 3 -- Set number of columns to 3

-- Set up UIGridLayout for a three-column layout
local gridLayout3 = Instance.new("UIGridLayout")
gridLayout3.Parent = ContentFrame
gridLayout3.SortOrder = Enum.SortOrder.LayoutOrder
gridLayout3.CellSize = UDim2.new(0, 120, 0, 40) -- Button size
gridLayout3.CellPadding = UDim2.new(0, 10, 0, 10) -- Space between buttons
gridLayout3.FillDirectionMaxCells = 3 -- Set number of columns to 3

local activeAnimations = {} -- Table to keep track of currently active animations

-- Function to create buttons for animations
local function createAnimationButton(name, animationIds)
    local button = Instance.new("TextButton")
    local buttonCorner = Instance.new("UICorner")
    button.Parent = ScrollingFrame
    button.Text = name
    button.Font = Enum.Font.Cartoon
    button.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    button.TextScaled = true
    button.TextColor3 = Color3.fromRGB(0, 0, 0)
    button.BackgroundTransparency = 0.2
    button.AutoButtonColor = true
    button.BorderSizePixel = 0
    button.TextWrapped = true

    buttonCorner.Parent = button
    buttonCorner.CornerRadius = UDim.new(0, 7)

    -- Store button reference for search functionality
    table.insert(buttons, button)

    -- Button click functionality
    button.MouseButton1Click:Connect(function()
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local animationIdsList = type(animationIds) == "table" and animationIds or {animationIds} -- Ensure animationIds is a table

            -- Flag to check if any animations are currently active
            local isActive = false 

            -- Iterate through each animation ID
            for _, animationId in ipairs(animationIdsList) do
                if activeAnimations[animationId] then
                    -- If the animation is already active, stop it
                    activeAnimations[animationId]:Stop()
                    activeAnimations[animationId] = nil -- Remove from active animations table
                else
                    -- Load and play the new animation
                    local anim = Instance.new("Animation")
                    anim.AnimationId = "rbxassetid://" .. animationId
                    local animationTrack = humanoid:LoadAnimation(anim)
                    animationTrack.Looped = true -- Enable looping
                    animationTrack:Play()
                    
                    -- Store the active animation track
                    activeAnimations[animationId] = animationTrack
                    isActive = true -- Mark that at least one animation is active
                end
            end
            
            -- Change the button color based on active state
            if isActive then
                button.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Show as active
            else
                button.BackgroundColor3 = Color3.fromRGB(200, 200, 200) -- Reset button color
            end
            
            -- Adjust speed from input box for each active animation
            for _, animationId in ipairs(animationIdsList) do
                if activeAnimations[animationId] then
                    activeAnimations[animationId]:AdjustSpeed(tonumber(SpeedInput.Text) or 1)
                end
            end
        end
    end)
end

-- Function to create a button for executing scripts
local function createExecuteScriptButton(name, scriptFunction)
    local button2 = Instance.new("TextButton")
    local buttonCorner2 = Instance.new("UICorner")
    button2.Parent = ContentFrame
    button2.Size = UDim2.new(0.9, 0, 0, 50)
    button2.Position = UDim2.new(0.05, 0, 0, 0)
    button2.Text = name
    button2.Font = Enum.Font.Cartoon
    button2.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    button2.TextScaled = true
    button2.TextColor3 = Color3.fromRGB(0, 0, 0)
    button2.BackgroundTransparency = 0.2
    button2.BorderSizePixel = 0

    buttonCorner2.Parent = button2
    buttonCorner2.CornerRadius = UDim.new(0, 7)

    button2.MouseButton1Click:Connect(function()
        button2.Text = "Executing."
        wait(0.3)
        button2.Text = "Executing.."
        wait(0.3)
        button2.Text = "Executing..."
        wait(0.3)
        button2.Text = name
        pcall(scriptFunction)
    end)
end


createExecuteScriptButton("Jerk Off", function()
    loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
end)

createExecuteScriptButton("Dash Anim", function()
    loadstring(game:HttpGet("https://pastefy.app/ZhKVgCK3/raw"))()
end)

createExecuteScriptButton("R6 Psycho Anim", function()
    loadstring(game:HttpGet("https://pastefy.app/YJITpCRA/raw"))() -----Psycho animation
end)

createExecuteScriptButton("R6 Killer Anim", function()
    loadstring(game:HttpGet("https://pastefy.app/riYch0rX/raw"))() -----Killer animation
end)

createExecuteScriptButton("Motion Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MotionHubBeta/BetaMotion/refs/heads/main/MotionHubBeta"))()
end)

createExecuteScriptButton("Classic Anim", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-Classic-Animations-2971"))()
end)

createExecuteScriptButton("Monster Mash Tool", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zerpharix/utrenklpleaserapeme/refs/heads/main/monstermashpotion"))()
end)

local function createBundleButton(name, animations)
    local button3 = Instance.new("TextButton")
    local buttonCorner3 = Instance.new("UICorner")
    button3.Parent = OtherFrame
    button3.Size = UDim2.new(0.9, 0, 0, 50)
    button3.Position = UDim2.new(0.05, 0, 0, 0)
    button3.Text = name
    button3.Font = Enum.Font.Cartoon
    button3.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    button3.TextScaled = true
    button3.TextColor3 = Color3.fromRGB(0, 0, 0)
    button3.BackgroundTransparency = 0.2
    button3.BorderSizePixel = 0

    buttonCorner3.Parent = button3
    buttonCorner3.CornerRadius = UDim.new(0, 7)

    -- Function to replace animations with given animation IDs
    local function replaceAnimations()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local animateScript = character:WaitForChild("Animate")
        local function StopAnim()
            for _, track in pairs(plr.Character.Humanoid:GetPlayingAnimationTracks()) do
        track:Stop()
        end
    end

        -- Replace animations with provided IDs
        for animationType, animationId in pairs(animations) do
            if animateScript:FindFirstChild(animationType) then
                for _, anim in ipairs(animateScript[animationType]:GetChildren()) do
                    if anim:IsA("Animation") then
                        anim.AnimationId = animationId
                    end
                end
            end
        end

        -- Confirm replacement
        local confirmation = Instance.new("TextLabel")
        confirmation.Text = "Animations Replaced!"
        confirmation.Size = UDim2.new(0.3, 0, 0.1, 0)
        confirmation.Position = UDim2.new(0.35, 0, 0.45, 0)
        confirmation.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        confirmation.Font = Enum.Font.Cartoon
        confirmation.TextScaled = true
        confirmation.TextColor3 = Color3.fromRGB(255, 255, 255)
        confirmation.Parent = script.Parent

        wait(2)
        confirmation:Destroy()
    end

    -- Button click functionality
    button3.MouseButton1Click:Connect(function()
        replaceAnimations()  -- Replace animations when the button is clicked
    end)
end

-- Define different animation sets for each button
local animationSet1 = {
    idle = "rbxassetid://248332713",
    idleAlt = "rbxassetid://248332713",
    walk = "rbxassetid://248335946",
    run = "rbxassetid://248335946",
    jump = "rbxassetid://248336294",
    fall = "rbxassetid://248336163",
    climb = "rbxassetid://248336677"
}

local animationSet2 = {
    idle = "rbxassetid://161100084",    -- Different set of animation IDs
    idleAlt = "rbxassetid://161100084",
    walk = "rbxassetid://161210451",
    run = "rbxassetid://161210451",
    jump = "rbxassetid://165167557",
    fall = "rbxassetid://165167632",
    climb = "rbxassetid://161235826"
}

local animationSet3 = {
    idle = "rbxassetid://204055750",    -- Another set of animation IDs
    idleAlt = "rbxassetid://204055750",
    walk = "rbxassetid://28440069",
    run = "rbxassetid://28440069",
    jump = "rbxassetid://233064613",
    fall = "rbxassetid://233322916"
}

local animationSet4 = {
    idle = "rbxassetid://27744947",    -- Another set of animation IDs
    idleAlt = "rbxassetid://27744947",
    walk = "rbxassetid://27759319",
    run = "rbxassetid://27759319",
    jump = "rbxassetid://80979216",
    fall = "rbxassetid://73033721"
}

-- Create multiple buttons with different animation sets
createBundleButton("Bloxikin Animation", animationSet1)
createBundleButton("2013 Animation", animationSet2)
createBundleButton("Sai Animation", animationSet3)
createBundleButton("Reaper Animation", animationSet4)


-- Adding buttons (you can add more here)
createAnimationButton("2013 Dance", "161099825")
createAnimationButton("Dance", "182435998")
createAnimationButton("Classic Dance", "27789359")
createAnimationButton("Wave", "128777973")
createAnimationButton("Laugh", "129423131")
createAnimationButton("Balloon Float", "148840371")
createAnimationButton("Barrel Throw", "31020869")
createAnimationButton("Bike Riding Stance", "189854234")
createAnimationButton("Guitar Equip", "192906348")
createAnimationButton("saxtest", "30257281")
createAnimationButton("Soccer Kick", "28458752")
createAnimationButton("drink", "29517689")
createAnimationButton("Goal Dance", "28488254")
createAnimationButton("Hold", "1119816160")
createAnimationButton("Pluck", "99198989")
createAnimationButton("Coasting Pose", "160737288")
createAnimationButton("Board Kick", "160737244")
createAnimationButton("Right Turn", "160737408")
createAnimationButton("Left Turn", "160737355")
createAnimationButton("Throw From Bag", "30188122")
createAnimationButton("Wand Cast", "31665427")
createAnimationButton("Left Slash", "74894663")
createAnimationButton("Right Slash", "74813494")
createAnimationButton("Bloxster Motorcycle", "185299570")
createAnimationButton("Drink Anim", "61914540")
createAnimationButton("Hyperbike Pose", "214738896")
createAnimationButton("RoPed Stand Up", "180270832")
createAnimationButton("Large Gun Hold", "941134851")
createAnimationButton("Slash", "186934658")
createAnimationButton("SprayPaint", "78494810")
createAnimationButton("Bang Sus", "106772613")
createAnimationButton("Tool Slash", "129967390")
createAnimationButton("Rocket Throw", "162861977")
createAnimationButton("Lamp Anim", "71012326")
createAnimationButton("Plant Anim", "74897796")
createAnimationButton("Drink Hot Sauce", "29517689")
createAnimationButton("Staff up", "27432691")
createAnimationButton("Launch Hand", "33323745")
createAnimationButton("Tool Lunge", "129967478")
createAnimationButton("Fast Sword Slash", "41824837")
createAnimationButton("Pitch Fork", "164025878")
createAnimationButton("Fire Gun", "123896085")
createAnimationButton("Staff Spin", "27763939")
createAnimationButton("something", "123101323")
createAnimationButton("Reload Gun", "190070243")
createAnimationButton("Fly Wings", "90828653")
createAnimationButton("Wave Tool", "160725720")
createAnimationButton("FlameThrower Hold", "168086975")
createAnimationButton("flaem", "116690317")
createAnimationButton("Thrust", "93633158")
createAnimationButton("StaffPound", "93696468")
createAnimationButton("holdplz2", "116690317")
createAnimationButton("Ollie", "160737450")
createAnimationButton("Whack", "32659706")
createAnimationButton("Ban Hammer Hold", "48138189")
createAnimationButton("Cannon", "176177529")
createAnimationButton("Laser Gun Equip", "182631367")
createAnimationButton("Light Firethrower", "75322014")
createAnimationButton("Toss", "75321266")
createAnimationButton("BeatBox", "45504977")
createAnimationButton("sword swing jump", "32659699")
createAnimationButton("twohandswordswing", "32659706")
createAnimationButton("Floor Crawl", "282574440")
createAnimationButton("Dab", "183412246")
createAnimationButton("Super Faint", "181525546")
createAnimationButton("Dino Walk", "204328711")
createAnimationButton("Loop Slam", "204295235")
createAnimationButton("Float Sit", "179224234")
createAnimationButton("Barrel Roll", "136801964")
createAnimationButton("Jumping Jacks", "429681631")
createAnimationButton("Weird Move", "215384594")
createAnimationButton("Floating Head", "121572214")
createAnimationButton("Levitate", "313762630")
createAnimationButton("Hero Jump", "184574340")
createAnimationButton("Head Throw", "35154961")
createAnimationButton("Moon Dance", "45834924")
createAnimationButton("Slap", "204062532")
createAnimationButton("Crouch", "182724289")
createAnimationButton("Walking Dance", "429703734")
createAnimationButton("Spinner", "188632011")
createAnimationButton("Holding Gun", "182393478")
createAnimationButton("Grenade Throw", "168160500")
createAnimationButton("Drive Thru", "168138731")
createAnimationButton("Flute", "52154760")
createAnimationButton("TableFlip", "111898867")
createAnimationButton("Slash Ice", "223624106")
createAnimationButton("zmobie", "223623937")
createAnimationButton("Begin Smash", "120735709")
createAnimationButton("End Smash", "120735762")
createAnimationButton("Standing", "158821881")
createAnimationButton("QuickSlash", "49815113")
createAnimationButton("Sword Equip", "94160581")
createAnimationButton("Begin Charge", "252394340")
createAnimationButton("Charge", "252395365")
createAnimationButton("Release Charge", "252395746")
createAnimationButton("BDB Idle", "214747217")
createAnimationButton("BDB Walk", "214748382")
createAnimationButton("BDB Slash", "214744167")
createAnimationButton("BDb Staff", "214744412")
createAnimationButton("Weird Swing", "59085834")
createAnimationButton("High Slash", "1098424552")
createAnimationButton("Rock Sword Equip", "317460113")
createAnimationButton("Bash", "193343548")
createAnimationButton("StaffSlash", "46756384")
createAnimationButton("Tank Guitar", "265084639")
createAnimationButton("RHK2 Kick Ninja", "45738282")
createAnimationButton("FireCast", "32326240")
createAnimationButton("Sword Thrust", "32659703")
createAnimationButton("Grim Walk", "27759788")
createAnimationButton("Grim Double Hit", "27763344")
createAnimationButton("Grim Strike", "27761123")
createAnimationButton("Hold Grim", "27758613")
createAnimationButton("Gravity Slam", "33169573")
createAnimationButton("Wand Swing", "35978913")
createAnimationButton("Shake Hand", "177443776")
createAnimationButton("Eat", "103822775")
createAnimationButton("Throw", "209875013")
createAnimationButton("Holding Gun", "264034706")
createAnimationButton("Shoot", "97884303")
createAnimationButton("Reloading Gun", "97885754")
createAnimationButton("Chop", "186934753")
createAnimationButton("Slash", "186934658")
createAnimationButton("Sword Pump Up", "85723345")
createAnimationButton("Ninja Sword Slash", "45873069")
createAnimationButton("Shoot Cannon", "182463144")
createAnimationButton("Button Press", "75322014")
createAnimationButton("Sword Shield", "94789762")
createAnimationButton("Electric Guitar", "99200153")
createAnimationButton("Pluck Guitar Electric", "99198989")
createAnimationButton("Cheers", "314726307")
createAnimationButton("OverHeadSwing", "74897796")
createAnimationButton("ChopPunch", "181263498")
createAnimationButton("UpperPunch", "181263202")
createAnimationButton("SlingShot", "33248324")
createAnimationButton("Rage", "72635723")
createAnimationButton("Spin Arms", "233087184")
createAnimationButton("Two Hand Hold Out", "233077885")
createAnimationButton("Spin Arms 2", "259438880")
createAnimationButton("Arm", "259440107")
createAnimationButton("Arms Out Spin", "235542946")
createAnimationButton("SlashAnim", "63718551")
createAnimationButton("Kick Hit", "188443632")
createAnimationButton("Clap", "54456096")
createAnimationButton("idk what that is", "69427277")
createAnimationButton("slowly arms out", "69427262")
createAnimationButton("Salute", "186673959")
createAnimationButton("StandStill", "167272039")
createAnimationButton("Throw Candy", "181437419")
createAnimationButton("Hands Shaking", "93711728")
createAnimationButton("Shield", "49763871")
createAnimationButton("ShieldBash", "49907410")
createAnimationButton("Dance", "248263260")
createAnimationButton("Slap Face", "46182987")
createAnimationButton("Robot Dance", "466755434")
createAnimationButton("Horn Potion Run", "126707392")
createAnimationButton("On Fire", "90117804")
createAnimationButton("Horse Ride", "321277423")
createAnimationButton("Flower", "80395075")
createAnimationButton("Hands", "159223413")
createAnimationButton("Swing Thonas Hand", "243827693")
createAnimationButton("Motorcycle", "247487116")
createAnimationButton("Sword Crit Up", "66703957")
createAnimationButton("Sword", "66702743")
createAnimationButton("Ice Bucket Throw", "173673979")
createAnimationButton("Holding Object", "151316061")
createAnimationButton("Glider Fly", "90872539")
createAnimationButton("Kick Legs", "60882887")
createAnimationButton("Wave", "55270038")
createAnimationButton("Idle", "94108418")
createAnimationButton("Probably Dance", "94161088")
createAnimationButton("Spin", "188632011")
createAnimationButton("Weird Thrust", "94161333")
createAnimationButton("OverHeadSwing", "94160738")
createAnimationButton("Gun", "95383474")
createAnimationButton("Shoot", "95383980")
createAnimationButton("Shake", "99807079")
createAnimationButton("Tuck Ski", "142890187")
createAnimationButton("Dancing Jacks", {"204328711", "429681631"})
createAnimationButton("Playing Piano", "673670051")
createAnimationButton("GOONMAXðŸ’€", {"95383980", "167272039", "99807079", "106772613"})
createAnimationButton("BackPack Head", "68339848")
createAnimationButton("Crying", "180612465")
createAnimationButton("Weird Legs", "248336459")
createAnimationButton("Kick Back", "33686061")
createAnimationButton("WereWolf Curl", "42070810")
createAnimationButton("Saxphone", "45036843")
createAnimationButton("RHK", "45733005")
createAnimationButton("Penguin Jump", "46196309")
createAnimationButton("Staff Taunt", "46700863")
createAnimationButton("Praying", "48137861")
createAnimationButton("Flute Dance", "52155014")
createAnimationButton("Shaking Hand", "52414165")
createAnimationButton("Test1", "54145508")
createAnimationButton("Stroking It", "55786615")
createAnimationButton("Stroking It Fast", "55791140")
createAnimationButton("Scream", "73137648")
createAnimationButton("Sword Fire", "74815981")
createAnimationButton("moon charge", "74909500")
createAnimationButton("Start Rest", "75356030")
createAnimationButton("Tapping Head", "75477112")
createAnimationButton("Swing Hand", "78394786")
createAnimationButton("Testzzzzz", "79418964")
createAnimationButton("anim walk", "80979216")
createAnimationButton("anim stand", "80979207")
createAnimationButton("Wavy Hands", "85568863")
createAnimationButton("Head Swing", "85570603")
createAnimationButton("Sports Jump", "85837259")
createAnimationButton("Call me", "86614939")
createAnimationButton("Idle Fencing", "87983681")
createAnimationButton("Lunge Fencing", "87985027")
createAnimationButton("Shaking Legs", "87986341")
createAnimationButton("Head Right Position", "88016955")
createAnimationButton("Psycho Arms", "90814669")
createAnimationButton("Self Harm", "91346946")
createAnimationButton("Enrage", "93648331")
createAnimationButton("Summon", "93693205")
createAnimationButton("Throw", "94157627")
createAnimationButton("Slam Leg", "94190213")
createAnimationButton("Execute", "94790629")
createAnimationButton("Fall Panic", "95424077")
createAnimationButton("Spartain Kick", "96619712")
createAnimationButton("Looking Up", "97169019")
createAnimationButton("Jump Jets", "97170520")
createAnimationButton("Landing Jets", "97171309")
createAnimationButton("nothinbg", "98454170")
createAnimationButton("yay Falling money", "99815141")
createAnimationButton("Run Charge", "100348530")
createAnimationButton("Football Dance", "101862746")
createAnimationButton("Arm Test", "102492689")
createAnimationButton("ArmTest 2", "103744157")
createAnimationButton("ArmTest 3", "103798833")
createAnimationButton("Laying While Snipe Gun", "113246235")
createAnimationButton("Laying Down", "181526230")
createAnimationButton("Faint", "181525546")
createAnimationButton("Laser Gun Crawl", "182749109")
createAnimationButton("BEND OVER!!!", "182789003")
createAnimationButton("Cover Face", "183696478")
createAnimationButton("DinoWalk", "190075311")
createAnimationButton("Sai Fall", "233322916")
createAnimationButton("SideStep UpperSlash", "247744115")
createAnimationButton("Crouch", "287325678")
createAnimationButton("Sleep", "327324663")
createAnimationButton("Throw", "28604759")
createAnimationButton("Monster Mash Dance", "35634514")
createAnimationButton("Monster Mash Dance 2", "35654637")
createAnimationButton("Listening Boombox", "122342062")
createAnimationButton("Cannon Up", "56146409")
createAnimationButton("Cannon Down", "56153856")
createAnimationButton("Beating Chest", "72635328")
createAnimationButton("Shaking Arms Ig", "73177702")
createAnimationButton("Arm Slash Sides", "74909569")
createAnimationButton("Calling Someone", "87684948")
createAnimationButton("Hockey Check", "142495255")
createAnimationButton("Arms Up", "187951261")
createAnimationButton("Arms Out ", "188242481")
createAnimationButton("Bomb Hold", "94861246")
createAnimationButton("Shiver", "216937924")
createAnimationButton("MRBEAST MEME POINT", "243656287")


-- Adjust button layout for more buttons as needed