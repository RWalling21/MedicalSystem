AddCSLuaFile("autorun/client/cl_init.lua")
AddCSLuaFile("autorun/shared/sh_init.lua")

include("autorun/shared/sh_init.lua")

print("sv_init loaded")

hook.Add("EntityTakeDamage", "GeneralDamage", function(target, dmg) -- Any Damage
    if target:IsPlayer() and dmg:IsBulletDamage() then
        SMbleeding(true, target)
    elseif target:IsPlayer() and dmg:IsDamageType(8) then
        print("It burns!")
    elseif target:IsPlayer() then
        print("God that hurts!")
    end
end)

hook.Add("GetFallDamage", "FallDamage", function(ply, speed) -- For fracture
    if speed > 650 then -- higher percent chance higher speed
        fracture(true, ply)
    end
end)

function SMFracture(enabled, ply) 
    if enabled == true then
    GAMEMODE:SetPlayerSpeed(ply, 75, 75)
    print(ply:Nick().." fractured his legs!")
    elseif enabled == false then
    GAMEMODE:SetPlayerSpeed(ply, 160, 240) -- Set back to default, make a variable on startup with getRunSpeed()
    end
end

function SMBleeding(enabled, ply)
    if enabled == true then
    print(ply:Nick().." Is Bleeding!")
    timer.Create("SMBleedDmg", 2, 5, function() print("BLEED DMG") end)
    end
end