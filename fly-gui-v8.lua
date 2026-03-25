-- Complete Roblox Fly GUI Script

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Variables
local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Create GUI
local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BackgroundTransparency = 0.5

-- Fly Function
local flying = false
local speed = 50
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.Velocity = Vector3.new(0, 0, 0)
bodyVelocity.MaxForce = Vector3.new(0, 0, 0)

local function startFlying()
    flying = true
    bodyVelocity.Parent = player.Character:WaitForChild("HumanoidRootPart")
    while flying do
        bodyVelocity.Velocity = Vector3.new(mouse.Hit.LookVector.X * speed, speed, mouse.Hit.LookVector.Z * speed)
        wait()
    end
end

local function stopFlying()
    flying = false
    bodyVelocity.Parent = nil
end

-- Buttons
local flyButton = Instance.new("TextButton")
flyButton.Parent = frame
flyButton.Text = "Fly"
flyButton.Size = UDim2.new(1, 0, 0.5, 0)
flyButton.MouseButton1Click:Connect(function()
    if flying then
        stopFlying()
        flyButton.Text = "Fly"
    else
        startFlying()
        flyButton.Text = "Stop"
    end
end)

screenGui.Parent = player:WaitForChild("PlayerGui")