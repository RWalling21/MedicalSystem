include("autorun/shared/sh_init.lua")
include("autorun/config/sm_config.lua")

--Disease Clock, if it doesn't work increase the delay time
timer.Simple(5, function()  
    net.Start("SMDiseaseCall")
        ply = LocalPlayer()
        net.WriteEntity(ply)
    net.SendToServer()
end)
