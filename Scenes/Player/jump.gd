extends StateBase

@export var player: Player 

func enter() -> void:
	player.velocity.y = player.jump_velocity
	player.cache_jump = 0
	if player.little_speed:
		player.velocity.y = player.jump_velocity/2.0
	else:
		player.velocity.y = player.jump_velocity
	player.little_speed = false
	player.coyote_time.stop()
	body.play("Jump")
	hand.play("Jump")

func physics_process_update(delta: float) -> void:
	player.player_move_1(player.jump_gravity,delta)
	if not player.is_on_floor() and player.velocity.y > 0.0:
		state_machine.change_state("Fall")
	if player.is_on_floor() and player.velocity.y >= 0:
		state_machine.change_state("Idle")

## 退出状态
func exit() -> void:
	pass
