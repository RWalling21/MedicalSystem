net.Receive("SMDisease", function() -- Call for disease
    ply = net.ReadEntity()
        SMDisease(true, ply)
end)

net.Receive("SMRareDisease", function() -- Call for rare disease
    ply = net.ReadEntity()
    SMBurnPopup(true, ply)
end)