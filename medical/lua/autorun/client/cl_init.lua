include("autorun/shared/sh_init.lua")
include("autorun/config/sm_config.lua")
include("autorun/config/sm_config.lua")

--Disease Clock, if it doesn't work increase the delay time
timer.Simple(startDiseaseDelay, function()
    net.Start("SMDiseaseCall")
        local ply = LocalPlayer()
        net.WriteEntity(ply)
    net.SendToServer()
end)
