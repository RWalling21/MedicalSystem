include("autorun/shared/sh_init.lua")
include("autorun/config/sm_config.lua")

ply = LocalPlayer()

--Disease Clock, if it doesn't work increase the delay time
timer.Simple(5, function() 
    print("Disease Clock initialized")
    timer.Create("SMDisease", diseaseApply, 0, function() -- On average you will get a disease every 1 hour of play time
        if chance(1, diseaseProbability) then
            SMDiseasePopup()
            net.Start("SMDisease")
                net.WriteEntity(ply)
            net.SendToServer()
        end
    end)

    timer.Create("SMRareDisease", rareDiseaseApply, 0, function() -- On average you will get a rare disease every 24 hours of playtime
        if chance(1, rareDiseaseProbability) then
            SMRareDiseasePopup()
            net.Start("SMRareDisease")
                net.WriteEntity(ply)
            net.SendToServer()
        end
    end)
end)
