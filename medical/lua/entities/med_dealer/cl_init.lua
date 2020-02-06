include("shared.lua")

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Draw()
	self:DrawModel()

	local pos = self:GetPos() + Vector(0, 0, 80)
	local ang = self:GetAngles()
	ang.y = LocalPlayer():EyeAngles().y - 90
	ang.x = 0
	ang.z = 90
	cam.Start3D2D(pos, ang, 0.1)
	draw.SimpleTextOutlined("Med Dealer", "SMCamText", 0, 0, medDealerColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, medDealerColorOutline)
	cam.End3D2D()
end

function SMShopMenu()
	local medShop = vgui.Create("DFrame")
	medShop:SetSize(350, 600)
	medShop:Center()
	medShop:SetTitle("Med Dealer")
	medShop:MakePopup()

	chat.AddText(medDealerColor, "Simple Medical: ",Color(255,255,255), medDealerNotifText)
end

net.Receive("SMMedShop", function()
	SMShopMenu()
end)