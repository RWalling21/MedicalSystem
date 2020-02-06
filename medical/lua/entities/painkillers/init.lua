AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_lab/jar01a.mdl")
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
        net.Start("SMFractureHealed")
        net.Send(ply)
        self:Remove()
    else
        net.Start("SMCant")
        net.Send(ply)
    end
end