--include("autorun/config/smconfig.lua")

function SMFracture(enabled, ply) 
    if enabled == true and fractureEnabled == true then
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
        end)
    elseif enabled == false then
        isBleeding = false
        timer.Stop("SMBleedDmg")
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
        end)
    elseif enabled == false then
        hasBurn = false
        timer.Stop("SMBurnDmg")
        GAMEMODE:SetPlayerSpeed(ply, 160, 240)
    end
end

function SMDisease(enabled, ply)
    if enabled == treu and ply:Alive() then
        hasDisease = true
        GAMEMODE:SetPlayerSpeed(ply, diseaseWalkSpeed, diseaseRunSpeed)
        timer.Create("SMDiseaseDMG", diseaseDelay, diseaseLoop, function() 
            ply:TakeDamage(diseaseDMG)
        end)
    elseif enabled == false then
        timer.Stop("SMDiseaseDMG")
    end
end

function SMRareDisease(enabled, ply)
    if enabled == treu and ply:Alive() then
        hasDisease = true
        timer.Create("SMRareDiseaseDMG", 30, 0, function() 
            ply:TakeDamage(25)
        end)
    elseif enabled == false then
        timer.Stop("SMRareDiseaseDMG")
    end
end