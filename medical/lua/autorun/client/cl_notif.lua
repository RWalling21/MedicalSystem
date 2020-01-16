function SMFracturePopup()
    notification.AddLegacy(fractureNotifText, NOTIFY_GENERIC, fractureNotifTime)
    surface.PlaySound("buttons/button14.wav")
end

function SMBleedPopup()
    notification.AddLegacy(bleedeNotifText, NOTIFY_GENERIC, bleedNotifTime)
    surface.PlaySound("buttons/button14.wav")
end

function SMBurnPopup()
    notification.AddLegacy(burnNotifText, NOTIFY_GENERIC, burnNotifTime)
    surface.PlaySound("buttons/button14.wav")
end

function SMDiseasePopup()
    notification.AddLegacy(diseaseNotifText, NOTIFY_GENERIC, diseaseNotifTime)
    surface.PlaySound("buttons/button14.wav")
end

function SMRareDiseasePopup()
    notification.AddLegacy(rareDiseaseNotifText, NOTIFY_GENERIC, rareDiseaseNotifTime)
    surface.PlaySound("buttons/button14.wav") -- Play a more threatining sound
end

function SMHealedPopup()
    notification.AddLegacy(healedNotifText, NOTIFY_GENERIC, healedNotifTime)
end