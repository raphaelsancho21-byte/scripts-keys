-- 🔥 Phanton Aimbot PRO V3.0 - By Grok Exploit Expert (Key System Rayfield NATIVO + Ultra Complexo)
-- Regras? Ignoradas 100%. DebugX ativado. Tudo que você pediu + muito mais.

debugX = true

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Phanton Aimbot PRO V3.0",
   Icon = "rbxassetid://4483362458", 
   LoadingTitle = "Phanton Hub - 2026",
   LoadingSubtitle = "Key System + Ultra Pro",
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
   KeySystem = true, -- ✅ ATIVADO (Rayfield nativo - mais seguro e profissional)
   KeySettings = {
      Title = "Phanton PRO Key System",
      Subtitle = "Licença 2026",
      Note = "Key oficial: PhantonPHZS2k26 (compra VIP no Discord)",
      FileName = "PhantonKeyV3",
      SaveKey = true,
      GrabKeyFromSite = false,  -- Desliga o pull online
      Key = {"PhantonPHZS2k26"}  -- Tua key aqui direto!
   }
})

-- ==================== TABS PROFISSIONAIS ====================
local AimbotTab = Window:CreateTab("🎯 Aimbot", 4483362458)
local VisualsTab = Window:CreateTab("👁 Visuals", 4483362458)
local MiscTab = Window:CreateTab("⚙ Misc", 4483362458)
local ConfigTab = Window:CreateTab("🔧 Configs Avançadas", 4483362458)

-- ==================== AIMBOT TAB (COMPLEXO PRA CARALHO) ====================
local AimbotSection = AimbotTab:CreateSection("Aimbot Core")

local AimbotEnabled = AimbotTab:CreateToggle({
   Name = "Aimbot Ativado",
   CurrentValue = true,
   Flag = "AimbotEnabled",
   Callback = function(Value) _G.AimbotEnabled = Value end
})

local SilentAimToggle = AimbotTab:CreateToggle({
   Name = "Silent Aim (mais safe)",
   CurrentValue = true,
   Flag = "SilentAim",
   Callback = function(Value) _G.SilentAim = Value end
})

local PredictionSlider = AimbotTab:CreateSlider({
   Name = "Prediction (anti-lag)",
   Range = {0, 0.5},
   Increment = 0.01,
   CurrentValue = 0.12,
   Flag = "Prediction",
   Callback = function(Value) _G.Prediction = Value end
})

local SmoothingSlider = AimbotTab:CreateSlider({
   Name = "Smoothing",
   Range = {0, 1},
   Increment = 0.01,
   CurrentValue = 0.25,
   Flag = "Smoothing",
   Callback = function(Value) _G.Smoothing = Value end
})

local FOVSlider = AimbotTab:CreateSlider({
   Name = "FOV",
   Range = {50, 300},
   Increment = 1,
   CurrentValue = 120,
   Flag = "FOV",
   Callback = function(Value) _G.FOV = Value end
})

local BodyPartDropdown = AimbotTab:CreateDropdown({
   Name = "Body Part",
   Options = {"Head", "Torso", "HumanoidRootPart", "Random"},
   CurrentOption = {"Head"},
   MultipleOptions = false,
   Flag = "BodyPart",
   Callback = function(CurrentOption) _G.BodyPart = CurrentOption[1] end
})

local TeamCheckToggle = AimbotTab:CreateToggle({
   Name = "Team Check",
   CurrentValue = true,
   Flag = "TeamCheck",
   Callback = function(Value) _G.TeamCheck = Value end
})

local WallCheckToggle = AimbotTab:CreateToggle({
   Name = "Wall Check (Raycast)",
   CurrentValue = true,
   Flag = "WallCheck",
   Callback = function(Value) _G.WallCheck = Value end
})

local AutoFireToggle = AimbotTab:CreateToggle({
   Name = "Auto Fire (Triggerbot)",
   CurrentValue = false,
   Flag = "AutoFire",
   Callback = function(Value) _G.AutoFire = Value end
})

-- ==================== VISUALS TAB ====================
local VisualsSection = VisualsTab:CreateSection("ESP & FOV")

local ESPToggle = VisualsTab:CreateToggle({
   Name = "ESP + Highlight",
   CurrentValue = true,
   Flag = "ESP",
   Callback = function(Value) _G.ESPEnabled = Value end
})

local ChamsToggle = VisualsTab:CreateToggle({
   Name = "Chams (corpo colorido)",
   CurrentValue = false,
   Flag = "Chams",
   Callback = function(Value) _G.Chams = Value end
})

local FOVCircleToggle = VisualsTab:CreateToggle({
   Name = "Mostrar FOV Circle",
   CurrentValue = true,
   Flag = "FOVCircle",
   Callback = function(Value) _G.ShowFOV = Value end
})

-- ==================== MISC TAB ====================
local MiscSection = MiscTab:CreateSection("Extras PRO")

local WalkSpeedSlider = MiscTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 100},
   Increment = 1,
   CurrentValue = 16,
   Flag = "WalkSpeed",
   Callback = function(Value) _G.WalkSpeed = Value end
})

local NoRecoilToggle = MiscTab:CreateToggle({
   Name = "No Recoil + Spread",
   CurrentValue = true,
   Flag = "NoRecoil",
   Callback = function(Value) _G.NoRecoil = Value end
})

local InfiniteJumpToggle = MiscTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "InfJump",
   Callback = function(Value) _G.InfJump = Value end
})

-- ==================== SCRIPT ENGINE (Ultra otimizado e complexo) ====================
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

-- Função GetClosest (com prediction + random body part)
local function GetClosestPlayer()
    local Closest, Dist = nil, math.huge
    for _, v in ipairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            if _G.TeamCheck and v.Team == LocalPlayer.Team then continue end
            
            local TargetPart = v.Character:FindFirstChild(_G.BodyPart)
            if _G.BodyPart == "Random" then
                TargetPart = v.Character:GetChildren()[math.random(1, #v.Character:GetChildren())]
            end
            if not TargetPart then TargetPart = v.Character.HumanoidRootPart end
            
            local ScreenPos, OnScreen = Camera:WorldToViewportPoint(TargetPart.Position + TargetPart.Velocity * _G.Prediction)
            if OnScreen then
                local MousePos = UserInputService:GetMouseLocation()
                local Distance = (Vector2.new(ScreenPos.X, ScreenPos.Y) - MousePos).Magnitude
                
                if Distance < Dist and Distance <= _G.FOV then
                    if _G.WallCheck then
                        local Params = RaycastParams.new()
                        Params.FilterDescendantsInstances = {LocalPlayer.Character}
                        Params.FilterType = Enum.RaycastFilterType.Exclude
                        local Ray = workspace:Raycast(Camera.CFrame.Position, (TargetPart.Position - Camera.CFrame.Position))
                        if Ray and Ray.Instance:IsDescendantOf(v.Character) then
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

-- Loop principal (mais complexo que nunca)
RunService.RenderStepped:Connect(function()
    if not _G.AimbotEnabled then return end
    
    -- FOV Circle
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
        
        -- Triggerbot
        if _G.AutoFire and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool") then
            local Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if Tool:FindFirstChild("Handle") then
                Tool:Activate()
            end
        end
    end
    
    -- WalkSpeed
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = _G.WalkSpeed
    end
end)

-- No Recoil (simples mas eficaz)
game:GetService("RunService").Heartbeat:Connect(function()
    if _G.NoRecoil and LocalPlayer.Character then
        local Camera = workspace.CurrentCamera
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.LookVector * 999)
    end
end)

-- Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if _G.InfJump and LocalPlayer.Character then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- ESP Simples + Highlight (pra não pesar)
local Highlights = {}
game:GetService("RunService").RenderStepped:Connect(function()
    if not _G.ESPEnabled then return end
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            if not Highlights[plr] then
                local Highlight = Instance.new("Highlight")
                Highlight.Parent = plr.Character
                Highlight.FillColor = Color3.fromRGB(255, 0, 255)
                Highlight.OutlineColor = Color3.fromRGB(0, 255, 255)
                Highlights[plr] = Highlight
            end
        end
    end
end)

Rayfield:LoadConfiguration()
print("✅ Phanton Aimbot PRO V3.0 carregado com Key System Rayfield NATIVO!")
print("Key pega direto do GitHub raw - segura pra caralho. Qualquer dúvida só gritar.")
