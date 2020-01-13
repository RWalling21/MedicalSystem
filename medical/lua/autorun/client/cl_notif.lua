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

function SMHealedPopup()
    notification.AddLegacy("You have been healed!!", NOTIFY_GENERIC, 4)
    surface.PlaySound("buttons/button14.wav")
end