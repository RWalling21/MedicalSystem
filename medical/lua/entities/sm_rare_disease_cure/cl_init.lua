include("shared.lua")

function ENT:Draw()
    self:DrawModel()
    local pos = self:GetPos() + Vector(0, 0, 20)
    local ang = self:GetAngles()
    ang.y = LocalPlayer():EyeAngles().y - 90
    ang.x = 0
    ang.z = 90
    cam.Start3D2D(pos, ang, 0.1)
    draw.SimpleTextOutlined("RARE Disease Cure", "SMCamText", 0, 0, rareDiseaseCure, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, rareDiseaseCureColorOutline)
    cam.End3D2D()
end