include("shared.lua")
include("config.lua")

function ENT:Initialize()
	self.csModel = ClientsideModel(PickupModel)
	self.csModel:SetModelScale(2,0)
end

function ENT:Draw()
	--self:DrawModel()

local moneyAngle = (CurTime() * 90) % 360
local moneyHeight =  math.sin(CurTime() * 3) * 5

	self.csModel:SetPos(self:GetPos() + Vector(0,0,moneyHeight - 1))
	self.csModel:SetAngles(Angle(0,moneyAngle,0))

end

function ENT:OnRemove()
	self.csModel:Remove()
end