-- โหลด UI Library (RedzLib V2)
local RedzLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/redz-hub/RedzLibV2/main/Source.lua"))()

-- สร้างหน้าต่างหลัก
local Window = RedzLib:MakeWindow({
  Title = "IทwIจ้า Hub | Farm Edition",
  SubTitle = "เวอร์ชันฟาร์มครบวงจร",
  Script = {
    Name = "IทwIจ้า",
    Type = "Script"
  },
  Icon = "rbxassetid://76698686353852" -- ไอคอนเทพเจ้า
})

-------------------------------------------------
-- หน้าที่ 1: ฟาร์มหลัก (Main Farm)
-------------------------------------------------
local Tab1 = Window:MakeTab({"1. ฟาร์มหลัก", "rbxassetid://76698686353852"})

Tab1:AddToggle({
  Name = "เปิดระบบฟาร์มเลเวลอัตโนมัติ",
  Default = false,
  Callback = function(Value)
    _G.AutoFarm = Value
  end
})

Tab1:AddToggle({
  Name = "เปิดระบบโจมตีรวดเร็วพิเศษ (Fast Attack)",
  Default = false,
  Callback = function(Value)
    _G.FastAttack = Value
  end
})

Tab1:AddToggle({
  Name = "เปิดระบบดึงมอนสเตอร์มารวม (Bring Mob)",
  Default = false,
  Callback = function(Value)
    _G.BringMob = Value
  end
})

-------------------------------------------------
-- หน้าที่ 2: ฟาร์มเฉพาะทาง (Special Farm)
-------------------------------------------------
local Tab2 = Window:MakeTab({"2. ฟาร์มเฉพาะทาง", "rbxassetid://76698686353852"})

Tab2:AddDropdown({
  Name = "เลือกสายที่ต้องการฟาร์มมาสเตอร์รี่",
  Options = {"Melee (หมัด)", "Sword (ดาบ)", "Gun (ปืน)", "Blox Fruit (ผลปีศาจ)"},
  Default = "Sword (ดาบ)",
  Callback = function(Value)
    _G.MasteryType = Value
  end
})

Tab2:AddToggle({
  Name = "เปิดระบบฟาร์มมาสเตอร์รี่",
  Default = false,
  Callback = function(Value)
    _G.AutoMastery = Value
  end
})

Tab2:AddToggle({
  Name = "เปิดระบบฟาร์มกระดูก (Haunted Castle)",
  Default = false,
  Callback = function(Value)
    _G.AutoBones = Value
  end
})

Tab2:AddDropdown({
  Name = "เลือกวัตถุดิบทำของที่ต้องการฟาร์ม",
  Options = {"Dragon Scale (เกล็ดมังกร)", "Fools Gold (ทองคำ)", "Shark Tooth (เขี้ยวฉลาม)", "Magma Ore (แร่ลาวา)", "Fish Tail (หางปลา)"},
  Default = "Dragon Scale (เกล็ดมังกร)",
  Callback = function(Value)
    _G.MaterialType = Value
  end
})

Tab2:AddToggle({
  Name = "เปิดระบบฟาร์มวัตถุดิบอัตโนมัติ",
  Default = false,
  Callback = function(Value)
    _G.AutoMaterials = Value
  end
})

-------------------------------------------------
-- หน้าที่ 3: ลงดันเจี้ยน (Raid System)
-------------------------------------------------
local Tab3 = Window:MakeTab({"3. ลงดันเจี้ยน", "rbxassetid://76698686353852"})

Tab3:AddDropdown({
  Name = "เลือกชิปดันเจี้ยน",
  Options = {"Flame (ไฟ)", "Ice (น้ำแข็ง)", "Light (แสง)", "Dark (ความมืด)", "Human: Buddha (พระ)", "Dough (โมจิ)"},
  Default = "Flame (ไฟ)",
  Callback = function(Value)
    _G.SelectRaid = Value
  end
})

Tab3:AddButton({
  Name = "กดซื้อชิปดันเจี้ยน",
  Callback = function()
    -- คำสั่งซื้อชิป
  end
})

Tab3:AddToggle({
  Name = "เปิดระบบลงดันเจี้ยนปลอดภัย (ลอยสูงกันตาย)",
  Default = false,
  Callback = function(Value)
    _G.SafeRaid = Value
  end
})

Tab3:AddToggle({
  Name = "เปิดระบบดึงมอนสลาย (Insta-Kill & Bring)",
  Default = false,
  Callback = function(Value)
    _G.InstaKillRaid = Value
  end
})

-------------------------------------------------
-- หน้าที่ 4: อีเวนต์ทะเล (Sea Events)
-------------------------------------------------
local Tab4 = Window:MakeTab({"4. อีเวนต์ทะเล", "rbxassetid://76698686353852"})

Tab4:AddToggle({
  Name = "เปิดระบบล่า Sea Beast & Terrorshark",
  Default = false,
  Callback = function(Value)
    _G.AutoSeaBeast = Value
  end
})

Tab4:AddToggle({
  Name = "เปิดระบบล่าบอส Leviathan (เลเวียธาน)",
  Default = false,
  Callback = function(Value)
    _G.AutoLeviathan = Value
  end
})

Tab4:AddToggle({
  Name = "เปิดระบบล่าเรือผี (Ghost Ship)",
  Default = false,
  Callback = function(Value)
    _G.AutoShipRaid = Value
  end
})

-------------------------------------------------
-- หน้าที่ 5: เผ่า V4 & เกาะปริศนา (Race V4 & Mirage)
-------------------------------------------------
local Tab5 = Window:MakeTab({"5. เผ่า V4 & เกาะปริศนา", "rbxassetid://76698686353852"})

Tab5:AddButton({
  Name = "วาร์ปไปเกาะ Mirage (เมื่อเกาะเกิด)",
  Callback = function()
    -- โค้ดวาร์ปไป Mirage Island
  end
})

Tab5:AddToggle({
  Name = "เปิดระบบช่วยลง Trial (ห้องทดลองเผ่า)",
  Default = false,
  Callback = function(Value)
    _G.AutoTrial = Value
  end
})

Tab5:AddToggle({
  Name = "เปิดใช้งานสกิลเผ่าอัตโนมัติ (Auto Race V4 Skill)",
  Default = false,
  Callback = function(Value)
    _G.AutoV4Skill = Value
  end
})

-------------------------------------------------
-- หน้าที่ 6: วาร์ป & ร้านค้า (Teleport & Shop)
-------------------------------------------------
local Tab6 = Window:MakeTab({"6. วาร์ป & ร้านค้า", "rbxassetid://76698686353852"})

Tab6:AddDropdown({
  Name = "เลือกเกาะที่ต้องการวาร์ปไป",
  Options = {"เกาะเริ่มต้น", "เกาะจังเกิ้ล", "เกาะทะเลทราย", "เกาะหิมะ", "เกาะคฤหาสน์", "เกาะปราสาทเงา"},
  Default = "เกาะเริ่มต้น",
  Callback = function(Value)
    _G.SelectIsland = Value
  end
})

Tab6:AddButton({
  Name = "กดวาร์ปไปเกาะที่เลือก",
  Callback = function()
    -- โค้ดสั่งวาร์ป
  end
})

Tab6:AddDropdown({
  Name = "เลือกสเตตัสที่ต้องการอัปอัตโนมัติ",
  Options = {"Melee (หมัด)", "Defense (เลือด)", "Sword (ดาบ)", "Gun (ปืน)", "Blox Fruit (ผลปีศาจ)"},
  Default = "Melee (หมัด)",
  Callback = function(Value)
    _G.StatType = Value
  end
})

Tab6:AddToggle({
  Name = "เปิดระบบอัปสเตตัสอัตโนมัติ (Auto Stats)",
  Default = false,
  Callback = function(Value)
    _G.AutoStats = Value
  end
})

-------------------------------------------------
-- หน้าที่ 7: ผลปีศาจ & ของ (Fruits & Items)
-------------------------------------------------
local Tab7 = Window:MakeTab({"7. ผลปีศาจ & ของ", "rbxassetid://76698686353852"})

Tab7:AddButton({
  Name = "กดสุ่มผลปีศาจ (Random Fruit)",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
  end
})

Tab7:AddToggle({
  Name = "เปิดระบบเก็บผลเข้าคลังอัตโนมัติ (Auto Store)",
  Default = false,
  Callback = function(Value)
    _G.AutoStoreFruit = Value
  end
})

Tab7:AddToggle({
  Name = "เปิดระบบวาร์ปเก็บผลปีศาจตกบนพื้น",
  Default = false,
  Callback = function(Value)
    _G.AutoGrabFruit = Value
  end
})

-------------------------------------------------
-- หน้าที่ 8: ตัวละคร & ระบบเซฟ (Settings & Server)
-------------------------------------------------
local Tab8 = Window:MakeTab({"8. ตัวละคร & ระบบเซฟ", "rbxassetid://76698686353852"})

Tab8:AddSlider({
  Name = "ปรับความเร็วการเดิน (WalkSpeed)",
  Min = 16,
  Max = 300,
  Default = 16,
  Callback = function(Value)
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
  end
})

Tab8:AddToggle({
  Name = "เปิดระบบเดินทะลุกำแพง (Noclip)",
  Default = false,
  Callback = function(Value)
    _G.Noclip = Value
  end
})

Tab8:AddButton({
  Name = "ลบเอฟเฟกต์ภาพ (ลดอาการกระตุก / กันเกมค้าง)",
  Callback = function()
    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
      if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic end
      if v:IsA("Decal") or v:IsA("Texture") then v:Destroy() end
    end
  end
})

Tab8:AddButton({
  Name = "ย้ายเซิร์ฟเวอร์หาคนน้อย (Server Hop)",
  Callback = function()
    -- โค้ด Server Hop
  end
})
