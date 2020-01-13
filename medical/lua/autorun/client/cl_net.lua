net.Receive("SMFractureMSG", function()
    SMFracturePopup()
end)

net.Receive("SMBleedMSG", function()
    SMBleedPopup()
end)

net.Receive("SMBurnMSG", function()
    SMBurnPopup()
end)

net.Receive("SMHealed", function()
    SMHealedPopup()
end)

--Disease is handled on the client