net.Receive("SMFractureMSG", function()
    SMFracturePopup()
end)

net.Receive("SMBleedMSG", function()
    SMBleedPopup()
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

net.Receive("SMHealed", function()
    SMHealedPopup()
    surface.PlaySound("items/smallmedkit1.wav")
end)

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