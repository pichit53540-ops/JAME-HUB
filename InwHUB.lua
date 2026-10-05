-- =======================================================
--  IทwIจ้า HUB - Standalone 8-Tab Custom UI
-- =======================================================

-- ป้องกันการเปิด UI ซ้ำ
if game:GetService("CoreGui"):FindFirstChild("InwJaoHubGui") then
    game:GetService("CoreGui").InwJaoHubGui:Destroy()
end

-- 1. ScreenGui หลัก
local InwGui = Instance.new("ScreenGui")
InwGui.Name = "InwJaoHubGui"
InwGui.Parent = game:GetService("CoreGui")

-- 2. Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = InwGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0) -- ขอบทองเทพเจ้า
MainFrame.BorderSizePixel = 2
MainFrame.Position = UDim2.new(0.2, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 480, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

-- Title Bar
local TitleBar = Instance.new("TextLabel")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
TitleBar.Size = UDim2.new(1, 0, 0, 35)
TitleBar.Font = Enum.Font.SourceSansBold
TitleBar.Text = "  ⚡ IทwIจ้า Hub | Custom 8-Tab Edition"
TitleBar.TextColor3 = Color3.fromRGB(255, 215, 0)
TitleBar.TextSize = 18
TitleBar.TextXAlignment = Enum.TextXAlignment.Left

-- ปุ่มปิด UI
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Position = UDim2.new(1, -30, 0.15, 0)
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 14
CloseBtn.MouseButton1Click:Connect(function()
    InwGui:Destroy()
end)

-- แถบเมนูด้านซ้าย (Tab List Holder)
local TabBar = Instance.new("ScrollingFrame")
TabBar.Parent = MainFrame
TabBar.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
TabBar.Position = UDim2.new(0, 5, 0, 40)
TabBar.Size = UDim2.new(0, 130, 1, -45)
TabBar.CanvasSize = UDim2.new(0, 0, 0, 330)
TabBar.ScrollBarThickness = 3

local TabUIList = Instance.new("UIListLayout")
TabUIList.Parent = TabBar
TabUIList.Padding = UDim.new(0, 4)

-- พื้นที่แสดงเนื้อหาด้านขวา (Content Holder)
local ContentArea = Instance.new("Frame")
ContentArea.Parent = MainFrame
ContentArea.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
ContentArea.Position = UDim2.new(0, 140, 0, 40)
ContentArea.Size = UDim2.new(1, -145, 1, -45)

---------------------------------------------------------------------
-- ระบบจัดการแท็บ (Tab Engine)
---------------------------------------------------------------------
local TabFrames = {}

local function CreateTab(tabName)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Parent = TabBar
    TabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    TabBtn.Size = UDim2.new(1, -5, 0, 35)
    TabBtn.Font = Enum.Font.SourceSans
    TabBtn.Text = tabName
    TabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    TabBtn.TextSize = 14

    local PageFrame = Instance.new("ScrollingFrame")
    PageFrame.Parent = ContentArea
    PageFrame.Size = UDim2.new(1, -10, 1, -10)
    PageFrame.Position = UDim2.new(0, 5, 0, 5)
    PageFrame.BackgroundTransparency = 1
    PageFrame.Visible = false
    PageFrame.ScrollBarThickness = 4

    local PageList = Instance.new("UIListLayout")
    PageList.Parent = PageFrame
    PageList.Padding = UDim.new(0, 6)

    table.insert(TabFrames, PageFrame)

    TabBtn.MouseButton1Click:Connect(function()
        for _, f in pairs(TabFrames) do f.Visible = false end
        PageFrame.Visible = true
    end)

    return PageFrame
end

-- ฟังก์ชันสร้างปุ่ม Toggle
local function AddToggle(parent, text, defaultState, callback)
    local Btn = Instance.new("TextButton")
    Btn.Parent = parent
    Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    Btn.Size = UDim2.new(1, -10, 0, 32)
    Btn.Font = Enum.Font.SourceSansBold
    Btn.TextSize = 14
    
    local state = defaultState
    local function updateText()
        if state then
            Btn.Text = text .. " : [ ON ]"
            Btn.TextColor3 = Color3.fromRGB(100, 255, 100)
        else
            Btn.Text = text .. " : [ OFF ]"
            Btn.TextColor3 = Color3.fromRGB(255, 100, 100)
        end
    end
    
    updateText()
    Btn.MouseButton1Click:Connect(function()
        state = not state
        updateText()
        callback(state)
    end)
end

---------------------------------------------------------------------
-- สร้างทั้ง 8 หน้า (8 Tabs)
---------------------------------------------------------------------
local Tab1 = CreateTab("1. ฟาร์มหลัก")
local Tab2 = CreateTab("2. ฟาร์มพิเศษ")
local Tab3 = CreateTab("3. ดันเจี้ยน/เรด")
local Tab4 = CreateTab("4. กิจกรรมทะเล")
local Tab5 = CreateTab("5. เผ่า V4/มิราจ")
local Tab6 = CreateTab("6. วาร์ป/ร้านค้า")
local Tab7 = CreateTab("7. ผลไม้/ไอเทม")
local Tab8 = CreateTab("8. ตั้งค่า/ลดแลค")

-- แสดงหน้าแรกไว้ก่อน
TabFrames[1].Visible = true

---------------------------------------------------------------------
-- ใส่ฟังค์ชันลงในแต่ละหน้า
---------------------------------------------------------------------

-- หน้าที่ 1: ฟาร์มหลัก
AddToggle(Tab1, "ระบบฟาร์มอัตโนมัติ", false, function(v) _G.AutoFarm = v end)
AddToggle(Tab1, "ดึงมอนมารวม (Bring Mob)", true, function(v) _G.BringMob = v end)
AddToggle(Tab1, "โจมตีเร็ว (Fast Attack)", true, function(v) _G.FastAttack = v end)

-- หน้าที่ 2: ฟาร์มพิเศษ
AddToggle(Tab2, "ฟาร์มมาสเตอรี่อาวุธ", false, function(v) _G.MasteryWeapon = v end)
AddToggle(Tab2, "ฟาร์มกระดูก (Bones)", false, function(v) _G.FarmBones = v end)

-- หน้าที่ 3: ดันเจี้ยน
AddToggle(Tab3, "ลงดันเจี้ยนออโต้ (Auto Raid)", false, function(v) _G.AutoRaid = v end)
AddToggle(Tab3, "ตื่นพลังผลไม้ออโต้", false, function(v) _G.AutoAwaken = v end)

-- หน้าที่ 4: กิจกรรมทะเล
AddToggle(Tab4, "ล่าเรือจ้าว / จ้าวทะเล", false, function(v) _G.AutoSeaBeast = v end)
AddToggle(Tab4, "ล่าเรือผีสิง", false, function(v) _G.AutoGhostShip = v end)

-- หน้าที่ 5: เผ่า V4
AddToggle(Tab5, "วาร์ปไปเกาะมิราจ", false, function(v) _G.TPMirage = v end)
AddToggle(Tab5, "ทำเควสต์ V4 อัตโนมัติ", false, function(v) _G.AutoTrialV4 = v end)

-- หน้าที่ 6: วาร์ป/ร้านค้า
AddToggle(Tab6, "วาร์ปไปเกาะ Starter", false, function(v) end)

-- หน้าที่ 7: ผลไม้
AddToggle(Tab7, "เก็บผลไม้ตกพื้นออโต้", false, function(v) _G.AutoStoreFruit = v end)
AddToggle(Tab7, "มองเห็นตำแหน่งผลไม้ (ESP)", false, function(v) _G.FruitESP = v end)

-- หน้าที่ 8: ตั้งค่า
AddToggle(Tab8, "เดินทะลุสิ่งกีดขวาง (Noclip)", true, function(v) _G.Noclip = v end)

-- ระบบ Noclip ทำงานเบื้องหลัง
spawn(function()
    while task.wait() do
        if _G.Noclip then
            pcall(function()
                if game.Players.LocalPlayer.Character then
                    for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end
            end)
        end
    end
end)

-- แจ้งเตือนเมื่อโหลดสำเร็จ
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "IทwIจ้า Hub",
    Text = "โหลด UI แบบ 8 หน้าสำเร็จแล้ว!",
    Duration = 5
})
