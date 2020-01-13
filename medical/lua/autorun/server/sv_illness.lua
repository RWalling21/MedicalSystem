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