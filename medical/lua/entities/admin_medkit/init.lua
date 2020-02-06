AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
include("config/sm_config.lua")

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

function ENT:Use(ply, caller)
    if ply.hasFracture then
        SMFracture(false, ply)
    end

    if ply.hasBleed then
        SMBleeding(false, ply)
    end

    if ply.hasBurn then
        SMBurn(false, ply)
    end

    if ply.hasDisease then
        SMDisease(false, ply)
    end

    if ply.hasRareDisease then
        SMRareDisease(false, ply)
    end

    -------------------------------------------------------
    local hp = ply:Health() + adminMedkitHP

    if hp >= ply:GetMaxHealth() then
        ply:SetHealth(ply:GetMaxHealth())
    else
        ply:SetHealth(ply:Health() + adminMedkitHP)
    end

    net.Start("SMMedkitHealed")
    net.Send(ply)
    self:Remove()
end