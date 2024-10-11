extends StateBase

@export var player: Player 

func enter() -> void:
	player.can_jump = false
	player.velocity.y = player.jump_velocity
	body.play("Jump")
	hand.play("Jump")

func physics_process_update(delta: float) -> void:
	player.player_move_1(player.jump_gravity,delta)
	if not player.is_on_floor() and player.velocity.y > 0.0:
		state_machine.change_state("Fall")

## 退出状态
func exit() -> void:
	pass
