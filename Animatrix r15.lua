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
local OtherFrame = Instance.new("TextLabel")
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
TopBar.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
TopBar.Size = UDim2.new(1, 0, 0, 31)

topcorner.Parent = TopBar
topcorner.CornerRadius = UDim.new(0, 10)

-- BottomBar
BottomBar.Parent = MainFrame
BottomBar.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
BottomBar.Size = UDim2.new(1, 0, 0, 30)
BottomBar.Position = UDim2.new(0, 0, 1, -31)

bottomcorner.Parent = BottomBar
bottomcorner.CornerRadius = UDim.new(0, 10)

BottomBar2.Parent = TabContainer
BottomBar2.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
BottomBar2.Size = UDim2.new(1.5, 0, 0, 30)
BottomBar2.Position = UDim2.new(0, 0, 1, -31)

bottomcorner2.Parent = BottomBar2
bottomcorner2.CornerRadius = UDim.new(0, 10)

-- TopBar
TopBar2.Parent = TabContainer
TopBar2.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
TopBar2.Size = UDim2.new(1.5, 0, 0, 31)
TopBar2.Position = UDim2.new(0, 0, 0, -30)

topcorner2.Parent = TopBar2
topcorner2.CornerRadius = UDim.new(0, 10)

BottomBar3.Parent = MuseumFrameWarn
BottomBar3.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
BottomBar3.Size = UDim2.new(1, 0, 0, 30)
BottomBar3.Position = UDim2.new(0, 0, 1, -31)
BottomBar3.BackgroundTransparency = 0.5

bottomcorner3.Parent = BottomBar3
bottomcorner3.CornerRadius = UDim.new(0, 10)

-- TopBar
TopBar3.Parent = MuseumFrameWarn
TopBar3.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
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
TitleText.Text = "Animatrix"
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
OtherFrame.Text = "Not Finished For R15!"
OtherFrame.Font = Enum.Font.Cartoon
OtherFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
OtherFrame.TextScaled = true


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
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 4, 0)
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


-- Example usage of `createExecuteScriptButton`
createExecuteScriptButton("R15 Anims By Gio", function()
    loadstring(game:HttpGet("https://pastefy.app/FN77ZhT4/raw"))()
end)

createExecuteScriptButton("Motion Hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MotionHubBeta/BetaMotion/refs/heads/main/MotionHubBeta"))()
end)

-- Example usage of `createExecuteScriptButton`
createExecuteScriptButton("Jerk Off By Gio", function()
loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
end)

createExecuteScriptButton("Dash Anim By Gio", function()
loadstring(game:HttpGet("https://pastefy.app/ZhKVgCK3/raw"))()
end)

-- Adding buttons (you can add more here)
createAnimationButton("Rifle Reload", "3972131105")
createAnimationButton("Rifle Aim Rotate", "3972157449")
createAnimationButton("Rifle Aim Slow", "3972164452")
createAnimationButton("Soldier Assault Rifle Aim", "4713633512")
createAnimationButton("Soldier Assault Rifle Fire", "4713811763")
createAnimationButton("zombie_attack", "3489169607")
createAnimationButton("zombie_death", "3716468774")
createAnimationButton("Playing Piano", "673670434")
createAnimationButton("Passenger Seated", "3360695880")
createAnimationButton("Driver Seated", "3360694441")
createAnimationButton("R15 Sword Lunge", "522638767")
createAnimationButton("R15 Sword Slash", "522635514")
createAnimationButton("Float Slash", "717879555")
createAnimationButton("Arms Out", "582384156")
createAnimationButton("Down Slash", "746398327")
createAnimationButton("Spinner", "754658275")
createAnimationButton("Ban Hammer Slash", "674871189")
createAnimationButton("Ghost Zombie", "708553116")
createAnimationButton("Pull", "675025795")
createAnimationButton("Princess Fire", "582855105")
createAnimationButton("Circle Arm", "698251653")
createAnimationButton("Bend", "696096087")
createAnimationButton("Rotate Slash", "675025570")
createAnimationButton("Clap", "754656200")
createAnimationButton("Blow", "522621924")
createAnimationButton("Whack", "536145995")
createAnimationButton("Slash", "536516422")
createAnimationButton("Bow Idle", "539471275")
createAnimationButton("Left Slash", "582795728")
createAnimationButton("OverHead Slash", "582796800")
createAnimationButton("Violin Playing", "582905411")
createAnimationButton("Falling", "718076987")
createAnimationButton("Sit", "807343012")
createAnimationButton("animation", "835635145")
createAnimationButton("animation2", "835649542")
createAnimationButton("Swing", "846744780")
createAnimationButton("Jump Attack", "855685476")
createAnimationButton("Train Hand", "855743063")
createAnimationButton("Spin Arm", "900850443")
createAnimationButton("Punching", "1098404428")
createAnimationButton("Spear Stab", "1323151362")
createAnimationButton("Spin", "2516930867")
createAnimationButton("Sleep", "2695918332")
createAnimationButton("Slam", "2733837253")
createAnimationButton("Quake", "2917204509")
createAnimationButton("Stab", "2917193622")
createAnimationButton("Trident Slash", "2917200442")
createAnimationButton("Summon", "3027289605")
createAnimationButton("Stab2", "3027801142")
createAnimationButton("Dagger Stab", "3101877315")
createAnimationButton("Dagger Lunge", "3101922409")
createAnimationButton("Time Stop", "3101948279")
createAnimationButton("Piano JUmp", "11453082181")
createAnimationButton("Rise Above", "12992262118")
createAnimationButton("Dance", "12259828678")
createAnimationButton("Kick It Dance", "12259826609")
createAnimationButton("Jawny Stomp", "16392075853")