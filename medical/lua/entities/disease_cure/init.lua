AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
 
include('shared.lua')

function ENT:Initialize()
	self:SetModel("models/hunter/blocks/cube05x05x05.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
 
        local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end
 
function ENT:Use(activator, caller)
	hasDisease = false
	SMDisease(false, activator)
	net.Start("SMHealed")
	net.Send(activator)
	self:Remove()
end