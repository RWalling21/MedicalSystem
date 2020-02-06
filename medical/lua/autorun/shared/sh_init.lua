--SETUP
include("autorun/client/cl_postprocess.lua")

--Conditions
function SMFracture(enabled, ply)
    if enabled and fractureEnabled then
        ply.hasFracture = true
        GAMEMODE:SetPlayerSpeed(ply, fractureWalkSpeed, fractureRunSpeed)
        ply:StopSprinting()
        ply:StopWalking()
        net.Start("SMFractureMSG")
        net.Send(ply)
    elseif enabled == false then
        ply.hasFracture = false
        GAMEMODE:SetPlayerSpeed(ply, 160, 240) -- Set back to default, make a variable on startup with getRunSpeed()
    end
end

function SMBleeding(enabled, ply)
    if enabled and bleedEnabled then
        ply.hasBleed = true
        net.Start("SMBleedMSG")
        net.Send(ply)
        GAMEMODE:SetPlayerSpeed(ply, bleedWalkSpeed, bleedRunSpeed)

        timer.Create("SMBleedDmg", bleedDelay, bleedLoop, function()
            ply:TakeDamage(bleedDMG)
            net.Start("SMDmgSound")
            net.Send(ply)
        end)
    elseif enabled == false then
        ply.hasBleed = false
        timer.Stop("SMBleedDmg")
        GAMEMODE:SetPlayerSpeed(ply, 160, 240)
    end
end

function SMBurn(enabled, ply)
    if enabled and burnEnabled then
        ply.hasBurn = true
        net.Start("SMBurnMSG")
        net.Send(ply)
        GAMEMODE:SetPlayerSpeed(ply, burnWalkSpeed, burnRunSpeed)

        timer.Create("SMBurnDmg", burnDelay, burnLoop, function()
            ply:TakeDamage(burnDMG)
            net.Start("SMDmgSound")
            net.Send(ply)
        end)
    elseif enabled == false then
        ply.hasBurn = false
        timer.Stop("SMBurnDmg")
        GAMEMODE:SetPlayerSpeed(ply, 160, 240)
    end
end

function SMDisease(enabled, ply)
    if enabled and diseaseEnabled then
        ply.hasDisease = true
        net.Start("SMDiseaseMSG")
        net.Send(ply)

        timer.Create("SMDiseaseDMG", diseaseDelay, diseaseLoop, function()
            ply:TakeDamage(diseaseDMG)
            net.Start("SMDmgSound")
            net.Send(ply)
        end)
    elseif enabled == false then
        ply.hasDisease = false
        timer.Stop("SMDiseaseDMG")
    end
end

function SMRareDisease(enabled, ply)
    if enabled and diseaseEnabled then
        ply.hasRareDisease = true
        net.Start("SMRareDiseaseMSG")
        net.Send(ply)

        timer.Create("SMRareDiseaseDMG", rareDiseaseDelay, rareDiseaseLoop, function()
            ply:TakeDamage(rareDiseaseDMG)
            net.Start("SMDmgSound")
            net.Send(ply)
        end)
    elseif enabled == false then
        ply.hasRareDisease = false
        timer.Stop("SMRareDiseaseDMG")
    end
end

--Misc Functions
function SMDiseaseInit(ply)
    timer.Create("SMDisease", diseaseApply, 0, function()
        if chance(1, diseaseProbability) and ply.hasDisease == false then
            SMDisease(true, ply)
        end
    end)

    timer.Create("SMRareDisease", rareDiseaseApply, 0, function()
        if chance(1, rareDiseaseProbability) and ply.hasRareDisease == false then
            SMRareDisease(true, ply)
        end
    end)
end

function SMDeactivate(ply)
    SMFracture(false, ply)
    SMBleeding(false, ply)
    SMBurn(false, ply)
    SMDisease(false, ply)
    SMRareDisease(false, ply)
    ----
    net.Start("SMPlyDie")
    net.Send(ply)
end

function chance(min, max)
    local rand = math.random(min, max)
    -- We use min because it is a constant that will always give us the correct value
    if rand == min then
        return true
    else
        return false
    end
end