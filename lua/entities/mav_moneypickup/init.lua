AddCSLuaFile("shared.lua")
AddCSLuaFile("config.lua")
AddCSLuaFile("cl_init.lua")

include("shared.lua")
include("config.lua")

function ENT:Initialize()

	self:SetModel("models/hunter/blocks/cube05x05x05.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_VPHYSICS)

	self:GetPhysicsObject():Wake()
	self:SetCollisionGroup(COLLISION_GROUP_WEAPON)

	self:SetTrigger(true)

	self:DrawShadow(false)

end

function ENT:StartTouch(activator)

	if not activator:IsPlayer() then
		return""
	end

	if activator:IsPlayer() then
		activator:addMoney(MoneyAmmount)
		activator:EmitSound("npc/crow/alert2.wav",self:GetPos())
		DarkRP.notify(activator, 1, 4, "You have found ".. GAMEMODE.Config.currency .. MoneyAmmount .."!")
	end

	self:Remove()
end