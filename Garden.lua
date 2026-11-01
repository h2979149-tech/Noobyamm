-- ============================================================================
-- NOOB-HUB: PASAR HUTAN EDITION (SIMPAN DENGAN NAMA: Garden.lua)
-- ============================================================================

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    warn("Noob-Hub: Aktivitas Anti-AFK dipicu secara aman!")
end)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({ 
    Name = "Noob-Hub | Pasar Hutan", 
    ConfigurationSaving = { Enabled = false } 
})

local TabGarden = Window:CreateTab("Kebun & Ternak", nil)
local TabToko = Window:CreateTab("Manajemen Toko", nil)

_G.InstantPlant = false
_G.AutoWaterPlant = false
_G.AutoCollectProducts = false
_G.InstantInteraction = false

TabGarden:CreateToggle({
   Name = "Tanam Instan (Instant Planting)",
   CurrentValue = false,
   Callback = function(Value)
       _G.InstantPlant = Value
       task.spawn(function()
           while _G.InstantPlant do
               task.wait(math.random(2, 5) / 10) 
               pcall(function()
                   for _, prompt in pairs(workspace:GetDescendants()) do
                       if _G.InstantPlant and prompt:IsA("ProximityPrompt") then
                           if prompt.ObjectText == "Tanah" or prompt.ActionText == "Tanam" or prompt.ActionText == "Plant" then
                               prompt:InputHoldBegin()
                               task.wait(0.02)
                               prompt:InputHoldEnd()
                           end
                       end
                   end
               end)
           end
       end)
   end,
})

TabGarden:CreateToggle({
   Name = "Bypass Waktu Interaksi (0 Detik)",
   CurrentValue = false,
   Callback = function(Value)
       _G.InstantInteraction = Value
       task.spawn(function()
           while _G.InstantInteraction do
               task.wait(0.5)
               pcall(function()
                   for _, prompt in pairs(workspace:GetDescendants()) do
                       if prompt:IsA("ProximityPrompt") then
                           prompt.HoldDuration = 0
                       end
                   end
               end)
           end
       end)
   end,
})

TabGarden:CreateToggle({
   Name = "Auto Siram/Urus Tanaman",
   CurrentValue = false,
   Callback = function(Value)
       _G.AutoWaterPlant = Value
       task.spawn(function()
           while _G.AutoWaterPlant do
               task.wait(math.random(3, 6) / 10)
               pcall(function()
                   for _, prompt in pairs(workspace:GetDescendants()) do
                       if _G.AutoWaterPlant and prompt:IsA("ProximityPrompt") then
                           if prompt.ObjectText == "Tanaman" or prompt.ActionText == "Siram" or prompt.ActionText == "Panen" then
                               prompt:InputHoldBegin()
                               task.wait(0.02)
                               prompt:InputHoldEnd()
                           end
                       end
                   end
               end)
           end
       end)
   end,
})

TabGarden:CreateToggle({
   Name = "Auto Tarik Hasil Ternak (Aman)",
   CurrentValue = false,
   Callback = function(Value)
       _G.AutoCollectProducts = Value
       task.spawn(function()
           while _G.AutoCollectProducts do
               task.wait(0.5)
               pcall(function()
                   local character = game.Players.LocalPlayer.Character
                   local hrp = character and character:FindFirstChild("HumanoidRootPart")
                   if hrp then
                       local playerPos = hrp.Position
                       for _, item in pairs(workspace:GetChildren()) do
                           if _G.AutoCollectProducts and (item.Name == "Egg" or item.Name == "Milk" or item.Name == "HasilTernak") then
                               if item:IsA("BasePart") then
                                   local distance = (item.Position - playerPos).Magnitude
                                   if distance <= 40 then
                                       item.CFrame = hrp.CFrame
                                   end
                               end
                           end
                       end
                   end
               end)
           end
       end)
   end,
})

TabToko:CreateButton({
   Name = "Isi Semua Rak Toko Instan",
   Callback = function()
       pcall(function()
           for _, prompt in pairs(workspace:GetDescendants()) do
               if prompt:IsA("ProximityPrompt") and (prompt.ObjectText == "Rak" or prompt.ActionText == "Pajang Barang") then
                   prompt:InputHoldBegin()
                   task.wait(0.02)
                   prompt:InputHoldEnd()
               end
           end
       end)
   end,
})

Rayfield:Notify({
   Name = "Noob-Hub Siap!",
   Content = "Skrip Pasar Hutan telah dimuat secara utuh.",
   Duration = 5,
   Image = 4483362458,
})
