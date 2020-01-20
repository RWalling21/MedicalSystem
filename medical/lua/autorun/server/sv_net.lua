net.Receive("SMDiseaseCall", function()
    local ply = net.ReadEntity()
    SMDiseaseInit(ply)
end)