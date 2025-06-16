local PlayerData = {}

PlayerData.Player_actions = {
	idle = "idle",
	parry = "parry",
	block = "block",
	absorb = "absorb",
	recharge = "recharge",
	dash = "dash" 
}

PlayerData.Player_actual_action = PlayerData.Player_actions.idle
PlayerData.Player_action_duration = 0.3
PlayerData.Player_action_recharge = 0.1

PlayerData.Round = 1
PlayerData.Dead = false
PlayerData.Battle_Start = false 
PlayerData.Intro = true
PlayerData.invincibility_active = false
PlayerData.invincibility_timer = 0

PlayerData.Player = {
	life_max = 100,
	life = 100,
	damage = 0,
	damage_max = 10,
	defense = 0,
	defense_max = 5,
	invincibility_duration = 3.0, 
}

PlayerData.Enemy = {
	life_max = 0,
	life = 0,
}

PlayerData.Player_line = 2
PlayerData.Player_move_delay = 0.2

PlayerData.Scene = {
	projectile_velocity = 1.5
}

PlayerData.Attack_types = {
	block = "block",
	parry = "parry",
	absorption = "absorption",
	damage = "damage"
}

function PlayerData.CheckType(attackType, playerAction)
	return (
		attackType == PlayerData.Attack_types.block and playerAction == PlayerData.Player_actions.block or
		attackType == PlayerData.Attack_types.parry and playerAction == PlayerData.Player_actions.parry or
		attackType == PlayerData.Attack_types.absorption and playerAction == PlayerData.Player_actions.absorb
	)
end

function PlayerData.Update(dt)
	if PlayerData.invincibility_active then
		PlayerData.invincibility_timer = PlayerData.invincibility_timer - dt
		if PlayerData.invincibility_timer <= 0 then
			PlayerData.invincibility_active = false
			PlayerData.invincibility_timer = 0
		end
	end
end

function PlayerData.AddLife(amount)
	PlayerData.Player.life = math.min(PlayerData.Player.life + amount, PlayerData.Player.life_max)
end

function PlayerData.RemoveLife(amount)

	if PlayerData.Player.defense > 0 then
		PlayerData.Player.defense = PlayerData.Player.defense - 1
	else
		PlayerData.Player.life = PlayerData.Player.life - amount
		if PlayerData.Player.life <= 0 then
			PlayerData.Player.life = 0
			PlayerData.Dead = true
		end

		PlayerData.invincibility_active = true
		PlayerData.invincibility_timer = PlayerData.Player.invincibility_duration
	end
end

function PlayerData.CalculatePlayerDamage()
	return 5 * PlayerData.Player.damage
end

function PlayerData.AddDefense(amount)
	PlayerData.Player.defense = math.min(PlayerData.Player.defense + amount, PlayerData.Player.defense_max)
end

function PlayerData.AddDamage(amount)
	PlayerData.Player.damage = math.min(PlayerData.Player.damage + amount, PlayerData.Player.damage_max)
end

function PlayerData.GenerateEnemyLife(min_life, max_life)
	local random_life = math.random(min_life, max_life)
	PlayerData.Enemy.life_max = random_life
	PlayerData.Enemy.life = random_life
end

function PlayerData.DamageEnemy(amount)
	PlayerData.Enemy.life = PlayerData.Enemy.life - amount
	if PlayerData.Enemy.life < 0 then
		PlayerData.Enemy.life = 0
	end
end

return PlayerData