-- Condition Call 
net.Receive("SMFractureMSG", function()
    SMFracturePopup()
    SMFracturePP(true)
end)

net.Receive("SMBleedMSG", function()
    SMBleedPopup()
    SMBleedPP(true)
end)

net.Receive("SMBurnMSG", function()
    SMBurnPopup()
    SMBurnPP(true)
end)

net.Receive("SMDiseaseMSG", function()
    SMDiseasePopup()
    SMDiseasePP(true)
end)

net.Receive("SMRareDiseaseMSG", function()
    SMRareDiseasePopup()
    SMRareDiseasePP(true)
end)

-----------------------------------------------------------------------------
-- Condition Heal
net.Receive("SMFractureHealed", function()
    SMFractureHealedPopup()
    SMFracturePP(false)
    surface.PlaySound(fractureHealedSound)
end)

net.Receive("SMBleedHealed", function()
    SMBleedHealedPopup()
    SMBleedPP(false)
    surface.PlaySound(bleedHealedSound)
end)

net.Receive("SMBurnHealed", function()
    SMBurnHealedPopup()
    SMBurnPP(false)
    surface.PlaySound(burnHealedSound)
end)

net.Receive("SMDiseaseHealed", function()
    SMDiseasseHealedPopup()
    SMDiseasePP(false)
    surface.PlaySound(diseaseHealedSound)
end)

net.Receive("SMRareDiseaseHealed", function()
    SMRareDiseasseHealedPopup()
    SMRareDiseasePP(false)
    surface.PlaySound(rareDiseaseHealedSound)
end)

net.Receive("SMMedkitHealed", function()
    SMMedkitPopup()
    SMFracturePP(false)
    surface.PlaySound(medkitHealedSound)
end)

net.Receive("SMCant", function()
    SMCant()
    surface.PlaySound(cantSound)
end)

-----------------------------------------------------------------------------
-- Misc
net.Receive("SMDmgSound", function()
    local rand = math.random(1, 3)
    if rand == 1 then
        surface.PlaySound("vo/npc/male01/pain06.wav")
    elseif rand == 2 then
        surface.PlaySound("vo/npc/male01/pain05.wav")
    else
        surface.PlaySound("vo/npc/male01/pain04.wav")
    end
end)

net.Receive("SMPlyDie", function()
    SMFracturePP(false)
    SMBleedPP(false)
    SMBurnPP(false)
    SMDiseasePP(false)
    SMRareDiseasePP(false)
end)
