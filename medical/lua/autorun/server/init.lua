-- SETUP
AddCSLuaFile("autorun/client/cl_init.lua")
AddCSLuaFile("autorun/shared/sh_init.lua")
AddCSLuaFile("autorun/config/sm_config.lua")

include("autorun/shared/sh_init.lua")
include("autorun/config/sm_config.lua")

util.AddNetworkString("SMFractureMSG")
util.AddNetworkString("SMBleedMSG")
util.AddNetworkString("SMBurnMSG")
util.AddNetworkString("SMDiseaseCall")
util.AddNetworkString("SMDiseaseMSG")
util.AddNetworkString("SMRareDiseaseMSG")
util.AddNetworkString("SMHealed")
util.AddNetworkString("SMDmgSound")


-- HOOKS
hook.Add("GetFallDamage", "SMFallDamage", function(ply, speed) -- For fracture
    if speed > fractureFallSpeed and hasFracture == false then -- higher percent chance higher speed
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

function SMDiseaseInit(ply)
    print("Disease Clock initialized")
    timer.Create("SMDisease", diseaseApply, 0, function() -- On average you will get a disease every 1 hour of play time
        if chance(1, diseaseProbability) and hasDisease == false then
            SMDisease(true, ply)
        end
    end)

    timer.Create("SMRareDisease", rareDiseaseApply, 0, function() -- On average you will get a rare disease every 24 hours of playtime
        print(hasRareDisease)
        if chance(1, rareDiseaseProbability) and hasRareDisease == false then
            print("CHUNGUS")
            SMRareDisease(true, ply)
        end
    end) 
end

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