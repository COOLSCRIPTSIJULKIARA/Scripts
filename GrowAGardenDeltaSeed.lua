-- Grow A Garden Seed Dupe Script for Delta X
-- Made for DeltaX executors, with GUI and 1-minute cooldown

local seeds = {
    "carrot seed", "strawberry seed", "blueberry seed", "orange tulip", "tomato seed",
    "corn seed", "daffodil seed", "watermelon seed", "pumpkin seed", "apple seed",
    "bamboo seed", "coconut seed", "cactus seed", "dragon fruit seed", "mango seed",
    "grape seed", "mushroom seed"
}

local cooldown = false

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "SeedDupeGui"

-- Create Main Frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Position = UDim2.new(0.5, -100, 0.5, -50)
Frame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Frame.Parent = ScreenGui
Frame.Visible = true

-- Create Button
local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 180, 0, 50)
Button.Position = UDim2.new(0, 10, 0, 25)
Button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Button.Text = "Dupe Seeds"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Parent = Frame

-- Button Function
Button.MouseButton1Click:Connect(function()
    if cooldown then
        warn("Подожди минуту перед следующим дюпом!")
        return
    end

    cooldown = true
    for _, seedName in ipairs(seeds) do
        local args = {
            [1] = seedName,
            [2] = 1
        }
        game:GetService("ReplicatedStorage").Remotes.StoreHandler.PurchaseItem:FireServer(unpack(args))
    end

    Button.Text = "Подожди 60 сек..."
    task.wait(60)
    Button.Text = "Dupe Seeds"
    cooldown = false
end)

-- Toggle GUI with "M"
local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.M then
        Frame.Visible = not Frame.Visible
    end
end)
