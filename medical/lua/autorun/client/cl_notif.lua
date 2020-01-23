function SMFracturePopup()
    notification.AddLegacy(fractureNotifText, NOTIFY_GENERIC, fractureNotifTime)
    surface.PlaySound("buttons/button14.wav")
end

function SMBleedPopup()
    notification.AddLegacy(bleedNotifText, NOTIFY_GENERIC, bleedNotifTime)
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

-------------------------------------------------------------------------------------------

function SMFractureHealedPopup()
    notification.AddLegacy(fractureHealedNotifText, NOTIFY_GENERIC, fractureHealedNotifTime)
end

function SMBleedHealedPopup()
    notification.AddLegacy(bleedHealedNotifText, NOTIFY_GENERIC, bleedHealedNotifTime)
end

function SMBurnHealedPopup()
    notification.AddLegacy(burnHealedNotifText, NOTIFY_GENERIC, burnHealedNotifTime)
end

function SMDiseasseHealedPopup()
    notification.AddLegacy(diseaseHealedNotifText, NOTIFY_GENERIC, diseaseHealedNotifTime)
end

function SMRareDiseasseHealedPopup()
    notification.AddLegacy(rareDiseaseHealedNotifText, NOTIFY_GENERIC, rareDiseaseHealedNotifTime)
end

function SMMedkitPopup()
    notification.AddLegacy(medkitHealedNotifText, NOTIFY_GENERIC, medkitHealedNotifTime)
end

function SMCant()
    notification.AddLegacy(cantUseNotifText, NOTIFY_GENERIC, cantUseNotifTime)
end
