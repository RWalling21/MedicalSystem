function SMDiseaseClock(ply)
    print("Disease Clock initialized")
    timer.Create("SMDisease", 300, 0, function() -- On average you will get a disease every 1 hour of play time
        if chance(1, 12) then
            net.Start("SMDisease")
                net.WriteEntity(ply)
            net.SendToServer()
            SMDiseasePopup()
        end
    end)

    timer.Create("SMRareDisease", 900, 0, function() -- On average you will get a rare disease every 24 hours of playtime
        if chance(1, 96) then
            net.Start("SMRareDisease")
                net.WriteEntity(ply)
            net.SendToServer()
            SMRareDiseasePopup()
        end
    end)
end