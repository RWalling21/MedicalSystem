AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')

function ENT:Initialize()
	self:SetModel("models/weapons/w_medkit.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(3)
        local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end

function ENT:Use(activator, caller)
	if isBleeding then
		isBleeding = false -- Check this variable and see where it is applied (Probobly nothing)
		SMBleeding(false, activator)
		net.Start("SMBleedHealed")
		net.Send(activator)
		self:Remove()
	else
		net.Start("SMCant")
		net.Send(activator)
	end
end