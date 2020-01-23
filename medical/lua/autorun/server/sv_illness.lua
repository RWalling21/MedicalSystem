include("autorun/config/sm_config.lua")
include("autorun/client/cl_postprocess.lua")

function SMFracture(enabled, ply)
    if enabled == true and fractureEnabled == true then
        --print(ply:Nick())
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

function SMBleeding(enabled, ply)
   if enabled == true and bleedEnabled == true then
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

function SMBurn(enabled, ply)
    if enabled == true and burnEnabled == true then
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

function SMDisease(enabled, ply)
    if enabled == true and diseaseEnabled == true then
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

function SMRareDisease(enabled, ply)
    if enabled == true and diseaseEnabled == true then
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