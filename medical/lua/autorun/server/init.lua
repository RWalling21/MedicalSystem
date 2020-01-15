-- SETUP
AddCSLuaFile("autorun/client/cl_init.lua")
AddCSLuaFile("autorun/shared/sh_init.lua")
AddCSLuaFile("autorun/config/sm_config.lua")

include("autorun/shared/sh_init.lua")
include("autorun/config/sm_config.lua")

hasFracture = false -- Make more efficent 
isBleeding = false
hasBurn = false

util.AddNetworkString("SMFractureMSG")
util.AddNetworkString("SMBleedMSG")
util.AddNetworkString("SMBurnMSG")
util.AddNetworkString("SMDisease")
util.AddNetworkString("SMRareDisease")
util.AddNetworkString("SMHealed")

-- HOOKS
hook.Add("GetFallDamage", "SMFallDamage", function(ply, speed) -- For fracture
    if speed > 660 and hasFracture == false then -- higher percent chance higher speed
        SMFracture(true, ply)
    end
end)

hook.Add("EntityTakeDamage", "SMGeneralDamage", function(target, dmg) -- Any Damage
    if target:IsPlayer() and dmg:IsBulletDamage() and isBleeding == false then
        if chance(1, bleedProbability) then
            SMBleeding(true, target)
        end
    elseif target:IsPlayer() and dmg:IsDamageType(8) and hasBurn == false then
        if chance(1, burnProbability) then
            SMBurn(true, target)
        end
    --elseif target:IsPlayer() then  Add later
        --if chance(1, 80) then
            --print("God that hurts!")
        --end
    end
end)

hook.Add("PlayerDeath", "SMDie", function(ply)
    SMBleeding(false, ply)
    SMBurn(false, ply)
    SMDisease(false, ply)
    SMRareDisease(false, ply)
    hasFracture = false
    isBleeding = false
    hasBurn = false
    hasDisease = false
    hasRareDisease = false
end)