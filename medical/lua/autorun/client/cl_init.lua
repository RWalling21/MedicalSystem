include("autorun/config/sm_config.lua")

hook.Add("AddToolMenuCategories", "CustomCategory", function()
	spawnmenu.AddToolCategory("Utilities", "Simple_Medical", "#Simple Medical")
end)

hook.Add("PopulateToolMenu", "CustomMenuSettings", function()
    spawnmenu.AddToolMenuOption("Utilities", "Simple_Medical", "Custom_Menu", "#Simple Medical Options", "", "", function(panel)
        local SMColorM = vgui.Create("DColorMixer", panel)
        SMColorM:Dock(FILL)
        SMColorM:SetPalette(true)
        SMColorM:SetAlphaBar(true)
        SMColorM:SetWangs(true)
        SMColorM:SetColor(Color(0, 0, 0))

        local SMButton = vgui.Create("DButton", frame)
        SMButton:SetText("Save Color")
        SMButton:SetPos(25, 50)
        SMButton:SetSize(175, 25)
        SMButton.DoClick = function()        
            net.Start("SMCamColor")
                local SMR = SMColorM:GetColor()["r"]
                local SMG = SMColorM:GetColor()["g"] 
                local SMB = SMColorM:GetColor()["b"]
                net.WriteString(SMR)
                net.WriteString(SMG)
                net.WriteString(SMB)
            net.SendToServer()
        end

        panel:AddItem(SMButton)
        panel:AddItem(SMColorM)
    end)
end)