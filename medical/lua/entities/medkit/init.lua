AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("autorun/config/sm_config.lua")
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
	hasFracture = false
	isBleeding = false
	hasBurn = false
	hasDisease = false
	SMFracture(false, activator)
	SMBleeding(false, activator)
	SMBurn(false, activator)
	SMDisease(false, activator)
	net.Start("SMHealed")
	net.Send(activator)
	if activator:Health() >= activator:GetMaxHealth() then
		activator:SetHealth(activator:GetMaxHealth())
	else
		local hp = activator:Health() + medkitHP
		if hp >= activator:GetMaxHealth() then
			activator:SetHealth(activator:GetMaxHealth())
		else
			activator:SetHealth(activator:Health() + medkitHP) -- Can do over max
		end
	end
	self:Remove()
end