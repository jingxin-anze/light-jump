extends StateBase

@export var player: Player 

func enter() -> void:
	hand.animation="Attack2"
	hand.frame=2
	hand.speed_scale=0

func physics_process_update(delta: float) -> void:
	player.player_move_1(player.fall_gravity,delta)
	if player.is_on_floor():
		state_machine.change_state("Idle")

## 退出状态
func exit() -> void:
	hand.speed_scale=1
