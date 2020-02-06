---------------------------
---------------------------
-- Simple Mediucal
-- v1.0.00 [2/2/2020]
---------------------------
-- Made by Beb (AKA Terry)
---------------------------
---------------------------
-- SETUP
AddCSLuaFile("autorun/client/cl_postprocess.lua")
AddCSLuaFile("autorun/shared/sh_init.lua")
AddCSLuaFile("config/sm_config.lua")
include("autorun/shared/sh_init.lua")
include("config/sm_config.lua")
util.AddNetworkString("SMFractureMSG")
util.AddNetworkString("SMBleedMSG")
util.AddNetworkString("SMBurnMSG")
util.AddNetworkString("SMDiseaseMSG")
util.AddNetworkString("SMRareDiseaseMSG")
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
    if speed > fractureFallSpeed and ply.hasFracture == false then
        SMFracture(true, ply)
    end
end)

-- Any Damage
hook.Add("EntityTakeDamage", "SMGeneralDamage", function(target, dmg)
    if target:IsPlayer() and dmg:IsBulletDamage() and target.hasBleed == false then
        if chance(1, bleedProbability) then
            SMBleeding(true, target)
        end
    elseif target:IsPlayer() and dmg:IsDamageType(8) and target.hasBurn == false then
        if chance(1, burnProbability) then
            SMBurn(true, target)
        end
    end
end)

if removeConditionOnDeath then
    hook.Add("PlayerDeath", "SMDie", function(ply)
        SMDeactivate(ply)
    end)
end

if removeConditionOnJob then
    hook.Add("OnPlayerChangedTeam", "SMChangeTeam", function(ply)
        SMDeactivate(ply)
    end)
end