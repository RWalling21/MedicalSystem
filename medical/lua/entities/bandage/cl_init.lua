include("shared.lua")

surface.CreateFont("SMCamText", {
    font = "Roboto", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    size = 60,
    weight = 500,
    antialias = true,
    bold = true
})

function ENT:Draw()
    self:DrawModel()
    local pos = self:GetPos() + Vector(0, 0, 20)
    local ang = self:GetAngles()
    ang.y = LocalPlayer():EyeAngles().y - 90
    ang.x = 0
    ang.z = 90
    cam.Start3D2D(pos, ang, 0.1)
    draw.SimpleTextOutlined("Bandage", "SMCamText", 0, 0, bandageColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, bandageColorOutline)
    cam.End3D2D()
end