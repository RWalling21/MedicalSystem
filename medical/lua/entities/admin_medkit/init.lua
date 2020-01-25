AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')
include("autorun/config/sm_config.lua")

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
	if adminMedkitFracture and hasFracture then
		hasFracture = false
		SMFracture(false, activator)
	end

	if adminMedkitBleed and isBleeding then
		isBleeding = false
		SMBleeding(false, activator)
	end
	
	if adminMedkitBurn and hasBurn then
		hasBurn = false
		SMBurn(false, activator)
	end

	if adminMedkitDisease and hasDisease then
		hasDisease = false
		SMDisease(false, activator)
	end

	if adminMedkitRareDisease and hasRareDisease then
		hasRareDisease = false
		SMRareDisease(false, activator)
	end
	-------------------------------------------------------
	if activator:Health() >= activator:GetMaxHealth() then
		net.Start("SMCant")
		net.Send(activator)
	else
		local hp = activator:Health() + adminMedkitHP
		if hp >= activator:GetMaxHealth() then
			activator:SetHealth(activator:GetMaxHealth())
		else
			activator:SetHealth(activator:Health() + adminMedkitHP)
		end
		net.Start("SMMedkitHealed")
		net.Send(activator)
		self:Remove()
	end
end