-- โหลด UI Library (RedzLib V2)
local RedzLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/redz-hub/RedzLibV2/main/Source.lua"))()

-- สร้างหน้าต่างหลัก
local Window = RedzLib:MakeWindow({
  Title = "IทwIจ้า Hub | Farm Edition",
  SubTitle = "ผู้นำฟาร์มครบวงจร",
  Script = {
    Name = "IทwIจ้า",
    Type = "Script"
  },
  Icon = "rbxassetid://76698686353852"
})

---------------------------------------------------------------------
-- หน้าที่ 1: ฟาร์มหลัก (Main Farm)
---------------------------------------------------------------------
local Tab1 = Window:MakeTab({"1. ฟาร์มหลัก", "swords"})

Tab1:AddToggle({
  Name = "ระบบเปิดฟาร์มอัตโนมัติ",
  Default = false,
  Callback = function(Value)
    _G.AutoFarm = Value
  end
})

Tab1:AddDropdown({
  Name = "เลือกมอนสเตอร์เป้าหมาย",
  Options = {"Bandit [Lv. 5]", "Desert Bandit [Lv. 60]", "Snow Bandit [Lv. 90]", "Factory Staff [Lv. 2200]"},
  Default = "Bandit [Lv. 5]",
  Callback = function(Value)
    _G.SelectedMob = Value
  end
})

Tab1:AddDropdown({
  Name = "เลือกอาวุธที่ใช้ฟาร์ม",
  Options = {"Melee", "Sword", "Blox Fruit"},
  Default = "Melee",
  Callback = function(Value)
    _G.SelectWeapon = Value
  end
})

Tab1:AddToggle({
  Name = "ดึงมอนสเตอร์มารวมกัน (Bring Mob)",
  Default = true,
  Callback = function(Value)
    _G.BringMob = Value
  end
})

Tab1:AddToggle({
  Name = "ระบบโจมตีเร็ว/ตีไว (Fast Attack)",
  Default = true,
  Callback = function(Value)
    _G.FastAttack = Value
  end
})

---------------------------------------------------------------------
-- หน้าที่ 2: ฟาร์มพิเศษ & วัสดุ (Special & Materials)
---------------------------------------------------------------------
local Tab2 = Window:MakeTab({"2. ฟาร์มพิเศษ/ของ", "star"})

Tab2:AddToggle({
  Name = "ฟาร์มมาสเตอรี่อาวุธ (Weapon Mastery)",
  Default = false,
  Callback = function(Value)
    _G.FarmMasteryWeapon = Value
  end
})

Tab2:AddToggle({
  Name = "ฟาร์มมาสเตอรี่ผลปีศาจ (Fruit Mastery)",
  Default = false,
  Callback = function(Value)
    _G.FarmMasteryFruit = Value
  end
})

Tab2:AddDropdown({
  Name = "เลือกวัตถุดิบที่ต้องการฟาร์ม",
  Options = {"Bones (กระดูก)", "Ectoplasm", "Cocoa", "Dragon Scale", "Mystic Droplet"},
  Default = "Bones (กระดูก)",
  Callback = function(Value)
    _G.SelectedMaterial = Value
  end
})

Tab2:AddToggle({
  Name = "เริ่มฟาร์มวัตถุดิบที่เลือก",
  Default = false,
  Callback = function(Value)
    _G.AutoFarmMaterial = Value
  end
})

---------------------------------------------------------------------
-- หน้าที่ 3: ระบบเรดดันเจี้ยน (Raid System)
---------------------------------------------------------------------
local Tab3 = Window:MakeTab({"3. ดันเจี้ยน/เรด", "shield"})

Tab3:AddDropdown({
  Name = "เลือกชิปดันเจี้ยน",
  Options = {"Flame", "Ice", "Quake", "Light", "Dark", "Spider", "Rumble", "Dough"},
  Default = "Flame",
  Callback = function(Value)
    _G.SelectedRaidChip = Value
  end
})

Tab3:AddButton({
  Name = "ซื้อชิปอัตโนมัติ",
  Callback = function()
  end
})

Tab3:AddToggle({
  Name = "ระบบลงดันเจี้ยนออโต้ (Auto Raid)",
  Default = false,
  Callback = function(Value)
    _G.AutoRaid = Value
  end
})

Tab3:AddToggle({
  Name = "ตื่นพลังผลไม้อัตโนมัติ (Auto Awaken)",
  Default = false,
  Callback = function(Value)
    _G.AutoAwaken = Value
  end
})

---------------------------------------------------------------------
-- หน้าที่ 4: กิจกรรมทางทะเล (Sea Events)
---------------------------------------------------------------------
local Tab4 = Window:MakeTab({"4. กิจกรรมทางทะเล", "waves"})

Tab4:AddToggle({
  Name = "ล่าเรือจ้าว / ตีจ้าวทะเล (Sea Beast)",
  Default = false,
  Callback = function(Value)
    _G.AutoSeaBeast = Value
  end
})

Tab4:AddToggle({
  Name = "ล่าเรือผีสิง (Ghost Ship)",
  Default = false,
  Callback = function(Value)
    _G.AutoGhostShip = Value
  end
})

Tab4:AddToggle({
  Name = "โจมตีฉลาม / Leviathan",
  Default = false,
  Callback = function(Value)
    _G.AutoKillShark = Value
  end
})

---------------------------------------------------------------------
-- หน้าที่ 5: เผ่า V4 & เกาะมิราจ (Race V4 & Mirage)
---------------------------------------------------------------------
local Tab5 = Window:MakeTab({"5. เผ่า V4/มิราจ", "user"})

Tab5:AddToggle({
  Name = "วาร์ปไปเกาะมิราจ (Mirage Island)",
  Default = false,
  Callback = function(Value)
    _G.TPMirage = Value
  end
})

Tab5:AddButton({
  Name = "มองหาเฟืองมิราจ (Find Gear)",
  Callback = function()
  end
})

Tab5:AddToggle({
  Name = "ทำเควสต์ V4 อัตโนมัติ (Auto Trial)",
  Default = false,
  Callback = function(Value)
    _G.AutoTrialV4 = Value
  end
})

---------------------------------------------------------------------
-- หน้าที่ 6: วาร์ป & ร้านค้า (Teleport & Shop)
---------------------------------------------------------------------
local Tab6 = Window:MakeTab({"6. วาร์ป/ร้านค้า", "map-pin"})

Tab6:AddDropdown({
  Name = "เลือกเกาะที่ต้องการวาร์ป",
  Options = {"Starter Island", "Marineford", "Impel Down", "Colosseum", "Mansion", "Castle on the Sea"},
  Default = "Starter Island",
  Callback = function(Value)
    _G.SelectedIsland = Value
  end
})

Tab6:AddButton({
  Name = "วาร์ปไปเกาะที่เลือก",
  Callback = function()
  end
})

Tab6:AddButton({
  Name = "ซื้อรูปแบบการต่อสู้ (Melee Shop)",
  Callback = function()
  end
})

---------------------------------------------------------------------
-- หน้าที่ 7: ผลไม้ & ไอเทม (Fruits & Items)
---------------------------------------------------------------------
local Tab7 = Window:MakeTab({"7. ผลไม้/ไอเทม", "cherry"})

Tab7:AddButton({
  Name = "สุ่มผลไม้ (Random Fruit)",
  Callback = function()
  end
})

Tab7:AddToggle({
  Name = "เก็บผลไม้ตกพื้นออโต้ (Auto Store Fruit)",
  Default = false,
  Callback = function(Value)
    _G.AutoStoreFruit = Value
  end
})

Tab7:AddToggle({
  Name = "มองเห็นตำแหน่งผลไม้ (Fruit ESP)",
  Default = false,
  Callback = function(Value)
    _G.FruitESP = Value
  end
})

---------------------------------------------------------------------
-- หน้าที่ 8: ตั้งค่า & ลดแลค (Settings & Optimization)
---------------------------------------------------------------------
local Tab8 = Window:MakeTab({"8. ตั้งค่า/ลดแลค", "settings"})

Tab8:AddToggle({
  Name = "โหมดเดินทะลุสิ่งกีดขวาง (Noclip)",
  Default = true,
  Callback = function(Value)
    _G.Noclip = Value
  end
})

Tab8:AddToggle({
  Name = "เปิดโหมดลดการกระตุก (White Screen / Anti-Lag)",
  Default = false,
  Callback = function(Value)
    _G.AntiLag = Value
  end
})

Tab8:AddButton({
  Name = "รีเซ็ตตัวละคร (Reset Character)",
  Callback = function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
  end
})

---------------------------------------------------------------------
-- ระบบทำงานเบื้องหลัง (Background Logic)
---------------------------------------------------------------------
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
