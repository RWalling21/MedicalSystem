-- SETUP
AddCSLuaFile("autorun/client/cl_postprocess.lua")
AddCSLuaFile("autorun/shared/sh_init.lua")
AddCSLuaFile("autorun/config/sm_config.lua")

include("autorun/shared/sh_init.lua")
include("autorun/config/sm_config.lua")

-- Do we really need all these Network strings?
util.AddNetworkString("SMFractureMSG")
util.AddNetworkString("SMBleedMSG")
util.AddNetworkString("SMBurnMSG")
util.AddNetworkString("SMDiseaseMSG")
util.AddNetworkString("SMRareDiseaseMSG")
--util.AddNetworkString("SMDiseaseCall")
util.AddNetworkString("SMFractureHealed")
util.AddNetworkString("SMBleedHealed")
util.AddNetworkString("SMBurnHealed")
util.AddNetworkString("SMDiseaseHealed")
util.AddNetworkString("SMRareDiseaseHealed")
util.AddNetworkString("SMMedkitHealed")
util.AddNetworkString("SMDmgSound")
util.AddNetworkString("SMPlyDie")
util.AddNetworkString("SMCant")


-- HOOKS
hook.Add("PlayerAuthed", "SMAuth", function(ply)
    SMDiseaseInit(ply)
end)

hook.Add("GetFallDamage", "SMFallDamage", function(ply, speed)
    if speed > fractureFallSpeed and hasFracture == false then
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
    end
end)

hook.Add("PlayerDeath", "SMDie", function(ply)
    SMDeactivate(ply)
end)

--hook.Add("PlayerDisconnected", "SMDC", function(ply)
    --SMDeactivate(ply)
--end)
