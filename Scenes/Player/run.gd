extends StateBase

@export var player: Player 

func enter() -> void:
	body.play("Walk")
	hand.play("Walk")
	player.can_jump = true

func physics_process_update(delta: float) -> void:
	player.player_move_1(player.fall_gravity,delta)
	if not player.is_on_floor() :
		state_machine.change_state("Fall")
	if player.direction==0:
		state_machine.change_state("Idle")
## 退出状态
func exit() -> void:
	pass