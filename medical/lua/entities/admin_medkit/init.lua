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

function ENT:Use(activator, caller)
    if Condition[1] then
        SMFracture(false, activator)
    end

    if Condition[2] then
        SMBleeding(false, activator)
    end

    if Condition[3] then
        SMBurn(false, activator)
    end

    if Condition[4] then
        SMDisease(false, activator)
    end

    if Condition[5] then
        SMRareDisease(false, activator)
    end

    -------------------------------------------------------
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