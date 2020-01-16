net.Receive("SMDiseaseCall", function()
    ply = net.ReadEntity()
    SMDiseaseInit(ply)
end)