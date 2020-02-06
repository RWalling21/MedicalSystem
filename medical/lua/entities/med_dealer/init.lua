AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("SMMedShop")

function ENT:Initialize()
    self:SetModel("models/Humans/Group03m/male_07.mdl")

    self:SetHullType(HULL_HUMAN)
    self:SetHullSizeNormal()
    self:SetSolid(SOLID_BBOX)
    self:SetMoveType(MOVETYPE_STEP)
    self:SetUseType(SIMPLE_USE)

    self:SetMaxYawSpeed(90) --Sets the angle by which an NPC can rotate at once.
end

function ENT:AcceptInput(Name, Activator, Caller)
    if Name == "Use" and Caller:IsPlayer() then

        rand = math.random(1, 3)
        if rand == 1 then
            self:EmitSound("vo/npc/male01/question12.wav", 75, 100, 1, CHAN_VOICE)
        elseif rand == 2 then
            self:EmitSound("vo/npc/male01/answer32.wav", 75, 100, 1, CHAN_VOICE)
        else
            self:EmitSound("vo/npc/male01/question18.wav", 75, 100, 1, CHAN_VOICE)
        end

        net.Start("SMMedShop")
        net.Send(Activator)
    end
end

--function ENT:OnTakeDamage(dmg)
  --  self:EmitSound("vo/npc/male01/question12.wav", 75, 100, 1, CHAN_VOICE)
--end 