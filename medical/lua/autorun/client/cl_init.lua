ply = LocalPlayer()

function chance(min, max) -- Add to shared
    rand = math.random(min, max)
    if rand == min then -- We use min because it is a constant that will always give us the correct value
        return true
    else 
        return false
    end
end

function SMDiseaseClock(ply)
    print("Disease Clock initialized")
    timer.Create("SMDisease", 300, 0, function() -- On average you will get a disease every 1 hour
        if chance(1, 12) then
            net.Start("SMDisease")
                net.WriteEntity(ply)
            net.SendToServer()
            SMDiseasePopup()
        end
    end)

    timer.Create("SMRareDisease", 900, 0, function() -- On average you will get a rare disease every 24 hours
        if chance(1, 96) then
            net.Start("SMRareDisease")
                net.WriteEntity(ply)
            net.SendToServer()
            SMRareDiseasePopup()
        end
    end)
end
SMDiseaseClock(ply)


net.Receive("SMFractureMSG", function()
    SMFracturePopup()
end)

net.Receive("SMBleedMSG", function()
    SMBleedPopup()
end)

net.Receive("SMBurnMSG", function()
    SMBurnPopup()
end)

function SMFracturePopup()
    notification.AddLegacy("You have fractured your leg!", NOTIFY_GENERIC, 4)
    surface.PlaySound("buttons/button14.wav")
end

function SMBleedPopup()
    notification.AddLegacy("You are bleeding!", NOTIFY_GENERIC, 4)
    surface.PlaySound("buttons/button14.wav")
end

function SMBurnPopup()
    notification.AddLegacy("You have a nasty burn!", NOTIFY_GENERIC, 4)
    surface.PlaySound("buttons/button14.wav")
end

function SMDiseasePopup()
    notification.AddLegacy("You have come down with a disease!", NOTIFY_GENERIC, 4)
    surface.PlaySound("buttons/button14.wav")
end

function SMRareDiseasePopup()
    notification.AddLegacy("You have come down with a RARE disease! Get help ASAP!", NOTIFY_GENERIC, 4)
    surface.PlaySound("buttons/button14.wav") -- Play a more threatining sound
end