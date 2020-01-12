AddCSLuaFile("autorun/client/cl_init.lua")

hasFracture = false -- Make more efficent 
isBleeding = false
hasBurn = false
hasDisease = false
hasRareDisease = false


util.AddNetworkString("SMFractureMSG")
util.AddNetworkString("SMBleedMSG")
util.AddNetworkString("SMBurnMSG")
util.AddNetworkString("SMDisease")
util.AddNetworkString("SMRareDisease")

hook.Add("EntityTakeDamage", "SMGeneralDamage", function(target, dmg) -- Any Damage
    if target:IsPlayer() and dmg:IsBulletDamage() and isBleeding == false then
        if chance(1, 10) then
            SMBleeding(true, target)
        end
    elseif target:IsPlayer() and dmg:IsDamageType(8) and hasBurn == false then
        if chance(1, 5) then
            SMBurn(true, target)
        end
    --elseif target:IsPlayer() then
        --if chance(1, 80) then
            --print("God that hurts!")
        --end
    end
end)

hook.Add("GetFallDamage", "SMFallDamage", function(ply, speed) -- For fracture
    if speed > 660 and hasFracture == false then -- higher percent chance higher speed
        SMFracture(true, ply)
    end
end)

hook.Add("PlayerDeath", "SMDie", function(ply)
    SMBleeding(false, ply)
    hasFracture = false
    isBleeding = false
    hasBurn = false
    hasDisease = false
    hasRareDisease = false
end)

function chance(min, max) -- Add to shared
    rand = math.random(min, max)
    if rand == min then -- We use min because it is a constant that will always give us the correct value
        return true
    else 
        return false
    end
end

function SMFracture(enabled, ply) 
    if enabled == true and ply:Alive() then
        hasFracture = true
        GAMEMODE:SetPlayerSpeed(ply, 75, 80)
        ply:StopSprinting()
        ply:StopWalking()
        net.Start("SMFractureMSG")
        net.Send(ply)
    elseif enabled == false then
        GAMEMODE:SetPlayerSpeed(ply, 160, 240) -- Set back to default, make a variable on startup with getRunSpeed()
    end
end

function SMBleeding(enabled, ply)
   if enabled == true and ply:Alive() then
        isBleeding = true
        net.Start("SMBleedMSG")
        net.Send(ply)
        timer.Create("SMBleedDmg", 5, 0, function() 
            ply:TakeDamage(3) 
        end)
    elseif enabled == false then
        isBleeding = false
        print(ply:Nick().." Is fine")
        timer.Stop("SMBleedDmg")
    end     
end

function SMBurn(enabled, ply)
    if enabled == true and ply:Alive() then
        hasBurn = true
        net.Start("SMBurnMSG")
        net.Send(ply)
        GAMEMODE:SetPlayerSpeed(ply, 130, 200)
        timer.Create("SMBurnDmg", 10, 0, function() 
            ply:TakeDamage(2) 
        end)
    elseif enabled == false then
        hasBurn = false
        print(ply:Nick().." Is fine")
        timer.Stop("SMBurnDmg")
        GAMEMODE:SetPlayerSpeed(ply, 160, 240)
    end
end

function SMDisease(enabled, ply)
    if enabled == treu and ply:Alive() then
        hasDisease = true
        timer.Create("SMDiseaseDMG", 20, 0, function() 
            ply:TakeDamage(10)
        end)
    elseif enabled == false then
        timer.Stop("SMDiseaseDMG")
    end
end

function SMDisease(enabled, ply)
    if enabled == treu and ply:Alive() then
        hasDisease = true
        timer.Create("SMRareDiseaseDMG", 30, 0, function() 
            ply:TakeDamage(25)
        end)
    elseif enabled == false then
        timer.Stop("SMRareDiseaseDMG")
    end
end

net.Receive("SMDisease", function() -- Call for disease
    ply = net.ReadEntity()
        SMDisease(true, ply)
end)

net.Receive("SMRareDisease", function() -- Call for rare disease
    ply = net.ReadEntity()
    SMBurnPopup(true, ply)
end)