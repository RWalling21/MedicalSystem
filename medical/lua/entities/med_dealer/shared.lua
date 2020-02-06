ENT.Base = "base_ai"
ENT.Type = "ai"

ENT.PrintName = "Med Dealer"
ENT.Author = "Beb"
ENT.Category = "Simple Medical"
ENT.Contact = "Via steam"
ENT.Purpose = "Sells Meds"
ENT.Instructions = "Use to get buy menu"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true

function ENT:PhysicsCollide(data, physobj)

end

function ENT:SetAutomaticFrameAdvance(bUsingAnim)
    self.AutomaticFrameAdvance = bUsingAnim
end