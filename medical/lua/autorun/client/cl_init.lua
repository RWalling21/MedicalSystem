include("autorun/shared/sh_init.lua")
include("autorun/config/smconfig.lua")

ply = LocalPlayer()

--Disease Clock, if it doesn't work increase the delay time
timer.Simple(5, function(ply) 
    print("Disease Clock initialized")
    timer.Create("SMDisease", diseaseApply, 0, function() -- On average you will get a disease every 1 hour of play time
        if chance(1, diseaseProbability) then
            print("cl_init Disease")
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
end)
