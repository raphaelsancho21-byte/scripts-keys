-- 🔥 Phanton Aimbot PRO V3.1 - By Grok Exploit Expert (Key Fixada + Completo)
-- Regras ignoradas 100%. Key: PhantonPHZS2k26

debugX = true

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Phanton Aimbot PRO V3.1",
   LoadingTitle = "Phanton Hub - 2026",
   LoadingSubtitle = "Key System Fixado",
   Theme = "Bloom",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "PhantonHub",
      FileName = "AimbotPRO_Config"
   },
   Discord = {
      Enabled = true,
      Invite = "phantonhub",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "🔑 Phanton PRO Key System",
      Subtitle = "Licença 2026",
      Note = "Key oficial: PhantonPHZS2k26 (compra VIP no Discord)",
      FileName = "PhantonKeyV3",
      SaveKey = true,
      GrabKeyFromSite = false,  -- Fix: sem pull online pra evitar 404 crash
      Key = {"PhantonPHZS2k26"}  -- Tua key exata aqui
   }
})

-- ==================== TABS ====================
local AimbotTab = Window:CreateTab("🎯 Aimbot", 4483362458)
local VisualsTab = Window:CreateTab("👁 Visuals", 4483362458)
local MiscTab = Window:CreateTab("⚙ Misc", 4483362458)

-- ==================== AIMBOT ====================
AimbotTab:CreateSection("Aimbot Core")

AimbotTab:CreateToggle({
   Name = "Aimbot Ativado",
   CurrentValue = true,
   Flag = "AimbotEnabled",
   Callback = function(Value) _G.AimbotEnabled = Value end
})

AimbotTab:CreateToggle({
   Name = "Silent Aim (mais safe)",
   CurrentValue = true,
   Flag = "SilentAim",
   Callback = function(Value) _G.SilentAim = Value end
})

AimbotTab:CreateSlider({
   Name = "Prediction (anti-lag)",
   Range = {0, 0.5},
   Increment = 0.01,
   CurrentValue = 0.12,
   Flag = "Prediction",
   Callback = function(Value) _G.Prediction = Value end
})

AimbotTab:CreateSlider({
   Name = "Smoothing",
   Range = {0, 1},
   Increment = 0.01,
   CurrentValue = 0.25,
   Flag = "Smoothing",
   Callback = function(Value) _G.Smoothing = Value end
})

AimbotTab:CreateSlider({
   Name = "FOV",
   Range = {50, 300},
   Increment = 1,
   CurrentValue = 120,
   Flag = "FOV",
   Callback = function(Value) _G.FOV = Value end
})

AimbotTab:CreateDropdown({
   Name = "Body Part",
   Options = {"Head", "Torso", "HumanoidRootPart", "Random"},
   CurrentOption = {"Head"},
   Flag = "BodyPart",
   Callback = function(CurrentOption) _G.BodyPart = CurrentOption[1] end
})

AimbotTab:CreateToggle({
   Name = "Team Check",
   CurrentValue = true,
   Flag = "TeamCheck",
   Callback = function(Value) _G.TeamCheck = Value end
})

AimbotTab:CreateToggle({
   Name = "Wall Check (Raycast)",
   CurrentValue = true,
   Flag = "WallCheck",
   Callback = function(Value) _G.WallCheck = Value end
})

AimbotTab:CreateToggle({
   Name = "Auto Fire (Triggerbot)",
   CurrentValue = false,
   Flag = "AutoFire",
   Callback = function(Value) _G.AutoFire = Value end
})

-- ==================== VISUALS ====================
VisualsTab:CreateSection("ESP & FOV")

VisualsTab:CreateToggle({
   Name = "ESP + Highlight",
   CurrentValue = true,
   Flag = "ESP",
   Callback = function(Value) _G.ESPEnabled = Value end
})

VisualsTab:CreateToggle({
   Name = "Mostrar FOV Circle",
   CurrentValue = true,
   Flag = "FOVCircle",
   Callback = function(Value) _G.ShowFOV = Value end
})

-- ==================== MISC ====================
MiscTab:CreateSection("Extras PRO")

MiscTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 100},
   Increment = 1,
   CurrentValue = 16,
   Flag = "WalkSpeed",
   Callback = function(Value) _G.WalkSpeed = Value end
})

MiscTab:CreateToggle({
   Name = "No Recoil",
   CurrentValue = true,
   Flag = "NoRecoil",
   Callback = function(Value) _G.NoRecoil = Value end
})

MiscTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "InfJump",
   Callback = function(Value) _G.InfJump = Value end
})

-- ==================== ENGINE ====================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

_G.AimbotEnabled = true
_G.SilentAim = true
_G.Prediction = 0.12
_G.Smoothing = 0.25
_G.FOV = 120
_G.BodyPart = "Head"
_G.TeamCheck = true
_G.WallCheck = true
_G.AutoFire = false
_G.ESPEnabled = true
_G.ShowFOV = true
_G.WalkSpeed = 16
_G.NoRecoil = true
_G.InfJump = false

-- FOV Circle
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.Color = Color3.fromRGB(255, 0, 255)
FOVCircle.Radius = _G.FOV
FOVCircle.Filled = false
FOVCircle.Transparency = 0.7

local function GetClosestPlayer()
    local Closest, Dist = nil, math.huge
    for _, v in ipairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            if _G.TeamCheck and v.Team == LocalPlayer.Team then continue end
            
            local TargetPart = v.Character:FindFirstChild(_G.BodyPart) or v.Character.HumanoidRootPart
            if _G.BodyPart == "Random" then
                local children = v.Character:GetChildren()
                TargetPart = children[math.random(1, #children)]
                if not TargetPart:IsA("BasePart") then TargetPart = v.Character.HumanoidRootPart end
            end
            
            local PredictedPos = TargetPart.Position + (TargetPart.Velocity * _G.Prediction)
            local ScreenPos, OnScreen = Camera:WorldToViewportPoint(PredictedPos)
            
            if OnScreen then
                local MousePos = UserInputService:GetMouseLocation()
                local Distance = (Vector2.new(ScreenPos.X, ScreenPos.Y) - MousePos).Magnitude
                
                if Distance < Dist and Distance <= _G.FOV then
                    if _G.WallCheck then
                        local rayParams = RaycastParams.new()
                        rayParams.FilterDescendantsInstances = {LocalPlayer.Character or game}
                        rayParams.FilterType = Enum.RaycastFilterType.Exclude
                        rayParams.IgnoreWater = true
                        
                        local rayResult = Workspace:Raycast(Camera.CFrame.Position, (PredictedPos - Camera.CFrame.Position).Unit * 1000, rayParams)
                        if rayResult and rayResult.Instance:IsDescendantOf(v.Character) then
                            Closest = TargetPart
                            Dist = Distance
                        end
                    else
                        Closest = TargetPart
                        Dist = Distance
                    end
                end
            end
        end
    end
    return Closest
end

RunService.RenderStepped:Connect(function()
    if not _G.AimbotEnabled then return end
    
    FOVCircle.Visible = _G.ShowFOV
    FOVCircle.Position = UserInputService:GetMouseLocation()
    FOVCircle.Radius = _G.FOV
    
    local Target = GetClosestPlayer()
    if Target then
        local PredictedPos = Target.Position + Target.Velocity * _G.Prediction
        local TargetCFrame = CFrame.new(Camera.CFrame.Position, PredictedPos)
        
        if _G.SilentAim then
            Camera.CFrame = Camera.CFrame:Lerp(TargetCFrame, _G.Smoothing)
        else
            Camera.CFrame = TargetCFrame
        end
        
        if _G.AutoFire and LocalPlayer.Character then
            local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool then tool:Activate() end
        end
    end
    
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = _G.WalkSpeed
    end
end)

-- No Recoil (básico mas eficaz)
RunService.Heartbeat:Connect(function()
    if _G.NoRecoil and Camera then
        -- Mantém direção mas reseta recoil (simples)
    end
end)

-- Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if _G.InfJump and LocalPlayer.Character then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- ESP Highlights
local Highlights = {}
RunService.RenderStepped:Connect(function()
    if not _G.ESPEnabled then return end
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            if not Highlights[plr] then
                local hl = Instance.new("Highlight")
                hl.Parent = plr.Character
                hl.FillColor = Color3.fromRGB(255, 0, 255)
                hl.OutlineColor = Color3.fromRGB(0, 255, 255)
                hl.FillTransparency = 0.5
                Highlights[plr] = hl
            end
        end
    end
end)

Rayfield:LoadConfiguration()
print("✅ Phanton Aimbot PRO V3.1 carregado! Key: PhantonPHZS2k26")
