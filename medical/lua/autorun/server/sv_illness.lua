include("autorun/config/sm_config.lua")
include("autorun/client/cl_postprocess.lua")

------------------------------------------------------------------------------------------------

function SMFracture(enabled, target)
    if enabled and fractureEnabled then
        ply = target
        hasFracture = true
        GAMEMODE:SetPlayerSpeed(ply, fractureWalkSpeed, fractureRunSpeed)
        ply:StopSprinting()
        ply:StopWalking()
        net.Start("SMFractureMSG")
        net.Send(ply)
    elseif enabled == false then
        GAMEMODE:SetPlayerSpeed(ply, 160, 240) -- Set back to default, make a variable on startup with getRunSpeed()
    end
end

function SMBleeding(enabled, target)
   if enabled and bleedEnabled then
        ply = target
        isBleeding = true
        net.Start("SMBleedMSG")
        net.Send(ply)
        GAMEMODE:SetPlayerSpeed(ply, bleedWalkSpeed, bleedRunSpeed) 
        timer.Create("SMBleedDmg", bleedDelay, bleedLoop, function()
            ply:TakeDamage(bleedDMG)
            net.Start("SMDmgSound")
            net.Send(ply)
        end)
    elseif enabled == false then
        isBleeding = false
        timer.Stop("SMBleedDmg")
        GAMEMODE:SetPlayerSpeed(ply, 160, 240)
    end
end

function SMBurn(enabled, target)
    if enabled and burnEnabled then
        ply = target
        hasBurn = true
        net.Start("SMBurnMSG")
        net.Send(ply)
        GAMEMODE:SetPlayerSpeed(ply, burnWalkSpeed, burnRunSpeed)
        timer.Create("SMBurnDmg", burnDelay, burnLoop, function()
            ply:TakeDamage(burnDMG)
            net.Start("SMDmgSound")
            net.Send(ply)
        end)
    elseif enabled == false then
        hasBurn = false
        timer.Stop("SMBurnDmg")
        GAMEMODE:SetPlayerSpeed(ply, 160, 240)
    end
end

function SMDisease(enabled, target)
    if enabled and diseaseEnabled then
        ply = target
        hasDisease = true
        net.Start("SMDiseaseMSG")
        net.Send(ply)
        timer.Create("SMDiseaseDMG", diseaseDelay, diseaseLoop, function()
            ply:TakeDamage(diseaseDMG)
            net.Start("SMDmgSound")
            net.Send(ply)
        end)
    elseif enabled == false then
        timer.Stop("SMDiseaseDMG")
    end
end

function SMRareDisease(enabled, target)
    if enabled and diseaseEnabled then
        ply = target
        hasRareDisease = true
        net.Start("SMRareDiseaseMSG")
        net.Send(ply)
        timer.Create("SMRareDiseaseDMG", rareDiseaseDelay, rareDiseaseLoop, function()
            ply:TakeDamage(rareDiseaseDMG)
            net.Start("SMDmgSound")
            net.Send(ply)
        end)
    elseif enabled == false then
        timer.Stop("SMRareDiseaseDMG")
    end
end

------------------------------------------------------------------------------------------------

function SMDiseaseInit(ply)
    timer.Create("SMDisease", diseaseApply, 0, function() -- On average you will get a disease every 1 hour of play time
        if chance(1, diseaseProbability) and hasDisease == false then
            SMDisease(true, ply)
        end
    end)

    timer.Create("SMRareDisease", rareDiseaseApply, 0, function() -- On average you will get a rare disease every 24 hours of playtime
        if chance(1, rareDiseaseProbability) and hasRareDisease == false then
            SMRareDisease(true, ply)
        end
    end)
end

function SMDeactivate(ply)
    SMBleeding(false, ply)
    SMBurn(false, ply)
    SMDisease(false, ply)
    SMRareDisease(false, ply)
    ----
    net.Start("SMPlyDie")
    net.Send(ply)
    ----
    hasFracture = false
    isBleeding = false
    hasBurn = false
    hasDisease = false
    hasRareDisease = false
end