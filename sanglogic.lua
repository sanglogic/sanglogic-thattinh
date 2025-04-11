-- // BLOX FRUITS - FULL MENU BY CHATGPT (V2)
-- // Bao gồm: Giao diện, Auto Farm, ESP, Teleport, Auto Skill, Auto Stat, Anti Cheat...

-- Load OrionLib GUI
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = OrionLib:MakeWindow({
    Name = "NGÔ TẤN SANG",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "SANGBLOXFRUIT"
})

-- // MAIN TAB
local Main = Window:MakeTab({Name = "Main", Icon = "rbxassetid://126101456053607", PremiumOnly = false})

Main:AddButton({Name = "Auto Farm Level", Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/zekwt/HohoHub/main/HohoHubFree.lua'))()
end})

Main:AddButton({Name = "Auto Farm Boss", Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/NougatBitz/BloxFruitStuff/main/AutoBoss.lua'))()
end})

Main:AddButton({Name = "Auto Elite Hunter", Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/NevaHub/neva/main/elite.lua'))()
end})

Main:AddToggle({Name = "ESP Player/Boss/Fruit", Default = false, Callback = function(v)
    if v then loadstring(game:HttpGet("https://raw.githubusercontent.com/xDepressionx/Free-Script/main/ESP.lua"))() end
end})

Main:AddButton({Name = "Auto Fruit Sniper (Mua trái shop)", Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/PepsiLeaks/BF/main/FruitSniper.lua'))()
end})

-- // AUTO SKILL TAB
local Skill = Window:MakeTab({Name = "Auto Skill", Icon = "rbxassetid://134368639566689", PremiumOnly = false})

Skill:AddToggle({Name = "Auto Z", Default = false, Callback = function(v)
    getgenv().autoZ = v
    while autoZ do wait(0.5)
        pcall(function()
            game:service('VirtualInputManager'):SendKeyEvent(true,"Z",false,game)
        end)
    end
end})

Skill:AddToggle({Name = "Auto X", Default = false, Callback = function(v)
    getgenv().autoX = v
    while autoX do wait(0.5)
        pcall(function()
            game:service('VirtualInputManager'):SendKeyEvent(true,"X",false,game)
        end)
    end
end})

Skill:AddToggle({Name = "Auto C", Default = false, Callback = function(v)
    getgenv().autoC = v
    while autoC do wait(0.5)
        pcall(function()
            game:service('VirtualInputManager'):SendKeyEvent(true,"C",false,game)
        end)
    end
end})

-- // AUTO STATS
local Stats = Window:MakeTab({Name = "Auto Stats", Icon = "rbxassetid://134368639566689", PremiumOnly = false})

for _, stat in ipairs({"Melee", "Defense", "Sword", "Gun", "Blox Fruit"}) do
    Stats:AddToggle({
        Name = "Auto " .. stat,
        Default = false,
        Callback = function(v)
            getgenv()["Auto"..stat] = v
            while getgenv()["Auto"..stat] do wait()
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", stat, 1)
                end)
            end
        end
    })
end

-- // MISC / BYPASS
local Misc = Window:MakeTab({Name = "Misc", Icon = "rbxassetid://134368639566689", PremiumOnly = false})

Misc:AddButton({Name = "Anti AFK", Callback = function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end})

Misc:AddButton({Name = "Server Hop", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Cesare0328/Roblox-Scripts/main/ServerHop.lua"))()
end})

Misc:AddButton({Name = "Infinite Geppo + No Dash Cooldown", Callback = function()
    local Player = game.Players.LocalPlayer
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self,...)
        local args = {...}
        if getnamecallmethod() == "FireServer" and tostring(self) == "Geppo" then
            return true
        end
        return old(self,...)
    end)
end})

-- // TELEPORT TAB (FULL MAP)
local TeleportTab = Window:MakeTab({Name = "Teleport Full", Icon = "rbxassetid://134368639566689", PremiumOnly = false})

local Islands = {
    -- Sea 1
    ["Start Island"] = CFrame.new(1037,17,1325),
    ["Marine Base"] = CFrame.new(-2603,45,2058),
    ["Jungle"] = CFrame.new(-1449,11,340),
    ["Pirate Village"] = CFrame.new(-1162,5,3846),
    ["Desert"] = CFrame.new(1143,6,4360),
    ["Middle Town"] = CFrame.new(-655,8,1436),
    ["Frozen Village"] = CFrame.new(1122,8,-5003),
    ["Colosseum"] = CFrame.new(-1820,7,-2740),
    ["Prison"] = CFrame.new(5153,7,4004),
    ["Magma Village"] = CFrame.new(-5238,7,8514),
    ["Sky Island"] = CFrame.new(-4970,717,-2622),
    ["Fountain City"] = CFrame.new(5243,38,4013),
    
    -- Sea 2
    ["Kingdom of Rose"] = CFrame.new(-394,73,283),
    ["Green Zone"] = CFrame.new(-2270,72,-2740),
    ["Graveyard"] = CFrame.new(-5401,94,-717),
    ["Snow Mountain"] = CFrame.new(1409,429,-5038),
    ["Hot and Cold"] = CFrame.new(-5867,15,-5071),
    ["Cursed Ship"] = CFrame.new(-876,22,-6857),
    ["Ice Castle"] = CFrame.new(5445,28,-6513),
    ["Forgotten Island"] = CFrame.new(-3052,236,-10141),
    ["Dark Arena"] = CFrame.new(-3851,15,5499),
    ["Raid Lab"] = CFrame.new(-6405, 250, -4498),

    -- Sea 3
    ["Port Town"] = CFrame.new(-287,20,5473),
    ["Hydra Island"] = CFrame.new(5228,603,345),
    ["Floating Turtle"] = CFrame.new(-10806,332,-8752),
    ["Great Tree"] = CFrame.new(2253,25,-6722),
    ["Castle on the Sea"] = CFrame.new(-249,44,-9797),
    ["Haunted Castle"] = CFrame.new(-9515,142,6158),
    ["Sea of Treats"] = CFrame.new(-2064,15,-12045),
    ["Candy Land"] = CFrame.new(-1081,77,-14218),
    ["Cake Island"] = CFrame.new(-2020, 73, -12192),
    ["Dough Dungeon"] = CFrame.new(-1836, 90, -15000),
    ["Temple of Time"] = CFrame.new(-12032, 347, -8760),
    ["Longma's Room"] = CFrame.new(-13054, 582, -8049)
}

TeleportTab:AddDropdown({
    Name = "Chọn Đảo Teleport",
    Default = "Start Island",
    Options = (function() local t = {} for i in pairs(Islands) do table.insert(t, i) end return t end)(),
    Callback = function(v)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Islands[v]
    end
})

-- Giao diện khởi động
OrionLib:Init()
