local Projectile = {}
Projectile.__index = Projectile

local Player = require "Scripts.Player_Status"

local START_Y = 170
local TARGET_Y = 100
local DIST_Y = START_Y - TARGET_Y

function Projectile:new(id, type, damage, speed)
    local self = setmetatable({}, Projectile)
    self.id = id or "."
    self.type = type or Player.Attack_types.block
    self.damage = damage or 10
    self.speed = speed or 100
    self.alive = true

    -- Começa pequeno
    go.set_scale(vmath.vector3(0.1, 0.1, 1.0), self.id)

    return self
end

function Projectile:update(dt)
    if not self.alive then return end

    local pos = go.get_position(self.id)
    pos.y = pos.y - ((self.speed * dt) * Player.Scene.projectile_velocity)
    go.set_position(pos, self.id)

    local clamped_y = math.max(math.min(pos.y, START_Y), TARGET_Y)
    local t = (START_Y - clamped_y) / DIST_Y 
    local scale_value = 0.1 + 0.9 * t        

    local scale = vmath.vector3(scale_value, scale_value, 1.0)
    go.set_scale(scale, self.id)
end

function Projectile:destroy()
    if self.alive then
        go.delete(self.id)
        self.alive = false
    end
end

function Projectile:on_trigger(message)
    if not self.alive then return end

    if message.other_id == hash("/Background") then
        self:destroy()
        return
    end
end

return Projectile
