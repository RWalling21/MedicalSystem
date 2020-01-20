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
end)

net.Receive("SMDiseaseMSG", function()
    SMDiseasePopup()
end)

net.Receive("SMRareDiseaseMSG", function()
    SMRareDiseasePopup()
end)

-----------------------------------------------------------------------------

net.Receive("SMFractureHealed", function()
    SMFractureHealedPopup()
    SMFracturePP(false)
    surface.PlaySound("items/smallmedkit1.wav")
end)

net.Receive("SMBleedHealed", function()
    SMBleedHealedPopup()
    SMBleedPP(false)
    surface.PlaySound("items/smallmedkit1.wav")
end)

net.Receive("SMBurnHealed", function()
    SMHealedPopup()
    --SMBleedPP(false)
    surface.PlaySound("items/smallmedkit1.wav")
end)

net.Receive("SMDiseaseHealed", function()
    SMHealedPopup()
    --SMBleedPP(false)
    surface.PlaySound("items/smallmedkit1.wav")
end)

net.Receive("SMRareDiseaseHealed", function()
    SMHealedPopup()
    --SMBleedPP(false)
    surface.PlaySound("items/smallmedkit1.wav")
end)

-----------------------------------------------------------------------------

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