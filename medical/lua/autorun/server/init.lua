AddCSLuaFile("autorun/client/cl_init.lua")

print("sv_init loaded")

hook.Add("EntityTakeDamage", "SMGeneralDamage", function(target, dmg) -- Any Damage
    if target:IsPlayer() and dmg:IsBulletDamage() then
        SMBleeding(true, target)
    elseif target:IsPlayer() and dmg:IsDamageType(8) then
        print("It burns!")
    elseif target:IsPlayer() then
        print("God that hurts!")
    end
end)

hook.Add("GetFallDamage", "SMFallDamage", function(ply, speed) -- For fracture
    if speed > 650 then -- higher percent chance higher speed
        SMFracture(true, ply)
    end
end)

hook.Add("PlayerDeath", "SMDie", function(ply)
    SMBleeding(false, ply)
end)

function SMFracture(enabled, ply) 
    if enabled == true then
    GAMEMODE:SetPlayerSpeed(ply, 75, 75)
    ply:StopSprinting()
    print(ply:Nick().." fractured his legs!")
    elseif enabled == false then
    GAMEMODE:SetPlayerSpeed(ply, 160, 240) -- Set back to default, make a variable on startup with getRunSpeed()
    end
end

function SMBleeding(enabled, ply)
   if enabled == true and ply:Alive() then
    print(ply:Nick().." Is Bleeding!")
        timer.Create("SMBleedDmg", 5, 0, function() 
            ply:TakeDamage(5) 
        end)
    elseif enabled == false then
     print(ply:Nick().." Is fine")
     timer.Stop("SMBleedDmg")
    end     
end