AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("autorun/config/sm_config.lua")
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
	if medkitFracture and hasFracture then
		hasFracture = false
		SMFracture(false, activator)
		SMFracturePP(false)
	end

	if medkitBleed and isBleeding then
		isBleeding = false
		SMBleeding(false, activator)
		SMBleedPP(false)
	end
	
	if medkitBurn and hasBurn then
		hasBurn = false
		SMBurn(false, activator)
		SMBurnPP(false)
	end

	if medkitDisease and hasDisease then
		hasDisease = false
		SMDisease(false, activator)
		SMDiseasePP(false)
	end

	if medkitRareDisease and hasRareDisease then
		hasRareDisease = false
		SMRareDisease(false, activator)
		SMRareDiseasePP(false)
	end
	-------------------------------------------------------
	if activator:Health() >= activator:GetMaxHealth() then
		net.Start("SMCant")
		net.Send(activator)
	else
		local hp = activator:Health() + medkitHP
		if hp >= activator:GetMaxHealth() then
			activator:SetHealth(activator:GetMaxHealth())
		else
			activator:SetHealth(activator:Health() + medkitHP)
		end
		net.Start("SMMedkitHealed")
		net.Send(activator)
		self:Remove()
	end
end