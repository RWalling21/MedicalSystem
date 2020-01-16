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
end)